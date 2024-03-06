Imports System.Data.SqlClient
Imports System.Data
Public Class Courtform
    Inherits System.Web.UI.Page
    Dim co As test = New test
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            bindComplaint()
            bindgrid()
        End If
    End Sub

    Protected Sub BT1CO_Click(sender As Object, e As EventArgs) Handles BT1CO.Click
        Dim Instr As String
        Instr = " Insert into Court_table(Court_name,Complaint_id,Victim_name,Ipc_code_section,Mode_of_operation,Date,Verdict) Values('" + txtCNCO.Text + "'," + DDL1CO.SelectedValue + ",'" + txtVNCO.Text + "','" + txtIPCCO.Text + "','" + txtMOCO.Text + "','" + txtDATECO.Text + "','" + txtVERDICTCO.Text + "')"
        Dim cmpCourt As SqlCommand = New SqlCommand(Instr, co.connect())
        cmpCourt.ExecuteNonQuery()
        Response.Write("<script>alert('Data saved successfully');</script>")
        txtCNCO.Text = " "
        txtVNCO.Text = " "
        txtIPCCO.Text = " "
        txtMOCO.Text = " "
        txtDATECO.Text = " "
        txtVERDICTCO.Text = " "
        bindgrid()
    End Sub
    Sub bindComplaint()
        Dim str As String
        str = "select Complaint_id,Full_name from Complaint_table"
        Dim com As SqlCommand = New SqlCommand(str, co.connect())
        Dim sqlda As SqlDataAdapter = New SqlDataAdapter(com)
        Dim ds As DataTable = New DataTable
        sqlda.Fill(ds)
        DDL1CO.Items.Clear()
        DDL1CO.Items.Add("--Select--")
        DDL1CO.DataTextField = "Full_name"
        DDL1CO.DataValueField = "Complaint_id"
        DDL1CO.DataSource = ds
        DDL1CO.DataBind()

    End Sub
    Public Sub bindgrid()

        Dim ap As DataTable = New DataTable
        Dim str As String
        str = "select Court_name,Victim_name,Ipc_code_section,Mode_of_operation,Date,Verdict from Court_table"
        Dim cmd As SqlCommand = New SqlCommand(str, co.connect())
        Dim ad As SqlDataAdapter = New SqlDataAdapter(cmd)
        ad.Fill(ap)
        GVCO.DataSource = ap
        GVCO.DataBind()

    End Sub
    Protected Sub GVCO_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles GVCO.PageIndexChanging
        GVCO.PageIndex = e.NewPageIndex
        bindgrid()
    End Sub
End Class