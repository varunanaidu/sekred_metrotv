$(function() {

    $('#btnAdd').on('click', function() {

        $('#exampleModal').modal('show');
    });

    $("#narasumber-form").ajaxForm({
        dataType: "json",
        url: base_url + 'narasumber/save',
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
            "url": base_url + "narasumber/view",
            "type": "POST"
        },
        "searchDelay": 750,
        "columnDefs": [{
            "targets": [5],
            "orderable": false
        }]
    });

    t.on('click', '.btn-detail', function(event) {
        event.preventDefault();
        var row_id = $(this).data('id');
        $.ajax({
            url: base_url + "narasumber/find",
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
                    var partner = data.msg[0].narasumber_partner.split("-");

                    $('#text_narasumber_name').text(data.msg[0].narasumber_name);
                    $('#text_narasumber_jabatan').text(data.msg[0].narasumber_jabatan);
                    $('#text_narasumber_telephone').html('<span id="text_narasumber_telephone">'+data.msg[0].narasumber_telephone+'<br/>'+data.msg[0].narasumber_telephone_2+'</span>');
                    $('#text_narasumber_email').html('<span id="text_narasumber_email">'+data.msg[0].narasumber_email+"<br/>"+data.msg[0].narasumber_email_2+'</span>');
                    $('#text_narasumber_addr').text(data.msg[0].narasumber_addr);
                    $('#text_narasumber_city').text(data.msg[0].narasumber_city);
                    $('#text_narasumber_instansi').text(data.msg[0].narasumber_instansi);
                    $('#text_narasumber_partner').text('('+partner[0]+') '+partner[1]);
                    $('#text_narasumber_partner_number').text(data.msg[0].narasumber_partner_number);
                    $('#text_narasumber_keterangan').text(data.msg[0].narasumber_keterangan);

                    var mod = $('#exampleModal2');
                    mod.modal('show');
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
            url: base_url + "narasumber/find",
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
                    var partner = data.msg[0].narasumber_partner.split("-");

                    $('#narasumber_name').val(data.msg[0].narasumber_name);
                    $('#narasumber_telephone').val(data.msg[0].narasumber_telephone);
                    $('#narasumber_telephone_2').val(data.msg[0].narasumber_telephone_2);
                    $('#narasumber_email').val(data.msg[0].narasumber_email);
                    $('#narasumber_email_2').val(data.msg[0].narasumber_email_2);
                    $('#narasumber_addr').val(data.msg[0].narasumber_addr);
                    $('#narasumber_city').val(data.msg[0].narasumber_city);
                    $('#narasumber_jabatan').val(data.msg[0].narasumber_jabatan);
                    $('#narasumber_instansi').val(data.msg[0].narasumber_instansi);
                    $('#partner_type').val(partner[0]);
                    $('#partner_name').val(partner[1]);
                    $('#narasumber_birth_place').val(data.msg[0].narasumber_birth_place);
                    $('#narasumber_birth_date').val(data.msg[0].narasumber_birth_date);
                    $('#narasumber_partner_number').val(data.msg[0].narasumber_partner_number);
                    $('#narasumber_keterangan').val(data.msg[0].narasumber_keterangan);

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

    t.on('click', '.btn-delete', function() {
        var row_id = $(this).data('id');
        Swal.fire({
            title: 'Hapus data !',
            type: 'warning',
            html: '<span class="italic">Apakah anda yakin ingin menghapus data narasumber ini ?</span>',
            showCancelButton: true,
            confirmButtonText: "Ya, Hapus!",
            cancelButtonText: "Batalkan",
            confirmButtonColor: "#DD6B55",
            showLoaderOnConfirm: true,
        }).then(function(result) {
            if (result.value) {
                $.ajax({
                    url: base_url + "narasumber/delete",
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