using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;

namespace MusicApp2017.Models
{
    public class ApplicationUser : IdentityUser
    {
        public int UserFavoriteGenreID { get; set; }
    }
}
