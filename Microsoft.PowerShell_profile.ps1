set-location e:
set-alias touch new-item
function Invoke-Reboot
{
    &"$env:SystemRoot\System32\shutdown.exe" -r
}
function Invoke-Standby
{
    &"$env:SystemRoot\System32\rundll32.exe" powrprof.dll,SetSuspendState Standby
}
Set-Alias csleep Invoke-Standby

set-alias np    C:\Windows\System32\notepad.exe
set-alias subl "${env:ProgramFiles}\Sublime Text 3\subl.exe"
set-alias edit "${env:ProgramFiles}\Sublime Text 3\subl.exe"
function cf {
    & ${env:AppData}'\Microsoft\Windows\Start Menu\Programs\CodeFlow\CodeFlow 2010.appref-ms'
}
function odd {
    & ${env:ProgramFiles(x86)}\Odd\Odd.exe -git
}

function .. { cd .. }
function ... { cd ..\.. }
function .... { cd ..\..\.. }
function ..... { cd ..\..\..\.. }
function ..... { cd ..\..\..\..\.. }

function st { & git status }
function clean { git clean -xdf }
function add { git add -p }
function addall { git add -A }
function pull { git pull }
function br { git branch }
function go { git checkout $args }
function unstage { git reset HEAD }
function commit { git commit -m $args }
function log { git log --pretty=format:"%h - <%an> %s (%cr)" --date=relative -10 }
function mylog { git log --pretty=format:"%h - <%an> %s (%cr)" --date=relative -10 --author=$env:USERNAME }
function stash { git stash save }
function unstash { git stash pop }
function stashes { git stash list }
function pick { git cherry-pick }
function lastchange { git whatchanged -m -n 1 -p }
function changedfiles { git diff-tree --no-commit-id --name-only -r }
function addcontinue { git add -A ; git rebase --continue }
function whichbranch { git branch --contains }
function amend { git commit --amend }
function fetchrebase { git fetch ; git rebase origin/master }
function fetch { git fetch }
function findfile { dir /s /b $args }
function findproc { tasklist /v | findstr /pins $args }
function kill { taskkill /f /pid $args }

function runtests {
    $branch = git rev-parse --abbrev-ref HEAD
    $lastcommit = git log --format="%H" -n 1

    git push -u -f origin $branch

    & "C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\IDE\TfsBuild.exe" start /collection:http://vstfrd:8080/Azure /buildDefinition:"One\PowerApps private" /getOption:Custom /customGetVersion:"LG:(no branch):$lastcommit" /queue
}

function prompt {
    $promptString = "" + $(Get-Location) + ">";
    Write-Host $promptString -NoNewline -ForegroundColor DarkGreen;
    return " ";
}

set-location e:
$windowtitle = Read-Host "name the window"
$Host.UI.RawUI.WindowTitle = $windowTitle
cls
