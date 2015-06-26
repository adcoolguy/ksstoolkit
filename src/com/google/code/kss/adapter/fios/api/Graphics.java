package com.google.code.kss.adapter.fios.api;

import com.google.code.kss.tool.fios.FIOSConverter;
import com.google.code.kss.tool.fios.FIOSFactory;

public class Graphics {

	private static boolean updateDisplay;

	public static void InitWindowAttributes() {
	}

	public static void initResolution(int resWidth, int resHeight) {
		/*		
		Digital TV - SDTV:
			480i - 704x480 interlaced
			480p - 704x480 progressive
		Digital-HDTV:
			720p - 1280x720 progressive
			1080i - 1920x1080 interlaced
			1080p - 1920x1080 progressive
 		*/			
		FIOSFactory.getInstance().init(resWidth, resHeight);
	}
	
	public static void CreateWindow(int iWidth, int iHeight) {
		//System.out.println("CreateWindow 1 " + iWidth + " " + iHeight);
		try {
			FIOSFactory.getInstance().createWindow(0, 0, iWidth, iHeight);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void CreateWindow(int iLayerNumber, int iAttributeID, long lParentHandle, int iX, int iY, int iWidth, int iHeight) throws Exception {
//		System.out.println("Graphics.CreateWindow 1 FIOSFactory.getInstance() " + FIOSFactory.getInstance());
		//for now attribute is just if else blocks
		if(iAttributeID == 0) {
			FIOSFactory.getInstance().setRGB(0, 0, 200);
		} else
		if(iAttributeID == 1) {
			FIOSFactory.getInstance().setRGB(0, 200, 0);
		} else
		if(iAttributeID == 2) {
			FIOSFactory.getInstance().setRGB(200, 0, 0);
		} else {
			FIOSFactory.getInstance().setRGB(0, 0, 0);
		}
//		System.out.println("Graphics.CreateWindow 2");

		try {
			FIOSFactory.getInstance().createWindow(iX, iY, iWidth, iHeight);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		}
//		System.out.println("Graphics.CreateWindow 3 done :)");
	}

	public static void drawBackground(int iX, int iY, int iWidth, int iHeight) {
		try {
			FIOSFactory.getInstance().drawBackground(iX, iY, iWidth, iHeight);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void setUpdateDisplay(boolean updateDisplay) {
		Graphics.updateDisplay = updateDisplay;		
	}
	
	public static boolean isUpdateDisplay() {
		return updateDisplay;
	}

	public static void updateDisplay() {
		//System.out.println(Class.class + " updateDisplay()");
		//FIOSFactory.getInstance().saveOutput();	//will cause "Error: Error calling method on NPObject!" in Java applet due to local file access issue
	}
	
	public static void DrawImageExByID(int g_Window_Attribute, long g_Window_Handle, int imageID, int x, int y, int width, int height, int alphaBlending) throws Exception {
		//TBD
		CreateWindow(-1, g_Window_Attribute, g_Window_Handle, x, y, width, height);
	}
	
	public static void DrawString(int iAttributeID, int iWinID, int x, int y, int width, int height, String pFontColor, String pFontBgColor, int wFontCode, int dwFlags, String szText) {
		//TBD
		try {
			FIOSFactory.getInstance().drawString(x, y, width, height, szText);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/*
	 * Get the font style related to the passed font size.
	 * 
	 * Also support only the size that is only valid for Iris FiOS.
	 */
	public static int getFontStyle(int fontSize) {
		System.out.println("Graphics.getFontStyle invoked with fontSize " + fontSize);
		int retVal = -1;
		int MIN_FONT_SIZE = 14;
		int MAX_FONT_SIZE = 25;
	
		switch (fontSize) {
		case 14:
			retVal = 3;
			break;
		case 15:
			retVal = 4;
			break;
		case 16:
			retVal = 1;
			break;
		case 17:
			retVal = 5;
			break;
		case 18:
			retVal = 0;
			break;
		case 19: //page 24 "FiOS TV Widgets API Reference" written as 16, could be a typo
			retVal = 6;
			break;
		case 20:
			retVal = 2;
			break;
		case 22:
			retVal = 7;
			break;
		case 24:
		case 25:
		case 26:
			retVal = 8;
			break;
		default:
			if (fontSize >= MAX_FONT_SIZE) {
				retVal = 8;
			} else if (fontSize <= MIN_FONT_SIZE) {
				retVal = 3;
			} else {
				retVal = 3;	//all default are size 14
			}
		}
	
		//TODO begin - due to bug in Iris emulator, the font size is not correct
		if(fontSize >= 16) {
			retVal = 8;
		} else
		if(fontSize == 14){
			retVal = 7;
		} else
		if(fontSize == 13){
			retVal = 2;
		} else
		if(fontSize == 12){
			retVal = 6;
		} else
		if(fontSize == 11){
			retVal = 0;
		} else
		if(fontSize == 10){
			retVal = 5;
		} else
		if(fontSize == 9){
				retVal = 1;
		} else
		if(fontSize == 8){
			retVal = 4;
		}
		//TODO end
		
		return retVal;
	}
	
}
