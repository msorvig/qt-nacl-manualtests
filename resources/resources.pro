TEMPLATE = app
TARGET = resources

DEPENDPATH += .
               .
# Input
SOURCES += hello_world.cpp
RESOURCES += resource.qrc

LIBS +=  -lppapi -lnacl_io
QT = core gui