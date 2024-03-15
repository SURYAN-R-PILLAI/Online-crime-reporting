Imports System.Data.SqlClient
Imports System.Data
Public Class Complaintview
    Inherits System.Web.UI.Page
    Dim co As test = New test
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Dim query As String
            Dim userid As String = Session("user_id").ToString()
            query = " SELECT * FROM Investigation_table WHERE Complaint_id = " + userid
            Dim com As SqlCommand = New SqlCommand(query, co.connect)
            Dim sqldaC As SqlDataAdapter = New SqlDataAdapter(com)
            Dim ds As DataTable = New DataTable
            sqldaC.Fill(ds)
            Dim ap As DataTable = New DataTable
            Dim str As String
            str = "select Circle_area,Station_name,Officer_in_charge,Victim_name,Details,Evidence from Investigation_table"
            Dim cmd As SqlCommand = New SqlCommand(str, co.connect())
            Dim ad As SqlDataAdapter = New SqlDataAdapter(cmd)
            ad.Fill(ap)
            GVCV.DataSource = ap
            GVCV.DataBind()
        End If
    End Sub
    Protected Sub GVCV_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles GVCV.PageIndexChanging
        GVCV.PageIndex = e.NewPageIndex
    End Sub
End Class