using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace DoAnMonHoc.Models
{
	[Table("Customer")]
	public class Customer
	{


		[DatabaseGenerated(DatabaseGeneratedOption.Identity)]
		[Key]
		public int id { get; set; }
		[MaxLength(50)]
		public string ussername { get; set; }
		[MaxLength(50)]
		public string password { get; set; }
		public string phone { get; set; }
		[MaxLength(50)]

		public string name { get; set; }
		[MaxLength(50)]
		public string email { get; set; }
		[MaxLength(250)]
		public string adddress { get; set; }

		public bool status { get; set; }




	}
}
