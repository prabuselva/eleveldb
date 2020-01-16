#!/bin/bash

if [ $TRAVIS_OS_NAME = 'osx' ]; then
    # Install kerl on macOS
    brew install kerl

    # Install Erlang/OTP
    kerl update releases
    travis_wait 25 kerl build ${OTP_VERSION}
    kerl install ${OTP_VERSION} ~/kerl/${OTP_VERSION}
    . ${HOME}/kerl/${OTP_VERSION}/activate
    wget https://s3.amazonaws.com/rebar3/rebar3
    chmod +x rebar3
fi