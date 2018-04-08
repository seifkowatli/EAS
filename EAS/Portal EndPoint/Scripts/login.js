



$(document).ready(function () {

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

              
                $.ajax({
                    
                    type: "Get",                   
                    url: "http://localhost:2199/api/Role",
                    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                    headers: { 'Authorization': 'Bearer ' + sessionStorage.getItem('accessToken') },
                    success: function (data) {
                        window.location = data;
                        return;
                    }
                });
                    
            
            },
            error: function (jqXHR) {
                $('#divErrorText').text(jqXHR.responseText);
                $('#divError').show('fade');
                window.alert("Error In Login Info");
            }


        });

    });




});


// Bind normal buttons
