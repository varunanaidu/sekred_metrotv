$(function() {


    $("#user").select2({
        placeholder: "Type NIP or Name",
        minimumInputLength: 2,
        ajax: {
            url: base_url + "user_access/search_emp",
            dataType: "json",
            delay: 250,
            processResults: function(data) {
                return {
                    results: data
                };
            },
            cache: true
        },
        allowClear: true
    });

    $('#user').on('change', function() {

        var user = $(this).val();
        if (user == "") {
            $("#content-uac").html("");
            return false;
        }

        var data = {
            "key": user
        };
        $.ajax({
            url: base_url + "user_access/setup",
            type: "POST",
            dataType: "JSON",
            data: data,
            beforeSend: function() {
                $("#content-uac").html("");
            },
            success: function(data) {
                if (data.type === "done") {
                    $("#content-uac").html(data.msg);
                } else {
                    Swal.fire("Failed!", data.msg, "error");
                }
            },
            error: function() {
                Swal.fire("Failed!", "Error occurred, Please refresh your browser.", "error");
            }
        });
    });



    $("#uac-form").ajaxForm({
        dataType: "json",
        url: base_url + 'user_access/save',
        beforeSubmit: function() {
            $('#btn-submit').removeClass('btn-primary').addClass('btn-warning').prop('disabled', true);
        },
        success: function(data) {
            var sa_title = (data.type == 'done') ? "Success!" : "Failed!";
            var sa_type = (data.type == 'done') ? "success" : "warning";
            Swal.fire({
                title: sa_title,
                type: sa_type,
                html: data.msg
            }).then(function() {
                if (data.type == 'done') window.location.reload();
            });
        },
        error: function() {
            Swal.fire("Failed!", "Error Occurred, Please refresh your browser.", "error");
        },
        complete: function() {
            $('#btn-submit').removeClass('btn-warning').addClass('btn-primary').prop('disabled', false);
        }
    });

});