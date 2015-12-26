#include <QtCore>
#include <QtCore/qcoremain.h>

void init(int argc, char **argv)
{
    qDebug() << "init";
}

void exit()
{
    qDebug() << "exit";
}

Q_CORE_MAIN(init, exit);
