// Add New User (Register)



// if you dont log in !!you Be referred to login page 
//var accessToken = sessionStorage.getItem('accessToken');
//if (accessToken== null)
//    window.location = "http://localhost:46253/";

function Close_Alert_Div() {

    $('#successText').hide();
    $('#errortxt').hide();
}

function Logout()
{

    bootbox.confirm("Are you sure?", function (result) {
        if (result) {
            sessionStorage.removeItem('accessToken');
            window.location.href = "http://localhost:3923/result.html";
            window.location.href = "http://localhost:46253/Result/Result";


        }


    })

    window.alert(222);

}

//for generate randomPassword
function randomPassword(length) {
    var chars = "abcdefghijklmnopqrstuvwxyz1234567890";
    var chars2 = "!@#$%^&*()-+<>";
    var chars3 = "ABCDEFGHIJKLMNOP"
    var number = "1234567890";
    var pass = "";
    for (var x = 0; x < length; x++) {
        var i = Math.floor(Math.random() * chars.length);
        pass += chars.charAt(i);
         i = Math.floor(Math.random() * chars2.length);
        pass += chars2.charAt(i);
         i = Math.floor(Math.random() * chars3.length);
        pass += chars3.charAt(i);
         i = Math.floor(Math.random() * number.length);
        pass += number.charAt(i);

    }
    return pass;
}


var Number_of_ILOS=1;
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
                PhoneNumber: $('#TextPhone').val(),
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

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/////// Add New Course ///////

$(document).ready(function () {


    //Get Teacher ID after Admin select Teacher 
    function Get_Teacher_ID() {
        var Teacher_id;

        $("#teacher_select").change(function () {
            var Teacher_id = $(this).children(":selected").attr("id");
            console.log(Teacher_id);
        });
    }



    
//Get Teachers
    function Get_Teachers() {

        $.ajax({
            url: 'http://localhost:2199/api/Admin/Get_Teachers',
            method: 'Get',
            headers: { 'Authorization': 'Bearer ' + sessionStorage.getItem('accessToken') },


            success: function (data) {

                $.each(data, function (i, item) {
                    $('#teacher_select').append($('<option>', {
                        id: item.UserId,
                        text: item.F_Name + " "+item.L_Name
                    }));
                })


            },
            
        });
    }
    

    //Add more than ILOS
   
    var max_fields = 10; //maximum input field allowed
    var fields = $(".fields"); //Fields
    var add_button = $("#add_field"); //Add button

    var x = 1; //initlal text box count
    $(add_button).click(function (e) { //on add input button click
        Number_of_ILOS = x;
        e.preventDefault(); //undo event
        if (x < max_fields) { //max input box allowed
            x++;
            Number_of_ILOS++//text box increment
            $(fields).append('<div><input class="form-control" type="text"  name="" id=text' + x + '><a href="#" class="remove_field">×</a></div>'); //add input box
            console.log(Number_of_ILOS);
        }
    });

    //remove topic
    $(fields).on("click", ".remove_field", function (e) { //user click on remove text
        e.preventDefault();
        $(this).parent('div').remove(); x--; Number_of_ILOS = x;
        console.log(Number_of_ILOS);
    });

    

  

});
function Add_Course() {


   // Add Course{Name ,Credit Hour, Description}
    var New_Course = {};

    New_Course['Course_Name'] = $('#Course_Name').val();
    New_Course['Credit_Hours'] = $("#Credit_Hours option:selected").text();
    New_Course['Course_Description'] = $('#Course_Description').val();


    var ILOS = [];
    Number_of_ILOS++;
    for (var i = 1; i < Number_of_ILOS; i++) {

        var ILOS_Descraption = {};
        ILOS_Descraption['ILO_Description'] = $('#text' + i).val();
        ILOS.push(ILOS_Descraption);

    }

    console.log(ILOS);
    $.ajax({
                type: "Post",
                data: JSON.stringify(New_Course),
                url: "http://localhost:2199/api/Admin/Add_Course",
                contentType: "application/json",
                headers: { 'Authorization': 'Bearer ' + sessionStorage.getItem('accessToken') },

                success: function () {
                   

                    $.ajax({

                       
                        type: "Post",
                        data: JSON.stringify(ILOS),
                        url: "http://localhost:2199/api/Admin/Add_ILOS",
                        contentType: "application/json",
                        headers: { 'Authorization': 'Bearer ' + sessionStorage.getItem('accessToken') },
                        success: function () {

                            $('#successText').show();
                        },
                        error: function (jqXHR) {
                            $('#P_error').text(jqXHR.responseText);
                            $('#errortxt').show('fade');

                        }

                        })
                },


        error: function (jqXHR) {
            $('#P_error').text(jqXHR.responseText);
            $('#errortxt').show('fade');

        }
       
    });





}

    
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// join between  Semester and his Courses


$(document).ready(function () {

    //Get Teachers
    function Get_Teachers() {

        $.ajax({
            url: 'http://localhost:2199/api/Admin/Get_Teachers',
            method: 'Get',
            headers: { 'Authorization': 'Bearer ' + sessionStorage.getItem('accessToken') },


            success: function (data) {

                $.each(data, function (i, item) {
                    $('#teacher_select').append($('<option>', {
                        id: item.UserId,
                        text: item.F_Name + " " + item.L_Name
                    }));
                })


            },

        });
    }


    //Get Courses
    function Get_Courses() {

        $.ajax({
            url: 'http://localhost:2199/api/Admin/Get_Courses',
            method: 'Get',
            headers: { 'Authorization': 'Bearer ' + sessionStorage.getItem('accessToken') },


            success: function (data) {

                $.each(data, function (i, item) {
                    $('#Course_select').append($('<option>', {
                        id: item.Course_ID,
                        text: item.Course_Name
                    }));
                })


            },

        });
    }

    //request 
    Get_Teachers();
    Get_Courses()



   

  

    $('#AddSemestersCours').on('click', function () {


        var Semester_Course = {};
        Semester_Course['UserID'] = $('#teacher_select').children(":selected").attr("id");
        Semester_Course['Course_ID'] = $('#Course_select').children(":selected").attr("id");
        Semester_Course['Semster_ID'] = 1;
        Semester_Course['Number_of_Student'] = 0;
        Semester_Course['Success_rate'] = -1;

        $.ajax({

            type: "Post",
            data: JSON.stringify(Semester_Course),
            url: "http://localhost:2199/api/Admin/Add_Semester_Course",
            contentType: "application/json",
            headers: { 'Authorization': 'Bearer ' + sessionStorage.getItem('accessToken') },
            success: function () {

                $('#successText').show();
            },


            error: function (jqXHR) {
                $('#P_error').text(jqXHR.responseText);
                $('#errortxt').show('fade');

            }
        })


    })

 





})
    
//////////////////////////////////////////////////////////////////////////////////////////////////
//Add New Exam 


function Get_Courses() {

    $.ajax({
        url: 'http://localhost:2199/api/Admin/Get_Courses',
        method: 'Get',
        headers: { 'Authorization': 'Bearer ' + sessionStorage.getItem('accessToken') },


        success: function (data) {

            $.each(data, function (i, item) {
                $('#CourseExamID').append($('<option>', {
                    id: item.Course_ID,
                    text: item.Course_Name
                }));
            })


        },

    });
}



$(document).ready(function () {

    Get_Courses();
    $('#AddExam').on('click', function () {


        NewExam = {};
        NewExam['Course_ID'] = $('#CourseExamID').children(":selected").attr("id");
        NewExam['Semster_ID'] = 1
        NewExam['Exam_Type'] = $("#CourseExamType option:selected").text();
        NewExam['Exam_Date'] = $('#ExamDate').val();
        NewExam['Exam_Notes'] = $('#ExamNotes').val();


        $.ajax({

            type: "Post",
            data: JSON.stringify(NewExam),
            url: "http://localhost:2199/api/Admin/AddNewExam",
            contentType: "application/json",
            headers: { 'Authorization': 'Bearer ' + sessionStorage.getItem('accessToken') },
            success: function () {

                $('#successText').show();
            },


            error: function (jqXHR) {
                $('#P_error').text(jqXHR.responseText);
                $('#errortxt').show('fade');

            }
        })




    })





})

    -////// Exam Analysis////////////////////////////////////////////////////

$(document).ready(function () {

    


    $body = $("body");
    $(document).on({
        ajaxStart: function () { $body.addClass("loading"); },
        ajaxStop: function () { $body.removeClass("loading"); }
    });

    var IlosTopicDiv = $('#IlosTopicDiv');
    var EXAMILOS_ = $('#EXAMILOS_').clone().prop('id', 'EXAMILOS_2');
   

    var CoursILOS = [];
    function DisplayStudentMarks(StudentMarks) {
        var Data1 = [];

        StudentMarks.forEach(function (element) {
            
            var Data2 = {
                "y": element.Degree,
                "label":  element.StudentNumber

            }

            Data1.push(Data2)

        })

        
        console.log(Data1)
        
       
           

        var chart = new CanvasJS.Chart("chartContainer", {
            animationEnabled: true,
            theme: "light2", // "light1", "light2", "dark1", "dark2"
            title: {
                text: "Student Marks"
            },
            axisY: {
                title: "Marks"
            },
            axisX: {
                title: "Count"
            },
            data: [{
                type: "column",
                showInLegend: true,
                legendMarkerColor: "grey",

                dataPoints: Data1 
            }]
         
        });
        chart.render();
               
                             
    }
    function DisplayIlos(ILOS_) {

        $.each(ILOS_, function (index, value) {

            var ILOs = {
                'index': index + 1,
                'ILOS': value.ilo,
                'percentage': value.ILOpercent

                
            }
            CoursILOS.push(ILOs);
        });
        console.log(CoursILOS);
        var ILOS_div = $('#ILOSDIV_');
        var ILOS_contuner = $('#CILOS_');

        $.each(CoursILOS, function (index, value) {

            var Contanier = ILOS_contuner.clone().prop('id', 'CILOS_' + index);
            Contanier.find('#IlosNumber').attr('id', 'IlosNumber' + index); 
            Contanier.find('#ILOSTEXT').attr('id', 'ILOSTEXT' + index);
            ILOS_div.append(Contanier);

            document.getElementById("IlosNumber" + index).innerHTML = 'ILOS' +value.index+":";
            document.getElementById("ILOSTEXT" + index).innerHTML = value.ILOS.ILO_Description;

        });
        


    }
    function DisplayILOSpercentage(CoursILOS_) {
        var ILOSPERCHAR = [];
        CoursILOS_.forEach(function (element) {
           
            var Data = {
                "y": element.percentage,
                "label": element.index + 'ILO'

            }
            ILOSPERCHAR.push(Data);

        });


        var chart = new CanvasJS.Chart("ILOSCHARDIV", {
            theme: "light2", // "light1", "light2", "dark1", "dark2"
            exportEnabled: true,
            animationEnabled: true,
            title: {
                text: " ILOS Success Percentage"
            },
            data: [{
                type: "pie",
                startAngle: 25,
                toolTipContent: "<b>{label}</b>: {y}%",
                showInLegend: "true",
                legendText: "{label}",
                indexLabelFontSize: 16,
                indexLabel: "{label} - {y}%",
                dataPoints: ILOSPERCHAR
            }]
        });
        chart.render();




    }
    function DisplayTopicPercentage(ILOTO)
    {
        $.each(ILOTO, function (index, element) {
            console.log(element);

            var countener1 = EXAMILOS_.clone().prop("id", 'EXAMTopic' + index);
            countener1.find("#head-an").attr('id', "head-an" + index);
            countener1.find("#ILOSDIV_").attr('id', "topicDIV_" + index);
            countener1.find("#CILOS_").attr('id', "CITopic" + index);
            countener1.find("#ILOSCHARDIV").attr('id', "CHARDIVTopic" + index);

            element

            IlosTopicDiv.append(countener1);
            document.getElementById("head-an" + index).innerHTML = 'ILO' + (index + 1) + ":";

        });

       

        $.each(ILOTO, function (index, element) {

            var tdiv = $('#topicDIV_' + index);
            var tdiv2 = $('#CITopic' + index);
            var TopicPercentage = [];

            $.each(element.Topics, function (index2, Topic ) {

                var t = { 'y': Topic.TopicSuccessPercent, 'label': 'Topic' + (index2 + 1) };
                TopicPercentage.push(t);
                var countener = tdiv2.clone().prop("id", 'CITopic' + index + '-' + index2);
                countener.find('#IlosNumber').attr('id', 'TopicNumber' + index + '-' + index2);
                countener.find('#ILOSTEXT').attr('id', 'TopicTEXT' + index + '-' + index2);

               
                tdiv.append(countener);
                document.getElementById('TopicNumber' + index + '-' + index2).innerHTML = 'Topic' + (index2 + 1) + ":";
                document.getElementById('TopicTEXT' + index + '-' + index2).innerHTML = Topic.TC.Topic_Description;
                



            })
            console.log(TopicPercentage);
            var chart = new CanvasJS.Chart("CHARDIVTopic" + index, {
                theme: "light2", // "light1", "light2", "dark1", "dark2"
                exportEnabled: true,
                animationEnabled: true,
                title: {
                    text: " Topic Success Percentage"
                },
                data: [{
                    type: "pie",
                    startAngle: 25,
                    toolTipContent: "<b>{label}</b>: {y}%",
                    showInLegend: "true",
                    legendText: "{label}",
                    indexLabelFontSize: 16,
                    indexLabel: "{label} - {y}%",
                    dataPoints: TopicPercentage
                }]
            });
            chart.render();

           



        })
       



    }

    

    function AGet_Courses() {
       
        $.ajax({
            url: 'http://localhost:2199/api/Admin/Get_Courses',
            method: 'Get',
            headers: { 'Authorization': 'Bearer ' + sessionStorage.getItem('accessToken') },


            success: function (data) {
                $.each(data, function (i, item) {
                    $("#CoursedA-s").append($('<option>', {
                        id: item.Course_ID,
                        text: item.Course_Name
                    }));
                })


            },

        });
    }
    var CoursILOS = [];
    AGet_Courses();
    $('#Exam-main2').hide();
    
    var ExamID = null;
  
    $("#CoursedA-s").change(function () {
        var CourseID = $(this).children(":selected").attr("id");

       
      
        $.ajax({

            url: "http://localhost:2199/api/Admin/GetCourseExams/" + CourseID,
            method: "Get",
            headers: { 'Authorization': 'Bearer ' + sessionStorage.getItem('accessToken') },
            success: function (Exams) {
                
                $.each(Exams, function (i, item) {
                    $("#ExamA-S").append($('<option>', {
                        id: item.Exam_ID,
                        text: item.Exam_Type
                    }));
                })


            }




        })

    });
    $("#ExamA-S").change(function () {
         ExamID =  $(this).children(":selected").attr("id");
       
    });
    $("#AdminExamAnalysis").on('click', function () {

        $('#Exam-main1').hide();
       

       


        if (ExamID != null) {

            $.ajax({

                url: "http://localhost:60703/api/AdminAnalysis/ExamAnalysis/" + ExamID,
                method: "Get",
                headers: { 'Authorization': 'Bearer ' + sessionStorage.getItem('accessToken') },
                success: function (data) {
                    $('#Exam-main2').show();
                    DisplayStudentMarks(data.SMarks);
                    DisplayIlos(data.CourseIlos);
                    DisplayILOSpercentage(CoursILOS);
                    DisplayTopicPercentage(data.CourseIlos);
                    data.Examinformation.Exam_Type

                    $('#ExamMarks').text(100);
                    $('#ExamType').text(data.Examinformation.Exam_Type);
                    $('#ExamDate').text(data.Examinformation.Exam_Date);
                    $('#ExamPeriod').text(data.Examinformation.Exam_Period);
                    $('#StudentNumber').text(data.StudentNumber);
                    $('#SuccessRate').text(data.ESuccessRate);


                    


                }
            })



        }



    });
    });



///// Course Analysis



function DisplayStudents_Marks(Marks) {

    var myTable = document.getElementById('TableMardID');


    Marks.forEach(function (element) {

        if (element.Degree >= 98)
        {
            myTable.rows[1].cells[2].innerHTML = element.StudentNumber;
            myTable.rows[1].cells[3].innerHTML = element.DegreePer+'%';

        }

        else if (element.Degree >= 95 && element.Degree < 98) {
            myTable.rows[2].cells[2].innerHTML = element.StudentNumber;
            myTable.rows[2].cells[3].innerHTML = element.DegreePer + '%';

        }

        else if (element.Degree >= 90 && element.Degree < 95) {
            myTable.rows[3].cells[2].innerHTML = element.StudentNumber;
            myTable.rows[3].cells[3].innerHTML = element.DegreePer + '%';

        }


        if (element.Degree >= 85 && element.Degree<90) {
            myTable.rows[4].cells[2].innerHTML = element.StudentNumber;
            myTable.rows[4].cells[3].innerHTML = element.DegreePer + '%';

        }

        else if (element.Degree >= 80 && element.Degree < 85) {
            myTable.rows[5].cells[2].innerHTML = element.StudentNumber;
            myTable.rows[5].cells[3].innerHTML = element.DegreePer + '%';

        }

        else if (element.Degree >= 75 && element.Degree < 80) {
            myTable.rows[6].cells[2].innerHTML = element.StudentNumber;
            myTable.rows[6].cells[3].innerHTML = element.DegreePer + '%';

        }

        if (element.Degree >= 70 && element.Degree < 75) {
            myTable.rows[7].cells[2].innerHTML = element.StudentNumber;
            myTable.rows[7].cells[3].innerHTML = element.DegreePer + '%';

        }

        else if (element.Degree >= 65 && element.Degree < 70) {
            myTable.rows[8].cells[2].innerHTML = element.StudentNumber;
            myTable.rows[8].cells[3].innerHTML = element.DegreePer + '%';

        }

        else if (element.Degree >= 60 && element.Degree < 65) {
            myTable.rows[9].cells[2].innerHTML = element.StudentNumber;
            myTable.rows[9].cells[3].innerHTML = element.DegreePer + '%';

        }
        else
            myTable.rows[10].cells[2].innerHTML = element.StudentNumber;
            myTable.rows[10].cells[3].innerHTML = element.DegreePer + '%';


    })
   






}
function DisplaySuccessPer(n,pn,n2,pn2) {

    var myTable = document.getElementById('TableMardID2');
            myTable.rows[1].cells[2].innerHTML = n;
            myTable.rows[1].cells[3].innerHTML = pn + '%';

            myTable.rows[2].cells[2].innerHTML = n2;
            myTable.rows[2].cells[3].innerHTML = pn2 + '%';


    }
        
        
        
        

$(document).ready(function () {
    var CourseID=null;
    $body = $("body");
    $(document).on({
        ajaxStart: function () { $body.addClass("loading"); },
        ajaxStop: function () { $body.removeClass("loading"); }
    });


    function ACGet_Courses() {

        $.ajax({
            url: 'http://localhost:2199/api/Admin/Get_Courses',
            method: 'Get',
            headers: { 'Authorization': 'Bearer ' + sessionStorage.getItem('accessToken') },


            success: function (data) {
                $.each(data, function (i, item) {
                    $("#CoursedA-c").append($('<option>', {
                        id: item.Course_ID,
                        text: item.Course_Name
                    }));
                })


            },

        });
    }
    ACGet_Courses();
    $("#CoursedA-c").change(function () {

         CourseID = $(this).children(":selected").attr("id");

         console.log(CourseID);

    })

    $("#AdminCourseAnalysis").on('click', function () {

        if (CourseID != null) {
            $.ajax({

                url: "http://localhost:60703/api/AdminAnalysis/A_CourseAnalysis/" + CourseID,
                method: "Get",
                success: function (data) {

                    $("#Course-main1").hide();

                    var temp1 = (data.CourseStudents - data.StudentSusccesNumber)
                    var temp2 = (100 - data.SuccessRate);
                    DisplaySuccessPer(data.StudentSusccesNumber,data.SuccessRate, temp1, temp2 )

                    document.getElementById("CourseNameID").innerHTML = data.CourseName ;
                    document.getElementById("NOSID").innerHTML = data.CourseStudents ;

                   
                    DisplayStudents_Marks(data.CSM);
                    console.log(data);


                }


            });

        }









    });









});