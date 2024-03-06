Imports System.Data.SqlClient
Imports System.Data
Public Class Loginform1
    Inherits System.Web.UI.Page
    Dim co As test = New test
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub BT1LO_Click(sender As Object, e As EventArgs) Handles bt1LO.Click, bt1LO.Click, bt1LO.Click, bt1LO.Click
        If RBLUSER.Checked = True Then
            Dim str As String
            str = "SELECT * FROM  User_table WHERE Email = '" + txtEMAILO.Text + "' AND Password = '" + txtPASSLO.Text + "' "
            Dim com As SqlCommand = New SqlCommand(str, co.connect)
            Dim sqldaC As SqlDataAdapter = New SqlDataAdapter(com)
            Dim ds As DataTable = New DataTable
            sqldaC.Fill(ds)
            If ds.Rows.Count > 0 Then
                Response.Redirect("FRMuser.aspx")
            Else
                Response.Write("<script>alert('Invalid Email or Password');</script>")
            End If
        ElseIf RBLPOLICE.Checked = True Then
            Dim str As String
            str = "SELECT * FROM  Policereg_table WHERE Email = '" + txtEMAILO.Text + "' AND Password = '" + txtPASSLO.Text + "' "
            Dim comm As SqlCommand = New SqlCommand(str, co.connect)
            Dim sqlda As SqlDataAdapter = New SqlDataAdapter(comm)
            Dim dsp As DataTable = New DataTable
            sqlda.Fill(dsp)
            If dsp.Rows.Count > 0 Then
                Response.Redirect("FRMpolice.aspx")
            Else
                Response.Write("<script>alert('Invalid Email or Password');</script>")

            End If
        End If



    End Sub

    Protected Sub LB2_Click(sender As Object, e As EventArgs) Handles LB2.Click
        Response.Redirect("userreg.aspx")
    End Sub

End Class