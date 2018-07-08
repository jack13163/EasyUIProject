using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    /// <summary>
    /// 菜单
    /// </summary>
    public class MenuInfo
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int ParentId { get; set; }
        public int Num { get; set; }
        public string Disc { get; set; }
        public string Url { get; set; }
        public string Ico { get; set; }
        public int Level { get; set; }

        public override string ToString()
        {
            return this.Id + "," + this.Name + "," + this.ParentId + "," + this.Num + "," + this.Disc + "," + this.Url + "," + this.Ico + "," + this.Level + ";";
        }
    }
}
