######################################################################
# Automatically generated by qmake (3.1) Sun May 24 23:49:39 2020
######################################################################

TEMPLATE = app
TARGET = ptcollab
INCLUDEPATH += .
win32:INCLUDEPATH += ../deps/include
QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets multimedia

GIT_VERSION = $$system(git --git-dir $$PWD/../.git --work-tree $$PWD describe --always)
DEFINES += GIT_VERSION=\"\\\"$$GIT_VERSION\\\"\"

CONFIG += c++17

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS
DEFINES += pxINCLUDE_OGGVORBIS
# You can make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# Please consult the documentation of the deprecated API in order to know
# how to port your code away from it.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

# Input
HEADERS += \
           editor/Animation.h \
           editor/DummySyncServer.h \
           editor/EditState.h \
           editor/EditorScrollArea.h \
           editor/EditorWindow.h \
           editor/KeyboardEditor.h \
           editor/NotePreview.h \
           editor/PxtoneActionSynchronizer.h \
           editor/PxtoneIODevice.h \
           editor/PxtoneUnitIODevice.h \
           editor/SelectWoiceDialog.h \
           editor/SideMenu.h \
           editor/quantize.h \
           protocol/Data.h \
           protocol/Hello.h \
           protocol/PxtoneEditAction.h \
           protocol/RemoteAction.h \
           protocol/SerializeVariant.h \
           pxtone/pxtn.h \
           pxtone/pxtnDelay.h \
           pxtone/pxtnDescriptor.h \
           pxtone/pxtnError.h \
           pxtone/pxtnEvelist.h \
           pxtone/pxtnMaster.h \
           pxtone/pxtnMax.h \
           pxtone/pxtnMem.h \
           pxtone/pxtnOverDrive.h \
           pxtone/pxtnPulse_Frequency.h \
           pxtone/pxtnPulse_Noise.h \
           pxtone/pxtnPulse_NoiseBuilder.h \
           pxtone/pxtnPulse_Oggv.h \
           pxtone/pxtnPulse_Oscillator.h \
           pxtone/pxtnPulse_PCM.h \
           pxtone/pxtnService.h \
           pxtone/pxtnText.h \
           pxtone/pxtnUnit.h \
           pxtone/pxtnWoice.h \
           pxtone/pxtoneNoise.h \
           server/BroadcastServer.h \
           server/Client.h \
           server/ServerSession.h
FORMS += \
    editor/EditorWindow.ui \
    editor/SelectWoiceDialog.ui \
    editor/SideMenu.ui
SOURCES += main.cpp \
           editor/Animation.cpp \
           editor/DummySyncServer.cpp \
           editor/EditState.cpp \
           editor/EditorScrollArea.cpp \
           editor/EditorWindow.cpp \
           editor/KeyboardEditor.cpp \
           editor/NotePreview.cpp \
           editor/PxtoneActionSynchronizer.cpp \
           editor/PxtoneIODevice.cpp \
           editor/PxtoneUnitIODevice.cpp \
           editor/SelectWoiceDialog.cpp \
           editor/SideMenu.cpp \
           protocol/Data.cpp \
           protocol/Hello.cpp \
           protocol/PxtoneEditAction.cpp \
           protocol/RemoteAction.cpp \
           pxtone/pxtnDelay.cpp \
           pxtone/pxtnDescriptor.cpp \
           pxtone/pxtnError.cpp \
           pxtone/pxtnEvelist.cpp \
           pxtone/pxtnMaster.cpp \
           pxtone/pxtnMem.cpp \
           pxtone/pxtnOverDrive.cpp \
           pxtone/pxtnPulse_Frequency.cpp \
           pxtone/pxtnPulse_Noise.cpp \
           pxtone/pxtnPulse_NoiseBuilder.cpp \
           pxtone/pxtnPulse_Oggv.cpp \
           pxtone/pxtnPulse_Oscillator.cpp \
           pxtone/pxtnPulse_PCM.cpp \
           pxtone/pxtnService.cpp \
           pxtone/pxtnService_moo.cpp \
           pxtone/pxtnText.cpp \
           pxtone/pxtnUnit.cpp \
           pxtone/pxtnWoice.cpp \
           pxtone/pxtnWoice_io.cpp \
           pxtone/pxtnWoicePTV.cpp \
           pxtone/pxtoneNoise.cpp \
           server/BroadcastServer.cpp \
           server/Client.cpp \
           server/ServerSession.cpp

!win32:LIBS += -logg -lvorbisfile
win32:LIBS += -L"$$PWD/../deps/lib" -L"$$PWD/deps/lib" -llibogg_static -llibvorbisfile

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
