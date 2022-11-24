baseurl=https://adminlte.io/themes/v3/


downloadFile(){
  curl "$baseurl"$1 --create-dirs -o $1
}

downloadFile "plugins/fontawesome-free/webfonts/fa-solid-900.woff2"
downloadFile "plugins/fontawesome-free/webfonts/fa-regular-400.woff2"
downloadFile "plugins/fontawesome-free/webfonts/fa-solid-900.woff"
downloadFile "plugins/fontawesome-free/webfonts/fa-regular-400.woff"
downloadFile "plugins/fontawesome-free/webfonts/fa-solid-900.ttf"
downloadFile "plugins/fontawesome-free/webfonts/fa-regular-400.ttf"

#downloadFile "plugins/fontawesome-free/css/all.min.css"
#downloadFile "plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css"
#downloadFile "plugins/icheck-bootstrap/icheck-bootstrap.min.css"
#downloadFile "plugins/jqvmap/jqvmap.min.css"
#downloadFile "dist/css/adminlte.min.css?v=3.2.0"
#downloadFile "plugins/overlayScrollbars/css/OverlayScrollbars.min.css"
#downloadFile "plugins/daterangepicker/daterangepicker.css"
#downloadFile "plugins/summernote/summernote-bs4.min.css"
#downloadFile "dist/img/AdminLTELogo.png"
#downloadFile "plugins/jquery/jquery.min.js"
#downloadFile "plugins/jquery-ui/jquery-ui.min.js"
#downloadFile "plugins/bootstrap/js/bootstrap.bundle.min.js"
#downloadFile "plugins/chart.js/Chart.min.js"
#downloadFile "plugins/sparklines/sparkline.js"
#downloadFile "plugins/jqvmap/jquery.vmap.min.js"
#downloadFile "plugins/jqvmap/maps/jquery.vmap.usa.js"
#downloadFile "plugins/jquery-knob/jquery.knob.min.js"
#downloadFile "plugins/moment/moment.min.js"
#downloadFile "plugins/daterangepicker/daterangepicker.js"
#downloadFile "plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"
#downloadFile "plugins/summernote/summernote-bs4.min.js"
#downloadFile "plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"
#downloadFile "dist/js/demo.js"
#downloadFile "dist/js/pages/dashboard.js"
#downloadFile "dist/js/adminlte.js?v=3.2.0"
#downloadFile "dist/img/user1-128x128.jpg"
#downloadFile "dist/img/user8-128x128.jpg"
#downloadFile "dist/img/user3-128x128.jpg"
#downloadFile "dist/img/AdminLTELogo.png"
#downloadFile "dist/img/user2-160x160.jpg"

