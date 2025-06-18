@echo off

cd ImageMagick-Windows

call Build\FindBash.cmd

BASH% -c "./CloneRepositories.sh --clone-configure --clone-dependencies"
