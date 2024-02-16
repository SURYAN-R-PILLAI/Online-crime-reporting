Imports System.Data.SqlClient
Imports System.Data
Public Class Stateform
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        con.ConnectionString = " Data Source = LAPTOP-3KTJE2ED\SQLEXPRESS; Initial Catalog = crimedb; User id = sa; Password = 123;"
        con.Open()
    End Sub

    Protected Sub TextBox1_TextChanged(sender As Object, e As EventArgs) Handles txtST.TextChanged

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles BTN1ST.Click
        Dim Instr As String
        Instr = " Insert into State_table( State_name) Values('" + txtST.Text +"')"
        Dim cmpState As SqlCommand = New SqlCommand(Instr, con)
        cmpState.ExecuteNonQuery()
        Response.Write("<script>alert('Data saved successfully');</script>")
        txtST.Text = " "
    End Sub

End Class