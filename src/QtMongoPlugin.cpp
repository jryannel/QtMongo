#include <QDebug>
#include "QtMongoPlugin.h"
#include "QMongoDriver.h"
#include <QtQml/QtQml>
#include <QtQml/QQmlContext>
#include <QtQml/QQmlEngine>
#include <QtDeclarative/QDeclarativeView>

void QtMongoPlugin::registerTypes(const char *uri)
{
    qmlRegisterUncreatableType<QMongoDriver>(uri, 1, 0, "MongoDriver",
        QString("you cannot create a new MongoDriver!"));
    qmlRegisterUncreatableType<QMongoCursor>(uri, 1, 0, "MongoCursor",
        QString("you cannot create a new MongoCursor!"));
    qmlRegisterUncreatableType<QMongoType>(uri, 1, 0, "MongoType",
        QString("you cannot create a new MongoType!"));
}

void QtMongoPlugin::initializeEngine(QQmlEngine *engine, const char *uri) {
    QQmlContext *ctx = engine->rootContext();
    ctx->setContextProperty("mongoDriver", new QMongoDriver(this));
}
