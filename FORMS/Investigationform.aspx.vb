Imports System.Data.SqlClient
Imports System.Data
Public Class Investigationform
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        con.ConnectionString = " Data Source = LAPTOP-3KTJE2ED\SQLEXPRESS; Initial Catalog = crimedb; User id = sa; Password = 123;"
        con.Open()
        If Not Me.IsPostBack Then
            bindComplaint()
            bindOfficer()

        End If
    End Sub

    Protected Sub txt6_TextChanged(sender As Object, e As EventArgs) Handles txtEVIDENCEI.TextChanged

    End Sub

    Protected Sub BT1I_Click(sender As Object, e As EventArgs) Handles BT1I.Click
        Dim Instr As String
        Instr = " Insert into Investigation_table(Circle_area,Station_name,Complaint_id,Officer_in_charge,Officer_id,Victim_name,Details,Evidence) Values('" + txtCAI.Text + "','" + txtSNI.Text + "'," + DDL1I.SelectedValue + ",'" + txtOII.Text + "'," + DDL2I.SelectedValue + ",'" + txtVNI.Text + "','" + txtDETAILSI.Text + "','" + txtEVIDENCEI.Text + "')"
        Dim cmpInvestigation As SqlCommand = New SqlCommand(Instr, con)
        cmpInvestigation.ExecuteNonQuery()
        Response.Write("<script>alert('Data saved successfully');</script>")
        txtCAI.Text = " "
        txtSNI.Text = " "
        txtOII.Text = " "
        txtVNI.Text = " "
        txtDETAILSI.Text = " "
        txtEVIDENCEI.Text = " "

    End Sub
    Sub bindComplaint()
        Dim str As String
        str = "select Complaint_id,Full_name from Complaint_table"
        Dim com As SqlCommand = New SqlCommand(str, con)
        Dim sqlda As SqlDataAdapter = New SqlDataAdapter(com)
        Dim ds As DataTable = New DataTable
        sqlda.Fill(ds)
        DDL1I.Items.Clear()
        DDL1I.Items.Add("--Select--")
        DDL1I.DataTextField = "Full_name"
        DDL1I.DataValueField = "Complaint_id"
        DDL1I.DataSource = ds
        DDL1I.DataBind()
    End Sub
    Sub bindOfficer()
        Dim str As String
        str = "select Officer_id,Name from Officer_table"
        Dim com As SqlCommand = New SqlCommand(str, con)
        Dim sqlda As SqlDataAdapter = New SqlDataAdapter(com)
        Dim ds As DataTable = New DataTable
        sqlda.Fill(ds)
        DDL2I.Items.Clear()
        DDL2I.Items.Add("--Select--")
        DDL2I.DataTextField = "Name"
        DDL2I.DataValueField = "Officer_id"
        DDL2I.DataSource = ds
        DDL2I.DataBind()
    End Sub

    Protected Sub DDL1I_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DDL1I.SelectedIndexChanged
        bindComplaint()

    End Sub

    Protected Sub DDL2I_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DDL2I.SelectedIndexChanged
        bindOfficer()
    End Sub
End Class