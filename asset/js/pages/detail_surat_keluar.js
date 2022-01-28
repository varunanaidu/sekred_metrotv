$( function () {

    $('#pengirim').select2({
        dropdownParent: $('#exampleModal'),
        placeholder: "Type NIP or Name",
        minimumInputLength: 2,
        ajax: {
            url: base_url + "surat_keluar/search_sdm",
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

    $('#pemeriksa').select2({
        dropdownParent: $('#exampleModal'),
        placeholder: "Type NIP or Name",
        minimumInputLength: 2,
        ajax: {
            url: base_url + "surat_keluar/search_sdm",
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

    $('#pengirim').on('change', function() {
        var value = $(this).val();

        $.ajax({
            url: base_url + 'surat_keluar/get_jabatan',
            type: 'POST',
            dataType: 'JSON',
            data : {'key':value},
            success: function(data) {
                $('#jabatan_pengirim').val(data.jabatan_pengirim);
            }
        });

    });

    $('#btn-cancel').on('click', function() {

        var type = $('#type').val();

        if (type == '') {
            $.ajax({
                url: base_url + 'surat_keluar/close_modal',
                type: 'POST',
                dataType: 'JSON',
                data: {
                    'id': $('#id').val()
                },
                success: function(data) {
                    $('#exampleModal').modal('hide');
                }
            });
        }else{
            $('#exampleModal').modal('hide');
        }

    });

    $('#btn-edit').on('click', function(event) {
        event.preventDefault();
        var row_id = $(this).data('id');
        $.ajax({
            url: base_url + "surat_keluar/find",
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
                    $arr = data.msg[0].nomor_surat.split('/');
                    $('#tempno').val($arr[0]);
                    $('#kategori').val($arr[1]);
                    $('#months').val($arr[2]);
                    $('#years').val($arr[3]);
                    $('#pengirim').append('<option value="'+data.msg[0].pengirim+'">'+data.msg[0].pengirim+' - '+data.msg[0].pengirim_name+'</option>');
                    $("#jabatan_pengirim").val(data.msg[0].jabatan_pengirim);
                    $("#penerima").val(data.msg[0].penerima);
                    $("#jabatan_penerima").val(data.msg[0].jabatan_penerima);
                    $("#instansi").val(data.msg[0].instansi);
                    $("#tempat_surat").val(data.msg[0].tempat_surat);
                    $("#tanggal_surat").val(data.msg[0].tanggal_surat);
                    $("#perihal").val(data.msg[0].perihal);
                    $('#pemeriksa').append('<option value="'+data.msg[0].pemeriksa+'">'+data.msg[0].pemeriksa+' - '+data.msg[0].pemeriksa_name+'</option>');
                    $("#isi").summernote('code', data.msg[0].isi);
                    $("#type").val("update");
                    $("#id").val(row_id);

                    var mod = $('#exampleModal');
                    mod.find('#modal-type').text('Edit');
                    mod.modal({
                        backdrop: 'static',
                        keyboard: false
                    });
                }
            },
            error: function() {
                Swal.fire("(500)", "Error Occurred, Please refresh your browser.", "error");
            }
        });
    });

    $("#suratKeluar-form").ajaxForm({
        dataType: "json",
        url: base_url + 'surat_keluar/save',
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

    $('#btn-send').on('click', function(event) {
    	event.preventDefault();

    	$('#surat_id').val( $(this).data('id') );
    	$('#exampleModal2').modal('show');
    });

    $("#notes-form").ajaxForm({
        dataType: "json",
        url: base_url + 'surat_keluar/save_notes',
        beforeSubmit: function() {
            $('#btn-submit2').removeClass('btn-primary').addClass('btn-warning').prop('disabled', true);
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
            $('#btn-submit2').removeClass('btn-warning').addClass('btn-primary').prop('disabled', false);
        }
    });

    $('#btn-approve').on('click', function() {
        var row_id = $(this).data('id');
        Swal.fire({
            title: 'Peringatan !',
            type: 'warning',
            html: '<span class="italic">Apakah anda yakin surat ini sudah benar dan ingin disetujui ? ?</span>',
            showCancelButton: true,
            confirmButtonText: "Ya, Lanjutkan!",
            cancelButtonText: "Batalkan",
            confirmButtonColor: "#DD6B55",
            showLoaderOnConfirm: true,
        }).then(function(result) {
            if (result.value) {
                $.ajax({
                    url: base_url + "surat_keluar/approve_surat",
                    type: 'post',
                    data: {
                        'surat_id': row_id
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
                            if (data.type == 'done') window.location.href = base_url + 'surat_keluar';
                        });
                    }
                });
            } else {
                Swal.fire('Dibatalkan', '', 'warning');
            }
        });
    });

    $('#btn-print').on('click', function() {
        var row_id = $(this).data('id');
        Swal.fire({
            title: 'Peringatan !',
            type: 'warning',
            html: '<span class="italic">Apakah anda yakin surat ini sudah benar dan ingin diprint ? ?</span>',
            showCancelButton: true,
            confirmButtonText: "Ya, Lanjutkan!",
            cancelButtonText: "Batalkan",
            confirmButtonColor: "#DD6B55",
            showLoaderOnConfirm: true,
        }).then(function(result) {
            if (result.value) {
                $.ajax({
                    url: base_url + "surat_keluar/print_surat",
                    type: 'post',
                    data: {
                        'surat_id': row_id
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
                            if (data.type == 'done') window.location.href = base_url + 'surat_keluar/generate_word3/' + row_id;
                        });
                    }
                });
            } else {
                Swal.fire('Dibatalkan', '', 'warning');
            }
        });
    });
	
});