//$("#scheduleBtn").button();
//$("#loginBtn").button().click(function(){});
$("#loginBtn").on('click', function() {
					bootbox
							.dialog({
								title : "Login",
								message : "<form role='form' id='loginform' method='POST' action='LoginValidation.jsp' onsubmit='return validate()'>"
										+ "<div class='form-group'>"
										+ "<label for='username'>Mavs Email</label>"
										+ "<input class='form-control' type='text' name='username' id='username' value=''>"
										+ "</div>"
										+ "<div class='form-group'>"
										+ "<label for='password'>Password</label>"
										+ "<input class='form-control' type='password' name='password' id='password' value=''>"
										+ "</div>" + "</form>"
								// + "<input type='submit' value='Login'
								// id='loginBtn2' class='btn btn-default'>"
								,
								buttons : {
									success : {
										label : "Login",
										className : "btn-primary",
										callback : function() {
											document.getElementById("loginform").submit();
										}
									},

									forgot : {
										label : "Forgot Password",
										className : "btn-secondary",
										callback : function() {
											forgotPassword();
										}
									}
								}

							});
					// bootbox.alert("noooooo", function(){});
				});
$("#leftAccordion").accordion({
	heightStyle : content
});
$("#rightAccordion").accordion({
	heightStyle : content
});
// $("#scheduleBtn").button().click(function(){});

function forgotPassword() {
	bootbox.dialog({
				title : "Forgot Password",
				message : "<form role='form' id='forgotPasswordform' method='POST' action='ForgotPasswordLink.jsp' onsubmit='return validate()'>"
						+ "<div class='form-group'>"
						+ "<label for='username'>Mavs Email</label>"
						+ "<input class='form-control' type='text' name='username' id='username' value=''>"
						+ "</div>",
				buttons : {
					success : {
						label : "Retrieve Password",
						className : "btn-primary",
						callback : function() {
							document.getElementById("forgotPasswordform").submit();
						}
					}
				}

			});
}

function validate() {
	var username = document.forms["loginform"]["username"].value;
	var password = document.forms["loginform"]["password"].value;

	if (username === null || username === "") {
		$("#username").notify("Please enter your username", "error", {
			elementPosition : 'bottom center',
			globalPosition : 'bottom center'
		})
		return false;
	}

	if (password === null || password === "") {
		$("#password").notify("Please enter your password", "error", {
			elementPosition : 'bottom center',
			globalPosition : 'bottom center'
		})
		return false;
	}

}