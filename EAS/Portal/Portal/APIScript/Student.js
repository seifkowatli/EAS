
//Student Marks
var SemesteWithCourse;
var NumberOfYears;
var NumberOfCoursInYear= []


$(document).ready(function () {
$('#contanierd0').hide();
$.ajax({
    method: "Get",
        url: "http://localhost:2199/api/Student/GetAllCourseMarks",
        contentType: "application/json",
        headers: { 'Authorization': 'Bearer ' + sessionStorage.getItem('accessToken') },

        success: function (data) {
            SemesteWithCourse = data;
            NumberOfYears = data.length;
            for (var i = 0; i < data.length; i++) {
                NumberOfCoursInYear[i] = data[i].CWM.length;
            }
           
            AddNewSemester();
            
        },

        error: function (jqXHR) {
            $('#errortxt').text(jqXHR.responseText);
            $('#errortxt').show('fade');
        },
        complete: function (jqXHR) {
            if (jqXHR.status == '401') {

                ////ulEmployee.append('<li style ="color:red">' + jqXHR.status + ':' + jqXHR.statusText + '</li>')
                window.alert(+jqXHR.status + ':' + jqXHR.statusText);
               // window.location.href = "http://localhost:3923/test1.html"


            }
        }

    });


    function AddNewSemester() {

        console.log(NumberOfYears);
        console.log(NumberOfCoursInYear);
        
        var All_Contanier = $('#All_Container');
        var CourseCountanier = $('#AllCourse0');
        var Course0 = $('#course0');

        $('#course0').remove();
       

        for (var i = 0; i < NumberOfYears; i++){

            var Contanier = $('#contanierd0').clone().prop('id', 'contanier' + i);
                Contanier.show();
                Contanier.find('#AllCourse0').attr('id', 'AllCourse' + i ); 
                Contanier.find('#semester_Name').attr('id', 'semester_Name' + i); 

            for (var j = 0; j < NumberOfCoursInYear[i]; j++) {

              
                $clon = Course0.clone().prop('id', 'course' + i + '-' + j);


                $clon.find("#CourseName0").attr("id", "CourseName" + i + '-' + j);
                $clon.find("#Practical0").attr("id", "Practical" + i + '-' + j);
                $clon.find("#mid0").attr("id", "mid" + i + '-' + j);
                $clon.find("#final0").attr("id", "final" + i + '-' + j);
                $clon.find("#CourseName" + i + '-' + j ).attr("href", "#collapse" + i + '-' + j);
                $clon.find("#collapse0").attr("id", "collapse" + i + '-' + j);

                Contanier.find('#AllCourse' + i ).append($clon);
            }

            All_Contanier.append(Contanier);

        }
        $('#contanierd0').remove();
        Display_Marks();




    }
    
    function Display_Marks(){

        console.log(SemesteWithCourse);
        for (var i = 0; i < NumberOfYears; i++) {

            document.getElementById("semester_Name" + i).innerHTML = SemesteWithCourse[i].semester.C_Year + '-' + SemesteWithCourse[i].semester.Semester1;
            for (var j = 0; j < NumberOfCoursInYear[i]; j++) 
            {
                document.getElementById("CourseName" + i + '-' + j).innerHTML = SemesteWithCourse[i].CWM[j].CourseName;

                document.getElementById("Practical" + i + '-' + j).innerHTML = SemesteWithCourse[i].CWM[j].StudentPractical;
                document.getElementById("mid" + i + '-' + j).innerHTML = SemesteWithCourse[i].CWM[j].MidMark;
                document.getElementById("final" + i + '-' + j).innerHTML = SemesteWithCourse[i].CWM[j].FinalMark;
                
            }
        }
    }

})

    //Student GPA
$(document).ready(function () {

     var chart = new CanvasJS.Chart("chartContainer2", {
         animationEnabled: true,
         theme: "dark1", // "light1", "light2", "dark1", "dark2"
         title: {
             text: " Your GPA is: "
         },
         subtitles: [{
             text: "3.3",
             fontSize: 16
         }],
         axisY: {

             scaleBreaks: {
                
                 customBreaks: [{
                     startValue: 10000,
                     endValue: 35000
                 }]
             }
         },
         data: [{
             type: "column",
             yValueFormatString: "#,##0.00",
             dataPoints: [
                 { label: "2016-1", y: 3.5 },
                 { label: "2016-2", y: 2.8 },
                 { label: "2017-1", y: 2.9 },
                 { label: "2017-2", y: 3.4 },
                 { label: "2018-1", y: 2 },
                 { label: "2018-2", y: 2.1 },
                 { label: "2019-1", y: 2.2 },
                 { label: "2019-2", y: 2.13 },
                 { label: "2020-2", y: 2.3 },
                 { label: "2020-3", y: 2.4 },

             ]
         }]
     });
     chart.render();
    })