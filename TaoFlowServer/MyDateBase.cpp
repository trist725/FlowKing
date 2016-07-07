
#include "MyDateBase.h"
#include <QDebug>

bool dbInit(QString dbType, QString HostName, QString dbName,
            QString UserName, QString UserPasswd)
{
    QSqlDatabase db = QSqlDatabase::addDatabase(dbType); // 使用mysql数据库驱动
    db.setHostName(HostName);
    db.setDatabaseName(dbName); // 数据库名
    db.setUserName(UserName); // 用户名
    db.setPassword(UserPasswd); // 密码

    bool ok = db.open(); // 尝试连接数据库

    if(!ok)
    {
        qDebug()<<db.lastError();
    }
    return ok;
}
