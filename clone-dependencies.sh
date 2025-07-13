#/bin/bash
set -e

clone()
{
    local repo=$1
    local folder=$2

    echo ''
    echo "Cloning $repo"

    if [ -z "$folder" ]; then
        folder=$repo
    fi

    if [ -d "$folder" ]; then
        cd $folder
    else
        git clone https://github.com/ImageMagick/$repo.git $folder
        if [ $? != 0 ]; then echo "Error during checkout"; exit; fi

        cd $folder
        git remote add sshpush git@github.com:ImageMagick/$repo.git
        git config remote.pushDefault sshpush
    fi

    git checkout new-config 2>/dev/null || git checkout -b new-config
    git reset --hard
    git pull origin new-config || true
    cd ..
}

clone_dependencies()
{
    if [ ! -d "Dependencies" ]; then
        mkdir -p "Dependencies"
    fi

    cd "Dependencies"

    clone 'aom'
    clone 'brotli'
    clone 'bzlib'
    clone 'cairo'
    clone 'croco'
    clone 'de265'
    clone 'deflate'
    clone 'exr'
    clone 'ffi'
    clone 'freetype'
    clone 'fribidi'
    clone 'glib'
    clone 'harfbuzz'
    clone 'heif'
    clone 'highway'
    clone 'jpeg-turbo'
    clone 'jpeg-turbo-12'
    clone 'jpeg-turbo-16'
    clone 'jpeg-xl'
    clone 'lcms'
    clone 'lqr'
    clone 'lzma'
    clone 'openh264'
    clone 'openjpeg'
    clone 'pango'
    clone 'pixman'
    clone 'png'
    clone 'raqm'
    clone 'raw'
    clone 'rsvg'
    clone 'tiff'
    clone 'webp'
    clone 'xml'
    clone 'zip'
    clone 'zlib'

    cd ..
}

clone_optional_dependencies()
{
    if [ ! -d "OptionalDependencies" ]; then
        mkdir -p "OptionalDependencies"
    fi

    cd "OptionalDependencies"

    clone 'fftw'
    clone 'flif'
    clone 'jbig'

    cd ..
}

download_release()
{
  local project=$1
  local release=$2
  local file=$3

  echo "Downloading $file from release $release of $project"

  curl -sS -L "https://github.com/ImageMagick/$project/releases/download/$release/$file" -o "$file"
}

download_configure()
{
  local version=$1

  mkdir -p "Configure"
  cd "Configure"

  download_release "Configure" "$version" "Configure.Release.x64.exe"
  download_release "Configure" "$version" "Configure.Release.arm64.exe"
  download_release "Configure" "$version" "Configure.Release.x86.exe"
  download_release "Configure" "$version" "files.zip"
  unzip -o "files.zip" && rm "files.zip"

  cd ..
}

clone_dependencies
clone_optional_dependencies
download_configure "2025.07.13.0657"