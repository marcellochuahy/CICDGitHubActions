### https://www.kodeco.com/40047657-docc-tutorial-for-swift-automating-publishing-with-github-actions/page/1

##!/bin/sh

## 1) Creates the Script: touch build-docc.sh

## 2) Make it executable by adding the appropriate permission: chmod +x build-docc.sh

## 3) Add the following command:

xcrun xcodebuild docbuild \
    -scheme GivenWithLove \
    -destination 'generic/platform=iOS Simulator' \
    -derivedDataPath "$PWD/.derivedData"

    ## xcrun:       is a tool that allows interaction with Xcode via command line
    ## xcodebuild:  is the part of it responsible for building Xcode projects
    ## docbuild:    is the subcommand that builds the documentation for a given target

    ## -scheme GivenWithLove \
    ## Choose the scheme you want to build documentation for. In this case, it’s the GivenWithLove app.

    ## -destination 'generic/platform=iOS Simulator' \
    ## Both the app and package were built for iOS and import SwiftUI, so set the destination to iOS.
    ## Some xcodebuild actions don’t require a specific device or simulator to run on, so prefix the destination with 'generic/'.
    ## And because you don’t want to deal with code signing, choose 'iOS Simulator' instead of an actual device.

    ## -derivedDataPath "$PWD/.derivedData"
    ## By default, xcodebuild generates its products and places them in the default derived data folder.
    ## Because you’ll need to find the documentation it generates, use a custom derived data location, with a known path, for easy access.

## 4) Run the Script Locally: ./build-docc.sh

## 5) open .derivedData/Build/Products/Debug-iphonesimulator

## 6) Converting the Documentation to HTML

xcrun docc process-archive transform-for-static-hosting \
    "$PWD/.derivedData/Build/Products/Debug-iphonesimulator/GivenWithLove.doccarchive" \
    --output-path ".docs" \
    --hosting-base-path "" # add your repo name later

## 7) ./build-docc.sh
## 8) open .docs
