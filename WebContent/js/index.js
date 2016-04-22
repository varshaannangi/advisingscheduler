//$("#scheduleBtn").button();
//$("#loginBtn").button().click(function(){});
$("#loginBtn")
		.on(
				'click',
				function() {
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
											document
													.getElementById("loginform")
													.submit();
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
	bootbox
			.dialog({
				title : "Forgot Password",
				message : "<form role='form' id='forgotPasswordform' method='POST' action='ForgotPassword.jsp' onsubmit='return validate()'>"
						+ "<div class='form-group'>"
						+ "<label for='username'>Mavs Email</label>"
						+ "<input class='form-control' type='text' name='username' id='username' value=''>"
						+ "</div>"
						+ "<div class='form-group'>"
						+ "<label for='securityQuestion'>Security Question</label>"
						+ "<select name='securityQuestion' id='securityQuestion' class='form-control' >"
						+ "<option value='What was your childhood nickname?'>What was your childhood nickname?</option>"
						+ "<option value='What is the name of your favorite childhood friend?'>What is the name of your favorite childhood friend?</option>"
						+ "<option value='What is your favorite movie?'>What is your favorite movie?</option>"
						+ "<option value='What school did you attend for sixth grade?'>What school did you attend for sixth grade?</option>"
						+ "</select>"
						+ " </div>"
						+ "<div class='form-group'>"
						+ "<label for='securityAnswer'>Security Question</label>"
						+ "<input type='text' name='securityAnswer' id='securityAnswer' value='' class='form-control'>"
						+ "</div>",
				buttons : {
					success : {
						label : "Retrieve Password",
						className : "btn-primary",
						callback : function() {
							document.getElementById("forgotPasswordform")
									.submit();
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