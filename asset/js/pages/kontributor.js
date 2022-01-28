$(function() {

    var data_map = [];

    $.ajax({
        url: base_url + 'kontributor/get_map',
        type: "POST",
        dataType: "JSON",
        success: function(data) {
            if (data.type == 'done') {
                for (var i = 0; i < data.msg.length; i++) {
                    data_map[data.msg[i].kontributor_province] = data.msg[i].TOTAL;
                }
            }
        }
    });

    $('#kontributor_periode').daterangepicker();

    $('#world-map').vectorMap({
        map: 'indonesia_id',
        backgroundColor: '#a5bfdd',
        borderColor: '#818181',
        borderOpacity: 0.25,
        borderWidth: 1,
        color: '#f4f3f0',
        enableZoom: true,
        hoverColor: '#c9dfaf',
        hoverOpacity: null,
        normalizeFunction: 'linear',
        scaleColors: ['#b6d6ff', '#005ace'],
        selectedColor: '#c9dfaf',
        selectedRegions: null,
        showTooltip: true,
        onRegionClick: function(e, c, r) {
            console.log(r);
        },
        onLabelShow: function(e, l, c) {
            if (data_map[l.html()]) {
                l.html(l.html() + ' : ' + data_map[l.html()] + ' Kontributor.');
            }
        }
    })

    $('#btnAdd').on('click', function() {

        $('#exampleModal').modal('show');
    });

    $("#kontributor-form").ajaxForm({
        dataType: "json",
        url: base_url + 'kontributor/save',
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
            "url": base_url + "kontributor/view",
            "type": "POST"
        },
        "searchDelay": 750,
        "columnDefs": [{
            "targets": [5],
            "visible": false
        },{
            "targets": [6],
            "orderable": false
        }]
    });

    t.on('click', '.btn-edit', function(event) {
        event.preventDefault();
        var row_id = $(this).data('id');
        $.ajax({
            url: base_url + "kontributor/find",
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

                    $('#kontributor_name').val(data.msg[0].kontributor_name);
                    $('input[name=kontributor_gender][value="' + data.msg[0].kontributor_gender + '"]').prop('checked', true)
                    $('#kontributor_identity').val(data.msg[0].kontributor_identity);
                    $('#kontributor_birth_place').val(data.msg[0].kontributor_birth_place);
                    $('#kontributor_birth_date').val(data.msg[0].kontributor_birth_date);
                    $('#kontributor_telephone').val(data.msg[0].kontributor_telephone);
                    $('#kontributor_telephone_2').val(data.msg[0].kontributor_telephone_2);
                    $('#kontributor_email').val(data.msg[0].kontributor_email);
                    $('#kontributor_email_2').val(data.msg[0].kontributor_email_2);
                    $('#kontributor_addr').val(data.msg[0].kontributor_addr);
                    $('#kontributor_addr_kirim').val(data.msg[0].kontributor_addr_kirim);
                    $('#kontributor_entry_date').val(data.msg[0].kontributor_entry_date);
                    $('#kontributor_rek_number').val(data.msg[0].kontributor_rek_number);
                    $('#kontributor_ukuran_baju').val(data.msg[0].kontributor_ukuran_baju);
                    $('#kontributor_skype').val(data.msg[0].kontributor_skype);
                    $('#kontributor_platform').val(data.msg[0].kontributor_platform);
                    $('#kontributor_status').val(data.msg[0].kontributor_status);
                    $('#kontributor_province').val(data.msg[0].kontributor_province);
                    $('#kontributor_area').val(data.msg[0].kontributor_area);
                    $('#kontributor_wilayah').val(data.msg[0].kontributor_wilayah);
                    $('#kontributor_country').val(data.msg[0].kontributor_country);

                    $("#kontributor_periode").daterangepicker({
                        startDate: data.msg[0].kontributor_periode_start,
                        endDate: data.msg[0].kontributor_periode_end,
                        locale: {
                            format: 'YYYY-MM-DD',
                            cancelLabel: 'Clear'
                        },
                    });


                    $('#kontributor_bpjs').val(data.msg[0].kontributor_bpjs);
                    $('#kontributor_bpjs_nomor').val(data.msg[0].kontributor_bpjs_nomor);
                    $('#kontributor_bpjs_istri').val(data.msg[0].kontributor_bpjs_istri);
                    $('#kontributor_bpjs_istri_nomor').val(data.msg[0].kontributor_bpjs_istri_nomor);
                    $('#kontributor_bpjs_anak1').val(data.msg[0].kontributor_bpjs_anak1);
                    $('#kontributor_bpjs_anak1_nomor').val(data.msg[0].kontributor_bpjs_anak1_nomor);
                    $('#kontributor_bpjs_anak2').val(data.msg[0].kontributor_bpjs_anak2);
                    $('#kontributor_bpjs_anak2_nomor').val(data.msg[0].kontributor_bpjs_anak2_nomor);
                    $('#kontributor_bpjs_anak3').val(data.msg[0].kontributor_bpjs_anak3);
                    $('#kontributor_bpjs_anak3_nomor').val(data.msg[0].kontributor_bpjs_anak3_nomor);

                    $('#kontributor_camera').val(data.msg[0].kontributor_camera);
                    $('#kontributor_software').val(data.msg[0].kontributor_software);

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

    t.on('click', '.btn-detail', function(event) {
        event.preventDefault();
        var row_id = $(this).data('id');
        $.ajax({
            url: base_url + "kontributor/find",
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
                    $('#text_kontributor_name').text(data.msg[0].kontributor_name);
                    $('#text_kontributor_identity').text(data.msg[0].kontributor_identity);
                    $('#text_kontributor_dob').text(data.msg[0].kontributor_birth_place + ', ' + moment(data.msg[0].kontributor_birth_date).format('DD MMMM YYYY'));
                    $('#text_kontributor_telephone').html('<span id="text_kontributor_telephone">' + data.msg[0].kontributor_telephone + '<br/>' + data.msg[0].kontributor_telephone_2 + '</span>');
                    $('#text_kontributor_email').html('<span id="text_kontributor_email">' + data.msg[0].kontributor_email + "<br/>" + data.msg[0].kontributor_email_2 + '</span>');
                    $('#text_kontributor_addr').text(data.msg[0].kontributor_addr);
                    $('#text_kontributor_addr_kirim').text(data.msg[0].kontributor_addr_kirim);
                    $('#text_kontributor_entry_date').text(moment(data.msg[0].kontributor_entry_date).format('DD MMMM YYYY'));
                    $('#text_kontributor_periode').text(moment(data.msg[0].kontributor_periode_start).format('DD MMMM YYYY') + ' - ' + moment(data.msg[0].kontributor_periode_end).format('DD MMMM YYYY'));
                    $('#text_kontributor_rek_number').text(data.msg[0].kontributor_rek_number);
                    $('#text_kontributor_periode').text(data.msg[0].kontributor_periode);
                    $('#text_kontributor_ukuran_baju').text(data.msg[0].kontributor_ukuran_baju);
                    $('#text_kontributor_skype').text(data.msg[0].kontributor_skype);
                    $('#text_kontributor_platform').text(data.msg[0].kontributor_platform);
                    $('#text_kontributor_status').text(data.msg[0].kontributor_status);
                    $('#text_kontributor_province').text(data.msg[0].kontributor_province);
                    $('#text_kontributor_area').text(data.msg[0].kontributor_area);
                    $('#text_kontributor_wilayah').text(data.msg[0].kontributor_wilayah);
                    $('#text_kontributor_country').text(data.msg[0].kontributor_country);
                    $('#text_kontributor_photo').attr('src', base_url + 'asset/files/kontributor/' + row_id + '/' + data.msg[0].kontributor_photo)
                    $('#text_kontributor_file').attr('href', base_url + 'asset/files/kontributor/' + row_id + '/' + data.msg[0].kontributor_file)

                    $('#text_kontributor_bpjs').text(data.msg[0].kontributor_bpjs);
                    $('#text_kontributor_bpjs_nomor').text(data.msg[0].kontributor_bpjs_nomor);
                    $('#text_kontributor_bpjs_istri').text(data.msg[0].kontributor_bpjs_istri);
                    $('#text_kontributor_bpjs_istri_nomor').text(data.msg[0].kontributor_bpjs_istri_nomor);
                    $('#text_kontributor_bpjs_anak1').text(data.msg[0].kontributor_bpjs_anak1);
                    $('#text_kontributor_bpjs_anak1_nomor').text(data.msg[0].kontributor_bpjs_anak1_nomor);
                    $('#text_kontributor_bpjs_anak2').text(data.msg[0].kontributor_bpjs_anak2);
                    $('#text_kontributor_bpjs_anak2_nomor').text(data.msg[0].kontributor_bpjs_anak2_nomor);
                    $('#text_kontributor_bpjs_anak3').text(data.msg[0].kontributor_bpjs_anak3);
                    $('#text_kontributor_bpjs_anak3_nomor').text(data.msg[0].kontributor_bpjs_anak3_nomor);

                    $('#text_kontributor_camera').text(data.msg[0].kontributor_camera);
                    $('#text_kontributor_software').text(data.msg[0].kontributor_software);

                    var mod = $('#exampleModal2');
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
            html: '<span class="italic">Apakah anda yakin ingin menghapus data kontributor ini ?</span>',
            showCancelButton: true,
            confirmButtonText: "Ya, Hapus!",
            cancelButtonText: "Batalkan",
            confirmButtonColor: "#DD6B55",
            showLoaderOnConfirm: true,
        }).then(function(result) {
            if (result.value) {
                $.ajax({
                    url: base_url + "kontributor/delete",
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