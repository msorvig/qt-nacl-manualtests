TEMPLATE = app
TARGET = qmake_ppapi

DEPENDPATH += .

# Input
SOURCES += main.cpp

LIBS += -lppapi
QT =