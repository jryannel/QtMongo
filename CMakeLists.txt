cmake_minimum_required(VERSION 2.8)
project(qtmongo)

# Qt related new cmake functions
set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)
set(CMAKE_SHARED_LINKER_FLAGS "-Wl,--no-undefined")
set(CMAKE_MODULE_PATH ${qtmongo_SOURCE_DIR}/CMakeModules)

find_package(Qt4 COMPONENTS QtCore QtDeclarative QtScript REQUIRED)
find_package(Boost 1.54 COMPONENTS thread filesystem program_options REQUIRED)
find_package(MongoDB REQUIRED)

add_definitions( -DQT_DEVELOPER_BUILD=1 -DNOCRYPT=1 -DNOUNCRYPT=1 )

include_directories(
	${CMAKE_CURRENT_SOURCE_DIR}
	${QT_INCLUDES}
	${Boost_INCLUDE_DIR}
	include
)

link_libraries(
    ${QT_QTSCRIPT_LIBRARY}
	${QT_QTCORE_LIBRARY}
	${QT_QTDECLARATIVE_LIBRARY}
	${Boost_LIBRARIES}
	${MongoDB_LIBRARIES}
)

set( HDRS
	include/QtMongoPlugin.h
	include/BSON.h
	include/QMongoDriver.h
	include/QMongoCursor.h
	include/QMongoType.h
	)

QT4_WRAP_CPP( MOC_SRCS
	${HDRS}
	OPTIONS -DBOOST_TT_HAS_OPERATOR_HPP_INCLUDED  -DBOOST_NO_TEMPLATE_PARTIAL_SPECIALIZATION
	)

set( SRCS
	src/QtMongoPlugin.cpp
	src/BSON.cpp
	src/QMongoDriver.cpp
	src/QMongoCursor.cpp
	src/QMongoType.cpp
	)

add_library( libqtmongoplugin SHARED
	 ${SRCS}
	 ${MOC_SRCS}
	)

set( LIBRARY_OUTPUT_PATH ${qtmongo_SOURCE_DIR}/QtMongo/ )
set_target_properties( libqtmongoplugin PROPERTIES PREFIX "")

install( TARGETS libqtmongoplugin LIBRARY DESTINATION ${QT_IMPORTS_DIR}/QtMongo )
install( FILES
	QtMongo/lib/mongodb/collection_patch.js
	QtMongo/lib/mongodb/db_patch.js
	QtMongo/lib/mongodb/utils.js
	QtMongo/lib/mongodb/db.js
	QtMongo/lib/mongodb/collection.js
	QtMongo/lib/mongodb/query.js
	QtMongo/lib/mongodb/README
	QtMongo/lib/mongodb/utils_patch.js
	QtMongo/lib/mongodb/query_patch.js
	DESTINATION ${QT_IMPORTS_DIR}/QtMongo/lib/mongodb/
	)
install( FILES
	QtMongo/MongoQuery.qml
	QtMongo/MongoDriverWrapper.js
	QtMongo/MongoCollection.qml
	QtMongo/MongoDB.js
	QtMongo/mongo.js
	QtMongo/qmldir
	QtMongo/MongoCollection.js
	QtMongo/MongoDB.qml
	QtMongo/MongoCode.js
	QtMongo/plugins.qmltypes
	DESTINATION ${QT_IMPORTS_DIR}/QtMongo
	)
