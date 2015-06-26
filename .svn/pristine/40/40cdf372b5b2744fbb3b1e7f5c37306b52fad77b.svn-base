package com.google.code.kss.tool.android;

import java.io.File;

import com.google.code.kss.core.util.ClassPathUpdater;
import com.google.code.kss.core.util.FileWatcherCallback;
import com.google.code.kss.core.util.JavaLibraryPath;
import com.google.code.kss.tool.common.ConverterBase;

/*
 * @version $Revision: 100 $ ($Author: ag $)
 * 
 */
public class LibgdxConverter extends ConverterBase implements FileWatcherCallback {

	static {
		try {
			File f = new File(".");
			String path = f.getCanonicalPath() + System.getProperty("file.separator");
			JavaLibraryPath.add(new File(path + "lib"));
			LibgdxConverter.initClasspath();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
		
	public LibgdxConverter() {
		super();
		//nativeSDKHome = Registry.getValue("nativeAPI");
		if(isNativeSDK()) {
			nativeSDKHome = getSDKHome();
		}
		worker = new LibgdxAndroid(this);
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
			ClassPathUpdater.add(rootDir + fs + "img" + fs + "java");
			ClassPathUpdater.add(rootDir + fs + "script" + fs + "java" + fs + "wireframe" + fs + "game1");
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
//				new LibgdxConverter());
		
		 LibgdxConverter con = new LibgdxConverter();
		 int textWindowWidth = 704;
		 int textWindowHeight = 480;
		 String resourceName = "zombie-walk-left-leg-close.screen";
		 con.setInputFile(resourceName);
		 con.setTextWindowWidth(textWindowWidth);
		 con.setTextWindowHeight(textWindowHeight);
		 con.processModify();
	}

}