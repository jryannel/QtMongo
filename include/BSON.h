#ifndef BSON_H
#define BSON_H

#include <QVariant>
#include <QDateTime>
#include <mongo/client/dbclient.h>

mongo::BSONObj toBson(QVariantMap obj);
QVariantMap fromBson(mongo::BSONObj bson);
QVariantList fromListBson(mongo::BSONObj bson);

class foo : QObject
{
    Q_OBJECT
};


#endif // BSON_H
