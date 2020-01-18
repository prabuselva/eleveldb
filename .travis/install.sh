#!/bin/bash

if [ $TRAVIS_OS_NAME = 'osx' ]; then
    # Install kerl on macOS
    brew install kerl

    # Install Erlang/OTP
    kerl update releases
    kerl build ${OTP_VERSION} ${OTP_VERSION}
    kerl install ${OTP_VERSION} install_${OTP_VERSION}
    source $(./kerl path install_${OTP_VERSION})/activate
fi