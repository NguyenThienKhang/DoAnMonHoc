using DoAnMonHoc.Models;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace DoAnMonHoc.Controllers
{
    public class ProductController : Controller
    {
        private readonly ApplicationDbContext _db;
        private readonly IHostingEnvironment _hosting;
        public ProductController(ApplicationDbContext db, IHostingEnvironment hosting)
        {
            _db = db;
            _hosting = hosting;
        }

        //Hiển thị danh sách sản phẩm
        [Route("{name}-{id}")]
        [Route("san-pham.html")]
        public IActionResult Index(int id=0)
        {
            ViewBag.menu = _db.Categories.ToList();
            var productList = _db.products.Include(x => x.Category).ToList();
             if(id>0)
            return View(productList.Where(x=>x.CategoryId==id).ToList());

            return View(productList.ToList());
        }


        //Hiển thị danh sách sản phẩm
        [Route("/san-pham/{name}-{id}.html")]
     
        public IActionResult detail(int id = 0)
        {
            ViewBag.menu = _db.Categories.ToList();
            var productList = _db.products.Find(id);
         

            return View(productList);
        }
    }
}

