//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Database
{
    using System;
    using System.Collections.Generic;
    
    public partial class Semester_Courses
    {
        public int Semster_ID { get; set; }
        public int Course_ID { get; set; }
        public string Teacher_ID { get; set; }
        public Nullable<int> Number_of_Student { get; set; }
        public Nullable<double> Success_rate { get; set; }
    
        public virtual AspNetUser AspNetUser { get; set; }
        public virtual Course Course { get; set; }
        public virtual Semester Semester { get; set; }
    }
}
