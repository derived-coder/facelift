
facelift_add_library(FaceliftModelLib
    SOURCES FaceliftModel.cpp QMLFrontend.cpp
    HEADERS FaceliftModel.h QMLFrontend.h ServiceWrapper.h
    LINK_LIBRARIES FaceliftCommonLib Qt5::Qml Qt5::Quick
)
