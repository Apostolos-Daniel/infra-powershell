$resourceGroup = "behindthebuzzword"
# create app service plan
az appservice plan create --name toli-plan --resource-group $resourceGroup
# create storage account
az storage account create -n tolisa -g $resourceGroup -l ukwest --sku Standard_LRS

# create function app
az functionapp create --name toli --resource-group $resourceGroup --storage-account tolisa --plan toli-plan