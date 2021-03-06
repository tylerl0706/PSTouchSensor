$Script:DEFAULT_PIN = 7

<#
.SYNOPSIS
Gets the value of the Touch Sensor

.DESCRIPTION
Gets the value of the Touch Sensor

.PARAMETER Pin
The GPIO pin to read from

.EXAMPLE
Get-PSTouchSensorValue

.NOTES
You must be running PowerShell with Sudo
#>
function Get-PSTouchSensor {
    [CmdletBinding()]
    param(
        [int]$Pin = $Script:DEFAULT_PIN
    )

    if (!$env:SUDO_UID) {
        throw "You must be running PowerShell with 'sudo' to use this module."
    }

    @{
        Result = (Get-GpioPin -Id $Pin).Value -eq 'High'
    }
}

<#
.SYNOPSIS
Sets the default GPIO pin on the Raspberry Pi used to read from

.DESCRIPTION
Sets the default GPIO pin on the Raspberry Pi used to read from

.PARAMETER Pin
The Gpio pin to read from

.EXAMPLE
Set-PSTouchSensorDefaultPin -Pin 8

#>
function Set-PSTouchSensorDefaultPin {
    [CmdletBinding()]
    param (
        [int]$Pin = 7
    )

    $Script:DEFAULT_PIN = $Pin
}
