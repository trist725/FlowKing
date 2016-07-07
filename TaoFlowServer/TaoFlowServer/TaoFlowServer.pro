#-------------------------------------------------
#
# Project created by QtCreator 2013-07-25T16:01:28
#
#-------------------------------------------------

QT       += core gui sql network webkit

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = TaoFlowServer
TEMPLATE = app


SOURCES +=\
        mainwindow.cpp \
    ThreadPool.cpp \
    TaoFlowServer.cpp \
    ServerMain.cpp \
    IOData.cpp

HEADERS  += mainwindow.h \
    ThreadPool.h \
    TaoFlowServer.h \
    PacketInfo.h \
    IOData.h \
    def.h \
    ClientInfo.h

FORMS    += mainwindow.ui

OTHER_FILES += \
    TaoFlowServer.pro.user \
    Makefile
