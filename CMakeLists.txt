cmake_minimum_required(VERSION 3.28)

project(qt5-template)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

find_package(Qt5 REQUIRED COMPONENTS Core Widgets Qml Quick QuickControls2 QmlImportScanner)

qt5_add_resources(RESOURCES qml/qml.qrc)

add_executable(${PROJECT_NAME} src/main.cpp ${RESOURCES})

target_link_libraries(${PROJECT_NAME} PUBLIC
        Qt5::Core
        Qt5::Gui
        Qt5::Qml
        Qt5::Quick
        Qt5::QuickControls2
)

qt_import_qml_plugins(${PROJECT_NAME})