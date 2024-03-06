Imports System.Data.SqlClient
Imports System.Data
Public Class userreg
    Inherits System.Web.UI.Page
    Dim co As test = New test
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            bindState()
            
        End If
    End Sub

    Protected Sub BTN1U_Click(sender As Object, e As EventArgs) Handles BTN1U.Click

        Dim Instr As String
        Dim Gen As String
        If RB1USER.Checked = True Then
            Gen = "MALE"
        ElseIf RB2USER.Checked Then
            Gen = "FEMALE"
        End If
        Instr = " Insert into User_table( First_name,Last_name,Email,Phone_no,Dob,Aadhar_number,Gender,House_name,State_id,City_id,Dist_id,Pincode,Password,Confirm_password) Values('" + txtFNU.Text + "','" + txtLNU.Text + "','" + txtEMAILU.Text + "'," + txtPHNOU.Text + ", '" + txtDOBU.Text + "'," + txtAADHARU.Text + ",'" + Gen + "','" + txtHNU.Text + "'," + DDL3U.SelectedValue + "," + DDL2U.SelectedValue + "," + DDL1U.SelectedValue + ",'" + txtPINCODEU.Text + "','" + txtPASSU.Text + "','" + txtCPASSU.Text + "')"
        Dim cmpUser As SqlCommand = New SqlCommand(Instr, co.connect())
        cmpUser.ExecuteNonQuery()
        Response.Write("<script>alert('Data saved successfully');</script>")
        txtFNU.Text = " "
        txtLNU.Text = " "
        txtEMAILU.Text = " "
        txtPHNOU.Text = " "
        txtDOBU.Text = " "
        txtAADHARU.Text = " "
        txtHNU.Text = " "
        txtPINCODEU.Text = " "
        txtPASSU.Text = " "
        txtCPASSU.Text = " "
    End Sub
    Public Sub bindState()
        Dim str As String
        str = "select State_id,State_name from State_table"
        Dim com As SqlCommand = New SqlCommand(str, co.connect())
        Dim sqldas As SqlDataAdapter = New SqlDataAdapter(com)
        Dim ds2 As DataTable = New DataTable
        sqldas.Fill(ds2)
        DDL3U.DataTextField = "State_name"
        DDL3U.DataValueField = "State_id"
        DDL3U.DataSource = ds2
        DDL3U.DataBind()
    End Sub

    Public Sub bindDistrict()
        Dim str As String
        str = "select Dist_id,State_id,Dist_name from District_table where State_id='" + DDL3U.SelectedValue + "'"
        Dim comn As SqlCommand = New SqlCommand(str, co.connect)
        Dim sqlda As SqlDataAdapter = New SqlDataAdapter(comn)
        Dim ds2 As DataTable = New DataTable
        sqlda.Fill(ds2)
        DDL1U.Items.Add("--Select--")
        DDL1U.DataTextField = "Dist_name"
        DDL1U.DataValueField = "Dist_id"
        DDL1U.DataSource = ds2
        DDL1U.DataBind()

    End Sub
    Public Sub bindCity()
        Dim str As String
        str = "select City_id,State_id,Dist_id,City_name from City_table where Dist_id = '" + DDL1U.SelectedValue + "'"
        Dim comnn As SqlCommand = New SqlCommand(str, co.connect)
        Dim sqldad As SqlDataAdapter = New SqlDataAdapter(comnn)
        Dim ds3 As DataTable = New DataTable
        sqldad.Fill(ds3)
        DDL2U.Items.Add("--Select--")
        DDL2U.DataTextField = "City_name"
        DDL2U.DataValueField = "City_id"
        DDL2U.DataSource = ds3
        DDL2U.DataBind()

    End Sub
    Public Sub bindgrid()

        Dim ap As DataTable = New DataTable
        Dim str As String
        str = "select First_name,Last_name,Email,Phone_no,Dob,Aadhar_number,Gender,House_name,Pincode,Password,Confirm_password from User_table"
        Dim cmd As SqlCommand = New SqlCommand(str, co.connect())
        Dim ad As SqlDataAdapter = New SqlDataAdapter(cmd)
        ad.Fill(ap)
        

    End Sub

    Protected Sub DDL3U_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DDL3U.SelectedIndexChanged
        bindDistrict()

    End Sub
    Protected Sub DDL1U_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DDL1U.SelectedIndexChanged
        bindCity()

    End Sub
End Class