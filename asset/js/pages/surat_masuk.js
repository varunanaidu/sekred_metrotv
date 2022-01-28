$(function() {

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
        $('#exampleModal2').modal('show');
    });

    $('#btn-confirm').on('click', function() {
        var param = $('#date_range').val();
        if (param != '')
            window.location.href = base_url + 'surat_masuk/print/' + param;
    });

    $('#timepicker').datetimepicker({
        use24hours: true,
        language: 'en',
        format: 'LTS',
        format: 'HH:mm:ss',
    })

    $('#btnAdd').on('click', function() {
        $('#exampleModal').modal('show');
    });

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

    $("#suratMasuk-form").ajaxForm({
        dataType: "json",
        url: base_url + 'surat_masuk/save',
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
            "url": base_url + "surat_masuk/view",
            "type": "POST"
        },
        "searchDelay": 750,
        "columnDefs": [{
            "targets": [9],
            "orderable": false,
            "className": "dt-body-center",
        }]
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
                    url: base_url + "surat_masuk/delete",
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