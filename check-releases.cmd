@echo off

call .github\build\find-bash.cmd

%BASH% -c "./check-releases.sh"
