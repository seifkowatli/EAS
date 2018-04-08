
var q;
var id;
var Is_Full_Time_Start = false;
var answers;
var interval;
var counter = 0;

function CallButton() {
    if (counter == 2)
        window.location.href = "http://localhost:46253/Result/Result";

    clearInterval(interval);
    $('#alert').hide();
    correct();
    jQuery('input:checked').removeProp('checked');
    $('#Get_Quest').click();
    
}


function Remove_Selected_Answer(s)
{
   
    var index = answers.indexOf(s);
   
    if (index > -1) {
        answers.splice(index, 1);   
    }
}


function get_quest() {

    answers = [q.Ans1, q.Ans2, q.Ans3, q.Ans4];

    var Selected;

        $('#div1').show('fade');
        id = q.Id;
        document.getElementById('quest1').innerHTML = "-" + ')' + q.Q_Text;

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



 function start_time() {

   var clock;
        clock = $('.clock').FlipClock({
            clockFace: 'DailyCounter',
            autoStart: false,
            callbacks: {
                stop: function () {
                    window.location = "http://localhost:46253/Result/Result"
                }
            }
        });

        clock.setTime(7200);
        clock.setCountdown(true);
        clock.start();
    }
 function question_time() {
        // set time for the particular countdown
        var time = 1 * 60 + 0;

         interval = setInterval(function () {
            var el = document.getElementById('clock1');
            // if the time is 0 then end the counter
            if (time <= 0) {

                $('#alert').show('fade');
                clearInterval(interval);
                remeing_time();
               
            }
            var minutes = Math.floor(time / 60);
            if (minutes < 10) minutes = "0" + minutes;
            var seconds = time % 60;
            if (seconds < 10) seconds = "0" + seconds;
            var text = minutes + ':' + seconds;
            el.innerHTML = text;
            time--;
        }, 1000);
    }
 function remeing_time() {
     var time = 0 + 10;

     interval = setInterval(function () {
         var el = document.getElementById('clock2');
         // if the time is 0 then end the counter
         if (time <= 0) {

             return CallButton();


         }
         var minutes = Math.floor(time / 60);
         if (minutes < 10) minutes = "0" + minutes;
         var seconds = time % 60;
         if (seconds < 10) seconds = "0" + seconds;
         var text = minutes + ':' + seconds;
         el.innerHTML = text;
         time--;
     }, 1000);
 }



 $(document).ready(function () {





    $('#div1').hide();
    $('#Get_Quest').on( 'click',function ()
    {
      
        //$("spanUsername").text('hello' + localStorage.getItem('UserName'))
        $.ajax({
            method: 'Get',
            url: 'http://localhost:2199/api/Get_Question/',
            contentType: "application/json",
            headers: { 'Authorization': 'Bearer ' + sessionStorage.getItem('accessToken') },
            success: function (data) {
                q = data.a;
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

