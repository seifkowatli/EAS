//Course Marks Admin


// Get ALL Course
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

$(document).ready(function(){



    $('#Course_select').change(function () {


        var CourseID = $('#Course_select').children(":selected").attr("id");
        var Marks = [];
       
       
        $.ajax({
            type: 'Get',
            url: 'http://localhost:60703/api/Charts/GetStudentMarks/' + CourseID,
            headers: { 'Authorization': 'Bearer ' + sessionStorage.getItem('accessToken') },
            dataType: "json",


            success: function (data) {
                all = data;
                $.each(data, function (i, item) {
                    ab = {
                        y:item.Mark,
                        label:item.Count + " Students"
                    };



                    Marks.push(ab);


                })

                var chart = new CanvasJS.Chart("CourseMark", {
                    theme: "light2", // "light1", "light2", "dark1", "dark2"
                    exportEnabled: true,
                    animationEnabled: true,
                    title: {
                        text: "Students Marks in Semester  2018"
                    },
                    data: [{
                        type: "pie",
                        startAngle: 25,
                        toolTipContent: "<b>{label}</b>: {y}%",
                        showInLegend: "true",
                        legendText: "{label}",
                        indexLabelFontSize: 16,
                        indexLabel: "{label} - {y}%",

                        dataPoints: Marks



                    }]
                });
                chart.render();




            },

        });

    })



})

////////////////