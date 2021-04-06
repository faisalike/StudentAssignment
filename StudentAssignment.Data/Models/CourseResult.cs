using System;
using System.Collections.Generic;

#nullable disable

namespace StudentAssignment.Data.Models
{
    public partial class CourseResult
    {
        public int Id { get; set; }
        public int? StudentCourseId { get; set; }
        public decimal? ObtainedMarks { get; set; }
        public decimal? TotalMarks { get; set; }
        public DateTime? CreationDate { get; set; }
    }
}
