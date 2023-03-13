function logoutUnbluConnection() {
    if (logoutUnblu) {
        logoutUnblu();
    }
}

function closeIntegrations() {
    logoutUnbluConnection();
}