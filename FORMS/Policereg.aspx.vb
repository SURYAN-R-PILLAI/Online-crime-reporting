Imports System.Data.SqlClient
Imports System.Data
Public Class Policereg
    Inherits System.Web.UI.Page
    Dim co As test = New test
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btn1PR_Click(sender As Object, e As EventArgs) Handles btn1PR.Click
        Dim Instr As String
        Dim Gen As String
        If RB1PR.Checked = True Then
            Gen = "MALE"
        ElseIf RB2PR.Checked Then
            Gen = "FEMALE"
        End If
        Instr = " Insert into Policereg_table( Name,Email,Contact_number,Password,Confirm_password,Gender) Values('" + txtNAMEPR.Text + "','" + txtEMAILPR.Text + "'," + txtCNPR.Text + ",'" + txtPASSPR.Text + "','" + txtCPASSPR.Text + "','" + Gen + "')"
        Dim cmpUser As SqlCommand = New SqlCommand(Instr, co.connect())
        cmpUser.ExecuteNonQuery()
        Response.Write("<script>alert('Data saved successfully');</script>")
        txtEMAILPR.Text = " "
        txtEMAILPR.Text = " "
        txtCNPR.Text = " "
        txtPASSPR.Text = " "
        txtCPASSPR.Text = " "
    End Sub
End Class