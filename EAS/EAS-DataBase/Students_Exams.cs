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
    
    public partial class Students_Exams
    {
<<<<<<< HEAD
<<<<<<< HEAD
=======
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Students_Exams()
        {
            this.Student_Answers = new HashSet<Student_Answers>();
        }
    
>>>>>>> 4987323c2b2daedd19efbc4d6b77dd89b5d82df6
=======
>>>>>>> 7141463f045bd038efbd3c5a56cbd2b460e3aca3
        public string Student_ID { get; set; }
        public int Exam_ID { get; set; }
        public Nullable<int> Exam_Result { get; set; }
<<<<<<< HEAD
=======
    
        public virtual AspNetUser AspNetUser { get; set; }
        public virtual Exam Exam { get; set; }
<<<<<<< HEAD
<<<<<<< HEAD
=======
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Student_Answers> Student_Answers { get; set; }
>>>>>>> 4987323c2b2daedd19efbc4d6b77dd89b5d82df6
=======
>>>>>>> 7141463f045bd038efbd3c5a56cbd2b460e3aca3
>>>>>>> 9229c6cf2bcfc022a4ebaf1673f2fe59a9b92b50
    }
}
