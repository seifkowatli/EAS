
$(document).ready(function () {

//Get User Information

    $.ajax({
        type: "Get",
        url: "http://localhost:2199/api/General/GetUserInformatin",
        contentType: "application/json",
        headers: { 'Authorization': 'Bearer ' + sessionStorage.getItem('accessToken') },

        success: function (data) {


            document.getElementById("full_N").innerHTML = data.F_Name + " " + data.L_Name;
            document.getElementById("MobileID").innerHTML = data.PhoneNumber;
            document.getElementById("EmailID").innerHTML = data.Email;
            document.getElementById("UserNameID").innerHTML = data.UserName;



        },
        error: function (jqXHR) {
            $('#errortxt').text(jqXHR.responseText);
            $('#errortxt').show('fade');
        },
        complete: function (jqXHR) {
            if (jqXHR.status == '401') {

                ////ulEmployee.append('<li style ="color:red">' + jqXHR.status + ':' + jqXHR.statusText + '</li>')
                window.alert(+jqXHR.status + ':' + jqXHR.statusText);
                window.location.href = "http://localhost:3923/test1.html"


            }
        }

    })


    $("#Logoff").on('click', function () {

        sessionStorage.removeItem('accessToken');
        window.location.href = "http://http://localhost:51103";

    })
})


