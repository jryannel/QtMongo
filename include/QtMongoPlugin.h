#ifndef QTMONGOPLUGIN_H
#define QTMONGOPLUGIN_H

#include <QtQml/QQmlExtensionPlugin>
#include <QtQml/QQmlEngine>
#include <QtQml/QQmlContext>

class QtMongoPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
public:
    virtual void initializeEngine(QQmlEngine *engine, const char *uri);
    virtual void registerTypes(const char *uri);
};

#endif // QTMONGOPLUGIN_H
