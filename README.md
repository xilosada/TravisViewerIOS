# TravisViewerIos: ![image](https://travis-ci.org/xilosada/TravisViewerIOS.svg?branch=master) [![codecov.io](https://codecov.io/github/xilosada/TravisViewerIOS/coverage.svg?branch=master)](https://codecov.io/github/xilosada/TravisViewerIOS?branch=master)

This application allows you to view all builds from public repos in Travis-CI.

* Search by Github username. Just enter the username in the TextField.
* If the username is found on github API, the app calls to Travis-CI Api and stores all repos and builds using CoreData.
* Press the "Show Repos" button to view the list of repos.
* If the repo has builds, you can select the repo to list all the builds.

## Build

**Install Carthage**

*Using the script*

This project uses Carthage to manage the frameworks. To install the carthage tool on your system, please download and run the Carthage.pkg file for the latest release, then follow the on-screen instructions.
You can get more information about this method in this [link](https://github.com/Carthage/Carthage to get more info.)

*Using homebrew*

Alternatively only on Xcode 7.x, you can use Homebrew and install the carthage tool on your system simply by running `brew update` and `brew install carthage`. (note: if you previously installed the binary version of Carthage, you should delete /Library/Frameworks/CarthageKit.framework).

*Using the script*

Also you can use the script provided to CI service. Just run in a terminal:
`./update_carthage.sh 0.12`

**Fetching frameworks**

After installing Carthage just run `carthage update --no-use-binaries --platform iOS` in the root directory of the project.
