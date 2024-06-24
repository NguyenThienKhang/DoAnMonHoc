using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace DoAnMonHoc.Models
{
    public class Order
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public DateTime OrderDate { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập họ tên đầy đủ")]
        public string CustomerName { get; set; }
        [Required(ErrorMessage = "Vui lòng cung cấp địa chỉ giao hàng")]
        public string Address { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập số điện thoại liên hệ")]
        public string Phone { get; set; }
        public double Total { set; get; }
        public string State { set; get; }
        public int Khachangid { set; get; }

    }
}
