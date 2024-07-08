cmake_minimum_required(VERSION 3.16)

project(MP3Demo VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick Core Multimedia)

qt_standard_project_setup()

qt_add_resources(RESOURCES
    resources.qrc
)

qt_add_executable(appMP3Demo
    main.cpp
    ${RESOURCES}
)

qt_add_qml_module(appMP3Demo
    URI MP3Demo
    VERSION 1.0
    QML_FILES
        Main.qml
        RESOURCES resources.qrc
)

set_target_properties(appMP3Demo PROPERTIES
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appMP3Demo
    PRIVATE Qt6::Quick
    PRIVATE Qt6::Core
    PRIVATE Qt6::Multimedia
)

install(TARGETS appMP3Demo
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
