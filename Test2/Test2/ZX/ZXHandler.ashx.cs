using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DataService;
using Model;
using Common;
using System.Data;
using Newtonsoft.Json;

namespace Web.ZX
{
    /// <summary>
    /// ZXHandler 的摘要说明
    /// </summary>
    public class ZXHandler : IHttpHandler
    {
        DataAccess data = new DataAccess();
        public void ProcessRequest(HttpContext context)
        {
            ZXInfo zx = new ZXInfo();
            ResultInfo result = new ResultInfo();
            string action = context.Request["action"].ToString();
            context.Response.ContentType = "text/plain";

            switch (action)
            {
                case "Add":
                    try
                    {
                        zx.JZId = context.Request.Form["JZId"];
                        zx.Name = context.Request.Form["Name"];
                        if (!ExistsZXInfo(zx.Name, zx.JZId))
                        {
                            result.Success = Add(zx);
                            result.Message = "咨询信息添加" + ((result.Success == true) ? "成功" : "失败") + "!";
                        }
                        else
                        {
                            result.Success = false;
                            result.Message = "您的咨询信息已提交，请耐心等待专家回复!";
                        }
                    }
                    catch (Exception ex)
                    {
                        result.Success = false;
                        result.Message = "异常:" + ex.Message;
                    }
                    string jss = JsonHelper<ResultInfo>.ObjectToJsonString(result);
                    context.Response.Write(jss);
                    context.Response.End();
                    break;
                case "GetAll":
                    int page = int.Parse(context.Request.Form["page"]);
                    int rows = int.Parse(context.Request.Form["rows"]);
                    context.Response.Write(GetAll(page, rows));
                    break;
                case "Update":
                    try
                    {
                        zx.Id = int.Parse(context.Request.Form["Id"].ToString());
                        zx.JZId = context.Request.Form["JZId"];
                        zx.Name = context.Request.Form["Name"];
                        result.Success = Update(zx);
                        result.Message = "更新咨询信息" + ((result.Success == true) ? "成功" : "失败") + "!";
                    }
                    catch (Exception ex)
                    {
                        result.Success = false;
                        result.Message = "异常:" + ex.Message;
                    }
                    jss = JsonHelper<ResultInfo>.ObjectToJsonString(result);
                    context.Response.Write(jss);//"{\"Success\":\"false\",\"Message\":\"更新用户信息失败!\"}"
                    break;
                case "Delete":
                    try
                    {
                        string id = context.Request["Id"];
                        string[] ids = id.Split(',');
                        for (int i = 0; i < ids.Length; i++)
                        {
                            result.Success = Delete(int.Parse(ids[i]));
                            if (result.Success == false)
                            {
                                break;
                            }
                        }
                        result.Message = "删除" + ids.Length + "条咨询信息" + ((result.Success == true) ? "成功" : "失败") + "!";
                    }
                    catch (Exception ex)
                    {
                        result.Success = false;
                        result.Message = "异常:" + ex.Message;
                    }
                    jss = JsonHelper<ResultInfo>.ObjectToJsonString(result);
                    context.Response.Write(jss);
                    context.Response.End();
                    break;
                default:
                    break;
            }
        }


        /// <summary>
        /// 保存用户的信息
        /// </summary>
        /// <param name="zx"></param>
        public bool Add(ZXInfo zx)
        {
            string sql = "INSERT INTO `web`.`咨询专家表`(`专家名`, `机组编号`) VALUES ('" +
                zx.Name + "', '" +
                 zx.JZId + "')";
            return data.ExecSql(sql);
        }

        /// <summary>
        /// 查看用户是否已经添加过咨询
        /// </summary>
        /// <param name="zx"></param>
        public bool ExistsZXInfo(string name, string jzid)
        {
            string sql = "SELECT count(*) FROM `web`.`咨询专家表` where 专家名='" + name + "' and 机组编号='" + jzid + "'";
            return (int.Parse(data.GetValue(sql).ToString()) > 0);
        }

        /// <summary>
        /// 获取所有咨询信息
        /// </summary>
        /// <returns>用户信息列表的json字符串形式</returns>
        public string GetAll(int page, int rows)
        {
            int start = (page - 1) * rows;
            int end = page * rows;
            List<ZXInfo> zxs = new List<ZXInfo>();
            string sql = "SELECT * FROM `web`.`咨询专家表`";
            string where = "limit " + start + "," + end;
            Dictionary<string, object> d = new Dictionary<string, object>();
            //获取数据总数(注意是总数,不是一页中数据的条数)
            DataTable dTable = data.GetTable(sql);
            d.Add("total", data.GetTable(sql).Rows.Count);
            //获取page页的数据
            dTable = dTable.AsEnumerable().Skip((page - 1) * rows).Take(rows).CopyToDataTable();
            for (int i = 0; i < dTable.Rows.Count; i++)
            {
                ZXInfo zx = new ZXInfo();
                zx.Id = int.Parse(dTable.Rows[i]["咨询编号"].ToString());
                zx.Name = dTable.Rows[i]["专家名"].ToString();
                zx.JZId = dTable.Rows[i]["机组编号"].ToString();

                zxs.Add(zx);
            }
            d.Add("rows", zxs);

            return JsonConvert.SerializeObject(d);
        }

        /// <summary>
        /// 删除用户信息
        /// </summary>
        /// <param name="user">用户信息</param>
        /// <returns>更新是否成功</returns>
        public bool Delete(int id)
        {
            string sql = "Delete from `web`.`咨询专家表` WHERE `咨询编号` = " + id;
            return data.ExecSql(sql);
        }

        /// <summary>
        /// 更新咨询信息
        /// </summary>
        /// <param name="zx">咨询信息</param>
        /// <returns>更新是否成功</returns>
        public bool Update(ZXInfo zx)
        {
            string sql = "Update `web`.`咨询专家表` SET " +
                "`专家名` = '" + zx.Name + "'," +
                "`机组编号` = '" + zx.JZId + "' WHERE `咨询编号` = " + zx.Id;
            return data.ExecSql(sql);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}