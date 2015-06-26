Pre-requisites
--------------
JDK 1.7

Platform supported
------------------
Android
iOS
Windows Phone
PlayStation Mobile

How to Run It
-------------

java com.google.code.kss.tool.webkit.GDTConverter

Note: 

On Mac OS X, need to add the folllowing into the VM arguments -

-d64 -XstartOnFirstThread -Djava.library.path=/Users/ag/demo/ksstoolkit/lib/libswt-pi-carbon-3235.jnilib


Features
--------

. Generate codes with at least:

1 splash
1 main menu
1 game layer
1 pause layer
1 background sound
1 player
1 enemy
3 lifes for the player

Project Setup
-------------

. GDT is developed with the assumption of the existence of Eclipse IDE. Even though, it might works with other IDE, it 
was designed to be launched from within an IDE.
. JDK 1.7 is needed as it depends on java.nio.file. A good URL is at http://dlc.sun.com.edgesuite.net/jdk7/binaries/index.html.
. Specify path to library_path in vm argument -Djava.library.path=libswt-carbon-3235:libswt-carbon-3235

Dependencies
------------

. KSSToolkit depends on Wireframesketcher 1.8.2 or above (http://wireframesketcher.com) as its core IDE.
. Simple XML 2.3.3 or above (simple.sourceforge.net) as its core XML parsing component.
. Ben Alman's Javascript debug wrapper (http://benalman.com/projects/javascript-debug-console-log).


Java Applet limitation
----------------------

. Google Chrome 5 and 6 do not seem to throw the properly exception back to Javascript run time.
If you encounter something like "Uncaught Error: Error calling method on NPObject!", please try to use Firefox 3/Firebug to debug the error.
However, it seems like Firefox 4.0b5 behaves the same as Chrome!


HTML limitation
---------------

Due to the fact that WireframeSketcher does not generate full path of the image used in the .screen file,
if the image and the .screen reside in the same directory. The path will not be generated, thus crashing 
com.google.code.kss.tool.webkit.HTML5Javascript.handleImagePath() with
java.lang.StringIndexOutOfBoundsException: String index out of range: -7 exception.

Workaround is not to save the image together in the same directory as the .screen/.story file.

The image resource name (the file name) can not contains illegal characters relative to the JavaScript 
variable naming convention. For example, file name with a hypen ('-'). This will break the HTML type 
output of the conversion.


Android limitation
------------------

iOS limitation
--------------

Windows Phone limitation
------------------------

PlayStation Mobile limitation
-----------------------------


Known Issue
-----------

Runtime exception -

"java.lang.UnsatisfiedLinkError: Cannot load 32-bit SWT libraries on 64-bit JVM"
-Please use 64 bit version of SWT. It can be downloaded from http://archive.eclipse.org/eclipse/downloads/drops/R-3.6.1-201009090800/index.php#SWT.
Or please change make sure the classpath picks up swt_64.jar instead of swt.jar.

"WARNING: Display must be created on main thread due to Cocoa restrictions."
-Set -XstartOnFirstThread during launch. c.f. http://stackoverflow.com/questions/3976342/running-swt-based-cross-platform-jar-properly-on-a-mac


Java compilation - 

"The type Collection is not generic; it cannot be parameterized with arguments <? extends E>"
-If this happens to you, please move the JDK (JRE System Library in Eclipse) to the top/first in your classpath.

There seems to be some conflicts with the String.format function. Workaround is to make sure that JDK 1.7 preceeds everything in the classpath.

