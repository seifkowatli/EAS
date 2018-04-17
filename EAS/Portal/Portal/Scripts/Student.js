
var Semester = [];
$(document).ready(function(){
    $.ajax({


        type: "Get",
        url: "http://localhost:2199/api/Student/Get_Semester",
        contentType: "application/json",
        headers: { 'Authorization': 'Bearer ' + sessionStorage.getItem('accessToken') },

        success: function (data) {
            Semester = data;
            load();

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

    });


    function load() {
        // get the last DIV which ID starts with ^= "klon"
        var $div = $('div[id^="contanier"]:last');
        document.getElementById("semester_Name").innerHTML = Semester[0].C_Year + '-' + Semester[0].Semester1;
        // Read the Number from that DIV's ID (i.e: 3 from "klon3")
        // And increment that number by 1

        if (Semester.length > 1) {
            for (var i = 1; i < Semester.length; i++) {
                // Clone it and assign the new ID (i.e: from num 4 to ID "klon4")
                var $klon = $div.clone().prop('id', 'contanier' + i);

                $klon.find("#a0").attr("href", "#collapse"+i);
                $klon.find("#collapse0").attr("id", "collapse" + i);
                // Finally insert $klon wherever you want
                $div.append($klon);

                $('#contanier' + i).find("#semester_Name").attr("id", "h" + i);
                document.getElementById("h" + i).innerHTML = Semester[i].C_Year + '-' + Semester[i].Semester1;

            }
        }

    }
})