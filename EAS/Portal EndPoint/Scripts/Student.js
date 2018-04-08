// JavaScript source code

$(document).ready(function () {
    var j;
    


    function table(j, v, v2) {

        var table = document.getElementById("myTable");


        var row = table.insertRow(j + 1);
        var cell1 = row.insertCell(0);
        var cell2 = row.insertCell(1);

        cell1.innerHTML = v;
        cell2.innerHTML = v2;


        if ((j + 1) % 2 != 0)
            document.getElementById("myTable").rows[j + 1].style.backgroundColor = "rgb(122, 213, 255)";


    }
   
    function getResult() {
        $("#div1")
        $.ajax({
            method: 'Get',
            url: "http://localhost:2199/api/Result" ,
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            headers: { 'Authorization': 'Bearer ' + sessionStorage.getItem('accessToken') },
            success: function (data) {

                document.getElementById('p1').innerHTML = localStorage.getItem('UserName');
                document.getElementById('p2').innerHTML = data.Final_result;


                $.each(data.Question_List, function (index, value) {

                    j = index;
                    table(j, value[0], value[1]);
                });

                sessionStorage.removeItem('accessToken');

            }


        })

    }

    window.onload = get;








});




$(window).unload(function () {
    alert('Handler for .unload() called.');
});

