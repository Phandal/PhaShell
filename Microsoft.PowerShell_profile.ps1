oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\customtheme.omp.json" | Invoke-Expression
Set-PSReadLineOption -Colors @{ Command = '#ABB2BF' }

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}