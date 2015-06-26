Pre-requisites
--------------
. Windows 32 bit OS only.

How to Run It
-------------

Android
java 

HTML 5
java com.google.code.kss.tool.webkit.HTMLConverter

FiOS TV
java com.google.code.kss.tool.fios.FIOSConverter


Features
--------

. Automatic image compression/reduction support (setImageReduction(true)).
. Automatic gray scale support.
. Automatic OK / Enter selector handler generation (with total transparent Rectangle artifact of wireframesketcher).
. Drag and drop component development.
. WYSIWYG Visual development.
. Native SDK support (setNativeSDK(true)).
. Scene (animation) support:
- Basic (frame based; default)
- Automatic continuous scene generation (data driven; setContinuos(true)).
. Developer friendly platform:
- Simple API
- Component based (e.g. a component can be commented out easily with support of dofile() even though the native platform does not)
- Automatic file change detection
- Discover lua issue even before the runtime issue (with TestLua.java)
- Support the following filtering which are not supported by Iris emulator -
. ASCII characters above 126 (filterIDEText).

Project Setup
-------------

. KSSToolkit is developed with the assumption of the existence of Eclipse IDE. Even though, it might works with other IDE, it 
was designed to be launched from within an IDE.
. By default, the project is setup to use JDK residing at c:\jdk1.7.0. So please change that if necessary.
. JDK 1.7 is needed as it depends on java.nio.file. A good URL is at http://dlc.sun.com.edgesuite.net/jdk7/binaries/index.html.

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

LUA limitation
--------------

General

. Status message is not synchronized with the tool. So to see the status message like "script executed" or otherwise, please apply scroll lock
to the Eclipse output console.

. There are couples of cases where the script will not run succcessfully (with "script executed" displayed) -
1. It seems like Nil is causing the engine to fail either passing as function parameter or concatenated with '..' operator.
Sample workaround is to use 
if(nResp == nil) then nResp = '' end
2. Variable that is not initialiazed properly.

For the former, please do a check against nil and assign a non-nil value accordingly based on the logic of the application. For the latter, 
the workaround is to wrap the variable with tostring() before concatenating.

. LuaJava framework allows the tool to read the status code of script execution but without line error. Thus, there is no line error
displayed by the tool except "script executed" or "script did not run properly". Workaround is to comment and uncomment using
"end function d()" where d is a dummy function name (assuming d is not a real function is any application), until such line where the script
is executed successfully ("script executed" displayed on the console).

FDT

. ".bin" file will not be copied over to Iris image directory. Thus, all .bin which is used in the screen mockup is assumed to exist in Iris's img folder.
. Currently the tool will not generate LUA window based on image widget without "src" tag/value. 
For example -
<widgets xsi:type="model:Image" x="82" y="159"/>
. The toolkit has piggyback Rectangle with alpha blending 0 to map to "Ok" button. This will allow the tool automatically generate the selection based on a rectangle region.
If in the mockup, you need rectangle with alpha 0 but do not mean to be a selection, please use Panel instead.
. Master screen is not supported. However, master screen can be used to visualize for example how the final scenes look like with the background as it will not be converted by FDT.
. Rectangle used for OK region has to be the top most layer in any scene. Otherwise the automatic OK region handler work not function correctly.
. It assumes total (list/text) items are the same as scene counts.
. Currently FDT makes use of the first scene to be the key scene for e.g. text sequencing etc. Thus the text ordering in the first scene matters.
. All text (TextField or TextArea only) will be treated as part of the "List". In FDT, List is an object that has a scrollable text or non-text elements. Thus text that is not meant to be a list element, has to be "merged" into the background as graphics.
. The project name has to be KSSToolkit. This is due to the fact that HTML 5 worker assume so e.g. handling of /resource/KSSToolkit/.
. The tool's "fgColor" has a higher priority than the one set from the codes e.g.
remove the following from the Wireframe's custom property (just the first scene) -
	fgColor='0xffffffff',bgColor='0xff990000'
and set it from the codes like the following -
	img.getC1().setDefaultFontColor("'0xFFb2b2b2'");
	img.getC1().setDefaultFontBgColor("'0xFF333333'");
If one would like the font color set from the code, make sure "fgColor" is removed from the text custom property.
. For automatic scene ("Autoscene") generation, there can not be more than one image in the first scene and the last (second) scene.
. Autoscene does not currently support text.
. Component name (derived from its filename) and its id have to be unique. E.g. img.getC1().setComponentId("L1"). Currently, the id uniqueness is not managed by the KSSToolkit.
. For FIOSConverter:
The output will not be based on the name of the input file *.screen but is hard coded to Mockup.lua.

Known Issue
-----------

Java compilation - 

"The type Collection is not generic; it cannot be parameterized with arguments <? extends E>"
-If this happens to you, please move the JDK (JRE System Library in Eclipse) to the top/first in your classpath.

There seems to be some conflicts with the String.format function. Workaround is to make sure that JDK 1.7 preceeds everything in the classpath.

Lua -

FDT

InitKSS.lua is not read by the framework properly. It is currently commented out in FIOSFactory.
So any script that depends on Java facility from lua will not work until this is resolved.

JavaScript -

.bin file (not valid anymore as Iris 1.0 and later does not depends on such file anymore for images)

For image with extension .bin (thanks to the platform used by FiOS), there will be a warning 
"Resource interpreted as image but transferred with MIME type application/octet-stream.". This does not break anything, and can be safely ignored.

LuaJava -

With jnlua (http://jnlua.luaforge.net/), encounter the following error -

FDT build 100 res. is 704x480 (SD)
TestLua done
javax.script.ScriptException: null:89: attempt to index global 'luajava' (a nil value) in null at line number 89
	at com.naef.jnlua.script.LuaScriptEngine.getScriptException(LuaScriptEngine.java:358)
	at com.naef.jnlua.script.LuaScriptEngine.callChunk(LuaScriptEngine.java:302)
	at com.naef.jnlua.script.LuaScriptEngine.eval(LuaScriptEngine.java:79)
	at javax.script.AbstractScriptEngine.eval(AbstractScriptEngine.java:264)
	at com.google.code.kss.tool.fios.FIOSFactory.runScript(FIOSFactory.java:109)
	at com.google.code.kss.core.util.KSSFactory.runScript(KSSFactory.java:96)
	at com.google.code.kss.TestLua.main(TestLua.java:57)
