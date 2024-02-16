Imports System.Data.SqlClient
Imports System.Data
Public Class Locationform
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        con.ConnectionString = " Data Source = LAPTOP-3KTJE2ED\SQLEXPRESS; Initial Catalog = crimedb; User id = sa; Password = 123;"
        con.Open()
        If Not Me.IsPostBack Then
            bindState()
            
        End If
        If Not Me.IsPostBack Then

            bindDistrict()
           
        End If
        If Not Me.IsPostBack Then

            bindCity()

        End If
    End Sub

    Protected Sub BT1L_Click(sender As Object, e As EventArgs) Handles BT1L.Click
        Dim Instr As String
        Instr = " Insert into Location_table( Location_name,State_id,Dist_id,Pincode,City_id) Values('" + txtLNL.Text + "'," + DDL1L.SelectedValue + "," + DDL2L.SelectedValue + "," + txtPINCODEL.Text + "," + DDL3L.SelectedValue + ")"
        Dim cmpLocation As SqlCommand = New SqlCommand(Instr, con)
        cmpLocation.ExecuteNonQuery()
        Response.Write("<script>alert('Data saved successfully');</script>")
        txtLNL.Text = " "
        txtPINCODEL.Text = " "

    End Sub
    Public Sub bindState()
        Dim str As String
        str = "select State_id,State_name from State_table"
        Dim com As SqlCommand = New SqlCommand(str, con)
        Dim sqldas As SqlDataAdapter = New SqlDataAdapter(com)
        Dim ds2 As DataTable = New DataTable
        sqldas.Fill(ds2)
        DDL1L.DataTextField = "State_name"
        DDL1L.DataValueField = "State_id"
        DDL1L.DataSource = ds2
        DDL1L.DataBind()
    End Sub

    Public Sub bindDistrict()
        Dim str As String
        str = "select Dist_id,State_id,Dist_name from District_table where State_id='" + DDL1L.SelectedValue +"'"
        Dim comn As SqlCommand = New SqlCommand(str, con)
        Dim sqlda As SqlDataAdapter = New SqlDataAdapter(comn)
        Dim ds2 As DataTable = New DataTable
        sqlda.Fill(ds2)
        DDL2L.Items.Clear()
        DDL2L.Items.Add("--Select--")
        DDL2L.DataTextField = "Dist_name"
        DDL2L.DataValueField = "Dist_id"
        DDL2L.DataSource = ds2
        DDL2L.DataBind()

    End Sub
    Public Sub bindCity()
        Dim str As String
        str = "select City_id,State_id,Dist_id,City_name from City_table where Dist_id ='" + DDL2L.SelectedValue +"'"
        Dim comnn As SqlCommand = New SqlCommand(str, con)
        Dim sqldad As SqlDataAdapter = New SqlDataAdapter(comnn)
        Dim ds3 As DataTable = New DataTable
        sqldad.Fill(ds3)
        DDL3L.Items.Clear()
        DDL3L.Items.Add("--Select--")
        DDL3L.DataTextField = "City_name"
        DDL3L.DataValueField = "City_id"
        DDL3L.DataSource = ds3
        DDL3L.DataBind()

    End Sub

    Protected Sub DDL2L_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DDL2L.SelectedIndexChanged
        bindCity()
    End Sub

    Protected Sub DDL1L_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DDL1L.SelectedIndexChanged
        bindDistrict()

    End Sub
End Class