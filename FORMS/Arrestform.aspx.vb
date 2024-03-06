Imports System.Data.SqlClient
Imports System.Data
Public Class Arrestform
    Inherits System.Web.UI.Page
    Dim co As test = New test
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            bindComplaint()
            bindOfficer()
            bindgrid()
        End If
    End Sub

    Protected Sub BT1A_Click(sender As Object, e As EventArgs) Handles BT1A.Click
        Dim Instr As String
        Instr = " Insert into Arrest_table(Victim_name,Complaint_id,Mode_of_operation,Ipc_code_section,Officer_id,Place_of_arrest,Date) Values('" + txtVNA.Text + "'," + DDL1A.SelectedValue + ",'" + txtMOA.Text + "','" + txtIPCA.Text + "'," + DDL2A.SelectedValue + ",'" + txtPAA.Text + "','" + txtDATEA.Text + "')"
        Dim cmpArrest As SqlCommand = New SqlCommand(Instr, co.connect())
        cmpArrest.ExecuteNonQuery()
        Response.Write("<script>alert('Data saved successfully');</script>")
        txtVNA.Text = " "
        txtMOA.Text = " "
        txtIPCA.Text = " "
        txtPAA.Text = " "
        txtDATEA.Text = " "
        bindgrid()
    End Sub
    Sub bindComplaint()
        Dim str As String
        str = "select Complaint_id,Full_name from Complaint_table"
        Dim com As SqlCommand = New SqlCommand(str, co.connect())
        Dim sqlda As SqlDataAdapter = New SqlDataAdapter(com)
        Dim ds As DataTable = New DataTable
        sqlda.Fill(ds)
        DDL1A.Items.Clear()
        DDL1A.Items.Add("--Select--")
        DDL1A.DataTextField = "Full_name"
        DDL1A.DataValueField = "Complaint_id"
        DDL1A.DataSource = ds
        DDL1A.DataBind()

    End Sub
    Sub bindOfficer()
        Dim str As String
        str = "select Officer_id,Name from Officer_table"
        Dim com As SqlCommand = New SqlCommand(str, co.connect())
        Dim sqlda As SqlDataAdapter = New SqlDataAdapter(com)
        Dim ds As DataTable = New DataTable
        sqlda.Fill(ds)
        DDL2A.Items.Clear()
        DDL2A.Items.Add("--Select--")
        DDL2A.DataTextField = "Name"
        DDL2A.DataValueField = "Officer_id"
        DDL2A.DataSource = ds
        DDL2A.DataBind()

    End Sub
    Public Sub bindgrid()

        Dim ap As DataTable = New DataTable
        Dim str As String
        str = "select Victim_name,Mode_of_operation,Ipc_code_section,Place_of_arrest,Date from Arrest_table"
        Dim cmd As SqlCommand = New SqlCommand(str, co.connect())
        Dim ad As SqlDataAdapter = New SqlDataAdapter(cmd)
        ad.Fill(ap)
        GVA.DataSource = ap
        GVA.DataBind()

    End Sub
    Protected Sub GVA_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles GVA.PageIndexChanging
        GVA.PageIndex = e.NewPageIndex
        bindgrid()
    End Sub
End Class