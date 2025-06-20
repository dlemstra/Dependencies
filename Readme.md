# ImageMagick Dependencies

This repository contains the scripts and tools needed to clone and manage the third-party dependencies required for building ImageMagick on Windows.

## Overview

ImageMagick is built with a number of third-party libraries that provide support for various image formats, compression algorithms, and other functionality. This project contains the necessary scripts to automatically clone and organize these libraries for the build process.

## Requirements

• Git for Windows
• Internet connection for cloning repositories
• Visual Studio 2017 (or newer) for building the dependencies

## Getting Started

### Clone Dependencies

To clone all the required third-party libraries for ImageMagick, run the appropriate clone script:

```cmd
CloneDependencies.cmd
```

### Run Configure.exe

One of the folders is called `ImageMagick-Windows\Configure`. This folder contains various builds of the `Configure` program. Running this program will start a Wizard that allows configuration of ImageMagick and its individual components. For the dependencies not all options will be used, but it is still used to create a solution file for Visual Studio.

### Build Dependencies

Depending on which options were chosen when running `Configure` a solution will be created in the `ImageMagick-Windows`folder that can be opened in Visual Studio. Open the solution and build it.
