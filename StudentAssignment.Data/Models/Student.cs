using System;
using System.Collections.Generic;

#nullable disable

namespace StudentAssignment.Data.Models
{
    public partial class Student
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int? RollNo { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public DateTime? CreationDate { get; set; }
        public DateTime? UpdationDate { get; set; }
        public bool? IsActive { get; set; }
    }
}
