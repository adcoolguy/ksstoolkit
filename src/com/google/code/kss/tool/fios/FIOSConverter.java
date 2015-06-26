package com.google.code.kss.tool.fios;

import java.awt.Color;
import java.io.File;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.prefs.BackingStoreException;

import net.infotrek.util.WindowsRegistry;

import org.apache.commons.io.FileUtils;

import com.google.code.kss.adapter.fios.api.Graphics;
import com.google.code.kss.core.model.ui.wireframesketcher.Screen;
import com.google.code.kss.core.model.ui.wireframesketcher.Widgets;
import com.google.code.kss.core.util.ClassPathUpdater;
//import com.google.code.kss.core.util.FileWatcher;
import com.google.code.kss.core.util.FileWatcherCallback;
import com.google.code.kss.core.util.JavaLibraryPath;
import com.google.code.kss.core.util.Registry;
import com.google.code.kss.tool.common.Converter;
import com.google.code.kss.tool.common.ConverterBase;
import com.google.code.kss.tool.ide.Wireframesketcher;
import com.google.code.kss.tool.common.ConverterBase.ViewType;
import static com.google.code.kss.core.util.CommonUtil.FS;

/*
 * @version $Revision: 100 $ ($Author: fios $)
 * 
 */
public class FIOSConverter extends ConverterBase implements FileWatcherCallback {

	static {
		try {
			File f = new File(".");
			String path = f.getCanonicalPath() + System.getProperty("file.separator");
			JavaLibraryPath.add(new File(path + "lib"));
			FIOSConverter.initClasspath();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
		
	/**
	 * 
	 */
	public static void initClasspath() {
		File f = new File(".");
		String rootDir = null;
		String fs = System.getProperty("file.separator");
		try {
			rootDir = f.getCanonicalPath();
			ClassPathUpdater.add(rootDir);
			ClassPathUpdater.add(rootDir + fs + "script" + fs + "lua" + fs + "fdt");
			ClassPathUpdater.add(rootDir + fs + "script" + fs + "lua" + fs + "idea");
			ClassPathUpdater.add(rootDir + fs + "img" + fs + "lua");
			ClassPathUpdater.add(rootDir + fs + "script" + fs + "lua" + fs + "wireframe");
			ClassPathUpdater.add(rootDir + fs + "script" + fs + "javascript" + fs + "fdt");
			ClassPathUpdater.add(rootDir + fs + "script" + fs + "lua" + fs + "wireframe" + fs + "FiOSTV");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public final String getSDKHome() {
		String retVal = null;
		
		retVal = System.getProperty("Iris");
		if(retVal == null) {
			try {
				retVal = WindowsRegistry.getKeySz(WindowsRegistry.HKEY_CURRENT_USER, "SOFTWARE\\Verizon\\Iris Emulator", "InstallPath");
			} catch (BackingStoreException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return retVal;
	}

	public static void main(String[] args) {
		System.out.println("OS name is '" + System.getProperty("os.name") + "' version '" + System.getProperty("os.version") + "'");
		String scannedDir = "./script/lua/wireframe";
		FIOSConverter con = new FIOSConverter();
//		con.setDefaultFontColor("'0x00550000'"); //purple color
//		con.setDefaultFontColor("'0xFF999999'"); //white color
//		con.setDefaultFontColor("'0xFFb2b2b2'"); //gray color
//		con.setDefaultFontColor("'0xFF333333'"); //black color
		String resourceName = "Login13.screen";
		int textWindowWidth = 704;
		int textWindowHeight = 480;
		con.setInputFile(resourceName);
		con.setTextWindowWidth(textWindowWidth);
		con.setTextWindowHeight(textWindowHeight);
		
		System.out.println("Target resource = " + resourceName);
//		FileWatcher.start(new File(scannedDir).getAbsolutePath(), con);
//		 con.setInputFile("Login13.screen");
		 con.processModify();
	}

	public FIOSConverter() {
		super();
		worker = new FIOSLua(this);
	}

	private void initNativeSDK() {
		if(isNativeSDK()) {
			nativeSDKHome = getSDKHome();
		}
	}
	
	public void setNativeSDK(boolean nativeSDK) {
		super.setNativeSDK(nativeSDK);
		initNativeSDK();
	}
	
	public String getFiosIrisHome() {
		return nativeSDKHome;
	}
	
	@Override
	public void processCreate() {

	}
	
	@Override
	public void processDelete() {

	}
	
	@Override
	public void processModify() {
		worker.addHeader(totalScene, listTextName, releaseNumber, useIDEText, standalone);
		modify(getComponentId());
		worker.addFooter(appendFlag, totalScene, cmPrefix, rectangleOKRegion, listTextName, useIDEText, mode, standalone, textWindowWidth, textWindowHeight);
	}
	
	@Override
	public void processOverflow() {
	}
	
	public String getComponentId() {
		return worker.getComponentId();
	}

	public void setComponentId(String componentId) {
		worker.setComponentId(componentId);
	}
	
	public boolean isHideCommonCode() {
		return worker.isHideCommonCode();
	}

	public void setHideCommonCode(boolean hideCommonCode) {
		worker.setHideCommonCode(hideCommonCode);
	}
	
}