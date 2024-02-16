Imports System.Data.SqlClient
Imports System.Data
Public Class Officerform
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        con.ConnectionString = " Data Source = LAPTOP-3KTJE2ED\SQLEXPRESS; Initial Catalog = crimedb; User id = sa; Password = 123;"
        con.Open()
        If Not Me.IsPostBack Then
            bindCircle()
            bindStation()
        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles BT1O.Click
        Dim Instr As String
        Instr = " Insert into Officer_table(Rank,Name,Circle_id,Mobile_number,Station_id,Email_id) Values('" + txtRANKO.Text + "','" + txtNAMEO.Text + "'," + DDL1O.SelectedValue + "," + txtMNO.Text + "," + DDL2O.SelectedValue + ",'" + txtEMAILO.Text + "')"
        Dim cmpOfficer As SqlCommand = New SqlCommand(Instr, con)
        cmpOfficer.ExecuteNonQuery()
        Response.Write("<script>alert('Data saved successfully');</script>")
        txtRANKO.Text = " "
        txtNAMEO.Text = " "
        txtMNO.Text = " "
        txtEMAILO.Text = " "

    End Sub
    Sub bindCircle()
        Dim str As String
        str = "select Circle_id,Circle_area from Circle_table"
        Dim com As SqlCommand = New SqlCommand(str, con)
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
        Dim com As SqlCommand = New SqlCommand(str, con)
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

    Protected Sub DDL1O_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DDL1O.SelectedIndexChanged
        bindCircle()

    End Sub

    Protected Sub DDL2O_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DDL2O.SelectedIndexChanged
        bindStation()

    End Sub
End Class