<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ASPxTreeView - How to change the height of the node</title>
    <style type="text/css">
        .sp
        {
            background: transparent url('Images/Separator.png') repeat-x !important;
            height: 3px;
            border-width: 0 !important; /*margin: 0 !important;*/
            padding: 0 !important;
        }
        
        .spNode
        {
            font-size: 0 !important;
            height: 3px;
        }
    </style>
    <script type="text/javascript">
        function tv_Init(s, e) {
            CalculateElbowWidth(s);
            var rootNode = s.GetRootNode();
            for (var i = 0; i < rootNode.GetNodeCount(); i++)
                ShowTreeViewNodesSeparator(rootNode.GetNode(i));
        }
        function tv_ExpandedChanged(s, e) {
            ShowTreeViewNodesSeparator(e.node);
        }
        function ShowTreeViewNodesSeparator(node) {
            ProcessNodeSeparator(node);
            if (!node.GetExpanded()) return;
            for (var i = 0; i < node.GetNodeCount(); i++)
                ShowTreeViewNodesSeparator(node.GetNode(i));
        }
        function ProcessNodeSeparator(node) {
            if (node.separatorsCreated || node.name.substr(0, 2) !== "sp") // separator node name
                return;

            var treeView = node.treeView;
            var sp = node.GetHtmlElement();
            var nodeLi = sp.parentNode;
            if (nodeLi.className.length > 0)
                nodeLi.className += " ";
            nodeLi.className += "spNode";

            var width = nodeLi.offsetWidth - treeView.cpElbowWidth;

            // Horizontal align
            var spMargin = 15;
            sp.style.marginLeft = spMargin + "px";
            sp.style.marginRight = spMargin + "px";
            width -= spMargin * 2;

            sp.style.width = width + "px";

            node.separatorsCreated = true;
        }

        function CalculateElbowWidth(treeView) {
            if (treeView.cpElbowWidth) return;
            if (treeView.GetNodeCount() === 0) return;
            var node = treeView.GetNode(0);
            var nodeLi = node.GetHtmlElement().parentNode;
            var elbow = GetNodeElbow(nodeLi);

            var pxWidth = GetCurrentStyle(elbow).width;
            var index = pxWidth.indexOf("px");
            if (index < 0) return;
            treeView.cpElbowWidth = parseInt(pxWidth.substr(0, index), 10);
        }
        function GetNodeElbow(nodeLi) {
            var elb = GetChildByClassName(nodeLi, "dxtv-elb");
            return elb || GetChildByClassName(nodeLi, "dxtv-elbNoLn");
        }
        function GetChildByClassName(element, className) {
            for (var i = 0; i < element.childNodes.length; i++) {
                var child = element.childNodes[i];
                if (child.className.indexOf(className) > -1) return child;
            }
            return null;
        }
        function GetCurrentStyle(element) {
            if (element.currentStyle)
                return element.currentStyle;
            return document.defaultView.getComputedStyle(element, null);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <dx:ASPxTreeView ID="tv" runat="server" OnLoad="tv_Load">
        <ClientSideEvents Init="tv_Init" ExpandedChanged="tv_ExpandedChanged" />
        <Nodes>
            <dx:TreeViewNode Text="ASPxTreeView Node #1">
                <Nodes>
                    <dx:TreeViewNode Text="ASPxTreeView Node #1a">
                    </dx:TreeViewNode>
                    <dx:TreeViewNode Text="ASPxTreeView Node #1b">
                    </dx:TreeViewNode>
                    <dx:TreeViewNode>
                        <NodeStyle CssClass="sp" />
                    </dx:TreeViewNode>
                    <dx:TreeViewNode Text="ASPxTreeView Node #1c">
                        <Nodes>
                            <dx:TreeViewNode Text="ASPxTreeView Node #1ca">
                            </dx:TreeViewNode>
                            <dx:TreeViewNode Text="ASPxTreeView Node #1cb">
                            </dx:TreeViewNode>
                            <dx:TreeViewNode>
                                <NodeStyle CssClass="sp" />
                            </dx:TreeViewNode>
                            <dx:TreeViewNode Text="ASPxTreeView Node #1cc">
                            </dx:TreeViewNode>
                        </Nodes>
                    </dx:TreeViewNode>
                </Nodes>
            </dx:TreeViewNode>
            <dx:TreeViewNode>
                <NodeStyle CssClass="sp" />
            </dx:TreeViewNode>
            <dx:TreeViewNode Text="ASPxTreeView Node #2">
            </dx:TreeViewNode>
            <dx:TreeViewNode Text="ASPxTreeView Node #3">
            </dx:TreeViewNode>
            <dx:TreeViewNode>
                <NodeStyle CssClass="sp" />
            </dx:TreeViewNode>
            <dx:TreeViewNode Text="ASPxTreeView Node #4">
            </dx:TreeViewNode>
        </Nodes>
    </dx:ASPxTreeView>
    </form>
</body>
</html>
