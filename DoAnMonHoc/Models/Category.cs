using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace DoAnMonHoc.Models
{
    public class Category
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        [Required, StringLength(50)]
        public String Name { get; set; }
        [Required(ErrorMessage ="Không được rỗng"), Range(1, 100)]
        public int DisplayOrder { get; set; }
        public int Root { get; set; }
        public bool Enable { get; set; }

    }
}
