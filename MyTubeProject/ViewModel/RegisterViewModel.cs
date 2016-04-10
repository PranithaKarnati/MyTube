using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace MyTubeProject.ViewModel
{
    public class RegisterViewModel
    {
        [Required]
        public string FirstName { get; set; }
        [Required]
        public string LastName { get; set; }

        [EmailAddress]
        //[Remote("CheckIfEmailAddressIsExist", "Account", ErrorMessage = "This email address has been used")]
        public string EmailAddress { get; set; }
        [StringLength(25, MinimumLength = 8, ErrorMessage = "Password need to have at least 8 character")]
        public string Password { get; set; }
        [System.ComponentModel.DataAnnotations.Compare("Password", ErrorMessage = "Confirm password need to match your password")]
        public string ConfirmPassword { get; set; }
    }
    public class LoginViewModel{
    public string UserName { get; set; }
    public string Password { get; set; }
}
    
}

