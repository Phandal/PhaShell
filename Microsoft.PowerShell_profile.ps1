oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\customtheme.omp.json" | Invoke-Expression
Set-PSReadLineOption -Colors @{ Command = '#ABB2BF' }
