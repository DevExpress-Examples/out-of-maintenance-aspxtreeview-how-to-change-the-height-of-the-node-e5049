Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Web

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub tv_Load(ByVal sender As Object, ByVal e As EventArgs)
		Dim separatorIndex As Integer = 0
		Dim treeView = CType(sender, ASPxTreeView)
		ProcessSeparatorNodes(treeView.Nodes, separatorIndex)
	End Sub
	Protected Sub ProcessSeparatorNodes(ByVal nodes As TreeViewNodeCollection, ByRef seperatorIndex As Integer)
		For Each node As TreeViewNode In nodes
			If node.NodeStyle.CssClass = "sp" Then
				seperatorIndex = seperatorIndex + 1
				node.Name = "sp" & seperatorIndex
			End If
			ProcessSeparatorNodes(node.Nodes, seperatorIndex)
		Next node
	End Sub
End Class