

function Close_Alert_Div() {

    $('#divErrorText').hide();
}
$(document).ready(function () {

    $('#divErrorText').hide();

    $('#btnLogin').click(function () {
        var user = $('#TextUserName').val();

        $.ajax({
            url: 'http://localhost:2199/token',
            method: 'POST',
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            data: {

                UserName: $('#TextUserName').val(),
                PassWord: $('#TextPassWord').val(),
                grant_type: 'password',
            },
            success: function (response) {
                sessionStorage.setItem('accessToken', response.access_token);
                localStorage.setItem('UserName', response.userName);
                window.location = 'http://localhost:46253/Exam/Exam_instructions';
            },
            error: function (jqXHR) {
                $("#P_error").text(jqXHR.responseText);
                $('#divErrorText').show('fade');
            },


        });

    });




});


// Bind normal buttons
