$(function() {

var fileTarget = $('.filebox .upload-hidden');

		fileTarget.on('change',
				function() { // 값이 변경되면
					if (window.FileReader) { // modern browser
						var filename = $(this)[0].files[0].name;
					} else { // old IE
						var filename = $(this).val().split('/').pop().split(
								'\\').pop(); // 파일명만 추출
					}

					// 추출한 파일명 삽입
					$(this).siblings('.upload-name').val(filename);
				});

});


function LoadImg(value) {
		if (value.files && value.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#userImg').attr('src', e.target.result);
			}

			reader.readAsDataURL(value.files[0]);
		}
	}

	function ResetImg() {
		$('#userImg').val('');
		$('#userImg')
				.attr('src',
						'${pageContext.servletContext.contextPath}/resources/images/unknown2.jpg');

		if (/(MSIE|Trident)/.test(navigator.userAgent)) {
			// ie 일때 input[type=file] init.
			$("#fileUpload").replaceWith($("#fileUpload").clone(true));
		} else {
			// other browser 일때 input[type=file] init.
			$("#fileUpload").val("");
		}

	}