<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TabSelectorControl.ascx.cs" Inherits="TabSelectorControl" %>

<div class="tabSelectorBackground" runat="server" id="SavingControl" visible="false">
    <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10 col-lg-8 col-max fullWidth">
        <section>
            <div class="col-lg-12 col-left noprint clearPadding">
                <ul class="width340">
                    <li id="liTabSavingDetail" runat="server">
                        <asp:LinkButton href="javascript:void(0);" id="tabSavingDetail" class="tabDetail" ResourceKey="SavingDetail" runat="server"></asp:LinkButton>
                    </li>
                    <li id="liTabSavingStatements" runat="server">
                        <asp:LinkButton href="javascript:void(0);" id="tabSavingMovements" class="tabMovements" ResourceKey="SavingMovements" runat="server"></asp:LinkButton>
                    </li>
                    <li id="liTabSavingOperations" runat="server">
                        <asp:LinkButton href="javascript:void(0);" id="tabSavingOperacoesDisponiveis" class="tabOperacoesDisponiveis" ResourceKey="SavingOperacoesDisponiveis" runat="server"></asp:LinkButton>
                    </li>
                </ul>
            </div>
        </section>
    </div>
</div>

<div class="tabSelectorBackground" runat="server" id="AccountControl" visible="false">
    <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10 col-lg-8 col-max fullWidth">
        <section>
            <div class="col-lg-12 col-left noprint clearPadding paddingTop5 paddingBottom5">
                <ul>
                    <li id="liDetail" runat="server">
                        <asp:LinkButton href="javascript:void(0);" ID="tabDetail" class="tabDetail" ResourceKey="Detail" runat="server"></asp:LinkButton>
                    </li>
                    <li id="liStatements" runat="server">
                        <asp:LinkButton href="javascript:void(0);" ID="tabMovements" class="tabMovements" ResourceKey="Movements" runat="server"></asp:LinkButton>
                    </li>
                    <li id="liOperations" runat="server">                    
                        <asp:LinkButton href="javascript:void(0);" ID="tabOperacoesDisponiveis" class="tabOperacoesDisponiveis" ResourceKey="OperacoesDisponiveis" runat="server"></asp:LinkButton>
                    </li>
                    <li id="liFavorits" runat="server">                    
                        <asp:LinkButton href="javascript:void(0);" ID="tabOperacoesFavoritas" class="tabOperacoesFavoritas" ResourceKey="OperacoesFavoritas" runat="server"></asp:LinkButton>
                    </li>
                </ul>
            </div>
        </section>
    </div>
</div>

<div class="tabSelectorBackground" runat="server" id="ExternalAccountControl" visible="false">
    <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10 col-lg-8 col-max fullWidth">
        <section>
            <div class="col-lg-12 col-left noprint clearPadding paddingTop5 paddingBottom5">
                <ul>
                    <li id="liExternalDetail" runat="server">
                        <asp:LinkButton href="javascript:void(0);" ID="tabExternalDetail" class="tabDetail" ResourceKey="ExternalDetail" runat="server"></asp:LinkButton>
                    </li>
                    <li id="liExternalStatements" runat="server">
                        <asp:LinkButton href="javascript:void(0);" ID="tabExternalMovements" class="tabMovements" ResourceKey="ExternalMovements" runat="server"></asp:LinkButton>
                    </li>
                    <li id="liExternalOperations" runat="server">                    
                        <asp:LinkButton href="javascript:void(0);" ID="tabExternalOperacoesDisponiveis" class="tabOperacoesDisponiveis" ResourceKey="ExternalOperacoesDisponiveis" runat="server"></asp:LinkButton>
                    </li>
                    <li id="liExternalFavorits" runat="server">                    
                        <asp:LinkButton href="javascript:void(0);" ID="tabExternalOperacoesFavoritas" class="tabOperacoesFavoritas" ResourceKey="ExternalOperacoesFavoritas" runat="server"></asp:LinkButton>
                    </li>
                </ul>
            </div>
        </section>
    </div>
</div>

<div class="tabSelectorBackground" runat="server" id="CardControl" visible="false">
    <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10 col-lg-8 col-max fullWidth">
        <section>
            <div class="col-lg-12 col-left noprint clearPadding paddingTop5 paddingBottom5">
                <ul class="width340">
                    <li id="liCardDetail" runat="server">                    
                        <asp:LinkButton href="javascript:void(0);" ID="tabCardDetail" class="tabDetail" ResourceKey="CardDetail" runat="server"></asp:LinkButton>
                    </li>
                    <li id="liCardStatements" runat="server">                    
                        <asp:LinkButton href="javascript:void(0);" ID="tabCardMovements" class="tabMovements" ResourceKey="CardMovements" runat="server"></asp:LinkButton>
                    </li>
                    <li id="liCardOperations" runat="server">
                        <asp:LinkButton href="javascript:void(0);" ID="tabCardOperacoesDisponiveis" class="tabOperacoesDisponiveis" ResourceKey="CardOperacoesDisponiveis" runat="server"></asp:LinkButton>
                    </li>
                </ul>
            </div>
        </section>
    </div>
</div>

<div class="tabSelectorBackground" runat="server" id="CardAccountControl" visible="false">
    <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10 col-lg-8 col-max fullWidth">
        <section>
            <div class="col-lg-12 col-left noprint clearPadding paddingTop5 paddingBottom5">
                <ul class="width340">
                    <li id="liCardAccountDetail" runat="server">                    
                        <asp:LinkButton href="javascript:void(0);" ID="tabCardAccountDetail" class="tabDetail" ResourceKey="CardAccountDetail" runat="server"></asp:LinkButton>
                    </li>
                    <li id="liCardAccountStatements" runat="server">
                        <asp:LinkButton href="javascript:void(0);" ID="tabCardAccountMovements" class="tabMovements" ResourceKey="CardAccountMovements" runat="server"></asp:LinkButton>
                    </li>
                    <li id="liCardAccountOperations" runat="server">
                        <asp:LinkButton href="javascript:void(0);" ID="tabCardAccountOperacoesDisponiveis" class="tabOperacoesDisponiveis" ResourceKey="CardAccountOperacoesDisponiveis" runat="server"></asp:LinkButton>
                    </li>
                </ul>
            </div>
        </section>
    </div>
</div>

<div class="tabSelectorBackground" id="CreditAccountsControl" runat="server" visible="false">
    <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10 col-lg-8 col-max fullWidth">
        <section>
            <div class="col-lg-12 col-left noprint clearPadding paddingTop5 paddingBottom5">
                <ul>
                    <li id="liCreditAccountDetail" runat="server">
                        <asp:LinkButton href="javascript:void(0);" id="tabCreditAccountDetail" class="tabDetail" ResourceKey="CreditAccountDetail" runat="server"></asp:LinkButton>
                    </li>
                    <li id="liCreditAccountStatements" runat="server">
                        <asp:LinkButton href="javascript:void(0);" id="tabCreditAccountMovements" class="tabMovements" ResourceKey="CreditAccountMovements" runat="server"></asp:LinkButton>
                    </li>
                    <li id="liCreditAccountPlan" runat="server">
                        <asp:LinkButton href="javascript:void(0);" id="tabFinancialPlan" class="tabFinancialPlan" ResourceKey="FinancialPlan" runat="server"></asp:LinkButton>
                    </li>
                    <li id="liCreditAccountOperations" runat="server">
                        <asp:LinkButton href="javascript:void(0);" id="tabCreditAccountOperacoesDisponiveis" class="tabOperacoesDisponiveis" ResourceKey="CreditAccountOperacoesDisponiveis" runat="server"></asp:LinkButton>
                    </li>
                </ul>
            </div>
        </section>
    </div>
</div>

<div class="tabSelectorBackground" id="CollateralizedAccountControl" runat="server" visible="false">
    <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10 col-lg-8 col-max fullWidth">
        <section>
            <div class="col-lg-12 col-left noprint clearPadding paddingTop5 paddingBottom5">
                <ul>
                    <li id="liCollateralizedDetail" runat="server">
                        <asp:LinkButton href="javascript:void(0);" id="tabCollateralizedDetail" class="tabDetail" ResourceKey="CollateralizedDetail" runat="server"></asp:LinkButton>
                    </li>
                    <li id="liCollateralizedStatements" runat="server">
                        <asp:LinkButton href="javascript:void(0);" id="tabCollateralizedMovs" class="tabMovements" ResourceKey="CollateralizedMovs" runat="server"></asp:LinkButton>
                    </li>
                    <li id="liCollaterilizedOperations" runat="server">
                        <asp:LinkButton href="javascript:void(0);" id="tabCollateralizedOps" class="tabOperacoesDisponiveis" ResourceKey="CollateralizedOps" runat="server"></asp:LinkButton>
                    </li>
                </ul>
            </div>
        </section>
    </div>
</div>
<div class="clearBoth"></div>

<script type="text/javascript">
    GoToTransaction = function (transaction, number) {
        eBankit.Presentation.SetBlockPageCommon();
        $('body').block();
        var href = '/Security/Transactions/Transactions.aspx?trxid=' + transaction;
        if (number != '') {
            href += '&acc=' + number;
        }
        eBankit.document.location.href = href;
    }

    GoToCardTransaction = function (transaction, number) {
        eBankit.Presentation.SetBlockPageCommon();
        $('body').block();
        var href = '/Security/Transactions/Transactions.aspx?trxid=' + transaction;
        if (number != '') {
            href += '&card=' + number;
        }
        eBankit.document.location.href = href;
    }
</script>