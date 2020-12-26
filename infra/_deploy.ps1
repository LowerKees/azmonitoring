[CmdletBinding()]
param (
    [Parameter()]
    [PSCustomObject]
    $ResourceGroups = @(
        @{
            "name"                      = "rg-atmon-001";
            "templateFilePath"          = "infra\rg-mon\infra.mon.json";
            "templateParameterFilePath" = "infra\rg-mon\infra.mon.parameters.json";
        },
        @{
            "name"                      = "rg-atana-001";
            "templateFilePath"          = "infra\rg-ana\infra.ana.json";
            "templateParameterFilePath" = "infra\rg-ana\infra.ana.parameters.json"
        }
    )
)

# Connect-AzAccount

$TAG = @{"source" = "Azure Thursday" }
$LOCATION = "westeurope"

foreach ($ResourceGroup in $ResourceGroups) {
    Write-Host "Creating resource group $($ResourceGroup.name)..."
    New-AzResourceGroup `
        -Name $ResourceGroup.name `
        -Location $LOCATION `
        -Tag $Tag `
        -ErrorAction Continue `
        -Force
}

$WORKSPACENAME = "law-mon-001"

Write-Host "Deploying resources to resource group $($ResourceGroups[0].name)..."
New-AzResourceGroupDeployment `
    -Name "Depl_monitor_resources" `
    -ResourceGroupName $ResourceGroups[0].name `
    -Mode Incremental `
    -TemplateParameterFile $ResourceGroups[0].templateParameterFilePath `
    -TemplateFile $ResourceGroups[0].templateFilePath `
    -workspaceName $WORKSPACENAME

Write-Host "Deploying resources to resource group $($ResourceGroups[1].name)..."
New-AzResourceGroupDeployment `
    -Name "Depl_monitor_resources" `
    -ResourceGroupName $ResourceGroups[1].name `
    -Mode Incremental `
    -TemplateParameterFile $ResourceGroups[1].templateParameterFilePath `
    -TemplateFile $ResourceGroups[1].templateFilePath `
    -workspaceName $WORKSPACENAME `
    -workspaceResourceGroupName $ResourceGroups[0].name


