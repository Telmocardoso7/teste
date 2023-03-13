eBankit.Presentation.Exchange = {}

eBankit.Presentation.Exchange.SelectCurrency = function (selectedCurrency, selectedCurrencyName, listNumber) {
    var currencyListId;
    var pSelectCurrencyNameId;
    if (listNumber == 0) {
        currencyListId = "ulFirstCurrenciesList";
        pSelectCurrencyNameId = pFirstSelectedCurrencyNameId;
    }
    else {
        currencyListId = "ulSecondCurrenciesList";
        pSelectCurrencyNameId = pSecondSelectedCurrencyNameId;
    }

    var hiddenItems = $("#" + currencyListId + " li:hidden");
    hiddenItems.show();

    var selected = $("#" + selectedCurrency.id);
    selected.hide();

    pSelectCurrencyNameId.html(selectedCurrencyName);
}