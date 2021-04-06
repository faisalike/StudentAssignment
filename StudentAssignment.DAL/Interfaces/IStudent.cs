using StudentAssignment.DAL.CustomModels;
using StudentAssignment.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StudentAssignment.DAL.Interfaces
{
    public interface IStudent
    {
        List<Student> GetAllStudent();
        Student GetStudentById(int id);
        List<Course> GetStudentCourses(int id);
        double CalculateGPA(CalculateModel model);
    }
}
