package com.google.code.kss.tool.common;

import static com.google.code.kss.core.util.CommonUtil.FS;

import java.awt.Color;
import java.io.File;
import java.net.URL;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Random;

import org.apache.commons.io.FileUtils;
import org.simpleframework.xml.Serializer;
import org.simpleframework.xml.core.Persister;

import com.appspot.cloudserviceapi.common.StringUtil;
import com.google.code.kss.adapter.fios.api.Graphics;
import com.google.code.kss.core.model.ui.wireframesketcher.Panels;
import com.google.code.kss.core.model.ui.wireframesketcher.Screen;
import com.google.code.kss.core.model.ui.wireframesketcher.Story;
import com.google.code.kss.core.model.ui.wireframesketcher.Widgets;
import com.google.code.kss.core.util.ClassPathUpdater;
import com.google.code.kss.core.util.GraphicsUtil;
import com.google.code.kss.core.util.ImageUtil;
import com.google.code.kss.tool.fios.FIOSConverter;
import com.google.code.kss.tool.fios.FIOSLua;

/**
 * This class converts WireframeSketcher's .screen file into Java object model.
 * 
 * Dependency -
 * 
 * Simple XML framework (http://simple.sourceforge.net/).
 * 
 */
public class ConverterBase {

	protected static double releaseNumber = 0.26;
	private Story story;
	private Screen screen;
	// private StringBuffer finalJSCodes = new StringBuffer();
	protected boolean appendFlag;
	protected String inputFile;
	protected int wCount = 0;
	/** native SDK present or otherwise */
	protected boolean nativeSDK;
	protected String nativeSDKHome;
	protected String nativeSDKImageDirName = "Img";
	protected int totalScene = 1;
	protected int currentScene = 0;
	protected String cmPrefix = "";
	protected Integer textFieldCount;
	protected int textAreaCount = 0;
	protected Integer[] rectangleOKRegion;
	protected String rectangleOKRegionFontColor;
	protected int rectangleOKRegionLineWidth;
	protected int previousTextFieldY = 0;
	protected int previousTextAreaY = 0;
	protected int textHeightDifference;
	protected boolean useIDEText = true;
	protected String[][] uiText;
	protected static String listTextName = "LstTxt";
	protected static String lastSceneName = null;
	protected String defaultFontColor = "'0x00000000'";
	protected String defaultFontBgColor = "'0x00000000'";
	protected ViewType mode = ViewType.HORIZONTAL_LISTVIEW;
	protected int textWindowWidth;
	protected int textWindowHeight;
	public enum ViewType {
		VERTICAL_LISTVIEW, HORIZONTAL_LISTVIEW
	};

	protected boolean standalone = true;
	protected Converter worker;
	private int currentAutoScenePos = 0;
	private int autoScene = -1;
	// UI annotations in the custom properties of wireframesketcher
	public static final String DO_NOT_CONVERT = "x";
	public static final String BACKGROUND_ONLY = "bg";
	
	public int getAutoScene() {
		return autoScene;
	}

	public void setAutoScene(int autoScene) {
		this.autoScene = autoScene;
	}
	
	public boolean isImageReduction() {
		return worker.isImageReduction();
	}

	public void setImageReduction(boolean imageReduction) {
		worker.setImageReduction(imageReduction);
	}

	public boolean isNativeSDK() {
		return nativeSDK;
	}

	public void setNativeSDK(boolean nativeSDK) {
		this.nativeSDK = nativeSDK;
	}
	
/*	public String getComponentId() {
		return componentId;
	}

	public void setComponentId(String componentId) {
		this.componentId = componentId;
	}
*/
	public void setStory(Story story) throws Exception {
		if (story == null) {
			throw new Exception("Story is NULL!");
		}
		Serializer serializer = new Persister();
		System.out.println("story name = '" + story.getName() + "'");
		try {
			URL source = ClassLoader.getSystemResource(story.getName());
			if (source == null) {
				throw new Exception("Story file '" + story.getName()
						+ "' is invalid or does not exist!");
			}
			this.story = serializer.read(Story.class, new File(source.toURI()));
		} catch (Exception e) {
			System.err.println("Convertor story constructor exception: " + e
					+ " (is the directory where " + story.getName()
					+ " file resides part of the classpath?)");
			throw e;
		}
	}

	public void setScreen(Screen screen) throws Exception {
		Serializer serializer = new Persister();
		if(screen == null || screen.getName() == null) {
			throw new Exception("Screen file must not be NULL or empty.");
		}
		System.out.println("screen name = '" + screen.getName() + "'");
		URL source = ClassLoader.getSystemResource(screen.getName());
		try {
			this.screen = serializer.read(Screen.class,
					new File(source.toURI()));
		} catch (Exception e) {
			System.err.println("Convertor screen constructor exception: " + e
					+ " (is the directory where " + screen.getName()
					+ " file resides part of the classpath?)");
		}
	}

	public ConverterBase() {
	}

	public Screen getScreen() {
		return screen;
	}

	public Story getStory() {
		return story;
	}

	/*
	 * public String getImageFileName(String src) { int begin, end; String
	 * retVal = src; if (src != null) { begin = src.lastIndexOf("/"); retVal =
	 * src.substring(begin + 1, src.length()); } return retVal; }
	 */
	/**
	 * Filter the full path away. Example returned value is like List.png.
	 * 
	 * @param src
	 * @return
	 */
	public String getStoryFileName(String src) {
		int begin, end;
		String retVal = src;
		if (src != null) {
			begin = src.lastIndexOf("/");
			end = src.toLowerCase().lastIndexOf(".story");
			retVal = src.substring(begin + 1, end);
		}
		return retVal;
	}

	public static void main(String[] args) {
		try {
			Screen s = new Screen();
			s.setName("Mockup.screen");
			ConverterBase c = new ConverterBase();
			Screen scr = null;
			if ((scr = c.getScreen()) != null) {
				System.out.println("widget count = " + scr.getWidgets().size());
				Iterator it = scr.getWidgets().iterator();
				Widgets w = null;
				int count = 0;
				String temp = null;
				while (it.hasNext()) {
					w = (Widgets) it.next();
					temp = "widget " + ++count + " type " + w.getType() + " x "
							+ w.getX() + " y " + w.getY() + " width "
							+ w.getMeasuredWidth() + " height "
							+ w.getMeasuredHeight();
					if ("model:Image".equals(w.getType()))
						temp = temp + " src " + w.getSrc();
					System.out.println(temp);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void handleTextArea(Widgets w, StringBuffer finalLUACodes,
			Object object) {
	}

	public void addRectangeOKRegionHandler(Widgets w,
			StringBuffer rectangleOKRegionHandlerLUACodes) {
	}

	public boolean isStandalone() {
		return standalone;
	}

	public void setStandalone(boolean standalone) {
		this.standalone = standalone;
	}

	public ViewType getMode() {
		return mode;
	}

	public void setMode(ViewType mode) {
		this.mode = mode;
	}

	public static String getListTextName(String componentId) {
		listTextName = "g_FDT"+ componentId+"_ListText"
		+ getImageNameMagicNumber(String.valueOf(releaseNumber));
		
		return listTextName;
	}

	public static String getLastScene(String componentId) {
		lastSceneName = "g_FDT" + componentId + "_Last_Screen";
		
		return lastSceneName;
	}
	
	public static String getForwardStopper(String componentId) {
		return "g_FDT" + componentId + "_Scroll_FWDAllowed";
	}
	
	public static String getBackwardStopper(String componentId) {
		return "g_FDT" + componentId + "_Scroll_BWDAllowed";
	}
	
	public void setOutputFile(String outputFile) {
		worker.setOutputFile(outputFile);
	}

	public void setInputFile(String inputFile) {
		this.inputFile = inputFile;
	}

	public void setTextWindowWidth(int textWindowWidth) {
		this.textWindowWidth = textWindowWidth;
	}
	
	public void setTextWindowHeight(int textWindowHeight) {
		this.textWindowHeight = textWindowHeight;
	}
	
	public Converter getWorker() {
		return worker;
	}

	public void setWorker(Converter worker) {
		this.worker = worker;
	}

	public Integer[] getRectangleOKRegion() {
		return rectangleOKRegion;
	}

	public void setRectangleOKRegion(Integer[] rectangleOKRegion) {
		this.rectangleOKRegion = rectangleOKRegion;
	}

	public String[][] getUiText() {
		return uiText;
	}

	public void setUiText(String[][] uiText) {
		this.uiText = uiText;
	}

	public boolean isAppendFlag() {
		return appendFlag;
	}

	public void setAppendFlag(boolean appendFlag) {
		this.appendFlag = appendFlag;
	}

	public int getTotalScene() {
		return totalScene;
	}

	public void setTotalScene(int totalScene) {
		this.totalScene = totalScene;
	}

	public String getCmPrefix() {
		return cmPrefix;
	}

	public void setCmPrefix(String cmPrefix) {
		this.cmPrefix = cmPrefix;
	}

	public int getCurrentScene() {
		return currentScene;
	}

	public void setCurrentScene(int currentScene) {
		this.currentScene = currentScene;
	}

	public boolean isUseIDEText() {
		return useIDEText;
	}

	public void setUseIDEText(boolean useIDEText) {
		this.useIDEText = useIDEText;
	}

	public String getDefaultFontColor() {
		return defaultFontColor;
	}

	public void setDefaultFontColor(String defaultFontColor) {
		this.defaultFontColor = defaultFontColor;
	}

	public String getDefaultFontBgColor() {
		return defaultFontBgColor;
	}

	public void setDefaultFontBgColor(String defaultFontBgColor) {
		this.defaultFontBgColor = defaultFontBgColor;
	}

	/**
	 * Filter the full path away. Example returned value is like List.png.
	 * 
	 * @param src
	 * @return
	 */
	// TODO need to put this into FileUtil!
	public String getImageFileName(String src) {
		int begin;
		String retVal = src;
		if (src != null) {
			begin = src.lastIndexOf(FS);
			if (begin == -1) {
				begin = src.lastIndexOf("/"); // for Wireframesketcher's path, I
				// know this could be redundant
				// if FS is already "/"
			}
			retVal = src.substring(begin + 1, src.length());
		}
		return retVal;
	}

	/**
	 * Filter the full path and the extension away.
	 * 
	 * @param src
	 * @return
	 */
	public String getImageName(String src) {
		int begin, end;
		String retVal = src;
		if (src != null) {
			begin = src.lastIndexOf(FS);
			if (begin == -1) {
				begin = src.lastIndexOf("/"); // for Wireframesketcher's path, I
				// know this could be redundant
				// if FS is already "/"
			}
			end = src.toLowerCase().lastIndexOf(".bin");
			if (end > -1) {
				retVal = src.substring(begin + 1, end);
			} else {
				// === handle file which is not .bin
				end = src.toLowerCase().lastIndexOf(".png");
				if (end == -1)
					end = src.toLowerCase().lastIndexOf(".jpg");
				if (end == -1)
					end = src.toLowerCase().lastIndexOf(".gif");
				if (end == -1)
					end = src.toLowerCase().lastIndexOf(".bmp");

				if (end != -1) {
					retVal = src.substring(begin + 1, end);
				}
			}
		}

		return retVal;
	}

	/**
	 * This function will help to provide ability to use user-friendly name in
	 * image file name.
	 * 
	 * @param src
	 * @return
	 */
	public static long getImageNameMagicNumber(String src) {
		long retVal = 0;
	
		if (src != null) {
			// === begin TBD
			// could be smarter but hey as long as it works
			for (int i = 0; i < src.length(); i++) {
				retVal += src.charAt(i);
			}
			// === end TBD
			Random generator = new Random(retVal);
			retVal = generator.nextInt(10000) + 10000;
		}

		return retVal;
	}

	public boolean isBinImageFile(String src) {
		boolean retVal = false;

		if (src != null && src.lastIndexOf(".bin") > -1)
			retVal = true;

		return retVal;
	}

	public String handleImage(Widgets w) {
		String retVal = w.getSrc();
		if (w.getSrc() != null) {
			try {
				if (w.getGrayscale()) {
					String temp1 = getImageFileName(w.getSrc());
					String temp2 = GraphicsUtil.toGrayScaleImage(temp1);
					if (isNativeSDK()) {
						copyImageFile(temp2);
					}
					retVal = getImageName(temp2);
				} else if(worker.isImageReduction()) {
					String temp1 = w.getSrc();
					try {
						//TODO buggy - gives "java.lang.IllegalArgumentException: Width (0) and height (8) must be non-zero" error
						temp1 = ImageUtil.reduce(getImageFileName(w.getSrc()), w, 0.7f);
					} catch (Exception e) {
						e.printStackTrace();
					}
					if (isNativeSDK()) {
						copyImageFile(temp1);
					}
					retVal = getImageName(temp1);
				} else 
					/* if (!isBinImageFile(w.getSrc()))*/ {
					if (isNativeSDK()) {
						copyImageFile(w.getSrc());
					}
					retVal = getImageName(w.getSrc());
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return retVal;
	}

	/**
	 * Copy the image resource into the Iris image folder.
	 * 
	 * @param source
	 *            the name of the source file including its path (e.g.
	 *            /background.png)
	 * @return
	 * @throws Exception
	 */
	public void copyImageFile(String source) throws Exception {
		if (source != null) {
			if (nativeSDKHome != null && !"".equals(nativeSDKHome.trim())) {
				File srcFile = null;
				File destFile = null;
				try {
					URL src = ClassLoader
							.getSystemResource(getImageFileName(source));
					if (src != null) { // === workaround for issue
						// http://code.google.com/p/ksstoolkit/issues/detail?id=1
						srcFile = new File(src.toURI());
						String target = String
								.valueOf(getImageNameMagicNumber(getImageName(source)))
								+ ".png"; // TODO this might or might not render
						// properly if it is not png!!!
						destFile = new File(nativeSDKHome.trim() + FS
								+ nativeSDKImageDirName + FS + target);
						FileUtils.copyFile(srcFile, destFile);
						System.out.println("##### " + srcFile.toPath()
								+ " copied as " + destFile.toPath() + " #####");
					}
				} catch (Exception e) {
					System.err.println("Error while creating image file '"
							+ destFile + "' (source '" + srcFile
							+ "') to Native home directory '" + nativeSDKHome
							+ "':");
					e.printStackTrace();
				}
			} else {
				throw new Exception("Native home is not set!");
			}
		}
	}

	/**
	 * Copy the .bin resource into native image folder.
	 * 
	 * @param source
	 *            the name of the source file including its path (e.g.
	 *            /background.png)
	 * @return
	 * @throws Exception
	 * @deprecated
	 */
	public void copyBINImageFile(String source) throws Exception {
		if (source != null) {
			if (nativeSDKHome != null && !"".equals(nativeSDKHome.trim())) {
				File srcFile = null;
				File destFile = null;
				try {
					URL src = ClassLoader
							.getSystemResource(getImageFileName(source));
					if (src != null) { // === workaround for issue
						// http://code.google.com/p/ksstoolkit/issues/detail?id=1
						srcFile = new File(src.toURI());
						String target = String
								.valueOf(getImageNameMagicNumber(getImageName(source)))
								+ ".bin";
						destFile = new File(nativeSDKHome.trim() + FS
								+ nativeSDKImageDirName + FS + target);
						FileUtils.copyFile(srcFile, destFile);
						System.out.println("##### " + srcFile.toPath()
								+ " copied as " + destFile.toPath() + " #####");
					}
				} catch (Exception e) {
					System.err.println("Error while creating image file '"
							+ destFile + "' (source '" + srcFile
							+ "') to Native home directory '" + nativeSDKHome
							+ "':");
					e.printStackTrace();
				}
			} else {
				throw new Exception("Native home is not set!");
			}
		}
	}

	public String getText(int scene, int index) {
		String retVal = null;

		try {
			retVal = uiText[scene - 1][index - 1];
		} catch (Exception e) {
			// e.printStackTrace();
			retVal = e.getMessage() + " .............."; // bab bad I know
		}

		return retVal;
	}

	/**
	 * This assumes that no text overlaps with each others.
	 * 
	 * @param x
	 * @param y
	 * @param componentId 
	 * @return
	 */
	public String getTextName(int x, int y, String componentId) {
		//TODO componentId needs to be unique
		return "g_FDT" + componentId + "_Text" + x + y;
	}

	public String getFontColor(Widgets w) {
		String retVal = defaultFontColor;
		String key = "fgColor";

		// TODO will put back getting from IDE once it is supported by wireframe
		String temp = null; // Wireframesketcher.getProperty(w, key);

		// if(temp != null) {
		// retVal = temp;
		// } else {
		temp = w.getForeground();
		if (temp != null) {
			retVal = "'" + FIOSConverter.getColorCode(temp) + "'";
		} else {
			if (defaultFontColor != null && !"".equals(defaultFontColor)) {
				retVal = defaultFontColor;
			} else {
				// assumption: default color in IDE should be black
				retVal = "'0xFF333333'";
			}
		}
		// }

		System.out.println(key + "=" + retVal);

		return retVal;
	}

	public String getFontBgColor(Widgets w) {
		String retVal = defaultFontBgColor;
		String key = "bgColor";

		// TODO will put back getting from IDE once it is supported by wireframe
		// String temp = Wireframesketcher.getProperty(w, key);

		// if(temp != null) {
		// retVal = temp;
		// }

		System.out.println(key + "=" + retVal);

		return retVal;
	}

	public static String getColorCode(String wireframeSketcherColorCode) {
		Color c = Color.decode(wireframeSketcherColorCode);
		return "0x" + Integer.toHexString(c.getRGB() & 0xffffffff);
//		return "0xFF" + Integer.toHexString(c.getRGB() & 0x00ffffff);    
	}

	// TODO need to support newline character somehow
	public String filterIDEText(String text) {
		text = text.replace("&#xA", " ").replace("\r", " ").replace("\n", " ");
		//=== does not support characters over 126 (source: https://www22.verizon.com/fiosdeveloper/General/Forum/ViewTopic_Posts.aspx?cid=24&fid=96)
		try {
			text = StringUtil.safeString(text);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return text.replace("'", "\\'");
	}

	/**
	 * Generate LUA script without scene support.
	 * @param componentId 
	 */
	public void modify(String componentId) {
		try {
			Graphics.initResolution(704, 480); // TBD - should not have to do
			// this!!!
			Screen scr = new Screen();
			scr.setName(inputFile);
			setScreen(scr);
			if ((scr = getScreen()) != null) {
				System.out.println("widget count = " + scr.getWidgets().size());
				Iterator<?> it = scr.getWidgets().iterator();
				Widgets w = null;
				String imgName = null;
				textFieldCount = 0;
				currentScene = 1;
				while (it.hasNext()) {
					w = (Widgets) it.next();
					imgName = handleImage(w);
					worker.convert(w, wCount, rectangleOKRegion, imgName,
							cmPrefix, textFieldCount, currentScene, useIDEText,
							uiText, getListTextName(componentId));
					wCount++;
				}
				// if(textFieldCount > 0) {
				// addTextConstants();
				// }
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * Generate LUA script with basic scene support.
	 * @param componentId 
	 */
	public void modifyScene(String componentId) {
		try {
			Graphics.initResolution(704, 480); // TBD - should not have to do
			// this!!!
			Screen scr = new Screen();
			scr.setName(inputFile);
			setScreen(scr);
			if ((scr = getScreen()) != null) {
				System.out.println("widget count = " + scr.getWidgets().size());
				Iterator<?> it = scr.getWidgets().iterator();
				Widgets w = null;
				String imgName = null;
				textFieldCount = new Integer(0);
				while (it.hasNext()) {
					w = (Widgets) it.next();
					imgName = handleImage(w);
					worker.convertScene(w, wCount, rectangleOKRegion, imgName,
							cmPrefix, textFieldCount, currentScene, useIDEText,
							uiText, getListTextName(componentId), totalScene);
					wCount++;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * Generate LUA script with automatic continuous scene support.
	 * 
	 * @param totalAutoScene
	 * @param stepAutoScene
	 * @param w1
	 * @param componentId 
	 */
	public void modifyAutoScene(AxisPlane mode, int totalAutoScene,
			int stepAutoScene, Widgets w1, Widgets w2, String componentId) {
		try {
			worker.setAutoScene(autoScene);
			System.out.println("widget to be auto generated = "
					+ totalAutoScene);
			String imgName = null;
			textFieldCount = new Integer(0);
			int originalX = -1, originalY = -1;
			if (mode == AxisPlane.X) {
				originalX = w1.getX();
				w1.setX(w1.getX() + currentAutoScenePos * stepAutoScene);
			} else if (mode == AxisPlane.Y) {
				originalY = w1.getY();
				w1.setY(w1.getY() + currentAutoScenePos * stepAutoScene);
			} else {
				throw new Exception(
						"Plane of axis for auto scene generation can not be empty or NULL!");
			}
			//automatic continous scenes
			currentAutoScenePos++;
			imgName = handleImage(w1);
			worker.convertScene(w1, wCount, rectangleOKRegion, imgName,
					cmPrefix, textFieldCount, currentScene, useIDEText, uiText,
					getListTextName(componentId), totalScene);
			wCount++;
//			System.out.println("currentAutoScenePos " + currentAutoScenePos + " wCount " + wCount);
			if (mode == AxisPlane.X) {
			} else if (mode == AxisPlane.Y) {
				w1.setY(originalY);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void addFooter(String componentId, AxisPlane autoScenePlane, int textWindowWidth, int textWindowHeight) {
		worker.addFooter(appendFlag, totalScene, cmPrefix, rectangleOKRegion,
				getListTextName(componentId), useIDEText, mode, standalone, textWindowWidth, textWindowHeight);
	}

	public void addSceneHeader() {
		worker.addSceneHeader(cmPrefix, currentScene);
	}

	public void addSceneFooter() {
		worker.addSceneFooter();
	}

	public void addHeader(String componentId) {
		worker.addHeader(totalScene, getListTextName(componentId), releaseNumber, useIDEText,
				standalone);
	}

	public AxisPlane getContinuosAxisPlane() {
		return worker.getContinuosAxisPlane();
	}

	public void setContinuosAxisPlane(AxisPlane continuosAxisPlane) {
		worker.setContinuosAxisPlane(continuosAxisPlane);
	}

	public void convertContinuousAutoScene(String imgName, AxisPlane autoScenePlane) {
		worker.convertContinuousAutoScene(imgName, autoScenePlane);
	}
	
	public Widgets getFirstModelWidget() {
		return worker.getFirstModelWidget();
	}
	
	public void setFirstModelWidget(Widgets modelWidget) {
		worker.setFirstModelWidget(modelWidget);
	}
	
	public Widgets getLastModelWidget() {
		return worker.getLastModelWidget();
	}
	
	public void setLastModelWidget(Widgets modelWidget) {
		worker.setLastModelWidget(modelWidget);
	}

	public String getTargetListName() {
		return worker.getTargetListName();
	}

	public void setTargetListName(String targetListName) {
		worker.setTargetListName(targetListName);
	}

	public String getTargetLastSceneName() {
		return worker.getTargetLastSceneName();
	}

	public void setTargetLastSceneName(String targetLastSceneName) {
		worker.setTargetLastSceneName(targetLastSceneName);
	}

	public String getTargetBackwardStopperName() {
		return 	worker.getTargetBackwardStopperName();
	}

	public void setTargetBackwardStopperName(String targetBackwardStopperName) {
		worker.setTargetBackwardStopperName(targetBackwardStopperName);
	}

	public String getTargetForwardStopperName() {
		return 	worker.getTargetForwardStopperName();
	}

	public void setTargetForwardStopperName(String targetForwardStopperName) {
		worker.setTargetForwardStopperName(targetForwardStopperName);
	}

	public Screen getModelScreen1() {
		return worker.getModelScreen1();
	}

	public void setModelScreen1(Screen modelScreen1) {
		worker.setModelScreen1(modelScreen1);
	}
	
	public int getRowCount() {
		return worker.getRowCount();
	}

	public void setRowCount(int rowCount) {
		worker.setRowCount(rowCount);
	}
	
}