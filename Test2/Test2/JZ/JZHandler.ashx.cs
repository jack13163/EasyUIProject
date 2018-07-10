using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DataService;
using Common;
using System.Data;
using Model;
using Newtonsoft.Json;
using JrscSoft.Common;
using System.IO;

namespace Web.JZ
{
    /// <summary>
    /// JZHandler 的摘要说明
    /// </summary>
    public class JZHandler : IHttpHandler
    {
        DataAccess data = new DataAccess();
        private static string gcname = "";

        public void ProcessRequest(HttpContext context)
        {
            ResultInfo result = new ResultInfo();
            JZInfo jz = new JZInfo();
            string action = context.Request["action"].ToString();
            context.Response.ContentType = "text/plain";

            switch (action)
            {
                case "GetAll":
                    context.Response.Write(GetAll());
                    break;
                case "GetJZState":
                    string jzid = context.Request.Form["JZId"];
                    context.Response.Write(GetJZState(jzid));
                    break;
                case "GetGC":
                    string jt = context.Request["jt"];
                    string gc = context.Request["gc"];
                    context.Response.Write(GetJZ(jt, gc));
                    break;
                case "Add":
                    try
                    {
                        jz.Id = context.Request.Form["Id"];
                        jz.Name = context.Request.Form["Name"];
                        jz.Introduce = context.Request.Form["Introduce"];
                        jz.JTName = context.Request.Form["JTName"];
                        jz.GCName = context.Request.Form["GCName"];
                        jz.Boss = context.Request.Form["Boss"];
                        jz.JW = context.Request.Form["JW"];
                        //保存数据到数据库中
                        result.Success = Add(jz);
                        result.Message = "插入机组信息" + ((result.Success == true) ? "成功" : "失败") + "!";
                    }
                    catch (Exception ex)
                    {
                        result.Success = false;
                        result.Message = "异常:" + ex.Message;
                    }
                    //返回客户端信息
                    context.Response.Write(JsonHelper<ResultInfo>.ObjectToJsonString(result));
                    break;
                case "GetAllJZId":
                    context.Response.Write(GetAllJZId());
                    break;
                case "Update":
                    try
                    {
                        jz = new JZInfo();
                        jz.Id = context.Request.Form["Id"];
                        jz.Name = context.Request.Form["Name"];
                        jz.Introduce = context.Request.Form["Introduce"];
                        jz.JTName = context.Request.Form["JTName"];
                        jz.GCName = context.Request.Form["GCName"];
                        jz.Boss = context.Request.Form["Boss"];
                        jz.JW = context.Request.Form["JW"];
                        result.Success = Update(jz);
                        result.Message = "更新机组[" + jz.Id + "]信息" + ((result.Success == true) ? "成功" : "失败") + "!";
                    }
                    catch (Exception ex)
                    {
                        result.Success = false;
                        result.Message = "异常:" + ex.Message;
                    }
                    //返回客户端信息
                    context.Response.Write(JsonHelper<ResultInfo>.ObjectToJsonString(result));
                    break;
                case "Delete":
                    try
                    {
                        int count = 0;
                        string id = context.Request["Id"];
                        string[] ids = id.Split(',');
                        for (int i = 0; i < ids.Length; i++)
                        {
                            result.Success = Delete(ids[i]);
                            if (result.Success == false)
                            {
                                break;
                            }
                            count++;
                        }
                        result.Message = ((result.Success == true) ? "操作成功:" : "操作失败:") + "共删除" + count + "条信息!";
                    }
                    catch (Exception ex)
                    {
                        result.Success = false;
                        result.Message = "异常:" + ex.Message;
                    }
                    //返回客户端信息
                    context.Response.Write(JsonHelper<ResultInfo>.ObjectToJsonString(result));
                    break;
                case "GetAllJZInfo":
                    int page = int.Parse(context.Request.Form["page"]);
                    int rows = int.Parse(context.Request.Form["rows"]);
                    context.Response.Write(GetAllJZInfo(page, rows));
                    break;
                case "StoreGCName":
                    gcname = context.Request.Form["GCName"].ToString();
                    if (gcname != null && gcname != "")
                    {
                        result.Success = true;
                        result.Message = "集团名称临时存储成功！";
                    }
                    context.Response.Write(JsonHelper<ResultInfo>.ObjectToJsonString(result));
                    break;
                case "GetAllGZJZInfo":
                    context.Response.Write(GetAllGZJZInfo(gcname));
                    break;
                case "ToExcel":
                    string tableName = context.Request.Form["JZId"].ToString();
                    string startTime = context.Request.Form["Start"].ToString();
                    string endTime = context.Request.Form["End"].ToString();
                    string filepath = tableName + "-" + startTime + "-" + endTime + ".xls";
                    try
                    {
                        DataTable dTable = GetTermJZInfo(tableName, startTime, endTime);
                        // 进行Excel转换操作，并返回转换的文件下载链接
                        string urlPath = ExcelHelper.EntityListToExcel2003(dTable);
                        context.Response.ContentType = "text/plain";
                        context.Response.Write(urlPath); // 返回Json格式的内容
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }
                    break;
                default:
                    break;
            }
        }

        /// <summary>
        /// 获取所有的机组信息列表【目录】
        /// </summary>
        /// <returns></returns>
        public string GetAll()
        {
            SelectorHelper shelper = new SelectorHelper();

            string sql = "SELECT * FROM `web`.`机组表`";
            DataTable dTable = data.GetTable(sql);
            for (int i = 0; i < dTable.Rows.Count; i++)
            {
                string name = dTable.Rows[i]["机组名称"].ToString();
                if (i == 0)
                {
                    shelper.AddItem(name, name, true);
                }
                else
                {
                    shelper.AddItem(name, name, false);
                }
            }
            return shelper.ToString();
        }

        /// <summary>
        /// 获取部分机组信息列表【目录】
        /// </summary>
        /// <returns></returns>
        public string GetJZ(string jt, string gc)
        {
            SelectorHelper shelper = new SelectorHelper();

            string sql = "SELECT * FROM `web`.`机组表` where 集团名称='" + jt + "' and 工厂名称='" + gc + "'";
            DataTable dTable = data.GetTable(sql);
            for (int i = 0; i < dTable.Rows.Count; i++)
            {
                string name = dTable.Rows[i]["工厂名称"].ToString();
                if (i == 0)
                {
                    shelper.AddItem(name, name, true);
                }
                else
                {
                    shelper.AddItem(name, name, false);
                }
            }
            return shelper.ToString();
        }

        /// <summary>
        /// 获取所有的机组信息列表【目录】
        /// </summary>
        /// <returns></returns>
        public string GetAllJZId()
        {
            SelectorHelper shelper = new SelectorHelper();

            string sql = "SELECT * FROM `web`.`机组表`";
            DataTable dTable = data.GetTable(sql);
            for (int i = 0; i < dTable.Rows.Count; i++)
            {
                string name = dTable.Rows[i]["机组编号"].ToString();
                if (i == 0)
                {
                    shelper.AddItem(name, name, true);
                }
                else
                {
                    shelper.AddItem(name, name, false);
                }
            }
            return shelper.ToString();
        }

        /// <summary>
        /// 获取机组状态
        /// </summary>
        /// <returns></returns>
        public int GetJZState(string jzid)
        {
            string sql = "SELECT 状态 FROM `web`.`机组表` where 机组编号='" + jzid + "'";
            return (int)data.GetValue(sql);
        }

        /// <summary>
        /// 获取所有的机组详细信息列表
        /// </summary>
        /// <returns></returns>
        public string GetAllJZInfo(int page, int rows)
        {
            int start = (page - 1) * rows;
            int end = page * rows;
            List<JZInfo> jzs = new List<JZInfo>();
            string sql = "SELECT * FROM `web`.`机组表`";
            string where = "limit " + start + "," + end;
            Dictionary<string, object> d = new Dictionary<string, object>();
            //获取数据总数(注意是总数,不是一页中数据的条数)
            DataTable dTable = data.GetTable(sql);
            d.Add("total", data.GetTable(sql).Rows.Count);
            //获取page页的数据
            dTable = dTable.AsEnumerable().Skip((page - 1) * rows).Take(rows).CopyToDataTable();
            for (int i = 0; i < dTable.Rows.Count; i++)
            {
                JZInfo jz = new JZInfo();
                jz.Id = dTable.Rows[i]["机组编号"].ToString();
                jz.Name = dTable.Rows[i]["机组名称"].ToString();
                jz.Introduce = dTable.Rows[i]["机组描述"].ToString();
                jz.JTName = dTable.Rows[i]["集团名称"].ToString();
                jz.GCName = dTable.Rows[i]["工厂名称"].ToString();
                jz.Boss = dTable.Rows[i]["负责人"].ToString();
                jz.JW = dTable.Rows[i]["机组经纬度"].ToString();
                jz.Status = int.Parse(dTable.Rows[i]["状态"].ToString());

                jzs.Add(jz);
            }
            d.Add("rows", jzs);

            return JsonConvert.SerializeObject(d);
        }

        /// <summary>
        /// 获取所有的报警机组详细信息列表
        /// </summary>
        /// <returns></returns>
        public string GetAllGZJZInfo(string gcname)
        {
            List<JZInfo> jzs = new List<JZInfo>();
            string sql = "SELECT * FROM `web`.`机组表` where 状态>1 and 工厂名称='" + gcname + "'";
            Dictionary<string, object> d = new Dictionary<string, object>();
            DataTable dTable = data.GetTable(sql);
            d.Add("total", data.GetTable(sql).Rows.Count);
            for (int i = 0; i < dTable.Rows.Count; i++)
            {
                JZInfo jz = new JZInfo();
                jz.Id = dTable.Rows[i]["机组编号"].ToString();
                jz.Name = dTable.Rows[i]["机组名称"].ToString();
                jz.Introduce = dTable.Rows[i]["机组描述"].ToString();
                jz.JTName = dTable.Rows[i]["集团名称"].ToString();
                jz.GCName = dTable.Rows[i]["工厂名称"].ToString();
                jz.Boss = dTable.Rows[i]["负责人"].ToString();
                jz.JW = dTable.Rows[i]["机组经纬度"].ToString();
                jz.Status = int.Parse(dTable.Rows[i]["状态"].ToString());

                jzs.Add(jz);
            }
            d.Add("rows", jzs);

            return JsonConvert.SerializeObject(d);
        }

        /// <summary>
        /// 保存机组的信息
        /// </summary>
        /// <param name="jz"></param>
        public bool Add(JZInfo jz)
        {
            string sql = "INSERT INTO `web`.`机组表`(`机组编号`, `机组名称`, `机组描述`, `集团名称`, `工厂名称`, `负责人`, `机组经纬度`) VALUES ('" +
                jz.Id + "', '" +
                jz.Name + "', '" +
                 jz.Introduce + "', '" +
                 jz.JTName + "', '" +
                 jz.GCName + "', '" +
                 jz.Boss + "', '" +
                 jz.JW + "');" +
                 "DROP TABLE IF EXISTS `" + jz.Id + "`;" +
                "CREATE TABLE `" + jz.Id + "` " +
                "(`ID` int(100) NOT NULL, " +
                "`测试日期` date NOT NULL," +
                "`测试时间` time DEFAULT NULL," +
                "`备注` varchar(2) DEFAULT NULL," +
                " PRIMARY KEY (`ID`, `测试日期`)" +
                ") ENGINE=InnoDB DEFAULT CHARSET=utf8 " +
                "partition by range (to_days(`测试日期`))" +
                "(partition P0 values less than (to_days('2019-01-01'))," +
                "partition P1 values less than (to_days('2019-07-01'))," +
                "partition P2 values less than (to_days('2020-01-01'))," +
                "partition P3 values less than (to_days('2020-07-01'))," +
                "partition P4 values less than (to_days('2021-01-01'))," +
                "partition P5 values less than (to_days('2021-07-01'))," +
                "partition P6 values less than (to_days('2022-01-01'))," +
                "partition P7 values less than (to_days('2022-07-01'))," +
                "partition P8 values less than (to_days('2023-01-01'))," +
                "partition P9 values less than (to_days('2024-07-01'))," +
                "partition P10 values less than (to_days('2025-01-01'))," +
                "partition P11 values less than (to_days('2025-07-01')))";
            return data.ExecSql(sql);
        }

        /// <summary>
        /// 删除机组信息
        /// </summary>
        /// <param name="id">机组编号</param>
        /// <returns>更新是否成功</returns>
        public bool Delete(string id)
        {
            string sql = "DELETE FROM `web`.`机组表` WHERE `机组编号` = '" + id + "';" + "DROP TABLE IF EXISTS `" + id + "`;";
            return data.ExecSql(sql);
        }

        /// <summary>
        /// 更新机组信息
        /// </summary>
        /// <param name="jz">机组信息</param>
        /// <returns>更新是否成功</returns>
        public bool Update(JZInfo jz)
        {
            string sql = "Update `web`.`机组表` SET " +
                "`机组名称` = '" + jz.Name + "'," +
                "`机组描述` = '" + jz.Introduce + "'," +
                "`集团名称` = '" + jz.JTName + "'," +
                "`工厂名称` = '" + jz.GCName + "'," +
                "`负责人` = '" + jz.Boss + "'," +
                "`机组经纬度` = '" + jz.JW + "'" + " WHERE `机组编号` = '" + jz.Id + "'";
            return data.ExecSql(sql);
        }

        /// <summary>
        /// 查询指定日期区间的机组信息
        /// </summary>
        /// <returns></returns>
        public DataTable GetTermJZInfo(string tablename, string start, string end)
        {
            string sql = "SELECT * FROM `" + tablename + "` where 测试日期 between '" + start + "' and '" + end + "'";
            //获取数据总数(注意是总数,不是一页中数据的条数)
            DataTable dTable = data.GetTable(sql);
            dTable.TableName = tablename;
            return dTable;
        }

        /// <summary>
        /// 文件下载
        /// </summary>
        /// <param name="context">上下文</param>
        /// <param name="s_fileName">服务器上的地址</param>
        public void DownloadFile(HttpContext context, string s_fileName)
        {
            string path = s_fileName;
            System.IO.FileInfo file = new System.IO.FileInfo(System.Web.HttpContext.Current.Server.MapPath(path));
            context.Response.Clear();
            context.Response.Charset = "UTF-8";
            context.Response.ContentEncoding = System.Text.Encoding.UTF8;
            context.Response.AddHeader("Content-Type", "application/octet-stream");
            // 添加头信息，为"文件下载/另存为"对话框指定默认文件名,设定编码为UTF8,防止中文文件名出现乱码
            context.Response.AddHeader("Content-Disposition", "attachment; filename=" + System.Web.HttpUtility.UrlEncode(file.Name, System.Text.Encoding.UTF8));
            // 添加头信息，指定文件大小，让浏览器能够显示下载进度
            context.Response.AddHeader("Content-Length", file.Length.ToString());
            //// 指定返回的是一个不能被客户端读取的流，必须被下载
            context.Response.ContentType = "application/ms-excel";
            // 把文件流发送到客户端
            context.Response.WriteFile(file.FullName);
            // 停止页面的执行
            context.Response.End();
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