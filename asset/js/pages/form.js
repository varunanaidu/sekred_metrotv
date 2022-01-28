$(function() {

    $('#btnAdd').on('click', function() {
        $('#form_file').attr('required', '');

        $('#exampleModal').modal('show');
    });

    $("#attachment-form").ajaxForm({
        dataType: "json",
        url: base_url + 'form/save',
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

    var t = $('#datatable').DataTable({
        "processing": true,
        "language": {
            "processing": '<i class="fa fa-spinner fa-pulse fa-3x fa-fw"></i><span class="sr-only">Loading...</span>'
        },
        "serverSide": true,
        "order": [],
        "ajax": {
            "url": base_url + "form/view",
            "type": "POST"
        },
        "searchDelay": 750,
        "columnDefs": [{
            "targets": [4],
            "orderable": false
        },{
            "targets": [3],
            "className": "dt-body-center"
        },]
    });

    t.on('click', '.btn-detail', function(event) {
        event.preventDefault();
        var row_id = $(this).data('id');
        $.ajax({
            url: base_url + "form/find",
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
                    // console.log(data);return;
                    $('#container_pdf').attr('data', base_url+'asset/files/form/'+data.msg[0].form_file);
                    $('#link_pdf').attr('href', base_url+'asset/files/form/'+data.msg[0].form_file);
                    $('#link_pdf2').attr('href', base_url+'asset/files/form/'+data.msg[0].form_file);
                    $('#exampleModal2').modal('show');
                }
            },
            error: function() {
                Swal.fire("(500)", "Error Occurred, Please refresh your browser.", "error");
            }
        });
    });

    t.on('click', '.btn-edit', function(event) {
        event.preventDefault();
        var row_id = $(this).data('id');
        $.ajax({
            url: base_url + "form/find",
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
                    $('#form_name').val(data.msg[0].form_name);
                    $('#form_description').val(data.msg[0].form_description);

                    $("#type").val("update");
                    $("#id").val(row_id);

                    $('#form_file').removeAttr('required');

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

    t.on('click', '.btn-delete', function() {
        var row_id = $(this).data('id');
        Swal.fire({
            title: 'Hapus data !',
            type: 'warning',
            html: '<span class="italic">Apakah anda yakin ingin menghapus data ini ?</span>',
            showCancelButton: true,
            confirmButtonText: "Ya, Hapus!",
            cancelButtonText: "Batalkan",
            confirmButtonColor: "#DD6B55",
            showLoaderOnConfirm: true,
        }).then(function(result) {
            if (result.value) {
                $.ajax({
                    url: base_url + "form/delete",
                    type: 'post',
                    data: {
                        'key': row_id
                    },
                    dataType: 'json',
                    success: function(data) {
                        var sa_title = (data.type == 'done') ? "Success!" : "Failed!";
                        var sa_type = (data.type == 'done') ? "success" : "error";
                        Swal.fire({
                            title: sa_title,
                            type: sa_type,
                            html: data.msg
                        }).then(function() {
                            if (data.type == 'done') window.location.reload();
                        });
                    }
                });
            } else {
                Swal.fire('Dibatalkan', '', 'warning');
            }
        });
    });

});