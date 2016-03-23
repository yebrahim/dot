set-alias subl "${env:ProgramFiles(x86)}\Sublime Text 3\subl.exe"
set-alias edit "${env:ProgramFiles(x86)}\Sublime Text 3\subl.exe"
set-alias cf "C:\Users\yaelsa\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\CodeFlow\CodeFlow 2010.appref-ms"
set-alias odd "${env:ProgramFiles(x86)}\Odd\Odd.exe -git"

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
function commit { git commit -m }
function log {
    git log --pretty=format:"%%Cred%%h%%Creset - %%C(bold blue)<%%an>%%Creset %%s %%Cgreen(%%cr)" --date=relative -10
}
function mylog {
    git log --pretty=format:"%%Cred%%h%%Creset - %%C(bold blue)<%%an>%%Creset %%s %%Cgreen(%%cr)" --date=relative -10 --author=%%USERNAME%%
}
function branchlog {
    git log --pretty=format:"%%Cred%%h%%Creset - %%C(bold blue)<%%an>%%Creset %%s %%Cgreen(%%cr)" --date=relative -10
}
function stash { git stash save }
function unstash { git stash pop }
function stashes { git stash list }
function pick { git cherry-pick }
function lastchange { git whatchanged -m -n 1 -p }
function changedfiles { git diff-tree --no-commit-id --name-only -r }
function addcontinue { git add -A ; git rebase --continue }
function whichbranch { git branch --contains }
function amend { git commit --amend }
function fetchrebase {git fetch ; git rebase origin/master}

function prompt {
    $promptString = "" + $(Get-Location) + ">";
    Write-Host $promptString -NoNewline -ForegroundColor DarkGreen;
    return " ";
}

set-location e:
$WindowTitle = read-host 'Enter window title'
$Host.UI.RawUI.WindowTitle = $WindowTitle