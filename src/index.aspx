<%@ Page Language="C#" %>

<%@ Register assembly="Ext.Net" namespace="Ext.Net" tagprefix="ext" %>

<script runat="server">
    protected void Button1_Click(object sender, DirectEventArgs e)
    {
        
        X.Msg.Notify(new NotificationConfig { 
            Icon  = Icon.Accept,
            Title = "Working",
            Html  = this.TextArea1.Text
        }).Show();
    }


    protected void Button3_DirectClick(object sender, DirectEventArgs e)
    {
        System.Threading.Thread.Sleep(3000);
        X.MessageBox.Alert("提示", "保存按钮被单击").Show();
        
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        this.TextArea1.Text = "12354";

    }
</script>

<!DOCTYPE html>
    
<html>
<head runat="server">
    <title>Ext.NET Example</title>
</head>
<body>
    <ext:ResourceManager ID="ResourceManager1" runat="server" />
    
    <form runat="server">
        <ext:Panel 
            ID="Window1"
            runat="server" 
            Title="Welcome to Ext.NET"
            Height="215"
            Width="350"
            Frame="true"
            Collapsible="true"
            Cls="box"
            BodyPadding="5"
            DefaultButton="0"
            Layout="AnchorLayout"
            DefaultAnchor="100%">
            <Items>
                <ext:TextArea 
                    ID="TextArea1" 
                    runat="server" 
                    EmptyText=">> Enter a Test Message Here <<"
                    FieldLabel="Message" 
                    Height="85" 
                    />
                <ext:TextField ID="TextField1" runat="server" Text="This is a sample !" Enabled="True" AllowBlank="False" />
            </Items>

       
            <Buttons>
    
        <ext:Button ID="Button3" runat="server"  Text="Submit" >
               <DirectEvents>
                 <Click OnEvent="Button3_DirectClick">
                     <EventMask ShowMask="true" Msg="正在处理..."></EventMask>
                </Click>
             </DirectEvents>
        </ext:Button>
 
                <ext:Button 
                    ID="Button1"
                    runat="server" 
                    Text="Submit"
                    Icon="Accept" 
                    OnDirectClick="Button1_Click" 
                    />
            </Buttons>
        </ext:Panel>
        <ext:Panel ID="Panel1" runat="server" Height="300" Title="Title">
            <Items>
            </Items>
        </ext:Panel>
        <ext:FormPanel ID="FormPanel1" runat="server" ButtonAlign="Right" Height="185" Padding="5" Title="Title" Width="300">
            <Items>
                <ext:TextField runat="server" AnchorHorizontal="100%" FieldLabel="Label" />
            </Items>
            <Buttons>
                <ext:Button runat="server" Icon="Disk" Text="Submit" />
            </Buttons>
        </ext:FormPanel>
        <br />
        <br />
    </form>
</body>
</html>