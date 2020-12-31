$RESOURCEGROUP = "rg-atana-001"
$DATAFACTORYNAME = "adf-at-ana-dev"

# Resources that are valid
New-AzDataFactoryV2LinkedService `
    -Name "LS_ADLS2_AT" `
    -ResourceGroupName $RESOURCEGROUP `
    -DataFactoryName $DATAFACTORYNAME `
    -DefinitionFile $PSScriptRoot\ls_adls2_at.json `
    -Force `
    -ErrorAction Stop

New-AzDataFactoryV2Dataset `
    -Name "DS_ADLS2_BIN" `
    -ResourceGroupName $RESOURCEGROUP `
    -DataFactoryName $DATAFACTORYNAME `
    -DefinitionFile $PSScriptRoot\ds_adls2_bin.json `
    -Force `
    -ErrorAction Stop

New-AzDataFactoryV2Pipeline `
    -Name "PL_MOVE_DATA" `
    -ResourceGroupName $RESOURCEGROUP `
    -DataFactoryName $DATAFACTORYNAME `
    -DefinitionFile $PSScriptRoot\pl_move_data.json `
    -Force `
    -ErrorAction Stop

# Resources that will display a runtime error because of a non existing storage container
New-AzDataFactoryV2LinkedService `
    -Name "LS_ADLS2_AT_B" `
    -ResourceGroupName $RESOURCEGROUP `
    -DataFactoryName $DATAFACTORYNAME `
    -DefinitionFile $PSScriptRoot\ls_adls2_at_b.json `
    -Force `
    -ErrorAction Stop

New-AzDataFactoryV2Dataset `
    -Name "DS_ADLS2_BIN_B" `
    -ResourceGroupName $RESOURCEGROUP `
    -DataFactoryName $DATAFACTORYNAME `
    -DefinitionFile $PSScriptRoot\ds_adls2_bin_b.json `
    -Force `
    -ErrorAction Stop

New-AzDataFactoryV2Pipeline `
    -Name "PL_MOVE_DATA_B" `
    -ResourceGroupName $RESOURCEGROUP `
    -DataFactoryName $DATAFACTORYNAME `
    -DefinitionFile $PSScriptRoot\pl_move_data_b.json `
    -Force `
    -ErrorAction Stop