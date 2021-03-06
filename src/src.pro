TEMPLATE = app
TARGET   = neptune-ui

include(../config.pri)

macos:CONFIG -= app_bundle
CONFIG *= no_private_qt_headers_warning link_pkgconfig

QT *= appman_main-private testlib

DEFINES *= NEPTUNE_VERSION=\\\"$$VERSION\\\"

SOURCES = main.cpp

unix:!macos:system($$pkgConfigExecutable() --libs x11 xi xcb) {
    PKGCONFIG *= xcb x11 xi
    QT += gui-private
    SOURCES += MouseTouchAdaptor.cpp
    HEADERS += MouseTouchAdaptor.h
    DEFINES += NEPTUNE_ENABLE_TOUCH_EMULATION
}

DESTDIR = $$OUT_PWD/../

win32: wrapper.files = neptune-ui_wrapper.bat
else: wrapper.files = neptune-ui_wrapper.sh
wrapper.path = $$INSTALL_PREFIX/neptune-ui

target.path = $$INSTALL_PREFIX/neptune-ui
INSTALLS += target wrapper
