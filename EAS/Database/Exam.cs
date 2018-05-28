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
    
    public partial class Exam
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Exam()
        {
            this.Students_Exams = new HashSet<Students_Exams>();
            this.Questions_Bank = new HashSet<Questions_Bank>();
        }
    
        public int Exam_ID { get; set; }
        public Nullable<int> Course_ID { get; set; }
        public Nullable<int> Semster_ID { get; set; }
        public string Exam_Type { get; set; }
        public string Exam_Time { get; set; }
        public string Exam_Date { get; set; }
        public Nullable<int> Exam_Period { get; set; }
        public string Exam_Notes { get; set; }
    
        public virtual Course Course { get; set; }
        public virtual Semester Semester { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Students_Exams> Students_Exams { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Questions_Bank> Questions_Bank { get; set; }
    }
}
