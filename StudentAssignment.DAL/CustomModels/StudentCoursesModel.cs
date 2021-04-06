using StudentAssignment.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StudentAssignment.DAL.CustomModels
{
    public class StudentCoursesModel
    {
        public Student Student { get; set; }
        public List<Course> Courses { get; set; }
    }
}
