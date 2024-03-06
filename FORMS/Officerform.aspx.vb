Imports System.Data.SqlClient
Imports System.Data
Public Class Officerform
    Inherits System.Web.UI.Page
    Dim co As test = New test
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            bindCircle()
            bindStation()
            bindTeam()
            bindgrid()
        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles BT1O.Click
        Dim Instr As String
        Instr = " Insert into Officer_table(Rank,Name,Circle_id,Assign_id,Mobile_number,Station_id,Email_id) Values('" + txtRANKO.Text + "','" + txtNAMEO.Text + "'," + DDL1O.SelectedValue + "," + DDL3O.SelectedValue + "," + txtMNO.Text + "," + DDL2O.SelectedValue + ",'" + txtEMAILO.Text + "')"
        Dim cmpOfficer As SqlCommand = New SqlCommand(Instr, co.connect())
        cmpOfficer.ExecuteNonQuery()
        Response.Write("<script>alert('Data saved successfully');</script>")
        txtRANKO.Text = " "
        txtNAMEO.Text = " "
        txtMNO.Text = " "
        txtEMAILO.Text = " "
        bindgrid()
    End Sub
    Sub bindCircle()
        Dim str As String
        str = "select Circle_id,Circle_area from Circle_table"
        Dim com As SqlCommand = New SqlCommand(str, co.connect())
        Dim sqlda As SqlDataAdapter = New SqlDataAdapter(com)
        Dim ds As DataTable = New DataTable
        sqlda.Fill(ds)
        DDL1O.Items.Clear()
        DDL1O.Items.Add("--Select--")
        DDL1O.DataTextField = "Circle_area"
        DDL1O.DataValueField = "Circle_id"
        DDL1O.DataSource = ds
        DDL1O.DataBind()
    End Sub
    Sub bindStation()
        Dim str As String
        str = "select Station_id,Station_name from Station_table"
        Dim com As SqlCommand = New SqlCommand(str, co.connect())
        Dim sqlda As SqlDataAdapter = New SqlDataAdapter(com)
        Dim ds As DataTable = New DataTable
        sqlda.Fill(ds)
        DDL2O.Items.Clear()
        DDL2O.Items.Add("--Select--")
        DDL2O.DataTextField = "Station_name"
        DDL2O.DataValueField = "Station_id"
        DDL2O.DataSource = ds
        DDL2O.DataBind()
    End Sub
    Sub bindTeam()
        Dim str As String
        str = "select Assign_id,Team_head from Teamassign_table"
        Dim com As SqlCommand = New SqlCommand(str, co.connect())
        Dim sqlda As SqlDataAdapter = New SqlDataAdapter(com)
        Dim ds As DataTable = New DataTable
        sqlda.Fill(ds)
        DDL3O.Items.Clear()
        DDL3O.Items.Add("--Select--")
        DDL3O.DataTextField = "Team_head"
        DDL3O.DataValueField = "Assign_id"
        DDL3O.DataSource = ds
        DDL3O.DataBind()
    End Sub

    Protected Sub DDL1O_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DDL1O.SelectedIndexChanged
        bindCircle()

    End Sub

    Protected Sub DDL2O_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DDL2O.SelectedIndexChanged
        bindStation()

    End Sub
    Public Sub bindgrid()

        Dim ap As DataTable = New DataTable
        Dim str As String
        str = "select Rank,Name,Mobile_number,Email_id from Officer_table"
        Dim cmd As SqlCommand = New SqlCommand(str, co.connect())
        Dim ad As SqlDataAdapter = New SqlDataAdapter(cmd)
        ad.Fill(ap)
        GVO.DataSource = ap
        GVO.DataBind()

    End Sub

    Protected Sub GVO_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles GVO.PageIndexChanging
        GVO.PageIndex = e.NewPageIndex
        bindgrid()
    End Sub
End Class