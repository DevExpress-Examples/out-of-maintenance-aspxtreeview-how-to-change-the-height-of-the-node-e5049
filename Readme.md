<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))
<!-- default file list end -->
# ASPxTreeView - How to change the height of the node


<p>To accomplish this task, you can set the <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxTreeViewTreeViewNodeStyleMembersTopicAll">NodeStyle.CssClass</a> property to the corresponding nodes and calculate the separator width in the <a href="http://help.devexpress.com/#AspNet/DevExpressWebASPxClassesScriptsASPxClientControl_Inittopic">ASPxClientTreeView.Init</a> event handler.</p>

<br/>


