using Microsoft.AspNetCore.Mvc;
using UserRegistrationApp.Models;

namespace UserRegistrationApp.Controllers
{
    public class AccountController : Controller
    {
        [HttpGet]
        public IActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Register(RegisterViewModel model)
        {
            ViewBag.Message = "Registration successful!";

            return View(model);
        }
    }
}