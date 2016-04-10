using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyTubeProject.Models
{
    public class RegisterModel
    {
        [Required]
        public string FirstName { get; set; }
        [Required]
        public string LastName { get; set; }
        [Required]

        [EmailAddress]
      //  [Remote("checkIfEmailAddressExist", "Action",HttpMethod ="Post",ErrorMessage ="this user already in access")]
        public string Email { get; set; }
        [Required]
        [StringLength(20, MinimumLength = 8, ErrorMessage = "Password minimum is 8 characters")]
        public string Password { get; set; }
        [System.ComponentModel.DataAnnotations.Compare("Password", ErrorMessage = "Confirm password need to match original password")]
        public string ConfirmPassword { get; set; }
    }
}