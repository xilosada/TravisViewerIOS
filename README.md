# TravisViewerIos 

This application allows you to view all builds of public repos on Travis-CI.
1. Enter the username in the TextField.
2. If the username is found on github, the app calls to Travis and store all repos using CoreData.
3. Press the button to view the list of repos.
4. If the repo has builds on Travis-CI, you can select the repo to list all the builds.

## Build

This project uses Carthage to manage the frameworks. To install the carthage tool on your system, please download and run the Carthage.pkg file for the latest release, then follow the on-screen instructions.
Alternatively only on Xcode 7.x, you can use Homebrew and install the carthage tool on your system simply by running brew update and brew install carthage. (note: if you previously installed the binary version of Carthage, you should delete /Library/Frameworks/CarthageKit.framework).

If you’d like to run the latest development version (which may be highly unstable or incompatible), simply clone the master branch of the repository, then run make install.

After downloading the source just run [carthage update --platform iOS]
