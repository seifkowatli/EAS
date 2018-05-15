var SemesteWithCourse;
var NumberOfYears;
var NumberOfCoursInYear= []


$(document).ready(function () {
$('#contanierd0').hide();
    $.ajax({
        type: "Get",
        url: "http://localhost:2199/api/Student/GetAllCourseMarks",
        contentType: "application/json",
        headers: { 'Authorization': 'Bearer' + sessionStorage.getItem('accessToken') },

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
                window.location.href = "http://localhost:3923/test1.html"


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