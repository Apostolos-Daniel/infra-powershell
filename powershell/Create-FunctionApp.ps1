
# temp: remove this

# create app service plan
az appservice plan create --name toli-plan --resource-group toli-rg
# create storage account
az storage account create -n tolisa -g toli-rg -l ukwest --sku Standard_LRS

# create function app
$output = az functionapp create --name toli --resource-group toli-rg --storage-account tolisa --plan toli-plan --output json | ConvertFrom-Json

$result = $output.properties

Write-Host what we get: $result

# create function
# func init toli-fa --dotnet
# func new --template "HTTP trigger" --name FunctionToli --language C#
# func start --build