$(function() {


    $('#btnAdd').on('click', function() {
        $('#getNipModal').modal('show');
    });

    $('#btn-send').on('click', function() {
        var nip = $('#nip').val();

        $.ajax({
            url: base_url + 'sdm_redaksi/get_emp',
            type: "POST",
            dataType: "JSON",
            data: { "nip": nip },
            success: function (data) {
                if ( data.msg.type === 'success' ) {
                    console.log( moment(data.msg.data[0].DATE_BIRTH, 'DD-MM-YYYY').format('YYYY-MM-DD') );
                    $('#emp_nip').val(nip);
                    $('#emp_fname').val(data.msg.data[0].NAME);
                    $('#emp_birth_place').val(data.msg.data[0].PLACE_BIRTH);
                    $('#emp_birth_date').val( moment(data.msg.data[0].DATE_BIRTH, 'DD-MM-YYYY').format('YYYY-MM-DD') );
                    $('#emp_nik').val(data.msg.data[0].KTP_NO);
                    $('#emp_address').val(data.msg.data[0].KTP_ADDR);
                    $('#emp_phone1').val(data.msg.data[0].PHONE);
                    $('#emp_phone2').val(data.msg.data[0].PHONE2);
                    $('#emp_email1').val(data.msg.data[0].EMAIL);
                    $('#emp_email2').val(data.msg.data[0].EMAIL);
                    $('#emp_div').val(data.msg.data[0].DIVISION);
                    $('#emp_dept').val(data.msg.data[0].DEPARTMENT);
                    $('#emp_jabatan').val(data.msg.data[0].POSITION);
                    $('#emp_ext').val(data.msg.data[0].EXT);

                    $('#exampleModal').modal('show');  
                }else{
                    Swal.fire("Failed!", "No data found.", "error");
                }
            }
        });
    });

    $("#sdm-form").ajaxForm({
        dataType: "json",
        url: base_url + 'sdm_redaksi/save',
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
            "url": base_url + "sdm_redaksi/view",
            "type": "POST"
        },
        "searchDelay": 750,
        "columnDefs": [{
            "targets": [6],
            "orderable": false
        }]
    });

    t.on('click', '.btn-detail', function(event) {
        event.preventDefault();
        var row_id = $(this).data('id');
        $.ajax({
            url: base_url + "sdm_redaksi/find",
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

                    $('#text_emp_nip').text(data.msg[0].emp_nip);
                    $('#text_emp_fname').text(data.msg[0].emp_fname);
                    $('#text_emp_nname').text(data.msg[0].emp_nname);
                    $('#text_emp_nik').text(data.msg[0].emp_nik);
                    $('#text_emp_dob').text(data.msg[0].emp_birth_place + ', ' + moment(data.msg[0].emp_birth_date).format('DD MMMM YYYY'));
                    $('#text_emp_addr').text(data.msg[0].emp_addr);
                    $('#text_emp_telephone').html('<span id="text_emp_telephone">' + data.msg[0].emp_phone1 + '<br/>' + data.msg[0].emp_phone2 + '</span>');
                    $('#text_emp_email').html('<span id="text_emp_email">' + data.msg[0].emp_email1 + "<br/>" + data.msg[0].emp_email2 + '</span>');
                    $('#text_emp_comp').text(data.msg[0].emp_comp);
                    $('#text_emp_div').text(data.msg[0].emp_div);
                    $('#text_emp_dept').text(data.msg[0].emp_dept);
                    $('#text_emp_jabatan').text(data.msg[0].emp_jabatan);
                    $('#text_emp_program').text(data.msg[0].emp_program);
                    $('#text_emp_ext').text(data.msg[0].emp_ext);
                    $('#text_emp_atasan').text(data.msg[0].emp_atasan);
                    $('#text_emp_atasan_phone').text(data.msg[0].emp_atasan_phone);
                    $('#text_emp_kontak_darurat_nama').text(data.msg[0].emp_kontak_darurat_nama);
                    $('#text_emp_kontak_darurat_nomor').text(data.msg[0].emp_kontak_darurat_nomor);
                    $('#text_emp_passport').text(data.msg[0].emp_passport);
                    $('#text_emp_expiry_passport').text(data.msg[0].emp_expiry_passport);
                    $('#text_emp_photo').attr('src', base_url + 'asset/files/emp/' + row_id + '/' + data.msg[0].emp_photo);

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
            url: base_url + "sdm_redaksi/find",
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
                    $('#emp_nip').val(data.msg[0].emp_nip);
                    $('#emp_fname').val(data.msg[0].emp_fname);
                    $('#emp_nname').val(data.msg[0].emp_nname);
                    $('#emp_birth_place').val(data.msg[0].emp_birth_place);
                    $('#emp_birth_date').val(data.msg[0].emp_birth_date);
                    $('#emp_nik').val(data.msg[0].emp_nik);
                    $('#emp_address').val(data.msg[0].emp_address);
                    $('#emp_phone1').val(data.msg[0].emp_phone1);
                    $('#emp_phone2').val(data.msg[0].emp_phone2);
                    $('#emp_email1').val(data.msg[0].emp_email1);
                    $('#emp_email2').val(data.msg[0].emp_email2);
                    $('#emp_comp').val(data.msg[0].emp_comp);
                    $('#emp_div').val(data.msg[0].emp_div);
                    $('#emp_dept').val(data.msg[0].emp_dept);
                    $('#emp_jabatan').val(data.msg[0].emp_jabatan);
                    $('#emp_ext').val(data.msg[0].emp_ext);
                    $('#emp_program').val(data.msg[0].emp_program);
                    $('#emp_atasan').val(data.msg[0].emp_atasan);
                    $('#emp_atasan_phone').val(data.msg[0].emp_atasan_phone);
                    $('#emp_kontak_darurat_nama').val(data.msg[0].emp_kontak_darurat_nama);
                    $('#emp_kontak_darurat_nomor').val(data.msg[0].emp_kontak_darurat_nomor);
                    $('#emp_passport').val(data.msg[0].emp_passport);
                    $('#emp_expiry_passport').val(data.msg[0].emp_expiry_passport);

                    $("#type").val("update");
                    $("#id").val(row_id);

                    $('#emp_photo').removeAttr('required');
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
            html: '<span class="italic">Apakah anda yakin ingin menghapus data karyawan ini ?</span>',
            showCancelButton: true,
            confirmButtonText: "Ya, Hapus!",
            cancelButtonText: "Batalkan",
            confirmButtonColor: "#DD6B55",
            showLoaderOnConfirm: true,
        }).then(function(result) {
            if (result.value) {
                $.ajax({
                    url: base_url + "sdm_redaksi/delete",
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