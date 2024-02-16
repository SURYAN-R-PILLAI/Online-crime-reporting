Imports System.Data.SqlClient
Imports System.Data
Public Class Districtform
    Inherits System.Web.UI.Page
    Dim conn As New SqlConnection
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        conn.ConnectionString = " Data Source = LAPTOP-3KTJE2ED\SQLEXPRESS; Initial Catalog = crimedb; User id = sa; Password = 123;"
        conn.Open()
        If Not Me.IsPostBack Then
            State()
        End If
    End Sub

    Protected Sub BTN1DI_Click(sender As Object, e As EventArgs) Handles BTN1DI.Click
        Dim Instr As String
        Instr = " Insert into District_table( Dist_name,State_id) Values('" + txtDI.Text + "'," + DDL1DI.SelectedValue + ")"
        Dim cmpState As SqlCommand = New SqlCommand(Instr, conn)
        cmpState.ExecuteNonQuery()
        Response.Write("<script>alert('Data saved successfully');</script>")
        txtDI.Text = " "
    End Sub
    Public Sub State()
        Dim str As String
        str = "select State_id,State_name from State_table"
        Dim com As SqlCommand = New SqlCommand(str, conn)
        Dim sqlda As SqlDataAdapter = New SqlDataAdapter(com)
        Dim ds As DataTable = New DataTable
        sqlda.Fill(ds)
        DDL1DI.Items.Clear()
        DDL1DI.Items.Add("--Select--")
        DDL1DI.DataTextField = "State_name"
        DDL1DI.DataValueField = "State_id"
        DDL1DI.DataSource = ds
        DDL1DI.DataBind()

    End Sub

    Protected Sub DDL1DI_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DDL1DI.SelectedIndexChanged

    End Sub
End Class