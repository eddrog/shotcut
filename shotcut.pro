QT       += opengl xml

TARGET = shotcut
TEMPLATE = app

SOURCES += main.cpp\
        mainwindow.cpp \
    mltcontroller.cpp \
    sdlwidget.cpp \
    scrubbar.cpp \
    openotherdialog.cpp \
    widgets/plasmawidget.cpp \
    widgets/lissajouswidget.cpp \
    widgets/isingwidget.cpp \
    widgets/video4linuxwidget.cpp \
    widgets/colorproducerwidget.cpp \
    widgets/decklinkproducerwidget.cpp \
    widgets/networkproducerwidget.cpp \
    widgets/colorbarswidget.cpp \
    widgets/noisewidget.cpp \
    widgets/pulseaudiowidget.cpp \
    widgets/jackproducerwidget.cpp \
    widgets/alsawidget.cpp \
    widgets/x11grabwidget.cpp \
    player.cpp \
    glwidget.cpp \
    widgets/servicepresetwidget.cpp \
    abstractproducerwidget.cpp \
    widgets/avformatproducerwidget.cpp \
    widgets/imageproducerwidget.cpp \
    widgets/timespinbox.cpp \
    widgets/audiosignal.cpp \
    docks/recentdock.cpp \
    docks/encodedock.cpp \
    dialogs/addencodepresetdialog.cpp \
    jobqueue.cpp \
    docks/jobsdock.cpp \
    dialogs/textviewerdialog.cpp

HEADERS  += mainwindow.h \
    mltcontroller.h \
    sdlwidget.h \
    scrubbar.h \
    openotherdialog.h \
    widgets/plasmawidget.h \
    abstractproducerwidget.h \
    widgets/lissajouswidget.h \
    widgets/isingwidget.h \
    widgets/video4linuxwidget.h \
    widgets/colorproducerwidget.h \
    widgets/decklinkproducerwidget.h \
    widgets/networkproducerwidget.h \
    widgets/colorbarswidget.h \
    widgets/noisewidget.h \
    widgets/pulseaudiowidget.h \
    widgets/jackproducerwidget.h \
    widgets/alsawidget.h \
    widgets/x11grabwidget.h \
    player.h \
    glwidget.h \
    widgets/servicepresetwidget.h \
    widgets/avformatproducerwidget.h \
    widgets/imageproducerwidget.h \
    widgets/timespinbox.h \
    widgets/audiosignal.h \
    docks/recentdock.h \
    docks/encodedock.h \
    dialogs/addencodepresetdialog.h \
    jobqueue.h \
    docks/jobsdock.h \
    dialogs/textviewerdialog.h

FORMS    += mainwindow.ui \
    openotherdialog.ui \
    widgets/plasmawidget.ui \
    widgets/lissajouswidget.ui \
    widgets/isingwidget.ui \
    widgets/video4linuxwidget.ui \
    widgets/colorproducerwidget.ui \
    widgets/decklinkproducerwidget.ui \
    widgets/networkproducerwidget.ui \
    widgets/colorbarswidget.ui \
    widgets/noisewidget.ui \
    widgets/pulseaudiowidget.ui \
    widgets/jackproducerwidget.ui \
    widgets/alsawidget.ui \
    widgets/x11grabwidget.ui \
    widgets/servicepresetwidget.ui \
    widgets/avformatproducerwidget.ui \
    widgets/imageproducerwidget.ui \
    docks/recentdock.ui \
    docks/encodedock.ui \
    dialogs/addencodepresetdialog.ui \
    docks/jobsdock.ui \
    dialogs/textviewerdialog.ui

RESOURCES += \
    resources.qrc

OTHER_FILES += \
    COPYING \
    deploy-linux.sh \
    deploy-osx.sh \
    deploy-win32.sh \
    shotcut.rc \
    scripts/build-shotcut.sh \
    icons/shotcut.icns \
    scripts/shotcut.nsi

mac {
    TARGET = Shotcut
    ICON = icons/shotcut.icns
}
win32 {
    INCLUDEPATH += include/mlt++ include/mlt
    LIBS += -Llib -lmlt++ -lmlt
	RC_FILE = shotcut.rc
    SOURCES += GLee/GLee.c
    HEADERS += GLee/GLee.h
} else {
    CONFIG += link_pkgconfig
    PKGCONFIG += mlt++
}
unix:!mac {
    LIBS += -lGLU
}

isEmpty(SHOTCUT_VERSION) {
    SHOTCUT_VERSION = $$system(date "+%y.%m.%d")
}
DEFINES += SHOTCUT_VERSION=\\\"$$SHOTCUT_VERSION\\\"
