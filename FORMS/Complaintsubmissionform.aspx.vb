﻿Imports System.Data.SqlClient
Imports System.Data
Public Class Complaintsubmissionform
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        con.ConnectionString = " Data Source = LAPTOP-3KTJE2ED\SQLEXPRESS; Initial Catalog = crimedb; User id = sa; Password = 123;"
        con.Open()
        If Not Me.IsPostBack Then
            bindUser()
            bindLocation()
        End If

    End Sub

    Protected Sub BT1C_Click(sender As Object, e As EventArgs) Handles BT1C.Click
        Dim Instr As String
        Instr = " Insert into Complaint_table( Full_name,Email,Phone_number,User_id,Subject,Place_of_occurrence,Date_of_occurrence,Police_station,Location_id,Description) Values('" + txtFNC.Text + "','" + txtEMAILC.Text + "'," + txtPHNOC.Text + "," + DDL1C.SelectedValue + ",'" + txtSUBJECTC.Text + "', '" + txtPOC.Text + "','" + txtDOC.Text + "','" + txtPSC.Text + "'," + DDL2C.SelectedValue + ",'" + txtDESCRIPTIONC.Text + "')"
        Dim cmpComplaint As SqlCommand = New SqlCommand(Instr, con)
        cmpComplaint.ExecuteNonQuery()
        Response.Write("<script>alert('Data saved successfully');</script>")
        txtFNC.Text = " "
        txtEMAILC.Text = " "
        txtPHNOC.Text = " "
        txtSUBJECTC.Text = " "
        txtPOC.Text = " "
        txtDOC.Text = " "
        txtPSC.Text = " "
        txtDESCRIPTIONC.Text = " "
       End Sub
    Sub bindUser()
        Dim str As String
        str = "select User_id,First_name from User_table"
        Dim com As SqlCommand = New SqlCommand(str, con)
        Dim sqlda As SqlDataAdapter = New SqlDataAdapter(com)
        Dim ds As DataTable = New DataTable

        sqlda.Fill(ds)
        DDL1C.Items.Clear()
        DDL1C.Items.Add("--Select--")
        DDL1C.DataTextField = "First_name"
        DDL1C.DataValueField = "User_id"
        DDL1C.DataSource = ds
        DDL1C.DataBind()

    End Sub
    Sub bindLocation()
        Dim str As String
        str = "select Location_id,Location_name from Location_table"
        Dim com As SqlCommand = New SqlCommand(str, con)
        Dim sqlda As SqlDataAdapter = New SqlDataAdapter(com)
        Dim ds As DataTable = New DataTable
        sqlda.Fill(ds)
        DDL2C.Items.Clear()
        DDL2C.Items.Add("--Select--")
        DDL2C.DataTextField = "Location_name"
        DDL2C.DataValueField = "Location_id"
        DDL2C.DataSource = ds
        DDL2C.DataBind()
    End Sub

    Protected Sub DDL1C_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DDL1C.SelectedIndexChanged
        bindUser()
    End Sub

    Protected Sub DDL2C_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DDL2C.SelectedIndexChanged
        bindLocation()
    End Sub
End Class