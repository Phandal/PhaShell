oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\customtheme.omp.json" | Invoke-Expression
Set-PSReadLineOption -Colors @{ Command = '#ABB2BF' }

function Git-Branch {
  $branch = (git branch -a | fzf)
  if ($branch) {
      git checkout $branch.Trim()
  }
}

function Git-Status {
  git status
}

function Git-Diff {
  git diff
}

function Git-Message-Commit {
  param ([string]$Message)
  if (!$Message){
    Write-Host "You must include a message"
    return
  }
  git commit -m $Message
}

function Git-Log-File {
  git log
}

New-Alias gb Git-Branch
New-Alias gs Git-Status
New-Alias gd Git-Diff
New-Alias gmc Git-Message-Commit
New-Alias glf Git-Log-File

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
