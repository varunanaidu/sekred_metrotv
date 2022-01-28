<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="au theme template">
    <meta name="author" content="Hau Nguyen">
    <meta name="keywords" content="au theme template">

    <!-- Title Page-->
    <title>Sekred Online</title>

    <!-- Fontfaces CSS-->
    <link href="<?= base_url(); ?>asset/css/font-face.css" rel="stylesheet" media="all">
    <link href="<?= base_url(); ?>asset/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <link href="<?= base_url(); ?>asset/vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
    <link href="<?= base_url(); ?>asset/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

    <!-- Bootstrap CSS-->
    <link href="<?= base_url(); ?>asset/vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

    <!-- Vendor CSS-->
    <link href="<?= base_url(); ?>asset/vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
    <link href="<?= base_url(); ?>asset/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
    <link href="<?= base_url(); ?>asset/vendor/wow/animate.css" rel="stylesheet" media="all">
    <link href="<?= base_url(); ?>asset/vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
    <link href="<?= base_url(); ?>asset/vendor/slick/slick.css" rel="stylesheet" media="all">
    <link href="<?= base_url(); ?>asset/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="<?= base_url(); ?>asset/vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">
    <link href="<?= base_url(); ?>asset/vendor/sweetalert2/dist/sweetalert2.min.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="<?= base_url(); ?>asset/css/theme.css" rel="stylesheet" media="all">

</head>

<body class="background animsition">
    <div class="page-wrapper">
        <div class="page-content--bge5">
            <div class="container">
                <div class="login-wrap" id="login-box">
                    <div class="login-content">
                        <div class="login-logo">
                         <h1 class="title-1" id="login-title"> Sekred Online </h1>
                     </div>
                     <div class="login-form">
                        <form method="POST" id="login-form" accept-charset="UTF-8">
                            <div class="form-group">
                                <label>NIP</label>
                                <input class="au-input au-input--full" type="text" name="user_name" id="user_name" placeholder="NIP">
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <input class="au-input au-input--full" type="password" name="user_pass" id="user_pass" placeholder="Password">
                            </div>
                            <button type="submit" class="au-btn au-btn--block au-btn--blue m-b-20" id="btn-submit">SIGN IN</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<script type="text/javascript">var base_url = '<?= base_url(); ?>'</script>
<!-- Jquery JS-->
<script src="<?= base_url(); ?>asset/vendor/jquery-3.2.1.min.js"></script>
<!-- Bootstrap JS-->
<script src="<?= base_url(); ?>asset/vendor/bootstrap-4.1/popper.min.js"></script>
<script src="<?= base_url(); ?>asset/vendor/bootstrap-4.1/bootstrap.min.js"></script>
<!-- Vendor JS       -->
<script src="<?= base_url(); ?>asset/vendor/slick/slick.min.js">
</script>
<script src="<?= base_url(); ?>asset/vendor/wow/wow.min.js"></script>
<script src="<?= base_url(); ?>asset/vendor/animsition/animsition.min.js"></script>
<script src="<?= base_url(); ?>asset/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
</script>
<script src="<?= base_url(); ?>asset/vendor/counter-up/jquery.waypoints.min.js"></script>
<script src="<?= base_url(); ?>asset/vendor/counter-up/jquery.counterup.min.js">
</script>
<script src="<?= base_url(); ?>asset/vendor/circle-progress/circle-progress.min.js"></script>
<script src="<?= base_url(); ?>asset/vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="<?= base_url(); ?>asset/vendor/chartjs/Chart.bundle.min.js"></script>
<script src="<?= base_url(); ?>asset/vendor/select2/select2.min.js"></script>
<script src="<?= base_url(); ?>asset/vendor/sweetalert2/dist/sweetalert2.min.js"></script>

<!-- Main JS-->
<script src="<?= base_url(); ?>asset/js/main.js"></script>

<script type="text/javascript">
    $( function () {

        var myip = "";
        $.get('https://jsonip.com/', function(r){ $("#server").val(r.ip); });
        myip = $("#server").val();
        $("#login-form").on('submit', function(e){
            e.preventDefault();
            $.ajax({
                url : base_url + "site/signin",
                type : "POST",
                dataType : "JSON",
                data : $(this).serialize(),
                beforeSend : function(){
                    $("#btn-submit").html ( 'Processing...' ).removeClass("btn-primary").addClass("btn-warning").prop("disabled", true);
                },
                success : function(data){
                    if ( data.type == "done" ){
                        window.location.reload();
                    }
                    else{
                        Swal.fire ( "Failed!", data.msg, "error");
                        $("#btn-submit").html ( 'SIGN IN' ).removeClass("btn-warning").addClass("btn-primary").prop("disabled", false);
                    }               
                },
                error : function(){
                    Swal.fire ( "Failed!", "Error Occurred, Please refresh your browser.", "error");
                },
                complete : function(){
                // $("#btn-submit").html ( 'LOGIN' ).removeClass("btn-warning").addClass("btn-primary").prop("disabled", false);
            }
        });
        });

    });
</script>
</body>
</html>
<!-- end document-->