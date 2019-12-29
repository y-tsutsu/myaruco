# Linux環境でのArUcoサンプルコード

## Required Packages

```console
$ sudo apt -y install libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
```

## Getting OpenCV Source Code

```console
$ cd linux
$ mkdir opencv && cd opencv
$ git clone https://github.com/opencv/opencv.git
$ cd opencv
$ git checkout -b 4.2.0 refs/tags/4.2.0
$ cd ..
$ git clone https://github.com/opencv/opencv_contrib.git
$ cd opencv_contrib
$ git checkout -b 4.2.0 refs/tags/4.2.0
$ cd ..
```

## Building OpenCV from Source Using CMake

```console
$ cd opencv
$ mkdir build && cd build
$ cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules/ ..
$ make -j4
$ sudo make install
$ cd ../..
```

## サンプルコードのビルド & 実行

```console
$ mkdir build && cd build
$ cmake ..
$ make -j4
$ ./myaruco
```

参考  
[https://docs.opencv.org/3.4.1/d7/d9f/tutorial_linux_install.html](https://docs.opencv.org/3.4.1/d7/d9f/tutorial_linux_install.html)

# Windows環境でのArUcoサンプルコード

## Getting OpenCV Source Code & Building OpenCV from Source Using CMake

```console
$ cd windows/opencv
$ ./install.sh
```

## Set environment variable (Path)

環境変数のPathに以下を絶対パスで設定．

`myaruco\windows\opencv\Install\opencv\x64\vc16\bin`

## サンプルコードのビルド & 実行

`myaruco\windows\myaruco\myaruco.sln`

Visual Studioで以下を絶対パスで設定．（x64）

* 追加のインクルード ディレクトリ（myaruco\windows\opencv\Install\opencv\include）
* 追加のライブラリ ディレクトリ（myaruco\windows\opencv\Install\opencv\x64\vc16\lib）
* 追加の依存ファイル（opencv_world420.lib or opencv_world420d.lib）

ビルドして実行．

参考  
[https://docs.opencv.org/3.4.1/d3/d52/tutorial_windows_install.html](https://docs.opencv.org/3.4.1/d3/d52/tutorial_windows_install.html)
