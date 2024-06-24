using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace DoAnMonHoc.Models
{
    public class Xulylink
    {


        public static string ToUrlAlias(string input)
        {
            if (string.IsNullOrWhiteSpace(input))
            {
                return string.Empty;
            }

            // Convert to lowercase
            input = input.ToLowerInvariant();

            // Normalize to decompose combined characters into base characters and diacritical marks
            string normalizedString = input.Normalize(NormalizationForm.FormD);

            // Remove diacritical marks
            StringBuilder stringBuilder = new StringBuilder();
            foreach (char c in normalizedString)
            {
                var unicodeCategory = System.Globalization.CharUnicodeInfo.GetUnicodeCategory(c);
                if (unicodeCategory != System.Globalization.UnicodeCategory.NonSpacingMark)
                {
                    stringBuilder.Append(c);
                }
            }

            // Convert to string without diacritical marks
            string withoutDiacritics = stringBuilder.ToString().Normalize(NormalizationForm.FormC);

            // Replace special characters with hyphen
            string urlAlias = Regex.Replace(withoutDiacritics, @"[^a-z0-9\s-]", "");
            urlAlias = Regex.Replace(urlAlias, @"\s+", "-").Trim('-');

            return urlAlias;
        }
    }
}
