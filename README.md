# Linux環境でのArUcoサンプルコード

## Required Packages

```console
$ sudo apt -y install libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
```

## Getting OpenCV Source Code

```console
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
```

参考  
[https://docs.opencv.org/3.4.1/d7/d9f/tutorial_linux_install.html](https://docs.opencv.org/3.4.1/d7/d9f/tutorial_linux_install.html)
