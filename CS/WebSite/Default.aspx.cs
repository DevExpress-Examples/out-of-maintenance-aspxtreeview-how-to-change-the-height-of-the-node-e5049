using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxTreeView;

public partial class _Default : System.Web.UI.Page {
    protected void tv_Load(object sender, EventArgs e) {
        int separatorIndex = 0;
        var treeView = (ASPxTreeView)sender;
        ProcessSeparatorNodes(treeView.Nodes, ref separatorIndex);
    }
    protected void ProcessSeparatorNodes(TreeViewNodeCollection nodes, ref int seperatorIndex) {
        foreach (TreeViewNode node in nodes) {
            if (node.NodeStyle.CssClass == "sp")
                node.Name = "sp" + seperatorIndex++;
            ProcessSeparatorNodes(node.Nodes, ref seperatorIndex);
        }
    }
}