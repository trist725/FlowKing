#ifndef MYDATEBASE_H
#define MYDATEBASE_H

#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>

bool dbInit(QString dbType, QString HostName, QString dbName,
            QString UserName, QString UserPasswd);

#endif // MYDATEBASE_H
