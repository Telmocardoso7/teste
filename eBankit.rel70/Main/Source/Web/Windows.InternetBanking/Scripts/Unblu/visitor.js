var unbluServer = $("[id$=hdnUnbluServer]").val();
var unbluApiKey = $("[id$=hdnUnbluApykey]").val();
var jwtUserToken = $("[id$=jwtUserToken]").val();

var loadJS = function (url, implementationCode) {
    var scriptTag = document.createElement('script');
    scriptTag.src = url;

    scriptTag.onload = implementationCode;
    scriptTag.onreadystatechange = implementationCode;

    document.body.appendChild(scriptTag);
};

function getAuthenticationState() {
	$.ajax({
		method: "POST",
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		url: "services.axd?Method=GetAssistanceAuthentication",
		success: function (res) {
			if (res == false) {
				callAuthentication();
            }
        }
	});
}

function setAuthenticationState() {
	$.ajax({
		method: "POST",
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		url: "services.axd?Method=SetAssistanceAuthentication"
	});
}

function callAuthentication() {
	var data = { token: jwtUserToken, type: 'JWT' };

	$.ajax({
		method: "POST",
		type: 'json',
		crossDomain: true,
		url: unbluServer + "unblu/rest/v3/authenticator/loginWithSecureToken?x-unblu-apikey=" + unbluApiKey,
		data: JSON.stringify(data),
		headers: {
			"Content-Type": "application/json; charset=utf-8",
		},
		xhrFields: {
			withCredentials: true
		},
		success: function (res) {
			setAuthenticationState();
		}
	});
}

function activateUnbluJwt() {
	if (typeof jwtUserToken === "undefined") {
		return;
	}

	getAuthenticationState();
}

function logoutUnblu() {
	$.ajax({
		method: "POST",
		contentType: "application/json; charset=utf-8",
		url: unbluServer + "unblu/rest/v3/authenticator/logout",
		xhrFields: {
			withCredentials: true
		},
	});
}

loadJS(unbluServer + "unblu/visitor.js?x-unblu-apikey=" + unbluApiKey, activateUnbluJwt);


