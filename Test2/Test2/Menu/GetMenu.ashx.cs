using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataService;
using System.Data;
using System.Web.Security;
using System.IO;
using System.Web.SessionState;
using Common;
using Newtonsoft.Json;
using JrscSoft.Common;
using System.Collections;
using Model;
namespace Web
{
    /// <summary>
    /// GetMenu 的摘要说明
    /// </summary>
    public class GetMenu : IHttpHandler, IRequiresSessionState
    {
        DataAccess data = new DataAccess();

        public void ProcessRequest(HttpContext context)
        {
            try
            {
                Hashtable menus = MenuHelper.GetAllMenu();
                string result = "";
                //if (context.Session["目录"] == null || context.Session["目录"].ToString().Trim() == "")
                if (true)
                {
                    string sql = "";
                    Tree<string> root = new Tree<string>();
                    DataTable dTable = null;
                    Tree<string> level1 = new Tree<string>();
                    Tree<string> level2 = new Tree<string>();
                    Tree<string> n1, n2 = null;

                    try
                    {
                        //在.ashx中引用 session 必须继承IReadOnlySessionState/IRequiresSessionState,否则无法获取Session对象
                        switch (context.Session["角色"].ToString())
                        {
                            case "管理员":
                                root.Data = "控制台";
                                root.Open = true;
                                n1 = new Tree<string>();
                                n1.Data = "组织管理";
                                n1.Open = true;
                                root.AddNode(n1);

                                n2 = new Tree<string>();
                                n2.Data = "系统管理";
                                n2.Open = true;
                                root.AddNode(n2);
                                Tree<string> n21 = new Tree<string>();
                                n21.Data = "用户管理";
                                n2.AddNode(n21);
                                Tree<string> n23 = new Tree<string>();
                                n23.Data = "集团管理";
                                n2.AddNode(n23);
                                Tree<string> n24 = new Tree<string>();
                                n24.Data = "工厂管理";
                                n2.AddNode(n24);
                                Tree<string> n25 = new Tree<string>();
                                n25.Data = "机组管理";
                                n2.AddNode(n25);
                                Tree<string> n26 = new Tree<string>();
                                n26.Data = "测点管理";
                                n2.AddNode(n26);
                                Tree<string> n27 = new Tree<string>();
                                n27.Data = "文档管理";
                                n2.AddNode(n27);
                                Tree<string> n22 = new Tree<string>();
                                n22.Data = "咨询管理";
                                n2.AddNode(n22);

                                sql = "SELECT * FROM `web`.`menue`";
                                ////整理菜单
                                dTable = data.GetTable(sql);
                                if (dTable.Rows.Count > 0)
                                {
                                    for (int i = 0; i < dTable.Rows.Count; i++)
                                    {
                                        string jt = dTable.Rows[i]["集团名称"].ToString();
                                        //不存在集团
                                        if (jt != "" && !Tree<string>.Exists(n1, jt))
                                        {
                                            Tree<string> node1 = new Tree<string>();
                                            node1.Data = jt;
                                            n1.AddNode(node1);
                                            level1 = node1;
                                        }

                                        string gc = dTable.Rows[i]["工厂名称"].ToString();
                                        //不存在工厂
                                        if (gc != "" && !Tree<string>.Exists(level1, gc))
                                        {
                                            Tree<string> node2 = new Tree<string>();
                                            node2.Data = gc;
                                            level1.AddNode(node2);
                                            level2 = node2;
                                        }

                                        sql = "SELECT * FROM `web`.`机组表` where `工厂名称`='" + level2.Data + "'";
                                        ////整理菜单
                                        DataTable dTable2 = data.GetTable(sql);
                                        for (int j = 0; j < dTable2.Rows.Count; j++)
                                        {
                                            string jz = dTable2.Rows[j]["机组名称"].ToString();
                                            //不存在机组
                                            if (jz != "" && !Tree<string>.Exists(level2, jz))
                                            {
                                                Tree<string> node3 = new Tree<string>();
                                                node3.Data = jz;
                                                level2.AddNode(node3);
                                            }
                                        }
                                    }
                                }
                                break;
                            case "集团负责人":
                                sql = "SELECT * FROM `web`.`用户表` where 用户名='" + context.Session["用户名"].ToString() + "'";
                                dTable = data.GetTable(sql);
                                root.Data = dTable.Rows[0]["集团名称"].ToString();
                                root.Open = true;

                                sql = "SELECT * FROM `web`.`menue`";
                                ////整理菜单
                                dTable = data.GetTable(sql);
                                if (dTable.Rows.Count > 0)
                                {
                                    for (int i = 0; i < dTable.Rows.Count; i++)
                                    {
                                        if (dTable.Rows[i]["集团名称"].ToString().Equals(root.Data))
                                        {
                                            string gc = dTable.Rows[i]["工厂名称"].ToString();
                                            //不存在工厂
                                            if (gc != "" && !Tree<string>.Exists(root, gc))
                                            {
                                                Tree<string> node1 = new Tree<string>();
                                                node1.Data = gc;
                                                root.AddNode(node1);
                                                level1 = node1;
                                            }

                                            sql = "SELECT * FROM `web`.`机组表` where `工厂名称`='" + level1.Data + "'";
                                            ////整理菜单
                                            DataTable dTable2 = data.GetTable(sql);
                                            for (int j = 0; j < dTable2.Rows.Count; j++)
                                            {
                                                string jz = dTable2.Rows[j]["机组名称"].ToString();
                                                //不存在机组
                                                if (jz != "" && !Tree<string>.Exists(level1, jz))
                                                {
                                                    Tree<string> node3 = new Tree<string>();
                                                    node3.Data = jz;
                                                    level1.AddNode(node3);
                                                }
                                            }
                                        }
                                    }
                                }
                                break;
                            case "工厂负责人":
                                sql = "SELECT * FROM `web`.`用户表` where 用户名='" + context.Session["用户名"].ToString() + "'";
                                dTable = data.GetTable(sql);
                                root.Data = dTable.Rows[0]["工厂名称"].ToString();
                                root.Open = true;

                                sql = "SELECT * FROM `web`.`机组表` where `工厂名称`='" + root.Data + "'";
                                ////整理菜单
                                DataTable dTable3 = data.GetTable(sql);
                                for (int j = 0; j < dTable3.Rows.Count; j++)
                                {
                                    string jz = dTable3.Rows[j]["机组名称"].ToString();
                                    //不存在机组
                                    if (jz != "" && !Tree<string>.Exists(root, jz))
                                    {
                                        Tree<string> node3 = new Tree<string>();
                                        node3.Data = jz;
                                        root.AddNode(node3);
                                    }
                                }
                                break;
                            case "机组人员":
                                sql = "SELECT * FROM `web`.`机组表` where `负责人`='" + context.Session["用户名"].ToString() + "'";
                                ////整理菜单
                                dTable = data.GetTable(sql);
                                if (dTable.Rows.Count > 0)
                                {
                                    root.Data = "机组列表";
                                    for (int i = 0; i < dTable.Rows.Count; i++)
                                    {
                                        Tree<string> node1 = new Tree<string>();
                                        node1.Data = dTable.Rows[i]["机组名称"].ToString();
                                        root.AddNode(node1);
                                    }
                                }
                                break;
                            case "专家":
                                root.Data = "信息列表";
                                root.Open = true;
                                Tree<string> zjnode = new Tree<string>();
                                zjnode.Data = "机组列表";
                                root.AddNode(zjnode);
                                Tree<string> wdnode = new Tree<string>();
                                wdnode.Data = "文档管理";
                                root.AddNode(wdnode);
                                sql = "SELECT 机组编号 FROM `web`.`咨询专家表` where `专家名`='" + context.Session["用户名"].ToString() + "'";
                                ////整理菜单
                                dTable = data.GetTable(sql);
                                if (dTable.Rows.Count > 0)
                                {
                                    for (int i = 0; i < dTable.Rows.Count; i++)
                                    {
                                        string jzid = dTable.Rows[i]["机组编号"].ToString();
                                        Tree<string> node1 = new Tree<string>();
                                        node1.URL = "/ZX/Index.html";//URL

                                        //获取机组名称
                                        sql = "SELECT 机组名称 FROM `web`.`机组表` where 机组编号='" + jzid + "'";
                                        node1.Data = (string)data.GetValue(sql);
                                        zjnode.AddNode(node1);
                                    }
                                }
                                break;
                            default:
                                break;
                        }

                        //遍历树，设置URL和是否打开标志
                        Tree<string>.SetMenuUrl(root, menus);

                        result = "[" + Tree<string>.ToJson(root) + "]";
                        context.Session["目录"] = result;//将目录保存到session中
                    }
                    catch (Exception ex)
                    {
                        context.Response.ContentType = "text/plain";
                        context.Response.Write(ex.Message);
                    }
                }
                else
                {
                    result = context.Session["目录"].ToString();
                }
                context.Response.ContentType = "text/plain";
                context.Response.Write(result);
            }
            catch (Exception ex) 
            {
                context.Response.Write(ex.Message);
            }
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