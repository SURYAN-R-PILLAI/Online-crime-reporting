Imports System.Data.SqlClient
Imports System.Data
Public Class Cityform
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        con.ConnectionString = " Data Source = LAPTOP-3KTJE2ED\SQLEXPRESS; Initial Catalog = crimedb; User id = sa; Password = 123;"
        con.Open()
        If Not Me.IsPostBack Then
            District()
            State()
        End If
    End Sub

    Protected Sub BTN1CI_Click(sender As Object, e As EventArgs) Handles BTN1CI.Click
        Dim Instr As String
        Instr = " Insert into City_table( City_name,Dist_id,State_id) Values('" + txtCI.Text + "'," + DDL1CI.SelectedValue + "," + DDL2CI.SelectedValue + ")"
        Dim cmpCity As SqlCommand = New SqlCommand(Instr, con)
        cmpCity.ExecuteNonQuery()
        Response.Write("<script>alert('Data saved successfully');</script>")
    End Sub
    Public Sub District()
        Dim str As String
        str = "select Dist_id,Dist_name from District_table"
        Dim com As SqlCommand = New SqlCommand(str, con)
        Dim sqlda As SqlDataAdapter = New SqlDataAdapter(com)
        Dim ds1 As DataTable = New DataTable
        sqlda.Fill(ds1)
        DDL1CI.DataTextField = "Dist_name"
        DDL1CI.DataValueField = "Dist_id"
        DDL1CI.DataSource = ds1
        DDL1CI.DataBind()
    End Sub
    Public Sub State()
        Dim str As String
        str = "select State_id,State_name from State_table"
        Dim comd As SqlCommand = New SqlCommand(str, con)
        Dim sqldas As SqlDataAdapter = New SqlDataAdapter(comd)
        Dim ds2 As DataTable = New DataTable
        sqldas.Fill(ds2)
        DDL2CI.DataTextField = "State_name"
        DDL2CI.DataValueField = "State_id"
        DDL2CI.DataSource = ds2
        DDL2CI.DataBind()
    End Sub
End Class