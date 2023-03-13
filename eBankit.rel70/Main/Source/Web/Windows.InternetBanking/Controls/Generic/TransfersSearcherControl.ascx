<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TransfersSearcherControl.ascx.cs" Inherits="TransfersSearcherControl" %>

<asp:UpdatePanel ID="updPanel" runat="server" UpdateMode="Always">
    <ContentTemplate>
        <it:FlowContainerDetail ID="flwReuseOperations" CssClass="panel panel-detail" Title="Reuse operation" runat="server">
            <div class="well well-large">

                <form class="form-horizontal">
                    <div class="control-group">
                        <label class="control-label" for="ddlClient">N.º Cliente</label>
                        <div class="Controls">
                            <it:DropDownListControl ID="ddlClient" runat="server" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="cbxTransfers">Consultar</label>
                        <div class="Controls">
                            <label class="checkbox" id="cbxTransfers">
                                <input type="checkbox" />Transferências Internas</label>
                            <label class="checkbox">
                                <input type="checkbox" />Transferências Intercancárias</label>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="cbxClient">Tipo de transferência</label>
                        <div class="Controls">
                            <it:DropDownListControl ID="ddlTransferType" runat="server" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="ddlConsultType">Tipo de consulta</label>
                        <div class="Controls">
                            <it:DropDownListControl ID="ddlConsultType" runat="server" />
                        </div>
                    </div>

                    <button type="submit" class="btn col-lg-12">Listar</button>

                </form>
            </div>

        </it:FlowContainerDetail>
    </ContentTemplate>
</asp:UpdatePanel>