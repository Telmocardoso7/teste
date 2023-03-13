<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SchedulerControl.ascx.cs" Inherits="SchedulerControl" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<asp:UpdatePanel ID="updPanelSchedule" runat="server" UpdateMode="Always">
    <ContentTemplate>
        <it:FlowInnerContainer ID="flwDataSchedule" Title="<%$FrontEndResources:SchedulerControl,TitleDataContainer %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
            <div>
                <div style="background-color: transparent; margin-top: 10px;">
                    <div id="collapseEbankitSchedules" class="panel-collapse schedule" runat="server">
                        <div class="panel-body row" style="padding-top: 0px; padding-bottom: 0px;">
                            <div id="divSchedulePeriodicity" runat="server">
                                <it:FormRadioList_v3 ID="frlScheduleType" runat="server" CssClass="big-radioButton" LabelText="<%$FrontEndResources:SchedulerControl,ScheduleType%>" RepeatDirection="Horizontal" HideLabel="false" />
                                <div id="divScheduleEventual" runat="server">
                                    <it:DatePickerTextBoxMetroControl_v3 ID="dtSingleScheduleDate" IsRequired="true" runat="server" Width="110px" ValidationMinDateMessage="<%$FrontEndResources:SchedulerControl,dtScheduleDatePermValidationMinDateMessage %>" Label="<%$FrontEndResources:SchedulerControl,OperationDate%>" CssClass="field field_v2 metro" />
                                    <div class="clearBoth"></div>
                                </div>
                                <div id="divSchedulePermanent" runat="server" class="hidden-panel">
                                    <div class="field field_v2 metro break">
                                        <it:DropDownListControl_v2 ID="ddlPeriod" IsRequired="True" runat="server" Label="<%$FrontEndResources:SchedulerControl,Frequency%>" />
                                    </div>
                                    <div class="clearBoth"></div>
                                    <it:DatePickerTextBoxMetroControl_v3 ID="dtPermanentScheduleStartDate" IsRequired="true" runat="server" Width="110px" ValidationMinDateMessage="<%$FrontEndResources:SchedulerControl,dtScheduleDatePermValidationMinDateMessage %>" Label="<%$FrontEndResources:SchedulerControl,StartAt%>" CssClass="field field_v2 metro" />
                                    <div class="field field_v2 metro break schedule-type">
                                        <it:DropDownListControl_v2 ID="ddlEndSchedule" IsRequired="True" runat="server" AutoPostBack="false" Label="<%$FrontEndResources:SchedulerControl,EndSchedule%>" />
                                        <div class="schedule-type-details">
                                            <div id="divScheduleEndDate" class="schedule-field">
                                                <it:DatePickerTextBoxMetroControl_v3 ID="dtPermanentScheduleEndDate" ShowLabel="false" IsRequired="true" runat="server" Width="110px" ValidationMinDateMessage="<%$FrontEndResources:SchedulerControl,dtScheduleDatePermValidationMinDateMessage %>" CssClass="field field_v2 metro" Label="<%$FrontEndResources:SchedulerControl,Date%>" />
                                            </div>
                                            <div id="divScheduleSpecific" class="schedule-field schedule-field-info">
                                                <it:TextBoxControl_v2 ID="txtScheduleSpecificNumber" ShowLabel="false" IsRequired="true" InfoText="<%$FrontEndResources:SchedulerControl,SchedulesTimesInfo%>" runat="server" Label="<%$FrontEndResources:SchedulerControl,SchedulesTimesInfo%>" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearBoth"></div>
                                </div>
                            </div>
                        </div>
                        <div class="clearBoth"></div>
                    </div>
                </div>
            </div>
        </it:FlowInnerContainer>
    </ContentTemplate>
</asp:UpdatePanel>
<asp:HiddenField ID="hdnIsScheduleActive" runat="server" />

<link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("SchedulerControl.css".ResolveCssUrl("components"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />

