# Linux
if [[ "${TRAVIS_OS_NAME}" == "linux" ]]; then
    QTDIR="/opt/qt${QT}"
    PATH="$QTDIR/bin:$PATH"
    source /opt/qt${QT}/bin/qt${QT}-env.sh
fi


# OS X 
if [[ "$TRAVIS_OS_NAME" == "osx" ]]; then
    #QT_VERSION_SHORT=5.12.0
    #QT_VERSION=5.12.0
    #QT_PATH=/Users/$USER/Qt$QT_VERSION
    #PATH=$QT_PATH/$QT_VERSION_SHORT/clang_64/bin:$PATH
    #export Qt5_DIR=$QT_PATH/$QT_VERSION_SHORT/clang_64/lib/cmake/Qt5
fi
