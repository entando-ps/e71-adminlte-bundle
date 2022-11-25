<#assign wp=JspTaglibs["/aps-core"]>
<@wp.info key="systemParam" paramName="applicationBaseURL" var="appUrl" />
<script nonce="<@wp.cspNonce />" >
    (function () {
        const consolePrefix = '[ENTANDO-KEYCLOAK]';
        const keycloakConfigEndpoint = '${appUrl}keycloak.json';
        let keycloakConfig;
        function dispatchKeycloakEvent(eventType) {
            console.info(consolePrefix, 'Dispatching', eventType, 'custom event');
            return window.dispatchEvent(new CustomEvent('keycloak', { detail: { eventType } }));
        };
        function initKeycloak() {
            const keycloak = new Keycloak(keycloakConfig);
            keycloak.onReady = function() {
                dispatchKeycloakEvent('onReady');
            };
            keycloak.onAuthSuccess = function() {
                dispatchKeycloakEvent('onAuthSuccess');
            };
            keycloak.onAuthError = function() {
                dispatchKeycloakEvent('onAuthError');
            };
            keycloak.onAuthRefreshSuccess = function() {
                dispatchKeycloakEvent('onAuthRefreshSuccess');
            };
            keycloak.onAuthRefreshError = function() {
                dispatchKeycloakEvent('onAuthRefreshError');
            };
            keycloak.onAuthLogout = function() {
                dispatchKeycloakEvent('onAuthLogout');
            };
            keycloak.onTokenExpired = function() {
                dispatchKeycloakEvent('onTokenExpired');
            };
            function onKeycloakInitialized(isAuthenticated) {
                if (isAuthenticated) {
                    console.info(consolePrefix, 'Keycloak initialized, user authenticated');
                } else {
                    console.info(consolePrefix, 'Keycloak initialized, user not authenticated');
                }
            };
            window.entando = {
                ...(window.entando || {}),
                keycloak,
            };
            window.entando.keycloak
                .init({ onLoad: 'check-sso', silentCheckSsoRedirectUri: '${appUrl}resources/static/silent-check-sso.html', promiseType: 'native', enableLogging: true })
                .then(onKeycloakInitialized)
                .catch(function (e) {
                    console.error(e);
                    console.error(consolePrefix, 'Failed to initialize Keycloak');
                });
        };
        function onKeycloakScriptError(e) {
            console.error(e);
            console.error(consolePrefix, 'Failed to load keycloak.js script');
        };
        function addKeycloakScript(keycloakConfig) {
            const script = document.createElement('script');
            script.src = keycloakConfig['auth-server-url'] + '/js/keycloak.js';
            script.async = true;
            script.addEventListener('load', initKeycloak);
            script.addEventListener('error', onKeycloakScriptError);
            document.body.appendChild(script);
        };
        fetch(keycloakConfigEndpoint)
            .then(function (response) {
                return response.json();
            })
            .then(function (config) {
                keycloakConfig = config;
                if (!keycloakConfig.clientId) {
                    keycloakConfig.clientId = keycloakConfig.resource;
                }
                addKeycloakScript(keycloakConfig);
            })
            .catch(function (e) {
                console.error(e);
                console.error(consolePrefix, 'Failed to fetch Keycloak configuration');
            });
    })();

    function toggleAuth(authenticated) {
        if (authenticated) {
            document.getElementById("user-authenticated").style.removeProperty("display");
            document.getElementById("user-notauthenticated").style.display = "none";
        } else {
            document.getElementById("user-authenticated").style.display = "none";
            document.getElementById("user-notauthenticated").style.removeProperty("display");

        }
    }

    window.addEventListener("keycloak", (evt) => {
        if (evt.detail.eventType === "onReady") {
            document.getElementById("user-authenticated").onclick=window.entando.keycloak.logout
            document.getElementById("user-notauthenticated").onclick=window.entando.keycloak.login
            toggleAuth(window.entando.keycloak.authenticated)
        }
    })
</script>
