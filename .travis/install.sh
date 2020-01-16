#!/bin/bash

if [ $TRAVIS_OS_NAME = 'osx' ]; then
    # Install kerl on macOS
    brew install kerl

    # Install Erlang/OTP
    travis_wait 25 kerl build ${OTP_VERSION}
    kerl install ${OTP_VERSION} ~/kerl/${OTP_VERSION}
    . ${HOME}/kerl/${OTP_VERSION}/activate
fi