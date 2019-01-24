# Linux
if [[ "${TRAVIS_OS_NAME}" == "linux" ]]; then
    QTDIR="/opt/qt${QT}"
    PATH="$QTDIR/bin:$PATH"
    source /opt/qt${QT}/bin/qt${QT}-env.sh
fi


