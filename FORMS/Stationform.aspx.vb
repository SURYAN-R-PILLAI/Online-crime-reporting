Imports System.Data.SqlClient
Imports System.Data
Public Class Stationform
    Inherits System.Web.UI.Page
    Dim co As test = New test
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        
        If Not Me.IsPostBack Then
            bindLocation()
            bindCity()
            bindgrid()
        End If
    End Sub

    Protected Sub BT1S_Click(sender As Object, e As EventArgs) Handles BT1S.Click
        Dim Instr As String
        Instr = " Insert into Station_table(Station_name,Station_email,City_id,Location_id,Phone_number,Station_in_charge) Values('" + txtSNS.Text + "','" + txtSES.Text + "','" + DDL1S.SelectedValue + "'," + DDL2S.SelectedValue + ", " + txtPHNOS.Text + ",'" + txtSIS.Text + "')"
        Dim cmpStation As SqlCommand = New SqlCommand(Instr, co.connect())
        cmpStation.ExecuteNonQuery()
        Response.Write("<script>alert('Data saved successfully');</script>")
        txtSNS.Text = " "
        txtSES.Text = " "
        txtPHNOS.Text = " "
        txtSIS.Text = " "
        bindgrid()
    End Sub
    Sub bindLocation()
        Dim str As String
        str = "select Location_id,Location_name from Location_table"
        Dim com As SqlCommand = New SqlCommand(str, co.connect())
        Dim sqlda As SqlDataAdapter = New SqlDataAdapter(com)
        Dim ds As DataTable = New DataTable
        sqlda.Fill(ds)
        DDL2S.Items.Clear()
        DDL2S.Items.Add("--Select--")
        DDL2S.DataTextField = "Location_name"
        DDL2S.DataValueField = "Location_id"
        DDL2S.DataSource = ds
        DDL2S.DataBind()
    End Sub
    Public Sub bindCity()
        Dim str As String
        str = "select City_id,State_id,Dist_id,City_name from City_table "
        Dim comnn As SqlCommand = New SqlCommand(str, co.connect())
        Dim sqldad As SqlDataAdapter = New SqlDataAdapter(comnn)
        Dim ds3 As DataTable = New DataTable
        sqldad.Fill(ds3)
        DDL1S.Items.Clear()
        DDL1S.Items.Add("--Select--")
        DDL1S.DataTextField = "City_name"
        DDL1S.DataValueField = "City_id"
        DDL1S.DataSource = ds3
        DDL1S.DataBind()

    End Sub

    Protected Sub DDL1S_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DDL2S.SelectedIndexChanged
        bindLocation()
    End Sub
    Public Sub bindgrid()

        Dim ap As DataTable = New DataTable
        Dim str As String
        str = "select Station_name,Station_email,Phone_number,Station_in_charge from Station_table"
        Dim cmd As SqlCommand = New SqlCommand(str, co.connect())
        Dim ad As SqlDataAdapter = New SqlDataAdapter(cmd)
        ad.Fill(ap)
        GVS.DataSource = ap
        GVS.DataBind()

    End Sub

    Protected Sub GVS_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles GVS.PageIndexChanging
        GVS.PageIndex = e.NewPageIndex
        Me.bindgrid()
    End Sub
End Class