param (
    [CmdletBinding()]
    [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName = $true)] [string]$Version,
    [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName = $true)] [string]$ProjectAlias,
    [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName = $true)] [string]$DatabaseServer,
    [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName = $true)] [string]$DatabasePrefix,
    [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName = $true)] [string]$DatabaseUser,
    [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName = $true)] [string]$DatabasePassword,
    [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName = $true)] [string]$SSISDBPassword,
    [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName = $true)] [string]$ProjectFilePath
)

$ProjectName = "eBankit.Analytics"
$FolderName = "eBankit.Analytics." + $ProjectAlias
$EnvironmentName = "DEV"

# set version by default
if(-not $Version)
{
    $Version = "2019"
}

# set project file path default
if(-not $ProjectFilePath)
{
    $ProjectFilePath = ".\eBankit.Analytics_SQLServer" + $Version + ".ispac"
}

# Load the IntegrationServices Assembly  
[Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.Management.IntegrationServices")  

# Store the IntegrationServices Assembly namespace to avoid typing it every time  
$ISNamespace = "Microsoft.SqlServer.Management.IntegrationServices"  

Write-Host ""
Write-Host "Connecting to server..."  

# Create a connection to the server  
$sqlConnectionString = "Data Source=" + $DatabaseServer + ";Initial Catalog=master;Integrated Security=SSPI;"  
$sqlConnection = New-Object System.Data.SqlClient.SqlConnection $sqlConnectionString  

# Create the Integration Services object  
$integrationServices = New-Object $ISNamespace".IntegrationServices" $sqlConnection  

$catalog = $integrationServices.Catalogs["SSISDB"]

if (-not $catalog)
{
    Write-Host "Creating a new SSIS Catalog..."  

    # Provision a new SSIS Catalog  
    $catalog = New-Object $ISNamespace".Catalog" ($integrationServices, "SSISDB", $SSISDBPassword)  
    $catalog.Create()
}
else
{
    Write-Host "SSIS Catalog already exists."
}

# Check catalog folder
$folder = $catalog.Folders[$FolderName]

if (-not $folder)
{
    Write-Host "Creating Folder" $FolderName "..."

    # Create a new folder
    $folder = New-Object $ISNamespace".CatalogFolder" ($catalog, $FolderName, "Folder description")
    $folder.Create()
}
else
{
    Write-Host "Folder" $FolderName "already exists."
}

# Check environment
$environment = $folder.Environments[$EnvironmentName]

if (-not $environment)
{
    Write-Host "Creating environment..."
 
    $environment = New-Object $ISNamespace".EnvironmentInfo" ($folder, $EnvironmentName, "Description")
    $environment.Create()

    Write-Host "Adding server variables ..."
 
    # Adding variable to our environment
    # Constructor args: variable name, type, default value, sensitivity, description
    $environment.Variables.Add("ADODWEbankitAnalyticsDataWarehouse_ConnectionString", [System.TypeCode]::String, "Data Source=" + $DatabaseServer + ";User ID=" + $DatabaseUser + ";Password=" + $DatabasePassword + ";Initial Catalog=" + $DatabasePrefix + "_EbankitAnalyticsDataWarehouse;Application Name=SSIS-eBankit.Analytics-{E4EF2583-1638-445D-AA4A-4B6CF9E84826};", $false, "")
    $environment.Variables.Add("ADOProdEbankitSecurityCenter_ConnectionString",[System.TypeCode]::String, "Data Source=" + $DatabaseServer + ";User ID=" + $DatabaseUser + ";Password=" + $DatabasePassword + ";Initial Catalog=" + $DatabasePrefix + "_EbankitSecurityCenter;Application Name=SSIS-eBankit.Analytics-{7955EE69-2329-4836-B4A4-0C2470DD11FD};", $false,"")
    $environment.Variables.Add("DWEbankitAnalyticsDataWarehouse_ConnectionString", [System.TypeCode]::String, "Data Source=" + $DatabaseServer + ";User ID=" + $DatabaseUser + ";Password=" + $DatabasePassword + ";Initial Catalog=" + $DatabasePrefix + "_EbankitAnalyticsDataWarehouse;Provider=SQLNCLI11.1;Auto Translate=False;", $false, "")
    $environment.Variables.Add("GenericProdEbankitDB_ConnectionString", [System.TypeCode]::String, "Data Source=" + $DatabaseServer + ";User ID=" + $DatabaseUser + ";Password=" + $DatabasePassword + ";Initial Catalog=" + $DatabasePrefix + "_EbankitAnalyticsStaging;Provider=SQLNCLI11.1;Persist Security Info=True;Auto Translate=False;", $false, "")
    $environment.Variables.Add("ProdEbankitAlerts_ConnectionString", [System.TypeCode]::String, "Data Source=" + $DatabaseServer + ";User ID=" + $DatabaseUser + ";Password=" + $DatabasePassword + ";Initial Catalog=" + $DatabasePrefix + "_EbankitAlerts;Provider=SQLNCLI11.1;Auto Translate=False;", $false, "")
    $environment.Variables.Add("ProdEbankitCampaigns_ConnectionString", [System.TypeCode]::String, "Data Source=" + $DatabaseServer + ";User ID=" + $DatabaseUser + ";Password=" + $DatabasePassword + ";Initial Catalog=" + $DatabasePrefix + "_EbankitCampaigns;Provider=SQLNCLI11.1;Auto Translate=False;", $false, "")
    $environment.Variables.Add("ProdEbankitContactDetail_ConnectionString", [System.TypeCode]::String, "Data Source=" + $DatabaseServer + ";User ID=" + $DatabaseUser + ";Password=" + $DatabasePassword + ";Initial Catalog=" + $DatabasePrefix + "_EbankitContactDetail;Provider=SQLNCLI11.1;Auto Translate=False;", $false, "")
    $environment.Variables.Add("ProdEbankitMembership_ConnectionString", [System.TypeCode]::String, "Data Source=" + $DatabaseServer + ";User ID=" + $DatabaseUser + ";Password=" + $DatabasePassword + ";Initial Catalog=" + $DatabasePrefix + "_EbankitMembership;Provider=SQLNCLI11.1;Auto Translate=False;", $false, "")
    $environment.Variables.Add("ProdEbankitMonitoring_ConnectionString", [System.TypeCode]::String, "Data Source=" + $DatabaseServer + ";User ID=" + $DatabaseUser + ";Password=" + $DatabasePassword + ";Initial Catalog=" + $DatabasePrefix + "_EbankitMonitoring;Provider=SQLNCLI11.1;Auto Translate=False;", $false, "")
    $environment.Variables.Add("ProdEbankitMPS_ConnectionString", [System.TypeCode]::String, "Data Source=" + $DatabaseServer + ";User ID=" + $DatabaseUser + ";Password=" + $DatabasePassword + ";Initial Catalog=" + $DatabasePrefix + "_EbankitMPS;Provider=SQLNCLI11.1;Auto Translate=False;", $false, "")
    $environment.Variables.Add("ProdEbankitSecurityCenter_ConnectionString", [System.TypeCode]::String, "Data Source=" + $DatabaseServer + ";User ID=" + $DatabaseUser + ";Password=" + $DatabasePassword + ";Initial Catalog=" + $DatabasePrefix + "_EbankitSecurityCenter;Provider=SQLNCLI11.1;Auto Translate=False;", $false, "")
    $environment.Variables.Add("Runtime_Environment", [System.TypeCode]::String, "DEV", $false, "")
    $environment.Variables.Add("StagingEbankitAnalyticsStaging_ConnectionString", [System.TypeCode]::String, "Data Source=" + $DatabaseServer + ";User ID=" + $DatabaseUser + ";Password=" + $DatabasePassword + ";Initial Catalog=" + $DatabasePrefix + "_EbankitAnalyticsStaging;Provider=SQLNCLI11.1;Auto Translate=False;", $false, "")
    $environment.Alter()
}
else
{
    Write-Host "Environment" $EnvironmentName "already exists."
}

# Check project deploy
$project = $folder.Projects[$ProjectName]

if (-not $project)
{
    Write-Host "Deploying" $ProjectName "project..."
 
    # Read the project file, and deploy it to the folder
    [byte[]] $projectFile = [System.IO.File]::ReadAllBytes($ProjectFilePath)
    $folder.DeployProject($ProjectName, $projectFile)

    Write-Host "Associate" $EnvironmentName "environment to project ..."

    $project = $folder.Projects[$ProjectName]
    $project.References.Add($EnvironmentName, $folder.Name)
    $project.Alter()

    Write-Host "Setting project parameters..."

    $project.Parameters["ADODWEbankitAnalyticsDataWarehouse_ConnectionString"].Set("Referenced", "ADODWEbankitAnalyticsDataWarehouse_ConnectionString")            
    $project.Parameters["ADOProdEbankitSecurityCenter_ConnectionString"].Set("Referenced", "ADOProdEbankitSecurityCenter_ConnectionString")
    $project.Parameters["DWEbankitAnalyticsDataWarehouse_ConnectionString"].Set("Referenced", "DWEbankitAnalyticsDataWarehouse_ConnectionString")
    $project.Parameters["GenericProdEbankitDB_ConnectionString"].Set("Referenced", "GenericProdEbankitDB_ConnectionString")
    $project.Parameters["ProdEbankitAlerts_ConnectionString"].Set("Referenced", "ProdEbankitAlerts_ConnectionString")
    $project.Parameters["ProdEbankitCampaigns_ConnectionString"].Set("Referenced", "ProdEbankitCampaigns_ConnectionString")
    $project.Parameters["ProdEbankitContactDetail_ConnectionString"].Set("Referenced", "ProdEbankitContactDetail_ConnectionString")
    $project.Parameters["ProdEbankitMembership_ConnectionString"].Set("Referenced", "ProdEbankitMembership_ConnectionString")
    $project.Parameters["ProdEbankitMonitoring_ConnectionString"].Set("Referenced", "ProdEbankitMonitoring_ConnectionString")
    $project.Parameters["ProdEbankitMPS_ConnectionString"].Set("Referenced", "ProdEbankitMPS_ConnectionString")
    $project.Parameters["ProdEbankitSecurityCenter_ConnectionString"].Set("Referenced", "ProdEbankitSecurityCenter_ConnectionString")
    $project.Parameters["Runtime_Environment"].Set("Referenced", "Runtime_Environment")
    $project.Parameters["StagingEbankitAnalyticsStaging_ConnectionString"].Set("Referenced", "StagingEbankitAnalyticsStaging_ConnectionString")

    $project.Alter()
}
else
{
    Write-Host "Project" $ProjectName "already deployed."
}
