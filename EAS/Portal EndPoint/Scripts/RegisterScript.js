
$(document).ready(function () {
    $("#LinkClose").click(function () {

        $('#divError').hide('fade')
    });
    $('#btnRegister').click(function () {

        $.ajax({
            url: 'http://localhost:2199/api/account/register',
            method: 'POST',
            headers: { 'Authorization': 'Bearer ' + sessionStorage.getItem('accessToken') },
            data: {
                UserName: $('#TextUserName').val(),
                Phone: $('#TextPhone').val(),
                Email: $('#TextEmail').val(),
                UserRole: $('#TextRole').val(),
                password: $('#TextPassWord').val(),
                F_Name: $('#F_Name').val(),
                L_Name: $('#L_Name').val(),
                confirmpassWord: $('#TextCPassWord').val(),
            },
            success: function () {
               
                $('#successModel').modal('show');

            },
            error: function (jqXHR) {
                $('#divErrorText').text(jqXHR.responseText);
                $('#divError').show('fade');
            }

            

        });

    });




});
