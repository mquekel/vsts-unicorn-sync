[CmdletBinding()]
param(
    [Parameter(Mandatory=$True)]
    [string]$ControlPanelUrl,

    [Parameter(Mandatory=$True)]
    [string]$SharedSecret,

    [string]$Configurations
)

Write-Host "Starting Unicorn Sync."
Write-Host "This script is using Unicorn.psm1 from https://github.com/kamsar/Unicorn Copyright (c) 2018 Kam Figy"

$ErrorActionPreference = 'Stop'

$ScriptPath = Split-Path $MyInvocation.MyCommand.Path

Import-Module $ScriptPath\Unicorn.psm1

if($Configurations)
{
    $seperator = [Environment]::NewLine
    $splitOption = [System.StringSplitOptions]::RemoveEmptyEntries

    $config = $Configurations.Split($seperator, $splitOption)
    Sync-Unicorn -ControlPanelUrl "$($ControlPanelUrl)" -SharedSecret "$($SharedSecret)" -Configurations $config
}
else{
    Sync-Unicorn -ControlPanelUrl "$($ControlPanelUrl)" -SharedSecret "$($SharedSecret)"
}