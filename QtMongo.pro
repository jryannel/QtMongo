TEMPLATE = lib
CONFIG += qt plugin
QT += qml widgets

TARGET = qtmongodb

DESTDIR = lib
OBJECTS_DIR = tmp
MOC_DIR = tmp
INCLUDEPATH += include /usr/include/arm-linux-gnueabihf/qt5 

QMAKE_MOC = $$[QT_INSTALL_BINS]/moc -DBOOST_TT_HAS_OPERATOR_HPP_INCLUDED  -DBOOST_NO_TEMPLATE_PARTIAL_SPECIALIZATION

HEADERS += \
    include/BSON.h \
    include/QtMongoPlugin.h \
    include/QMongoDriver.h \
    include/QMongoCursor.h \
    include/QMongoType.h

SOURCES += \
    srcs/QtMongoPlugin.cpp \
    srcs/BSON.cpp \
    srcs/QMongoDriver.cpp \
    srcs/QMongoCursor.cpp \
    srcs/QMongoType.cpp

OTHER_FILES += \
    demo.qml \
    qmldir \
    README \
    LICENSE \
    Button.qml \
    QtMongo/MongoDB.qml \
    QtMongo/MongoCollection.qml \
    QtMongo/MongoDB.js \
    QtMongo/MongoCollection.js \
    QtMongo/MongoQuery.qml \
    QtMongo/lib/json/json2.js \
    JsonEdit.qml \
    QtMongo/lib/mongodb/collection.js \
    QtMongo/lib/mongodb/db.js \
    QtMongo/lib/mongodb/query.js \
    QtMongo/lib/mongodb/README \
    QtMongo/MongoCode.js \
    QtMongo/lib/mongodb/utils.js \
    QtMongo/lib/mongodb/utils_patch.js \
    QtMongo/lib/mongodb/collection_patch.js \
    QtMongo/lib/mongodb/query_patch.js \
    QtMongo/lib/mongodb/db_patch.js \
    QtMongo/mongo.js \
    QtMongo/jstests.js \
    QtMongo/lib/jstests/find1.js \
    QtMongo/MongoDriverWrapper.js \
    qtmongo.json

LIBS += -lmongoclient  -lboost_thread -lboost_filesystem -lboost_program_options -L/usr/include/arm-linux-gnueabihf/qt5
