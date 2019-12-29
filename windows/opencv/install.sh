#!/bin/bash -e
myRepo=$(pwd)
CMAKE_CONFIG_GENERATOR="Visual Studio 16 2019"
CMAKE_CONFIG_ARCH="x64"
if [ ! -d "$myRepo/opencv" ]; then
    echo "clonning opencv"
    git clone https://github.com/opencv/opencv.git
    mkdir -p Build
    mkdir -p Build/opencv
    mkdir -p Install
    mkdir -p Install/opencv
fi
pushd opencv
git checkout master
git pull --rebase
git checkout refs/tags/4.2.0
popd

if [ ! -d "$myRepo/opencv_contrib" ]; then
    echo "clonning opencv_contrib"
    git clone https://github.com/opencv/opencv_contrib.git
    mkdir -p Build
    mkdir -p Build/opencv_contrib
fi
pushd opencv_contrib
git checkout master
git pull --rebase
git checkout refs/tags/4.2.0
popd

RepoSource=opencv
pushd Build/$RepoSource
CMAKE_OPTIONS='-DBUILD_PERF_TESTS:BOOL=OFF -DBUILD_TESTS:BOOL=OFF -DBUILD_DOCS:BOOL=OFF -DWITH_CUDA:BOOL=OFF -DBUILD_EXAMPLES:BOOL=OFF -DINSTALL_CREATE_DISTRIB=ON'
cmake -G"$CMAKE_CONFIG_GENERATOR" -A"$CMAKE_CONFIG_ARCH" $CMAKE_OPTIONS -DOPENCV_EXTRA_MODULES_PATH="$myRepo"/opencv_contrib/modules -DCMAKE_INSTALL_PREFIX="$myRepo"/install/"$RepoSource" "$myRepo/$RepoSource"
echo "************************* $Source_DIR -->debug"
cmake --build . --config debug
echo "************************* $Source_DIR -->release"
cmake --build . --config release
cmake --build . --target install --config release
cmake --build . --target install --config debug
popd
