

////////////////////////////////////////////////////////////
// if you dont log in !!you Be referred to login page 
//var accessToken = sessionStorage.getItem('accessToken');
//if (accessToken== null)
//    window.location = "http://localhost:46253/";
////////////////////////////////////////////////////////////
function Close_Alert_Div() {


    $('#errortxt').hide();
}

$(document).ready(function () {

    $('#errortxt').hide();


    $('#btnLogin').click(function () {
        var user = $('#TextUserName').val();

        $.ajax({

            url: 'http://localhost:2199/token',
            method: 'POST',
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            data: {

                UserName: $('#user-name').val(),
                PassWord: $('#password').val(),
                grant_type: 'password',
            },
            success: function (response) {
                sessionStorage.setItem('accessToken', response.access_token);
                localStorage.setItem('UserName', response.userName);
                $.ajax({

                    type: "Get",
                    url: "http://localhost:2199/api/Route",
                    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                    headers: { 'Authorization': 'Bearer ' + sessionStorage.getItem('accessToken') },
                    success: function (data) {
                        window.location = data;
                        return;
                    }
                });


            },
            error: function (jqXHR) {
                $('#P_error').text(jqXHR.responseText);
                $('#errortxt').show('fade');
            }


        });

    });




});


// Bind normal buttons
