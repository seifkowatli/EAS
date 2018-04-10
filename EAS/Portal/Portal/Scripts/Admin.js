// Add New User (Register)


////////////////////////////////////////////////////////////
// if you dont log in !!you Be referred to login page 
var accessToken = sessionStorage.getItem('accessToken');
if (accessToken== null)
    window.location = "http://localhost:46253/";
////////////////////////////////////////////////////////////
function Close_Alert_Div() {

    $('#successText').hide();
    $('#errortxt').hide();
}

function randomPassword(length) {
    var chars = "abcdefghijklmnopqrstuvwxyz1234567890";
    var chars2 = "!@#$%^&*()-+<>";
    var chars3 = "ABCDEFGHIJKLMNOP"
    var number = "1234567890";
    var pass = "";
    for (var x = 0; x < length; x++) {
        var i = Math.floor(Math.random() * chars.length);
        pass += chars.charAt(i);
        var i = Math.floor(Math.random() * chars2.length);
        pass += chars2.charAt(i);
        var i = Math.floor(Math.random() * chars3.length);
        pass += chars3.charAt(i);
        var i = Math.floor(Math.random() * number.length);
        pass += number.charAt(i);

    }
    return pass;
}


$(document).ready(function () {

    $('#successText').hide();
    $('#errortxt').hide();

    $('#btnRegister').click(function () {


        var Random_Password = randomPassword(4);
        console.log(Random_Password);
       

   
        $.ajax({
            url: 'http://localhost:2199/api/account/register',
            method: 'POST',
            headers: { 'Authorization': 'Bearer ' + sessionStorage.getItem('accessToken') },
            data: {
                UserName: $('#TextUserName').val(),
                Phone: $('#TextPhone').val(),
                Email: $('#TextEmail').val(),
                UserRole: $('#TextRole').find(":selected").text(),
                password: Random_Password,
                confirmpassWord: Random_Password,
                F_Name: $('#F_Name').val(),
                L_Name: $('#L_Name').val(),

            },
            success: function () {

                $('#successText').show('fade');


            },
            
            error: function (jqXHR) {
                $('#P_error').text(jqXHR.responseText);
                $('#errortxt').show('fade');
            }



        });

    });




});











//