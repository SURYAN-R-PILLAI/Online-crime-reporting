Imports System.Data.SqlClient
Imports System.Data
Public Class Teamassignform
    Inherits System.Web.UI.Page
    Dim co As test = New test
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            bindComplaint()
            bindCity()
        End If
    End Sub

    Protected Sub BT1T_Click(sender As Object, e As EventArgs) Handles BT1T.Click
        Dim Instr As String
        Instr = " Insert into Teamassign_table(Circle_area,Complaint_id,Team_head,City_id,Email,Contact_number) Values('" + txtCAT.Text + "'," + DDL1T.SelectedValue + ",'" + txtTHT.Text + "'," + DDL2T.SelectedValue + ",'" + txtEMAILT.Text + "'," + txtCNT.Text + ")"
        Dim cmpTeamassign As SqlCommand = New SqlCommand(Instr, co.connect)
        cmpTeamassign.ExecuteNonQuery()
        Response.Write("<script>alert('Data saved successfully');</script>")
        txtCAT.Text = " "
        txtTHT.Text = " "
        txtEMAILT.Text = " "
        txtCNT.Text = " "
    End Sub
    Sub bindComplaint()
        Dim str As String
        str = "select Complaint_id,Full_name from Complaint_table"
        Dim com As SqlCommand = New SqlCommand(str, co.connect)
        Dim sqldaC As SqlDataAdapter = New SqlDataAdapter(com)
        Dim ds As DataTable = New DataTable
        sqldaC.Fill(ds)
        DDL1T.Items.Clear()
        DDL1T.Items.Add("--Select--")
        DDL1T.DataTextField = "Full_name"
        DDL1T.DataValueField = "Complaint_id"
        DDL1T.DataSource = ds
        DDL1T.DataBind()
    End Sub
    Public Sub bindCity()
        Dim str As String
        str = "select City_id,State_id,Dist_id,City_name from City_table "
        Dim comnn As SqlCommand = New SqlCommand(str, co.connect)
        Dim sqldad As SqlDataAdapter = New SqlDataAdapter(comnn)
        Dim ds3 As DataTable = New DataTable
        sqldad.Fill(ds3)
        DDL2T.Items.Clear()
        DDL2T.Items.Add("--Select--")
        DDL2T.DataTextField = "City_name"
        DDL2T.DataValueField = "City_id"
        DDL2T.DataSource = ds3
        DDL2T.DataBind()

    End Sub
End Class