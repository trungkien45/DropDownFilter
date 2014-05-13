<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DropDownFilter.ascx.cs" Inherits="WebApplication5.Control.Common.DropDownFilter" %>
<script src="../../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        var $txt = $('#<%=TextBox1.ClientID %>');
        var $ddl = $('#<%=DropDownList1.ClientID%>');
        var $items = $('#<%=DropDownList1.ClientID %> option');
        $txt.keyup(function () {
            <%=this.ClientID %>searchDDL($txt.val()); 
        });
        $ddl.change(function(){
            var criteria_id =  $(':selected',this).text();
            $txt.val(criteria_id);
        });
        function <%=this.ClientID%>searchDDL(item){
            $ddl.empty();
            var exp= new RegExp(item,"i");
            var arr= $.grep($items,function(n){
                return exp.test($(n).text());
            });
            if (arr.length > 0) {
                //countItemsFound(arr.length);
                $.each(arr, function() {
                    $ddl.append(this);
                    $ddl.get(0).selectedIndex = 0;
                });
            }
            else {
                //countItemsFound(arr.length);
                $ddl.append("<option>No Items Found</option>");
            }
        }
    });
</script>
<div style="float:left">
<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ControlToValidate="DropDownList1"
    ErrorMessage="">*</asp:RequiredFieldValidator>
<br />
<asp:DropDownList ID="DropDownList1" runat="server" 
   Width="125px" ondatabound="DropDownList1_DataBound">
</asp:DropDownList>
</div>
