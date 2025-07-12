@echo off

call .github\build\find-bash.cmd

BASH% -c "./clone-dependencies.sh"
