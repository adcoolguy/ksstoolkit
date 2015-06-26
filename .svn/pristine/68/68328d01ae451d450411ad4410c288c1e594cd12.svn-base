package com.google.code.kss;

import java.io.File;

import com.google.code.kss.core.util.JavaLibraryPath;
import com.google.code.kss.core.util.KSSFactory;
import com.google.code.kss.tool.fios.FIOSConverter;
import com.google.code.kss.tool.fios.FIOSFactory;

/**
 * This sample test program demonstrate the capability of FiOS Development Toolkit (FDT).
 * 
 * Dependencies - 
 * 
 * LuaJava 1.1 (luajava-1.1-win32-lua51.zip) available at http://luaforge.net/frs/?group_id=10.
 * Lua Java Scripting Engine (luaScriptEngine.jar) available at http://www.cynicalmonkey.com/lua-engine/.
 * 
 */
public class TestLua {
	static {
		try {
			File f = new File(".");
			String path = f.getCanonicalPath() + System.getProperty("file.separator");
			JavaLibraryPath.add(new File(path + "lib"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		FIOSConverter.initClasspath();
		try {
			int buildNum = 100;
			System.out.println("FDT build " + buildNum + " res. is 704x480 (SD)");
			//initialize the KSS framework
			FIOSFactory app = new FIOSFactory(KSSFactory.getManager());
			KSSFactory.setFactory(app);
			KSSFactory.loadObject("FDT.lua");	//common lua handlers not available in Fios SDK
			//setup any abstracted API needed by the script - for now, this step is manual
			KSSFactory.loadObject("Util.lua");
			KSSFactory.loadObject("Graphics.lua");
			KSSFactory.loadObject("EPG.lua");
			KSSFactory.loadObject("VOD.lua");
			KSSFactory.loadObject("Timer.lua");
			KSSFactory.loadObject("Network.lua");
			//showtime!
//			KSSFactory.loadScript("simple.lua");
			KSSFactory.loadScript("test.lua");
//			KSSFactory.loadScript("Keyboard.lua");
//			KSSFactory.loadScript("Sudoku.lua");
//			KSSFactory.execute();
//			KSSFactory.loadScript("testjava.lua");
//			KSSFactory.loadScript("NEW_VERIZON_DEMO.lua");
//			KSSFactory.loadScript("List.lua");
//			KSSFactory.loadScript("WIDGET-0.1.lua");
			KSSFactory.runScript();
			System.out.println("TestLua done");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
//			KSSFactory.loadScript("C:/Verizon/Samples/blinkInput.lua");
//			KSSFactory.loadScript("C:/Verizon/Samples/downloadFile.lua");
//			KSSFactory.loadScript("C:/Verizon/Samples/drawAxis.lua");
//			KSSFactory.loadScript("C:/Verizon/Samples/drawRect.lua");
//			KSSFactory.loadScript("C:/Verizon/Samples/input.lua");
//			KSSFactory.loadScript("C:/Verizon/Samples/list.lua");
//			KSSFactory.loadScript("C:/Verizon/Samples/list_1.0.lua");
//			KSSFactory.loadScript("C:/Verizon/Samples/network.lua");
//			KSSFactory.loadScript("C:/Verizon/Samples/networkImage.lua");
//			KSSFactory.loadScript("C:/Verizon/Samples/nonslidinglist 2.0.lua");
//			KSSFactory.loadScript("C:/Verizon/Samples/nonSlidingNoImages.lua");
//			KSSFactory.loadScript("C:/Verizon/Samples/objectTextWidget.lua");
//			KSSFactory.loadScript("C:/Verizon/Samples/objectTextWidget_1.lua");
//			KSSFactory.loadScript("C:/Verizon/Samples/prog1.lua");
//			KSSFactory.loadScript("C:/Verizon/Samples/prog2.lua");
//			KSSFactory.loadScript("C:/Verizon/Samples/sci-uc1.lua");
//			KSSFactory.loadScript("C:/Verizon/Samples/sci-uc2-text-scroller.lua");
//			KSSFactory.loadScript("C:/Verizon/Samples/usingText.lua");
			

}
