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
    
    public partial class ILO
    {
<<<<<<< HEAD
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ILO()
        {
            this.Questions_Bank = new HashSet<Questions_Bank>();
        }
    
=======
>>>>>>> f0bbe600bddb1581549f1e674c7a777e5f078ec5
        public int ILOs_ID { get; set; }
        public Nullable<int> Topic_ID { get; set; }
        public string ILOs_Description { get; set; }
        public Nullable<int> C_week { get; set; }
<<<<<<< HEAD
    
        public virtual Topic Topic { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Questions_Bank> Questions_Bank { get; set; }
=======
>>>>>>> f0bbe600bddb1581549f1e674c7a777e5f078ec5
    }
}
