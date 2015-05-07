@ECHO OFF
prompt $E[32m$P$E[m$G$s
doskey alias=doskey /macros $*

doskey ls=dir /b $*
doskey ll=dir $*
doskey ..=pushd ..
doskey ...=pushd ..\..
doskey ....=pushd ..\..\..
doskey .....=pushd ..\..\..\..
doskey ......=pushd ..\..\..\..\..
doskey cd=pushd $*
doskey cd-=popd
doskey ~=pushd %USERPROFILE%

doskey cat=type $*
doskey mv=move $*
doskey rm=del $*
doskey rmdir=rd /s /q $*
doskey search=dir /s /b $*
doskey cp=xcopy /friek $*
doskey findstring=findstr /pins /C:$*
doskey findproc=tasklist /v $B findstr /pins $*

doskey st=git status $*
doskey clean=git clean -xdf
doskey add=git add -p $*
doskey addall=git add .
doskey pull=git pull $*
doskey br=git branch $*
doskey go=git checkout $*
doskey unstage=git reset HEAD $*
doskey syncto=git merge -m "Syncing to $1." $1 $*
doskey commit=git commit -m $*
doskey diff=git diff $*
doskey log=git log --pretty=format:"%%h - %%an (%%ae): %%s" -10 $*
doskey stash=git stash save $*
doskey unstash=git stash pop $*
doskey stashes=git stash list $*
doskey lastchange=git whatchanged -m -n 1 -p $*

doskey np=notepad $*

doskey edit="%PROGRAMFILES(x86)%\Notepad++\notepad++" $*
doskey devenv="%ProgramFiles(x86)%\Microsoft Visual Studio 12.0\Common7\IDE\devenv.exe"
doskey cf="C:\Users\yaelsa\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\CodeFlow\CodeFlow 2010.appref-ms"
doskey bc2="%ProgramFiles(x86)%\Beyond Compare 2\BC2.exe"
doskey sublime="%ProgramFiles%\Sublime Text 3\sublime_text.exe"
doskey odd="%ProgramFiles(x86)%\Odd\Odd.exe" -git
