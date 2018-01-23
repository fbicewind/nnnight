function _logout() {
	$.ajax({
		type : 'POST',
		url : _path + '/logout',
		dataType : 'json',
		success : function(result) {
			if (result.status == 'success') {
				window.location.reload();
			} else {
				alert('退出失败')
			}
		}
	});
}