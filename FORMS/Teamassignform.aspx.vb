Imports System.Data.SqlClient
Imports System.Data
Public Class Teamassignform
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        con.ConnectionString = " Data Source = LAPTOP-3KTJE2ED\SQLEXPRESS; Initial Catalog = crimedb; User id = sa; Password = 123;"
        con.Open()
        If Not Me.IsPostBack Then
            bindComplaint()
            bindOfficer()
            bindCity()
        End If
    End Sub

    Protected Sub BT1T_Click(sender As Object, e As EventArgs) Handles BT1T.Click
        Dim Instr As String
        Instr = " Insert into Teamassign_table(Circle_area,Complaint_id,Station_name,Officer_id,Officer_in_charge,City_id,Pincode,Contact_number) Values('" + txtCAT.Text + "'," + DDL1T.SelectedValue + ",'" + txtSNT.Text + "'," + DDL2T.SelectedValue + ",'" + txtOIT.Text + "'," + DDL3T.SelectedValue + ",'" + txtPINCODET.Text + "'," + txtCNT.Text + ")"
        Dim cmpTeamassign As SqlCommand = New SqlCommand(Instr, con)
        cmpTeamassign.ExecuteNonQuery()
        Response.Write("<script>alert('Data saved successfully');</script>")
        txtCAT.Text = " "
        txtSNT.Text = " "
        txtOIT.Text = " "
        txtPINCODET.Text = " "
        txtCNT.Text = " "
    End Sub
    Sub bindComplaint()
        Dim str As String
        str = "select Complaint_id,Full_name from Complaint_table"
        Dim com As SqlCommand = New SqlCommand(str, con)
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
    Sub bindOfficer()
        Dim str As String
        str = "select Officer_id,Name from Officer_table"
        Dim com As SqlCommand = New SqlCommand(str, con)
        Dim sqldaC As SqlDataAdapter = New SqlDataAdapter(com)
        Dim ds As DataTable = New DataTable
        sqldaC.Fill(ds)
        DDL2T.Items.Clear()
        DDL2T.Items.Add("--Select--")
        DDL2T.DataTextField = "Name"
        DDL2T.DataValueField = "Officer_id"
        DDL2T.DataSource = ds
        DDL2T.DataBind()
    End Sub

   
    Public Sub bindCity()
        Dim str As String
        str = "select City_id,State_id,Dist_id,City_name from City_table "
        Dim comnn As SqlCommand = New SqlCommand(str, con)
        Dim sqldad As SqlDataAdapter = New SqlDataAdapter(comnn)
        Dim ds3 As DataTable = New DataTable
        sqldad.Fill(ds3)
        DDL3T.Items.Clear()
        DDL3T.Items.Add("--Select--")
        DDL3T.DataTextField = "City_name"
        DDL3T.DataValueField = "City_id"
        DDL3T.DataSource = ds3
        DDL3T.DataBind()

    End Sub

    Protected Sub DDL1T_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DDL1T.SelectedIndexChanged
        bindComplaint()

    End Sub

    Protected Sub DDL2T_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DDL2T.SelectedIndexChanged
        bindOfficer()

    End Sub
End Class