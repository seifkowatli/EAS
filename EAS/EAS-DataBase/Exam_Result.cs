//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EAS_DataBase
{
    using System;
    using System.Collections.Generic;
    
    public partial class Exam_Result
    {
        public int Exam_ID { get; set; }
        public string Student_ID { get; set; }
        public Nullable<int> Total_Result { get; set; }
    
        public virtual AspNetUser AspNetUser { get; set; }
        public virtual Exam Exam { get; set; }
    }
}