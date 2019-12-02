function login() {
	$.ajax({
		url : "login?action=login",
		data : $("#frmlogin").serialize(),
		dataType : "json",
		type : "post",
		success : function(result, textStatus, jqxhr) {
			if (result.status == 1) {
				location.href = "admin?action=home";
			} else {
				alert(result.message);
			}
		},
		error : function(jqxhr, textStatus, errorThrown) {
			console.log(jqxhr.status + textStatus + errorThrown);
		}
	});
}