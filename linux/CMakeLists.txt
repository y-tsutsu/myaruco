cmake_minimum_required(VERSION 2.8)
project(myaruco)

set(CMAKE_CXX_FLAGS "-O2 -std=c++14 -Wall -g")

file(GLOB SOURCES
    ./*.cpp
)

file(GLOB HEADERS
    ./*.h
)

add_executable(myaruco
    ${SOURCES}
    ${HEADERS}
)

# For OpenCV
find_package(OpenCV REQUIRED)
if(OpenCV_FOUND)
    target_include_directories(myaruco PUBLIC ${OpenCV_INCLUDE_DIRS})
    target_link_libraries(myaruco ${OpenCV_LIBS})
endif()
