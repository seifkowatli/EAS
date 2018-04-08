
var question;
var question_ID;
var answers;
var interval;
var counter = 0;


//after end the exam go to  result page 
function CallButton() {
    if (counter == 10)
        window.location.href = "http://localhost:46253/Result/Result";

    clearInterval(interval);
    $('#alert').hide();
    correct();
    jQuery('input:checked').removeProp('checked');
    $('#Get_Quest').click();
    
}


//remove selected student answer
function Remove_Selected_Answer(s)
{
   
    var index = answers.indexOf(s);
   
    if (index > -1) {
        answers.splice(index, 1);   
    }
}


function get_quest() {

    answers = [q.Question_Answer1, q.Question_Answer2, q.Question_Answer3, q.Question_Answer4];

    var Selected;

        $('#div1').show('fade');
        question_ID = q.Id;
        document.getElementById('quest1').innerHTML = "-" + ')' + q.Quest_Text;

        Selected = answers[Math.floor(Math.random() * 3)];
        document.getElementById("ans1-t").textContent = Selected;
         Remove_Selected_Answer(Selected);

         Selected = answers[Math.floor(Math.random() * 2)];
         document.getElementById("ans2-t").textContent = Selected;
         Remove_Selected_Answer(Selected);

         Selected = answers[Math.floor(Math.random() * 1)];
         document.getElementById("ans3-t").textContent = Selected;

        document.getElementById("ans4-t").textContent = q.Ans3;

}


 function correct() {


        $(document).ready(function () {

            
            

            if ($('#ans1').is(':checked')) {

                answer1 = $('#ans1-t').text();
            }



            else if ($('#ans2').is(':checked')) {
                answer1 = $('#ans2-t').text();
            }

            else if ($('#ans3').is(':checked')) {
                answer1 = $('#ans3-t').text();
            }


            else if ($('#ans4').is(':checked')) {
                answer1 = $('#ans4-t').text();
            }
            else
            {
                answer1 = "No Answer";
            }

            var q = {
                id: id,
                answer: answer1,
            };
            

            $.ajax({
                type: "Post",
                data: JSON.stringify(q),
                headers: { 'Authorization': 'Bearer ' + sessionStorage.getItem('accessToken') },
                url: "http://localhost:2199/api/Questions_Correcting/Q_correct",
                contentType: "application/json",
                success: function () {
                   
                },


                complete: function () {

                },


            })



        })

        



 }







 $(document).ready(function () {






     //get question from OES_Server
    $('#Get_Quest').on( 'click',function ()
    {
      
        //$("spanUsername").text('hello' + localStorage.getItem('UserName'))
        $.ajax({
            method: 'Get',
            url: 'http://localhost:2199/api/Get_Question/',
            contentType: "application/json",
            headers: { 'Authorization': 'Bearer ' + sessionStorage.getItem('accessToken') },
            success: function (data) {
                question = data;
                counter = data.counter;
                if (Is_Full_Time_Start==false) {
                    $('#Get_Quest').hide();
                    start_time();
                    Is_Full_Time_Start = true;
                }
                question_time();
                get_quest();

               

            },
            complete: function (jqXHR) {


              

                if (jqXHR.status == '401') {

                    ////ulEmployee.append('<li style ="color:red">' + jqXHR.status + ':' + jqXHR.statusText + '</li>')
                    window.location.href = "http://localhost:46253"


                }
            }


        });
      
        
        });
        $('#Log_Off').click(function () {

           
            bootbox.confirm("Are you sure?", function (result) {
                if (result) {
                    window.location.href = "http://localhost:46253/Result/Result";


                }


            })
           




        }
            )
    });

