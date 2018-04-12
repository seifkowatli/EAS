
function Close_Alert_Div() {

    $('#successText').hide();
    $('#errortxt').hide();
}

$(document).ready(function () {



    $('#successText').hide();
    $('#errortxt').hide();

    //Ans1: $('#A1').val(),
    //    Ans2: $('#A2').val(),
    //        Ans3: $('#A3').val(),
    //            TrueAns: $('#TA').val(),

    $('#BtnSave').click(function () {

        var Answers = [];

        console.log(Answers);



        var true_Answer = {
            Answer_Text: $('#t-ans').val()
        };
        var Answer1 = {
            Answer_Text: $('#ans1').val()
        };
        var Answer2 = {
            Answer_Text: $('#ans2').val()
        };
        var Answer3 = {
            Answer_Text: $('#ans3').val()
        };




        Answers.push(true_Answer);
        Answers.push(Answer1);
        Answers.push(Answer2);
        Answers.push(Answer3);

        console.log(Answers);

        var T = document.getElementById("TS");
        var S = T.options[T.selectedIndex].text;

        var D = document.getElementById("DY");
        var Y = D.options[D.selectedIndex].text;


        var N_quest = {
            Question_Text: $('#qt').val(),
            Thinking_Skills: S,
            Expected_Time: $('#ET').val(),
            Difficulty_Level: Y,
            Question_Mark: $('#mk').val(),
            Question_Frequency: 0,





        };
        console.log(N_quest)

        $.ajax({


            type: "Post",
            data: JSON.stringify(N_quest),
            url: "http://localhost:2199/api/Teacher/Add_New_Question",
            contentType: "application/json",
            headers: { 'Authorization': 'Bearer ' + sessionStorage.getItem('accessToken') },

            success: function (response) {
                $.ajax({

                    type: "Post",
                    data: JSON.stringify(Answers),
                    url: "http://localhost:2199/api/Teacher/Add_Answers",
                    contentType: "application/json",
                    headers: { 'Authorization': 'Bearer ' + sessionStorage.getItem('accessToken') },

                    success:
                    $('#successText').show('fade')

                })

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




    });
    $('#Log_Off').click(function () {

        sessionStorage.removeItem('accessToken');
        window.location.href = "http://localhost:3923/test1.html";

    }


    )
});




