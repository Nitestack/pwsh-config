oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\emodipt-extend.omp.json" | Invoke-Expression

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile))
{
  Import-Module "$ChocolateyProfile"
}

$powershell_dev_path = "$env:USERPROFILE\Documents\Programmierung\projects\powershell"

Import-Module Terminal-Icons
Import-Module -Name $powershell_dev_path\Nvim-Switcher

# Aliases
Set-Alias grep findstr
Set-Alias vim nvim.exe
Set-Alias lvim 'C:\Users\hydra\.local\bin\lvim.ps1'

# Utilities
function which($command)
{
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function Open-PowerShellConfig()
{
  nvim.exe $env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
}
Set-Alias psc Open-PowerShellConfig
