package com.google.code.kss.adapter.fios.api;

import com.google.code.kss.tool.fios.FIOS;
import com.google.code.kss.tool.fios.FIOSFactory;

public class VOD {
	
	public static void updateDisplay() {
		//System.out.println(Class.class + " updateDisplay()");
		FIOSFactory.getInstance().saveOutput();
	}

	public static void createVOD(String poster, String asset, int x, int y, int width, int height) {
		try {
			FIOSFactory.getInstance().createVOD(poster, asset, x, y, width, height);
			FIOSFactory.getInstance().saveOutput();		//as for video we don't have something like updateDisplay()
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//not working! signature issue?
	public static void PlayAssetByID(int nContext, String pPID, String pPAID) {
		//createVOD();
	}

	public static void DrawPoster(int iAttributeID, int iWinID, long lAssetID, long lHirarchyID, int x, int y, int width, int height, int alphaBlending) {
	}
}
