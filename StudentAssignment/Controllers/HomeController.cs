using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using StudentAssignment.DAL.CustomModels;
using StudentAssignment.DAL.Interfaces;
using StudentAssignment.Data.Models;
using StudentAssignment.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

namespace StudentAssignment.Controllers
{
    public class HomeController : Controller
    {
        private readonly IStudent _studentRepo;

        public HomeController(IStudent student)
        {
            _studentRepo = student;
        }


        public IActionResult Index()
        {
            try
            {
                List<Student> students = _studentRepo.GetAllStudent();
                return View(students);

            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
                return View();
            }
        }

        public IActionResult StudentCourses(int id)
        {
            try
            {
                StudentCoursesModel model = new StudentCoursesModel();
                model.Courses = _studentRepo.GetStudentCourses(id);
                model.Student = _studentRepo.GetStudentById(id);
                return View(model);

            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
                return View();
            }
        }

        [HttpPost]
        public double CalculateGPA([FromBody]CalculateModel model)
        {
            return _studentRepo.CalculateGPA(model);
        }

        public IActionResult Privacy()
        {
            return View();
        }
    }
}
