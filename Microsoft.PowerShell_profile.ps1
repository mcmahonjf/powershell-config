oh-my-posh init pwsh --config "C:/Users/fmcma/OneDrive/Documents/WindowsPowerShell/config.json" | Invoke-Expression

function gs () {
    git status
}

function gsw ($branch) {
    git switch $branch
}

function ga () {
    git add .
}

function gonvim () {
    cd $env:nvimpath
}

function goprogramming () {
    cd $env:progpath
}

function goto ($name) {
    [Environment]::GetEnvironmentVariable($name, 'user').Value
}

function rename ($name) {
    $Host.UI.RawUI.WindowTitle = $name
}

function admin {
    if ($args.Count -gt 0) {
        $argList = "& '" + $args + "'"
        Start-Process "$psHome\powershell.exe" -Verb runAs -ArgumentList $argList
    } else {
        Start-Process "$psHome\powershell.exe" -Verb runAs
    }
}

function find-file ($name) {
    ls -recurse -filter "*${name}*" -ErrorAction SilentlyContinue | foreach {
        $place_path = $_.directory
        echo "${place_path}\${_}"
    }
}

function grep ($regex, $dir) {
    if ($dir) {
        ls $dir | select-string $regex
        return
    }
    $input | select-string $regex
}

function touch ($file) {
    "" | Out-File $file -Encoding utf8
}

function pkill ($name) {
    ps $name -ErrorAction SilentlyContinue | kill
}

function pgrep ($name) {
    ps $name
}
# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
