
function Close_Alert_Div() {

    $('#successText').hide();
    $('#errortxt').hide();
  

}


function GetILOS() {

   
}

function GetCourse() {
  
    $.ajax({
        url: 'http://localhost:2199/api/Teacher/Get_Courses',
        method: 'Get',
        headers: { 'Authorization': 'Bearer ' + sessionStorage.getItem('accessToken') },


        success: function (data) {
           
            $.each(data, function (i, item) {
                $('#CourseID1').append($('<option>', {
                    id: item.Course_ID,
                    text: item.Course_Name
                }));
            })


        },

    });


  

   

}




//Add Question
$(document).ready(function () {

  
    GetCourse();
    $('#successText').hide();
    $('#errortxt').hide();

    //Ans1: $('#A1').val(),
    //    Ans2: $('#A2').val(),
    //        Ans3: $('#A3').val(),
    //            TrueAns: $('#TA').val(),


    //Get_Topic
    $('#CourseID1').on('change', function ()     {

        //empty ILOS 
        $('#TopicS')
            .find('option')
            .remove()
            .end();
   

        var CourseID =$('#CourseID1').children(":selected").attr("id");

        $.ajax({
            type: 'Get',
            url: 'http://localhost:2199/api/Teacher/Get_Topic/'+ CourseID,
            headers: { 'Authorization': 'Bearer ' + sessionStorage.getItem('accessToken') },
            dataType: "json",


            success: function (data) {
                
                $.each(data, function (i, item) {
                    $('#TopicS').append($('<option>', {
                        id: item.Topic_ID,
                        text: item.Topic_Description
                    }));
                })


            },

        });



       
    })

    $('#BtnSave').click(function () {

      
        var Answers = [];

        console.log(Answers);



        var true_Answer = {
            Answer: $('#t-ans').val()
        };
        var Answer1 = {
            Answer: $('#ans1').val()
        };
        var Answer2 = {
            Answer: $('#ans2').val()
        };
        var Answer3 = {
            Answer: $('#ans3').val()
        };




        Answers.push(true_Answer);
        Answers.push(Answer1);
        Answers.push(Answer2);
        Answers.push(Answer3);

      

        var T = document.getElementById("TS");
        var S = T.options[T.selectedIndex].text;

        var D = document.getElementById("DY");
        var Y = D.options[D.selectedIndex].text;

        var Topicid = $('#TopicS').children(":selected").attr("id");



        var N_quest = {
            Question: $('#qt').val(),
            Thinking_Skills: S,
            Expected_Time: $('#ET').val(),
            Difficulty_Level: Y,
            Question_Mark: $('#mk').val(),
            Question_Frequency: 0,
            Topic_ID: Topicid,






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



/////////////////////////////////////////////////////////////////////////////////////////////////////////
//Create Exam




function GetCourseExams() {

    $.ajax({
        url: 'http://localhost:2199/api/Teacher/CourseExams',
        method: 'Get',
        headers: { 'Authorization': 'Bearer ' + sessionStorage.getItem('accessToken') },


        success: function (data) {
           
            $.each(data, function (i, item) {
                $('#CourseExam-T').append($('<option>', {
                    id: item.Exam_ID,
                    text: item.Course_Name + ' ' + item.Exam_Type,
                    value: item.Course_ID
                }));
            })


        },

    });

}



    $(document).ready(function () {

        var NumberOfTopic = 0;
        var ExamInformation = [];
        var TopicPercentage = []
        var ThinkingSkills = [];

        var TestDiv = $('#Topic-t').clone();
        var TestDivF = $('#Topic-tF').clone();

    
        $('#state1').hide();
        $('#state3').hide();
        GetCourseExams();

        $('#finish-t').on('click', function () {


          
            var EI = [];
            $('#create-t').hide();

            $('#state3').show();


          
            var TotalGrade = document.getElementById('ToatalGrade1').value;   
            var ExamPeriod = document.getElementById('Period1').value;



            var ToicDiv = $('#Topic-divF');
            ToicDiv.empty();
            ToicDiv.append(TestDivF);

            for (var i = 0; i < NumberOfTopic; i++) {
                var Topic = [];
                Topic['Text'] = 
                Topic['percentage'] = 

                TopicPercentage.push({
                    'Text': $('#topic-t' + i).text(),
                    'percentage': $('#TS-t' + i).val(),
                });

                
                $('#Topic-tF').hide();

                var temp = TestDivF.clone().prop('id', 'Topic-tF' + i);
                temp.show();



                temp.find("#topic-F").attr("id", "topic-F" + i);
                temp.find("#TS-tF").attr("id", "TS-tF" + i);
                ToicDiv.append(temp);

                document.getElementById("topic-F" + i).innerHTML = TopicPercentage[i].Text ;
                $("#TS-tF" + i).val(TopicPercentage[i].percentage);


            }            
            var Difficulty = {

                'VeryEasy': $('#VES').find('option:selected').val(),
                'Easy': $('#EasyS').find('option:selected').val(),
                'Avarage': $('#AvarageS').find('option:selected').val(),
                'Difficult': $('#DifficultS').find('option:selected').val(),
                'VeryDifficult': $('#MDS').find('option:selected').val()
            };
            

            $("#Very_EasyF").val(Difficulty['VeryEasy']);
            $("#EasyF").val(Difficulty['Easy']);
            $("#AvarageF").val(Difficulty['Avarage']);
            $("#DifficultF").val(Difficulty['Difficult']);
            $("#MostDifficultF").val(Difficulty['VeryDifficult']);


            ThinkingSkills = {

                'Crtical': $('#Crtical-S').find('option:selected').val(),
                'Analysis':$('#Analysis-S').find('option:selected').val(),
               'Practical':$('#Practical-S').find('option:selected').val(),
             'Theoratical':$('#Theoratical-S').find('option:selected').val()

            }
           

            $("#CrticalF").val(ThinkingSkills['Crtical']);
            $("#AnalysisF").val(ThinkingSkills['Analysis']);
            $("#PracticalF").val(ThinkingSkills['Practical']);
            $("#TheoraticalF").val(ThinkingSkills['Theoratical']);



            EI['TotalGrade'] = TotalGrade;
            EI['ExamPeriod'] = ExamPeriod;
            EI['TopicPercentage'] = TopicPercentage;
            EI['Difficulty'] = Difficulty;
            EI['ThinkingSkills'] = ThinkingSkills;
            EI['ExamID'] = $('#CourseExam-T').children(":selected").attr("id");





            ExamInformation.push(EI);

            //Display Exam Infroamation before generat a exam  



           $('#Toatal_GradeF').val(TotalGrade);
           $('#PeriodF').val(ExamPeriod );


           
        })
        $('#CourseExam-T').on('change', function () {

            var ToicDiv = $('#Topic-div');
            ToicDiv.empty();
            ToicDiv.append(TestDiv);

            var CourseID = $('#CourseExam-T').children(":selected").attr("value");
            
            $.ajax({
                type: 'Get',
                url: 'http://localhost:2199/api/Teacher/Get_Topic/' + CourseID,
                headers: { 'Authorization': 'Bearer ' + sessionStorage.getItem('accessToken') },
                dataType: "json",


                success: function (data) {
                    NumberOfTopic = data.length;
                    $.each(data, function (i, item) {
                        $('#Topic-t').hide();

                        var temp = TestDiv.clone().prop('id', 'Topic-t' + i);
                        temp.show();

                        temp.find("#topic-t").attr("id", "topic-t" + i);
                        temp.find("#TS-t").attr("id", "TS-t" + i);
                        ToicDiv.append(temp);
                       // $("topic-t" + i).show();


                        document.getElementById("topic-t" + i).innerHTML = item.Topic_Description;


                    })




                },

            });



        })
        $('#GenerateQestionssID').on('click', function () {

            console.log(ExamInformation.Difficulty);

            
           
            var ExamInfo = {
                TotalGrade: ExamInformation[0].TotalGrade,
                ExamPeriod: ExamInformation[0].ExamPeriod,
                TopicPercentage: ExamInformation[0].TopicPercentage,
                Difficulty: ExamInformation[0].Difficulty,
                ThinkingSkills: ExamInformation[0].ThinkingSkills,
                ExamID: ExamInformation[0].ExamID,
                        };

            $.ajax({


                type: "Post",
                data: JSON.stringify(ExamInfo),
                url: "http://localhost:2199/api/Teacher/GetExamInformation",
                contentType: "application/json",
                headers: { 'Authorization': 'Bearer ' + sessionStorage.getItem('accessToken') },

                success: function (response) {
                    $('#successText').show();

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




        })




      
     

    })





              //  $(this).closest('select').prop("disabled", false)

//$('#checkboxes input:checked').each(function() {
