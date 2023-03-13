<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SMSSimulator.aspx.cs" Inherits="WebserviceSimulation.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div>  
      
         <asp:GridView ID="GridView1" DataSourceID="SqlDataSource1" runat="server" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
      SelectCommand="SELECT [id],[data],[smsTo],[message] FROM [dbo].[SMSSimulator] where data > getdate()-1 order by id desc"
      ConnectionString="<%$ ConnectionStrings:WebserviceSimulationConnectionString %>" />
    </asp:SqlDataSource>  
      
    </div> 
    </div>
    </form>
</body>
</html>
