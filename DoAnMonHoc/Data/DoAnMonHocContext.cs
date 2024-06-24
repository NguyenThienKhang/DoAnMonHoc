using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using DoAnMonHoc.Models;

namespace DoAnMonHoc.Data
{
    public class DoAnMonHocContext : DbContext
    {
        public DoAnMonHocContext (DbContextOptions<DoAnMonHocContext> options)
            : base(options)
        {
        }

        public DbSet<DoAnMonHoc.Models.Category> Category { get; set; }

        public DbSet<DoAnMonHoc.Models.Product> Product { get; set; }
    }
}
