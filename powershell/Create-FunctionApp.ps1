# create app service plan
az appservice plan create --name toli-plan --resource-group behindthebuzzword
# create storage account
az storage account create -n tolisa -g toli-rg -l ukwest --sku Standard_LRS

# create function app
az functionapp create --name toli --resource-group toli-rg --storage-account tolisa --plan toli-plan