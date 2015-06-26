#! /usr/bin/env bash

#Need to create soft link to your GAEJ home e.g.
#ln -s /Users/ag/appengine-java-sdk-1.5.1 /appengine-java-sdk
#ln -s '/Users/ag/ksstoolkit/java/service/' /project_home

#Also need to make sure Java is installed properly, generally available at /usr/bin/java and 
#change JAVA_HOME accordingly

export JAVA_HOME='/System/Library/Frameworks/JavaVM.framework/Home'
export GAE_JAVA_SDK_HOME='/appengine-java-sdk'
#export PATH=${PATH}:$JAVA_HOME/bin:$GAE_JAVA_SDK_HOME/bin
PROJECT_HOME='/project_home'

echo 'copying ' ${PROJECT_HOME}/ksstoolkit/command/.classpath.mac ' to ' ${PROJECT_HOME}/ksstoolkit/.classpath ' ...'
cp -f ${PROJECT_HOME}/ksstoolkit/command/.classpath.mac ${PROJECT_HOME}/ksstoolkit/.classpath