TEMPLATE = app
TARGET = qtcore

DEPENDPATH += .

# Input
SOURCES += hello_world.cpp

LIBS +=  -lppapi -lnacl_io
QT = core