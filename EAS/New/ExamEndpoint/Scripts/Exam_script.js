

////////////////////////////////////////////////////////////
// if you dont log in !!you Be referred to login page  
var accessToken = sessionStorage.getItem('accessToken');
if (accessToken == null)
    window.location = "http://localhost:46253/";


/////////////////////////////////////////////////////////Exam Script//////////////////
$(document).ready(function () {

    $('#ExamFinash').hide();

});

var temps = [];
var Timer1, Timer2;
var distance2;
var Questions = [];//to save  question from server before apply filter1
var Questions_F1 = [];// to save  question from server after apply filter1
var StudentAnswers = [];
var allow = [];
var question_ID;
var StartExam = false;
var current_Question = 0;


/////////////////////////////////////////////////   Start the Exam on load page
Exam_Eng();
/////////////////////////////////////////////////
function Exam_Time(time) {


    // Set the date we're counting down to
    var countDownDate = new Date(Date.now());
    countDownDate.setHours(countDownDate.getHours() + time);

    // Update the count down every 1 second
    Timer1 = setInterval(function () {

        // Get todays date and time
        var now = new Date().getTime();

        // Find the distance between now an the count down date
        var distance = countDownDate - now;

        // Time calculations for days, hours, minutes and seconds
        // var days = Math.floor(distance / (1000 * 60 * 60 * 24));
        var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((distance % (1000 * 60)) / 1000);

        // Output the result in an element with id="cd"
        document.getElementById("cd").innerHTML = hours + "h "
            + minutes + "m " + seconds + "s ";

        // If the count down is over, write some text 
        if (distance < 0) {
            clearInterval(Timer1);
            document.getElementById("cd").innerHTML = "EXPIRED";
        }
    }, 1000);


}


function Start_Question_time(m, s) {

    var minute = Number(m);
    var second = Number(s);
    var countDownDate_q = new Date(Date.now());
    countDownDate_q.setMinutes(countDownDate_q.getMinutes() + minute);
    countDownDate_q.setSeconds(countDownDate_q.getSeconds() +( second+1));
    Timer2 = setInterval(function () {

        // Get todays date and time
        var now = new Date().getTime();

        // Find the distance between now an the count down date
        distance2 = countDownDate_q - now;

        // Time calculations for days, hours, minutes and seconds

        var minutes = Math.floor((distance2 % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((distance2 % (1000 * 60)) / 1000);

        // Output the result in an element with id="cdq"
        document.getElementById("cdq").innerHTML =
            + minutes + "m " + seconds + "s ";

        // If the count down is over, write some text 
        if (distance2 < 0) {
            document.getElementById("cdq").innerHTML = "EXPIRED";
            clearInterval(Timer2);
            Time_EXPIRED();
        }
    }, 1000);
}



// request for next question
function Exam_Eng() {

    if (StartExam == false) {
        StartExam = true;
        Get_All_Questions();
      Exam_Time(2);




    }
    else {
        Question_Next_counts++;
        save();
        Get_Next_Question();
    }

}




//remove answer after randomly 
function Remove_Selected_Answer(s) {

    var index = answers.indexOf(s);

    if (index > -1) {
        answers.splice(index, 1);
    }
}

//Change_the_order_of_Answers for ever question
function COA() {


    // current_Question++;

    for (var i = 0; i < Questions.length; i++) {

        var singleObj = {};

        singleObj['Q_ID'] = Questions[i].Question_ID;
        singleObj['Question_Text'] = Questions[i].Question_Text;



        answers = [Questions[i].Question_Answer1, Questions[i].Question_Answer2, Questions[i].Question_Answer3];

        var Selected;
        Selected = answers[Math.floor(Math.random() * 3)];
        singleObj['Q_ans1'] = Selected;
        Remove_Selected_Answer(Selected);

        Selected = answers[Math.floor(Math.random() * 2)];
        singleObj['Q_ans2'] = Selected;
        Remove_Selected_Answer(Selected);

        Selected = answers[Math.floor(Math.random() * 1)];
        singleObj['Q_ans3'] = Selected;

        singleObj['Q_ans4'] = Questions[i].Question_Answer4;

        singleObj['remaining_minutes'] = Questions[i].Expected_Time;//beacuse Expected_Time string in database
        singleObj['remaining_seconds'] = 0;
        singleObj['Student_Answer'] = " ";
        singleObj['is_Time_Expered'] = false;
        singleObj['Answer_number'] = -1;



        Questions_F1.push(singleObj);

    }
    console.log(Questions_F1);

    

    QFU(Questions_F1[current_Question])

}
//Display Question For USR
function QFU(q) {


    document.getElementById('Question_Text').innerHTML = "-" + ')' + q.Question_Text;

    document.getElementById("Q_ans1").textContent = q.Q_ans1;


    document.getElementById("Q_ans2").textContent = q.Q_ans2;

    document.getElementById("Q_ans3").textContent = q.Q_ans3;

    document.getElementById("Q_ans4").textContent = q.Q_ans4;

    clearInterval(Timer2);
    Start_Question_time(q.remaining_minutes, q.remaining_seconds);


}
//Sttrat Exam Time






function Next_Question() {

   

   
        save_Student_Answer();
        if (current_Question < Questions_F1.length - 1) {


            for (var i = current_Question + 1; i <= Questions_F1.length - 1; i++) {

                if (Questions_F1[i].is_Time_Expered == false) {
                    if (Questions_F1[current_Question].is_Time_Expered == false) {
                        xx = distance2;
                        var minutes = Math.floor((xx % (1000 * 60 * 60)) / (1000 * 60));
                        var seconds = Math.floor((xx % (1000 * 60)) / 1000);
                        Questions_F1[current_Question].remaining_minutes = minutes;
                        Questions_F1[current_Question].remaining_seconds = seconds;

                        
                    }

                    current_Question = i;
                    //clear previous Answer
                    jQuery('input:checked').removeProp('checked');
                    QFU(Questions_F1[current_Question]);
                    Previous_SA(Questions_F1[current_Question]);
                    break;
                }
            }







            console.log(Questions_F1);
        }
        else
            window.alert("Last One");
    
}


function Previous_Question() {


   
    

        if (current_Question > 0) {


            for (var i = current_Question - 1; i >= 0; i--) {

                if (Questions_F1[i].is_Time_Expered == false) {
                    if (Questions_F1[current_Question].is_Time_Expered == false) {
                        xx = distance2;
                        var minutes = Math.floor((xx % (1000 * 60 * 60)) / (1000 * 60));
                        var seconds = Math.floor((xx % (1000 * 60)) / 1000);
                        Questions_F1[current_Question].remaining_minutes = minutes;
                        Questions_F1[current_Question].remaining_seconds = seconds;
                        //clear timer 
                        clearInterval(Timer2);
                    }

                    current_Question = i;

                    QFU(Questions_F1[current_Question]);

                    Previous_SA(Questions_F1[current_Question]);
                    break;
                }
            }

        }
        else
            window.alert("First One");
    }



//save Previous  student anser
function Previous_SA(q) {


    if (q.Student_Answer != -1) {
        if (q.Answer_number == 1)
            $("#Ans1").prop("checked", true);

        else if (q.Answer_number == 2)
            $("#Ans2").prop("checked", true);

        else if (q.Answer_number == 3)
            $("#Ans3").prop("checked", true);

        else if (q.Answer_number == 4)
            $("#Ans4").prop("checked", true);
    }
}


function Get_All_Questions() {

    $.ajax({

        method: 'Get',
        url: 'http://localhost:2199/api/QuestionAlgorithms/LoadQuestions',
        contentType: "application/json",
        headers: { 'Authorization': 'Bearer ' + sessionStorage.getItem('accessToken') },
        success: function (data) {
            Questions = data;
            COA();//filter1
        },
        complete: function (jqXHR) {



            if (jqXHR.status == '401') {

                ////ulEmployee.append('<li style ="color:red">' + jqXHR.status + ':' + jqXHR.statusText + '</li>')
                window.location.href = "http://localhost:46253"


            }
        }


    });
}

function save_Student_Answer()
{
   
    if ($('#Ans1').is(':checked'))
    {
        Questions_F1[current_Question].Student_Answer = document.getElementById("Q_ans1").textContent;
        Questions_F1[current_Question].Answer_number = 1;  
    }
    else if ($('#Ans2').is(':checked')) {
        Questions_F1[current_Question].Student_Answer = document.getElementById("Q_ans2").textContent;
        Questions_F1[current_Question].Answer_number = 2;
    }

    else if ($('#Ans3').is(':checked')) {
        Questions_F1[current_Question].Student_Answer = document.getElementById("Q_ans3").textContent;
        Questions_F1[current_Question].Answer_number = 3;
    }
    else if ($('#Ans4').is(':checked')) {
        Questions_F1[current_Question].Student_Answer = document.getElementById("Q_ans4").textContent;
        Questions_F1[current_Question].Answer_number = 4;
    }
    
        else {
           
        Questions_F1[current_Question].Student_Answer = "NO Answer";
    }

}




function Time_EXPIRED()
{
    save_Student_Answer();
    clearInterval(Timer2);
    Questions_F1[current_Question].is_Time_Expered = true;
    Next_Question();
    //Questions_F1.splice(current_Question, 1);
}

function Save_Student_Answer_in_DB() {

   

    var Student_Answer = [];
    var singleObj = {};


    for (var i = 0; i < Questions_F1.length; i++) {

        var singleObj = {};
        singleObj['Question_ID'] = Questions_F1[i].Q_ID;
        singleObj['Exam_ID'] = 1;
        singleObj['Student_Answer'] = Questions_F1[i].Student_Answer;
        Student_Answer.push(singleObj);

    }
    console.log(Student_Answer);

    $.ajax({

        method: 'Post',
        data: JSON.stringify(Student_Answer),
        url: 'http://localhost:2199/api/QuestionsCorrection/correction',
        contentType: "application/json",
        headers: { 'Authorization': 'Bearer ' + sessionStorage.getItem('accessToken') },
        success: function () {
            window.location=('http://localhost:46253/Result/Result');
        },
        complete: function (jqXHR) {

            if (jqXHR.status == '401') {
                window.alert("ok");
            }
        }
    })
}


function SubmitQuestion() {

   

  
    if (Questions_F1.length == 1) {
        $('#ExamDiv').hide();
        $('#ExamFinash').show();
        window.location = ('http://localhost:46253/Result/Result');
    }
    
     else if (Questions_F1.length > 1 && current_Question < Questions_F1.length - 1) {

            Questions_F1.splice(current_Question, 1);

            QFU(Questions_F1[current_Question]);
            console.log(Questions_F1.length);
        }

     else if (current_Question == Questions_F1.length - 1) {

            Questions_F1.splice(Questions_F1.length - 1, 1);

            jQuery('input:checked').removeProp('checked');
            QFU(Questions_F1[--current_Question]);
            console.log(Questions_F1.length);
        }

    }




    
/////////////////////////////////////////////////////////////////////////////////////////////////////

