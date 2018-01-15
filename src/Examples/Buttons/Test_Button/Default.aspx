<%@ Page Language="C#" %>

<script runat="server">
   
 
    protected void btnOK_DirectClick(object sender, DirectEventArgs e)
    {
        this.txtCompany.Text = "test";
    }
    
    protected void btnCancel_DirectClick(object sender, DirectEventArgs e)
    {
        this.txtCompany.Text = "取消";
    }
</script>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>FormPanel - Ext.NET Examples</title>
    <link href="/resources/css/examples.css" rel="stylesheet" />

    <script>
      
    </script>
</head>
<body>
    <form runat="server">
        <ext:ResourceManager runat="server" />

        <ext:FormPanel
            runat="server"
            Title="Company data"
            Width="1000"
            BodyPadding="5"
            Layout="ColumnLayout">

            <FieldDefaults LabelAlign="Left" MsgTarget="Side" />

            <Items>
                

                <ext:FieldSet
                    runat="server"
                    ColumnWidth="0.4"
                    Title="Company details"
                    MarginSpec="0 0 0 10"
                    ButtonAlign="Right">
                    <Defaults>
                        <ext:Parameter Name="LabelWidth" Value="115" />
                    </Defaults>
                    <Items>
                        <ext:TextField Name="company" runat="server" FieldLabel="Name" ID="txtCompany" />
                        <ext:TextField Name="price" runat="server" FieldLabel="Price" />
                        <ext:TextField Name="pctChange" runat="server" FieldLabel="Change (%)" />
                        <ext:DateField Name="lastChange" runat="server" FieldLabel="Last Updated" />
                        <ext:RadioGroup runat="server" FieldLabel="Rating (read-only)" ColumnsNumber="3" AutomaticGrouping="false">
                            <Items>
                                <ext:Radio runat="server" Name="rating" InputValue="0" BoxLabel="A" ReadOnly="true" />
                                <ext:Radio runat="server" Name="rating" InputValue="1" BoxLabel="B" ReadOnly="true" />
                                <ext:Radio runat="server" Name="rating" InputValue="2" BoxLabel="C" ReadOnly="true" />
                            </Items>
                        </ext:RadioGroup>
                    </Items>
                </ext:FieldSet>
            </Items>
            <Buttons>
                 <ext:Button id="btnOK" runat="server" Text="Save To Grid" OnDirectClick="btnOK_DirectClick"/>
                <ext:Button id="btnCancel" runat="server" Text="取消" OnDirectClick="btnCancel_DirectClick"/>
                <ext:Button runat="server" Text="Reset Fields">
                    <Listeners>
                        <Click Handler="this.up('form').getForm().reset();" />
                    </Listeners>
                </ext:Button>
                <ext:Button runat="server" Text="Get Values...">
                    <Menu>
                        <ext:Menu runat="server">
                            <Items>
                                <ext:MenuItem runat="server" Text="Object">
                                    <Listeners>
                                        <Click Handler="alert(Ext.encode(this.up('form').getForm().getValues()));" />
                                    </Listeners>
                                </ext:MenuItem>
                                <ext:MenuItem runat="server" Text="String">
                                    <Listeners>
                                        <Click Handler="alert(this.up('form').getForm().getValues(true));" />
                                    </Listeners>
                                </ext:MenuItem>
                            </Items>
                        </ext:Menu>
                    </Menu>
                </ext:Button>
            </Buttons>
        </ext:FormPanel>
      
    </form>

</body>
</html>