using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;
using Model;

namespace Common
{
    public class Tree<T>
    {
        public Tree()
        {
            nodes = new List<Tree<T>>();
        }

        public Tree(T data)
        {
            this.Data = data;
            nodes = new List<Tree<T>>();
        }

        private Tree<T> parent;
        /// <summary>
        /// 父结点
        /// </summary>
        public Tree<T> Parent
        {
            get { return parent; }
        }
        /// <summary>
        /// 结点数据
        /// </summary>
        public T Data { get; set; }
        /// <summary>
        /// URL
        /// </summary>
        public string URL { get; set; }
        /// <summary>
        /// 目录是否展开
        /// </summary>
        public bool Open { get; set; }
        /// <summary>
        /// 菜单ID
        /// </summary>
        public int Id { get; set; }

        private List<Tree<T>> nodes;
        /// <summary>
        /// 子结点
        /// </summary>
        public List<Tree<T>> Nodes
        {
            get { return nodes; }
        }
        /// <summary>
        /// 添加结点
        /// </summary>
        /// <param name="node">结点</param>
        public void AddNode(Tree<T> node)
        {
            if (!nodes.Contains(node))
            {
                node.parent = this;
                nodes.Add(node);
            }
        }
        /// <summary>
        /// 添加结点
        /// </summary>
        /// <param name="nodes">结点集合</param>
        public void AddNode(List<Tree<T>> nodes)
        {
            foreach (var node in nodes)
            {
                if (!nodes.Contains(node))
                {
                    node.parent = this;
                    nodes.Add(node);
                }
            }
        }
        /// <summary>
        /// 移除结点
        /// </summary>
        /// <param name="node"></param>
        public void Remove(Tree<T> node)
        {
            if (nodes.Contains(node))
                nodes.Remove(node);
        }
        /// <summary>
        /// 清空结点集合
        /// </summary>
        public void RemoveAll()
        {
            nodes.Clear();
        }

        /// <summary>
        /// 将树转换为Json字符串
        /// </summary>
        /// <param name="root"></param>
        /// <returns></returns>
        public static string ToJson(Tree<T> root)
        {
            string result = "";

            result += "{\"id\":" + root.Id;
            result += ",\"text\":\"" + root.Data;
            result += "\"";
            result += ",\"attributes\":{\"url\":\"" + root.URL;
            result += "\"}";

            if (root.Nodes.Count > 0)
            {
                result += ",\"state\":\"" + (root.Open ? "open" : "closed");
                result += "\"";
                result += ",\"children\":";
                result += "[";
                foreach (var item in root.Nodes)
                {
                    result += ToJson(item);
                    result += ",";
                }
                result = result.Remove(result.Length - 1, 1);
                result += "]";
            }

            result += "}";
            return result;
        }

        /// <summary>
        /// 查看下一层中是否存在某一个节点
        /// </summary>
        /// <param name="root"></param>
        /// <param name="search"></param>
        /// <returns></returns>
        public static bool Exists(Tree<string> root, string search)
        {
            if (root.Nodes.Count > 0)
            {
                foreach (var item in root.Nodes)
                {
                    if (item.Data.Equals(search))
                    {
                        return true;
                    }
                }
            }
            return false;
        }
        
        /// <summary>
        /// 根据数据库中的菜单信息，设置树形菜单的URL
        /// </summary>
        /// <param name="root"></param>
        /// <param name="menus"></param>
        /// <returns></returns>
        public static Tree<string> SetMenuUrl(Tree<string> root, Hashtable menus)
        {
            //设置当前节点url信息
            if (menus.ContainsKey(root.Data))
            {
                //如果程序中已经设置过URL就采用自定义的URL，否则采用数据库中的URL
                if (root.URL == null || root.URL == "")
                {
                    root.URL = ((MenuInfo)(menus[root.Data])).Url;
                }
                root.Id = ((MenuInfo)(menus[root.Data])).Id;
            }
            if (root.Nodes.Count > 0)
            {
                //深度优先遍历（只要存在子节点，就遍历子节点）
                foreach (var item in root.Nodes)
                {
                    SetMenuUrl(item, menus);
                }
            }
            return root;
        }
    }
}
