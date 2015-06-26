package com.google.code.kss.tool.webkit;

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
public class HTMLConverter extends ConverterBase implements FileWatcherCallback {

	static {
		try {
			File f = new File(".");
			String path = f.getCanonicalPath() + System.getProperty("file.separator");
			JavaLibraryPath.add(new File(path + "lib"));
			HTMLConverter.initClasspath();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
		
	public HTMLConverter() {
		super();
		//nativeSDKHome = Registry.getValue("nativeAPI");
		if(isNativeSDK()) {
			nativeSDKHome = getSDKHome();
		}
		worker = new HTML5Javascript(this);
	}
	

	@Override
	public void processCreate() {

	}

	@Override
	public void processDelete() {

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
	
	@Override
	public void processModify() {
		worker.addHeader(totalScene, listTextName, releaseNumber, useIDEText, standalone);
		modify(getComponentId());
		worker.addFooter(appendFlag, totalScene, cmPrefix, rectangleOKRegion, listTextName, useIDEText, mode, standalone, textWindowWidth, textWindowHeight);
	}
	
	public String getNativeSDKHome() {
		return nativeSDKHome;
	}
	
	public static void initClasspath() {
		File f = new File(".");
		String rootDir = null;
		String fs = System.getProperty("file.separator");
		try {
			rootDir = f.getCanonicalPath();
			ClassPathUpdater.add(rootDir);
			ClassPathUpdater.add(rootDir + fs + "img" + fs + "lua");
			ClassPathUpdater.add(rootDir + fs + "script" + fs + "lua" + fs + "wireframe");
			ClassPathUpdater.add(rootDir + fs + "script" + fs + "javascript" + fs + "fdt");
			ClassPathUpdater.add(rootDir + fs + "script" + fs + "lua" + fs + "wireframe" + fs + "FiOSTV");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public final String getSDKHome() {
		return null;
	}
	
	public static void main(String[] args) {
		System.out.println("OS name is '" + System.getProperty("os.name") + "' version '" + System.getProperty("os.version") + "'");
//		FileWatcher.start(new File("./script/lua").getAbsolutePath(),
//				new FIOSConverter());
		
		 HTMLConverter con = new HTMLConverter();
		 int textWindowWidth = 704;
		 int textWindowHeight = 480;
		 String resourceName = "Login13.screen";
		 con.setInputFile(resourceName);
		 con.setTextWindowWidth(textWindowWidth);
		 con.setTextWindowHeight(textWindowHeight);
		 con.processModify();
	}

}