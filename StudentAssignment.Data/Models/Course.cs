using System;
using System.Collections.Generic;

#nullable disable

namespace StudentAssignment.Data.Models
{
    public partial class Course
    {
        public int CourseNo { get; set; }
        public string CourseName { get; set; }
        public DateTime? CreationDate { get; set; }
        public bool? IsActive { get; set; }
    }
}
