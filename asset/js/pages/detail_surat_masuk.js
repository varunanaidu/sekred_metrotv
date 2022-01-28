$(function() {

    $('#jenis_surat').on('change', function() {

        var val = $(this).val();

        if (val == 2) {
            $('#kepadaContainer').removeAttr('style');
            $('#kepada').attr('required', '');
        } else {
            $('#kepadaContainer').css('display', 'none');
            $('#kepada').removeAttr('required');
        }
    });

    $('#kepada').select2({
        dropdownParent: $('#exampleModal'),
        placeholder: "Type NIP or Name",
        minimumInputLength: 2,
        ajax: {
            url: base_url + "surat_masuk/search_sdm",
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

    $('#timepicker').datetimepicker({
        use24hours: true,
        language: 'en',
        format: 'LTS',
        format: 'HH:mm:ss',
    });

    $("#suratMasuk-form").ajaxForm({
        dataType: "json",
        url: base_url + 'surat_masuk/save',
        beforeSerialize: function () {
            $('#jenis_surat').removeAttr('disabled');
        },
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
                // if (data.type == 'done') window.location.reload();
                if (data.type == 'done') window.location.href = base_url + 'surat_masuk';
            });
        },
        error: function() {
            Swal.fire("Failed!", "Error Occurred, Please refresh your browser.", "error");
            $('#jenis_surat').attr('disabled', '');
        },
        complete: function() {
            $('#btn-submit').removeClass('btn-warning').addClass('btn-primary').prop('disabled', false);
            $('#jenis_surat').attr('disabled', '');
        }
    });

    $('#btn-edit').on('click', function(event) {
        event.preventDefault();
        var row_id = $(this).data('id');
        $.ajax({
            url: base_url + "surat_masuk/find",
            type: 'post',
            data: {
                'key': row_id
            },
            dataType: 'json',
            success: function(data) {
                if (data.type != 'done') {
                    var sa_title = (data.type == 'done') ? "Success!" : "Failed!";
                    var sa_type = (data.type == 'done') ? "success" : "error";
                    Swal.fire({
                        title: sa_title,
                        type: sa_type,
                        html: data.msg
                    });
                } else {
                    $("#pengirim").val(data.msg[0].pengirim);
                    $("#jenis_surat").val(data.msg[0].jenis_surat);

                    if (data.msg[0].jenis_surat == 2) {
                        $('#kepadaContainer').removeAttr('style');
                        $('#kepada').attr('required', '');
                        $('#kepada').append('<option value="'+data.msg[0].kepada+'">'+data.msg[0].kepada+' - '+data.msg[0].user_fname+'</option>');
                    } else {
                        $('#kepadaContainer').css('display', 'none');
                        $('#kepada').removeAttr('required');
                        $("#kepada").val(data.msg[0].kepada);
                    }


                    $("#tanggal_acara").val(data.msg[0].tanggal_acara);
                    $("#jam_acara").val(data.msg[0].jam_acara);
                    $("#lokasi").val(data.msg[0].lokasi);
                    $("#perihal").val(data.msg[0].perihal);
                    $("#area").val(data.msg[0].area);
                    $("#keterangan").val(data.msg[0].keterangan);

                    $("#type").val("update");
                    $("#id").val(row_id);

                    var mod = $('#exampleModal');
                    mod.find('#modal-type').text('Edit');
                    mod.modal('show');
                }
            },
            error: function() {
                Swal.fire("(500)", "Error Occurred, Please refresh your browser.", "error");
            }
        });
    });
});