@echo off

git clone --branch new-config https://github.com/ImageMagick/ImageMagick-Windows

cd ImageMagick-Windows

call Build\FindBash.cmd

BASH% -c "./CloneRepositories.sh --clone-dependencies"

cd ..

BASH% -c "./CheckReleases.sh"
