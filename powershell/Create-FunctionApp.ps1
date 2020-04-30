$functionAppName = "behindthebuzzword-fa"
$location = "ukwest"
$resourceGroup = "behindthebuzzword"
$servicePlan = "behindthebuzzword-plan"
$storageAccount = "behindthebuzzwordsa"

Write-Host create resource group
#az group delete --name $resourceGroup
#az group create --location $location --name $resourceGroup 

Write-Host create app service plan
az appservice plan create --name $servicePlan --resource-group $resourceGroup --location $location

Write-Host create storage account
az storage account create --name $storageAccount --resource-group $resourceGroup --location $location --sku Standard_LRS

Write-Host create function app
az functionapp create --name $functionAppName --resource-group $resourceGroup --storage-account $storageAccount --plan $servicePlan

# create function
# func init toli-fa --dotnet
# func new --template "HTTP trigger" --name FunctionToli --language C#
# func start --build 