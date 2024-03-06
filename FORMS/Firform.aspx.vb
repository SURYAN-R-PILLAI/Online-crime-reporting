Imports System.Data.SqlClient
Imports System.Data
Public Class Firform
    Inherits System.Web.UI.Page
    Dim co As test = New test
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            bindStation()
            bindComplaint()
            bindOfficer()
            bindDistrict()
            bindgrid()
        End If
    End Sub

    Protected Sub BT1_Click(sender As Object, e As EventArgs) Handles BT1F.Click
        Dim Instr As String
        Instr = " Insert into FIR_table(Dist_id,Station_id,Fir_report,Fir_date,Place_of_occurrence,Ipc_code_section,Crime_subject,Mode_of_operation,Evidence,Complaint_id,Officer_id) Values(" + DDL1F.SelectedValue + "," + DDL2F.SelectedValue + ",'" + txtFRF.Text + "','" + txtFDF.Text + "','" + txtPOF.Text + "','" + txtIPCF.Text + "','" + txtCSF.Text + "','" + txtMOF.Text + "','" + txtEVIDENCEF.Text + "'," + DDL3F.SelectedValue + "," + DDL4F.SelectedValue + ")"
        Dim cmpFIR As SqlCommand = New SqlCommand(Instr, co.connect())
        cmpFIR.ExecuteNonQuery()
        Response.Write("<script>alert('Data saved successfully');</script>")
        txtFRF.Text = " "
        txtFDF.Text = " "
        txtPOF.Text = " "
        txtIPCF.Text = " "
        txtCSF.Text = " "
        txtMOF.Text = " "
        txtEVIDENCEF.Text = " "
        bindgrid()
    End Sub
    Sub bindStation()
        Dim str As String
        str = "select Station_id,Station_name from Station_table"
        Dim com As SqlCommand = New SqlCommand(str, co.connect())
        Dim sqldaC As SqlDataAdapter = New SqlDataAdapter(com)
        Dim ds As DataTable = New DataTable
        sqldaC.Fill(ds)
        DDL2F.Items.Clear()
        DDL2F.Items.Add("--Select--")
        DDL2F.DataTextField = "Station_name"
        DDL2F.DataValueField = "Station_id"
        DDL2F.DataSource = ds
        DDL2F.DataBind()
    End Sub
    Sub bindComplaint()
        Dim str As String
        str = "select Complaint_id,Full_name from Complaint_table"
        Dim com As SqlCommand = New SqlCommand(str, co.connect())
        Dim sqldaC As SqlDataAdapter = New SqlDataAdapter(com)
        Dim ds As DataTable = New DataTable
        sqldaC.Fill(ds)
        DDL3F.Items.Clear()
        DDL3F.Items.Add("--Select--")
        DDL3F.DataTextField = "Full_name"
        DDL3F.DataValueField = "Complaint_id"
        DDL3F.DataSource = ds
        DDL3F.DataBind()
    End Sub
    Sub bindOfficer()
        Dim str As String
        str = "select Officer_id,Name from Officer_table"
        Dim com As SqlCommand = New SqlCommand(str, co.connect())
        Dim sqldaC As SqlDataAdapter = New SqlDataAdapter(com)
        Dim ds As DataTable = New DataTable
        sqldaC.Fill(ds)
        DDL4F.Items.Clear()
        DDL4F.Items.Add("--Select--")
        DDL4F.DataTextField = "Name"
        DDL4F.DataValueField = "Officer_id"
        DDL4F.DataSource = ds
        DDL4F.DataBind()
    End Sub
    Public Sub bindDistrict()
        Dim str As String
        str = "select Dist_id,State_id,Dist_name from District_table "
        Dim comn As SqlCommand = New SqlCommand(str, co.connect())
        Dim sqlda As SqlDataAdapter = New SqlDataAdapter(comn)
        Dim ds2 As DataTable = New DataTable
        sqlda.Fill(ds2)
        DDL1F.Items.Clear()
        DDL1F.Items.Add("--Select--")
        DDL1F.DataTextField = "Dist_name"
        DDL1F.DataValueField = "Dist_id"
        DDL1F.DataSource = ds2
        DDL1F.DataBind()

    End Sub
    Public Sub bindgrid()

        Dim ap As DataTable = New DataTable
        Dim str As String
        str = "select Fir_report,Fir_date,Place_of_occurrence,Ipc_code_section,Crime_subject,Mode_of_operation,Evidence from FIR_table"
        Dim cmd As SqlCommand = New SqlCommand(str, co.connect())
        Dim ad As SqlDataAdapter = New SqlDataAdapter(cmd)
        ad.Fill(ap)
        GVF.DataSource = ap
        GVF.DataBind()

    End Sub
    Protected Sub GVF_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles GVF.PageIndexChanging
        GVF.PageIndex = e.NewPageIndex
        bindgrid()
    End Sub
End Class