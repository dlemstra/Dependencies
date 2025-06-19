# ImageMagick Dependencies

This repository contains the scripts and tools needed to clone and manage the third-party dependencies required for building ImageMagick on Windows.

## Overview

ImageMagick is built with a number of third-party libraries that provide support for various image formats, compression algorithms, and other functionality. This project contains the necessary scripts to automatically clone and organize these libraries for the build process.

## Requirements

• Git for Windows
• Internet connection for cloning repositories
• Visual Studio 2017 (or newer) for building the dependencies

## Getting Started

### Clone ImageMagick-Windows

To get started, you need to clone the ImageMagick-Windows repository, which contains the build scripts and configuration files:

```cmd
git clone https://github.com/ImageMagick/ImageMagick-Windows.git
```

### Clone Dependencies

To clone all the required third-party libraries for ImageMagick, run the appropriate clone script:

```cmd
CloneDependencies.cmd
```