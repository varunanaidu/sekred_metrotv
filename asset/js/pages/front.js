$( function () {

	$('#information_container').on('click', 'a', function(event) {
		event.preventDefault();
		
		var row_id = $(this).data('id');
        $.ajax({
            url: base_url + "site/show_information",
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
                    $('#informasi_text').text(data.msg[0].informasi_text);
                    $('#informasi_content').text(data.msg[0].informasi_content);

                    var mod = $('#informationModal');
                    mod.modal('show');
                }
            },
            error: function() {
                Swal.fire("(500)", "Error Occurred, Please refresh your browser.", "error");
            }
        });
	});
	
});