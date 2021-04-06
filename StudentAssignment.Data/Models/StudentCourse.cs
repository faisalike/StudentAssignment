using System;
using System.Collections.Generic;

#nullable disable

namespace StudentAssignment.Data.Models
{
    public partial class StudentCourse
    {
        public int Id { get; set; }
        public int? StudentId { get; set; }
        public int? CourseId { get; set; }
    }
}
