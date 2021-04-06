using StudentAssignment.DAL.CustomModels;
using StudentAssignment.DAL.Interfaces;
using StudentAssignment.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;

namespace StudentAssignment.DAL.Repository
{
    public class StudentRepository : IStudent
    {
        private readonly StudentDBContext _context;
        public StudentRepository(StudentDBContext context)
        {
            _context = context;
        }
        public List<Student> GetAllStudent()
        {
            return _context.Students.Where(a => a.IsActive == true).ToList();
        }

        public Student GetStudentById(int id)
        {
            return _context.Students.Where(a => a.Id == id && a.IsActive == true).FirstOrDefault();
        }

        public List<Course> GetStudentCourses(int id)
        {
            try
            {
                var query = (from s in _context.Students
                             join sc in _context.StudentCourses on s.Id equals sc.StudentId
                             join c in _context.Courses on sc.CourseId equals c.CourseNo
                             where s.Id == id && s.IsActive == true
                             select c);
                List<Course> lst = query.ToList();
                return lst;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public double CalculateGPA(CalculateModel model)
        {
            try
            {
                var query = (from sc in _context.StudentCourses
                             join cr in _context.CourseResults on sc.Id equals cr.StudentCourseId
                             where (sc.CourseId == model.CourseId || model.CourseId == 0) && sc.StudentId == model.StudentId
                             select cr);

                List<CourseResult> lst = query.ToList();
                double totalgrade = 0;
                for (int i = 0; i < lst.Count; i++)
                {
                    totalgrade += GetGrade(lst[i]);
                }
                if (totalgrade > 0)
                    totalgrade = totalgrade / lst.Count;
                return totalgrade;
            }
            catch (Exception ex)
            {
                return 0;
            }
        }


        public double GetGrade(CourseResult result)
        {
            decimal percentage = (decimal)(result.ObtainedMarks / result.TotalMarks) * 100;
            double gradeValue = 0;
            if (percentage > 90)
            {
                gradeValue = Grade.A;
            }
            else if (percentage >= 80 && percentage < 90)
            {
                gradeValue = Grade.B;
            }
            else if (percentage >= 70 && percentage < 80)
            {
                gradeValue = Grade.C;
            }
            else if (percentage >= 60 && percentage < 70)
            {
                gradeValue = Grade.D;
            }
            else if (percentage < 60)
            {
                gradeValue = Grade.F;
            }
            return gradeValue;
        }
    }
}
