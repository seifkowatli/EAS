
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
    var count1 = 0;
    var count2 = 0;
    var count3 = 0;


    var TestDiv = $('#Topic-t').clone();
    var TestDivF = $('#Topic-tF').clone();


    $('#state1').hide();
    $('#state3').hide();
    GetCourseExams();

    $("#next2").on('click', function () {





        currentIndex = $('#theCarousel div.active').index();
        console.log(currentIndex);
        if (currentIndex == 1) {
            count1 = 0;
            console.log(NumberOfTopic);
            for (var i = 0; i < NumberOfTopic; i++) {

                count1 = count1 + parseInt($("#TS-t" + i).val())


            }
            console.log(count1);

            if ((count1 < 100) || (count1 > 100)) {
                window.alert("sum of Difficulty percentage must ne 100% ");
                $('#theCarousel').carousel(0);
                $('#theCarousel').carousel(1);

            }

            else if (count1 == 100) {

                $('#theCarousel').carousel(2);

            }



        }

        if (currentIndex == 2) {
            count2 = 0;

            count2 = parseInt(parseInt($('#VES').val()) + parseInt($('#EasyS').val()) + parseInt($('#AvarageS').val()) + parseInt($('#DifficultS').val()) + parseInt($('#MDS').val()))


            if ((count2 < 100) || (count2 > 100)) {
                window.alert("sum of Difficulty percentage must ne 100% ");
                $('#theCarousel').carousel(0);
                $('#theCarousel').carousel(2);

            }

            else if (count2 == 100) {

                $('#theCarousel').carousel(3);

            }



        }
        if (currentIndex == 3) {
            count3 = 0;

            count3 = parseInt(parseInt($('#Crtical-S').val()) + parseInt($('#Analysis-S').val()) + parseInt($('#Practical-S').val()) + parseInt($('#Theoratical-S').val()) + parseInt($('#Compiling-S').val()))


            if ((count3 < 100) || (count3 > 100)) {
                window.alert("sum of Difficulty percentage must ne 100% ");
                $('#theCarousel').carousel(0);
                $('#theCarousel').carousel(3);

            }

            else if (count3 == 100) {

                $('#theCarousel').carousel(3);

            }



        }




    })
    $('#finish-t').on('click', function () {
        console.log(count1);
        console.log(count2);
        console.log(count3);

        if (count1 == 100 && count2 == 100 && count3 == 100) {

            var EI = [];
            $('#create-t').hide();
            $('#state3').show();
            $('#myModal').modal('hide');




            var TotalGrade = document.getElementById('ToatalGrade1').value;
            var ExamPeriod = document.getElementById('Period1').value;



            var ToicDiv = $('#Topic-divF');
            ToicDiv.empty();
            ToicDiv.append(TestDivF);

            for (var i = 0; i < NumberOfTopic; i++) {
                var Topic = [];
                //Topic['Text'] =;
                //  Topic['percentage'] =;

                if ($('#TS-t' + i).val() > 0) {
                    TopicPercentage.push({
                        'ID': $("#TS-t" + i + " option:first").attr('id'),
                        'percentage': $('#TS-t' + i).val(),
                        'Text': $('#topic-t' + i).text()
                    });




                    $('#Topic-tF').hide();

                    var temp = TestDivF.clone().prop('id', 'Topic-tF' + i);
                    temp.show();



                    temp.find("#topic-F").attr("id", "topic-F" + i);
                    temp.find("#TS-tF").attr("id", "TS-tF" + i);
                    ToicDiv.append(temp);

                    document.getElementById("topic-F" + i).innerHTML = TopicPercentage[i].Text;
                    $("#TS-tF" + i).val(TopicPercentage[i].percentage);
                }

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

                'CriticalThinking': $('#Crtical-S').find('option:selected').val(),
                'Analysis': $('#Analysis-S').find('option:selected').val(),
                'Understanding': $('#Practical-S').find('option:selected').val(),
                'Recall': $('#Theoratical-S').find('option:selected').val(),
                'Compiling': $('#Compiling-S').find('option:selected').val()

            }


            $("#CrticalF").val(ThinkingSkills['CriticalThinking']);
            $("#AnalysisF").val(ThinkingSkills['Analysis']);
            $("#PracticalF").val(ThinkingSkills['Understanding']);
            $("#TheoraticalF").val(ThinkingSkills['Recall']);
            $("#CompilingF").val(ThinkingSkills['Compiling']);



            EI['TotalGrade'] = TotalGrade;
            EI['ExamPeriod'] = ExamPeriod;
            EI['TopicPercentage'] = TopicPercentage;
            EI['Difficulty'] = Difficulty;
            EI['ThinkingSkills'] = ThinkingSkills;
            EI['ExamID'] = $('#CourseExam-T').children(":selected").attr("id");





            ExamInformation.push(EI);

            //Display Exam Infroamation before generat a exam  



            $('#Toatal_GradeF').val(TotalGrade);
            $('#PeriodF').val(ExamPeriod);


        }
        else {
            if (count1 != 100)
                $('#theCarousel').carousel(1);
            else if (count2 != 100)
                $('#theCarousel').carousel(2);
            else
                $('#theCarousel').carousel(3);
        }
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

                    $("#TS-t" + i + " option:first").attr("id", item.Topic_ID);
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

    // CourseAnalysis

function GetTeacherCourse() {

    $.ajax({
        url: 'http://localhost:2199/api/Teacher/TeacherCourse',
        method: 'Get',
        headers: { 'Authorization': 'Bearer ' + sessionStorage.getItem('accessToken') },


        success: function (data) {

            $.each(data, function (i, item) {
                $('#TeacherCoursID').append($('<option>', {
                    id: item.Course_ID,
                    text: item.Course_Name,
                }));
            })


        },

    });

}

$(document).ready(function () {

    var CourseID = 1;
    GetTeacherCourse();
    $('#TeacherCoursID').on('change', function () {
        var CourseID = $('#TeacherCoursID').children(":selected").attr("id");
    })

    $("#C_Analysis").on('click', function () {

        $.ajax({
            url: 'http://localhost:60703/api/TeacherAnalysis/TeacherCourseAnalysis/' + CourseID,
            method: 'Get',
            headers: { 'Authorization': 'Bearer ' + sessionStorage.getItem('accessToken') },


            success: function (data) {
                $('#swe2').hide();
                var datapoint = [];
                var temp1 = { 'label': "MaxMark", 'y': data.MaxMark }
                datapoint.push(temp1);
                var temp2 = { 'label': "MinMark", 'y': data.MinMark }
                datapoint.push(temp2);
                var temp3 = { 'label': "AvrageMark", 'y': data.AvrageMark }
                datapoint.push(temp3);


                var chart = new CanvasJS.Chart("Courschart3", {
                    animationEnabled: true,
                    theme: "light2", // "light1", "light2", "dark1", "dark2"
                    title: {
                        text: "Course Analysis"
                    },
                    axisY: {
                        title: "Mark",
                        
                        includeZero: false
                    },
                    axisX: {
                        title: "Students Number is " + data.CourseStudents
                    },
                    data: [{
                        type: "column",
                        yValueFormatString: "#,##0.0#\"%\"",
                        dataPoints: datapoint
                    }]
                });
                chart.render();
            }


        })

    })

})

              //  $(this).closest('select').prop("disabled", false)

//$('#checkboxes input:checked').each(function() {
