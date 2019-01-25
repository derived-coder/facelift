# Linux
if [[ "${TRAVIS_OS_NAME}" == "linux" ]]; then
    sudo apt-get install python3 python3-pip python3-setuptools doxygen libgl1-mesa-dev
    sudo pip3 install antlr4-python3-runtime six pyyaml click typing jinja2 watchdog path.py
fi


# OS X 
if [[ "$TRAVIS_OS_NAME" == "osx" ]]; then
    # Setup versions
    export QT_VERSION_SHORT=5.12.0
    export QT_VERSION=5.12.0
    export QT_PATH=/Users/$USER/Qt$QT_VERSION

    # Install from homebrew
    brew update

    # Install other dependencies
    if [[ ! -d dependencies ]]; then
        mkdir -p dependencies
    fi
    pushd dependencies

   # Install Qt
    if [[ ! -d "$QT_PATH/${QT_VERSION_SHORT}/" ]]; then
        mkdir -p qt
        pushd qt
        curl -LO http://download.qt.io/official_releases/online_installers/qt-unified-mac-x64-online.dmg
        hdiutil attach qt-unified-mac-x64-online.dmg

        QT_APP=$(cd /Volumes && ls | grep qt-unified-mac)
        QT_APP=${QT_APP//\//}

        /Volumes/${QT_APP}/${QT_APP}.app/Contents/MacOS/${QT_APP} -v --script ../../travis/qt-installer-noninteractive.qs
        popd
    fi
    export PATH=$PATH:$QT_PATH/$QT_VERSION_SHORT/clang_64/bin
    export Qt5_DIR=$QT_PATH/$QT_VERSION_SHORT/clang_64
    ls $QT_PATH/$QT_VERSION_SHORT/clang_64/bin

    popd
fi

cd ${TRAVIS_BUILD_DIR}
mkdir build
echo $PATH
