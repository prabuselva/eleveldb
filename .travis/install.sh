#!/bin/bash

if [ $TRAVIS_OS_NAME = 'osx' ]; then
    # Install kerl on macOS
    brew install kerl

    # Install Erlang/OTP
    kerl build ${OTP_VERSION}
    kerl install ${OTP_VERSION} ~/kerl/${OTP_VERSION}
    . ${HOME}/kerl/${OTP_VERSION}/activate
fi