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

namespace DoAnMonHoc.Areas.Admin.Controllers
{
    [Area("admin")]
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
        public IActionResult Index()
        {
            var productList = _db.products.Include(x => x.Category).ToList();
            return View(productList);
        }
        //Hiển thị form thêm sản phẩm mới
        public IActionResult Add()
        {
            //truyền danh sách thể loại cho View để sinh ra điều khiển DropDownList
            ViewBag.CategoryList = _db.Categories.Select(x => new SelectListItem
            {
                Value = x.Id.ToString(),
                Text = x.Name
            });
            return View();
        }

        //Xử lý thêm sản phẩm
        [HttpPost]
        public IActionResult Add(Product product, IFormFile ImageUrl)
        {
            if (ModelState.IsValid) //kiem tra hop le
            {
                if (ImageUrl != null)
                {
                    //xu ly upload và lưu ảnh đại diện
                    product.ImageUrl = SaveImage(ImageUrl);
                }
                //thêm product vào table Product
                _db.products.Add(product);
                _db.SaveChanges();
                TempData["success"] = "Product inserted success";
                return RedirectToAction("Index");
            }
            ViewBag.CategoryList = _db.Categories.Select(x => new SelectListItem
            {
                Value = x.Id.ToString(),
                Text = x.Name
            });
            return View();
        }
        //Hiển thị form cập nhật sản phẩm
        public IActionResult Update(int id)
        {
            var product = _db.products.Find(id);
            if (product == null)
            {
                return NotFound();
            }
            //truyền danh sách thể loại cho View để sinh ra điều khiển DropDownList
            ViewBag.CategoryList = _db.Categories.Select(x => new SelectListItem
            {
                Value = x.Id.ToString(),
                Text = x.Name
            });
            return View(product);
        }
        //Xử lý cập nhật sản phẩm
        [HttpPost]
        public IActionResult Update(Product product, IFormFile ImageUrl)
        {
            if (ModelState.IsValid) //kiem tra hop le
            {
                var existingProduct = _db.products.Find(product.Id);
                if (ImageUrl != null)
                {
                    //xu ly upload và lưu ảnh đại diện mới
                    product.ImageUrl = SaveImage(ImageUrl);

                    //xóa ảnh cũ (nếu có)

                    if (!string.IsNullOrEmpty(existingProduct.ImageUrl))
                    {
                        var oldFilePath = Path.Combine(_hosting.WebRootPath,
                        existingProduct.ImageUrl);
                        if (System.IO.File.Exists(oldFilePath))
                        {
                            System.IO.File.Delete(oldFilePath);
                        }
                    }
                }
                else

                {
                    product.ImageUrl = existingProduct.ImageUrl;
                }
                //cập nhật product vào table Product
                existingProduct.Name = product.Name;
                existingProduct.Description = product.Description;
                existingProduct.Price = product.Price;
                existingProduct.CategoryId = product.CategoryId;
                existingProduct.ImageUrl = product.ImageUrl;
                existingProduct.Description = product.Description;
                existingProduct.Sort = product.Sort;
                existingProduct.Detail = product.Detail;
                existingProduct.Datepost = product.Datepost;
                existingProduct.Userpost = product.Userpost;
                _db.SaveChanges();
                TempData["success"] = "Product updated success";
                return RedirectToAction("Index");
            }
            ViewBag.CategoryList = _db.Categories.Select(x => new SelectListItem
            {
                Value = x.Id.ToString(),
                Text = x.Name
            });
            return View();
        }
        private string SaveImage(IFormFile image)
        {
            //đặt lại tên file cần lưu
            var filename = Guid.NewGuid().ToString() + Path.GetExtension(image.FileName);
            //lay duong dan luu tru wwwroot tren server
            var path = Path.Combine(_hosting.WebRootPath, @"img/products");
            var saveFile = Path.Combine(path, filename);
            using (var filestream = new FileStream(saveFile, FileMode.Create))
            {
                image.CopyTo(filestream);
            }
            return @"img/products/" + filename;
        }
        //Hiển thị form xác nhận xóa sản phẩm
        public IActionResult Delete(int id)
        {
            var product = _db.products.Find(id);
            if (product == null)
            {
                return NotFound();
            }
            return View(product);
        }
        //Xử lý xóa sản phẩm
        [HttpPost, ActionName("Delete")]
        public IActionResult DeleteConfirmed(int id)
        {
            var product = _db.products.Find(id);
            if (product == null)
            {
                return NotFound();
            }
            // xoá hình cũ của sản phẩm
            if (!String.IsNullOrEmpty(product.ImageUrl))
            {
                var oldFilePath = Path.Combine(_hosting.WebRootPath, product.ImageUrl);
                if (System.IO.File.Exists(oldFilePath))
                {
                    System.IO.File.Delete(oldFilePath);

                }
            }
            // xoa san pham khoi CSDL
            _db.products.Remove(product);
            _db.SaveChanges();
            TempData["success"] = "Product deleted success";
            //chuyen den action index
            return RedirectToAction("Index");
        }
    
}
}
