$(function() {

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

    $("#date_range").daterangepicker({
        autoUpdateInput: false,
        locale: {
            cancelLabel: 'Clear'
        },
        ranges: {
            'Today': [moment(), moment()],
            'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
            'Last 7 Days': [moment().subtract(6, 'days'), moment()],
            'Last 30 Days': [moment().subtract(29, 'days'), moment()],
            'This Month': [moment().startOf('month'), moment().endOf('month')],
            'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')],
        }
    });
    
    $('#date_range').on('apply.daterangepicker', function(ev, picker) {
        $(this).val(picker.startDate.format('YYYY-MM-DD') + "_" + picker.endDate.format('YYYY-MM-DD'));
    });

    $('#date_range').on('cancel.daterangepicker', function(ev, picker) {
        $(this).val('');
    });

    $('#btnPrint').on('click', function() {
        $('#exampleModal3').modal('show');
    });

    $('#btn-confirm').on('click', function() {
        var param = $('#date_range').val();
        if( param != '' ) window.location.href = base_url + 'surat_keluar/print/' + param;
    });

    $('#isi').summernote({
        height: 300
    });


    $('#btnAdd').on('click', function() {

        $.ajax({
            url: base_url + 'surat_keluar/open_modal',
            type: 'POST',
            dataType: 'JSON',
            success: function(data) {
                $('#id').val(data.msg);
                $('#tempno').val(data.msg_2);
                $('#months').val(data.months);

                $('#exampleModal').modal({
                    backdrop: 'static',
                    keyboard: false
                });

                /*window.onbeforeunload = function(e) {
                    e = e || window.event;
                    if (e) {
                        e.returnValue = 'Sure?';
                    }
                }*/
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

        $('#suratKeluar-form').trigger('reset');
        $('#isi').summernote('code', '');
        $('#pengirim').val(null).trigger('change');
        $('#pemeriksa').val(null).trigger('change');

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

    var t = $('#datatable').DataTable({
        "processing": true,
        "pagingType": "simple",
        "language": {
            "processing": '<i class="fa fa-spinner fa-pulse fa-3x fa-fw"></i><span class="sr-only">Loading...</span>'
        },
        "serverSide": true,
        "order": [],
        "ajax": {
            "url": base_url + "surat_keluar/view",
            "type": "POST"
        },
        "searchDelay": 750,
        "columnDefs": [{
            "targets": [10],
            "orderable": false
        }]
    });

    t.on('click', '.btn-edit', function(event) {
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

    t.on('click', '.btn-delete', function() {
        var row_id = $(this).data('id');
        Swal.fire({
            title: 'Hapus data !',
            type: 'warning',
            html: '<span class="italic">Apakah anda yakin ingin menghapus surat ini ?</span>',
            showCancelButton: true,
            confirmButtonText: "Ya, Hapus!",
            cancelButtonText: "Batalkan",
            confirmButtonColor: "#DD6B55",
            showLoaderOnConfirm: true,
        }).then(function(result) {
            if (result.value) {
                $.ajax({
                    url: base_url + "surat_keluar/delete",
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