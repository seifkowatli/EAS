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
    
    public partial class Course_Students
    {
        public int Course_ID { get; set; }
        public string Student_ID { get; set; }
        public int Semster_ID { get; set; }
        public Nullable<bool> C_Drop { get; set; }
        public Nullable<bool> Prohibited { get; set; }
        public Nullable<double> Student_Mark { get; set; }
    }
}
