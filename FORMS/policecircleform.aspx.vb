﻿Imports System.Data.SqlClient
Imports System.Data
Public Class Policedeptform
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        con.ConnectionString = " Data Source = LAPTOP-3KTJE2ED\SQLEXPRESS; Initial Catalog = crimedb; User id = sa; Password = 123;"
        con.Open()
        If Not Me.IsPostBack Then
            bindDistrict()
            bindCity()
        End If

    End Sub

    Protected Sub BT1D_Click(sender As Object, e As EventArgs) Handles BT1P.Click
        Dim Instr As String
        Instr = " Insert into Circle_table(Circle_area,Circle_head,Dist_id,City_id,Pincode,Phone_no) Values('" + txtCAP.Text + "','" + txtHNP.Text + "'," + DDL1P.SelectedValue + "," + DDL2P.SelectedValue + ",'" + txtPINCODEP.Text + "'," + txtPHNOP.Text + ")"
        Dim cmpCircle As SqlCommand = New SqlCommand(Instr, con)
        cmpCircle.ExecuteNonQuery()
        Response.Write("<script>alert('Data saved successfully');</script>")
        txtCAP.Text = " "
        txtHNP.Text = " "
        txtPINCODEP.Text = " "
        txtPHNOP.Text = " "
    End Sub
    Public Sub bindDistrict()
        Dim str As String
        str = "select Dist_id,State_id,Dist_name from District_table "
        Dim comn As SqlCommand = New SqlCommand(str, con)
        Dim sqlda As SqlDataAdapter = New SqlDataAdapter(comn)
        Dim ds2 As DataTable = New DataTable
        sqlda.Fill(ds2)
        DDL1P.Items.Clear()
        DDL1P.Items.Add("--Select--")
        DDL1P.DataTextField = "Dist_name"
        DDL1P.DataValueField = "Dist_id"
        DDL1P.DataSource = ds2
        DDL1P.DataBind()

    End Sub
    Public Sub bindCity()
        Dim str As String
        str = "select City_id,State_id,Dist_id,City_name from City_table where Dist_id ='" + DDL1P.SelectedValue + "'"
        Dim comnn As SqlCommand = New SqlCommand(str, con)
        Dim sqldad As SqlDataAdapter = New SqlDataAdapter(comnn)
        Dim ds3 As DataTable = New DataTable
        sqldad.Fill(ds3)
        DDL2P.Items.Clear()
        DDL2P.Items.Add("--Select--")
        DDL2P.DataTextField = "City_name"
        DDL2P.DataValueField = "City_id"
        DDL2P.DataSource = ds3
        DDL2P.DataBind()

    End Sub

    Protected Sub DDL1P_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DDL1P.SelectedIndexChanged
        bindCity()
    End Sub
End Class