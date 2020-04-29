# This updates pester not always necessary but worth noting
#Install-Module -Name Pester -Force -SkipPublisherCheck

Import-Module Pester

#Invoke-Pester -Script .\Create-FunctionApp.test.ps1 -OutputFile .\Test-Pester.XML -OutputFormat NUnitXML

# Extract of LogicApp.Tests.with.CLI.ps1
Describe "Function App Deployment Tests" {
    # Init
    BeforeAll {
        #az login --service-principal -u $Username -p $Password -t $TenantId
    }

    # Teardown
    AfterAll {
    }

    Context "When Function App created" {
             $state = (az functionapp show --name toli --resource-group toli-rg --output json --query "state" | ConvertFrom-Json).Trim()

        $expected = "Running"
        It "Should be running successfully" {
            $state | Should -Be $expected
        }

        $name = (az functionapp show --name toli --resource-group toli-rg --output json --query "name" | ConvertFrom-Json).Trim()
        It "Should have name of" {
            $expected = "toli"

            $name | Should -Be $expected
        }
    }
}