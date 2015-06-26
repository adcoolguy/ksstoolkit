package com.google.code.kss.tool.android;

import java.awt.Color;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.io.FileUtils;

import com.google.code.kss.core.model.ui.wireframesketcher.Screen;
import com.google.code.kss.core.model.ui.wireframesketcher.Widgets;
import com.google.code.kss.core.util.CommonUtil;
import com.google.code.kss.core.util.GraphicsUtil;
import com.google.code.kss.core.util.ImageUtil;
import com.google.code.kss.tool.common.AxisPlane;
import com.google.code.kss.tool.common.Converter;
import com.google.code.kss.tool.common.ConverterBase;
import com.google.code.kss.tool.common.ConverterBase.ViewType;

public class LibgdxAndroid implements Converter {

	private ConverterBase c = null;
	private String inputFile;
	private String outputFile = "Mockup.htm";
	private String commentDelimiter = "//";
	private String scriptBeginDelimiter = "<SCRIPT type=\"text/javascript\">";
	private String scriptEndDelimiter = "</SCRIPT>";
	private String methodBeginDelimiter = "{";
	private String methodEndDelimiter = "}";
	private String lineDelimiter = "";	//";";
	private String ifBeginDelimiter = "{";
	private String ifEndDelimiter = "}";
	private String elseIfToken = "else if";
	private String elseToken = "else";	
	private String nullToken = "null";
	private String andOperator = "&&";
	private String orOperator = "||";
	private String notOperator = "!";
	private String whileBeginDelimiter = "{";
	private String whileEndDelimiter = "}";
	private final String NEQ = "!=";
	private final String NEQEQ = "!==";
	private final String EQEQEQ = "===";
//	private String stringConcat = " + ";
	private StringBuffer rectangleOKRegionHandlerJSCodes;
	private StringBuffer finalJSCodes = new StringBuffer();
	private StringBuffer finalJavaCodes = new StringBuffer();
	private StringBuffer canvasHTML = new StringBuffer();
	private StringBuffer textAreaHTML = new StringBuffer();
	private StringBuffer screenHandlerJSCodes;
	private StringBuffer textNameValueJSCodes;
	private int onTextCount = 1;
	private int mainBgX;
	private int mainBgY;
	private int mainBgWidth;
	private int mainBgHeight;
	private int wImageCount = 0;
	private List firsSceneWidgetNames = new ArrayList();
	private String previousSceneToken;
	private String currentSceneToken;
	HashMap imageNameMagicNumber = new HashMap();
	StringBuffer imagePathJSCodes = new StringBuffer();
	private static final int LIBGDX_X_OFFSET = 8;
	private static final int LIBGDX_Y_OFFSET = 8;
	private static final int JS_ELEMENT_OFFSET = -1;	//JavaScript element starts with zero not 1
	private String androidSDKHome;
	private int autoScene = -1;

	private String componentId = "";
	private boolean hideCommonCode;
	private boolean imageReduction;
	private AxisPlane continuosAxisPlane;	
	private Widgets modelWidget1;
	private Widgets modelWidget2;
	private Screen modelScreen1;
	//=== integration piece
	private String targetListName = null;	//the dependent component's list text table variable name
	private String targetLastSceneName = null;	//the dependent component's last scene variable name
	private String targetBackwardStopperName = null;	//the dependent component's backward key stop flag
	private String targetForwardStopperName = null;	//the dependent component's forward key stop flag
	private StringBuffer onTextJSCodes;
	
	public LibgdxAndroid(ConverterBase c) {
		super();
		this.c = c;
		try {
			System.out.println("template = " + getCodeTemplate());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private String getCodeTemplate() throws Exception {
		String text = FileUtils.readFileToString(FileUtils.toFile(
	            this.getClass().getResource("/LibgdxScreen.txt")));
		
		return text;
	}
	
	public int getAutoScene() {
		return autoScene;
	}

	public void setAutoScene(int autoScene) {
		this.autoScene = autoScene;
	}
	
	public AxisPlane getContinuosAxisPlane() {
		return continuosAxisPlane;
	}

	public void setContinuosAxisPlane(AxisPlane continuosAxisPlane) {
		this.continuosAxisPlane = continuosAxisPlane;
	}

	public boolean isImageReduction() {
		return imageReduction;
	}

	public void setImageReduction(boolean imageReduction) {
		this.imageReduction = imageReduction;
	}
	
	public String getTargetListName() {
		return targetListName;
	}

	public void setTargetListName(String targetListName) {
		this.targetListName = targetListName;
	}

	public String getTargetLastSceneName() {
		return targetLastSceneName;
	}

	public void setTargetLastSceneName(String targetLastSceneName) {
		this.targetLastSceneName = targetLastSceneName;
	}

	public Widgets getFirstModelWidget() {
		return modelWidget1;
	}

	public void setFirstModelWidget(Widgets modelWidget) {
		this.modelWidget1 = modelWidget;
	}
	
	public Widgets getLastModelWidget() {
		return modelWidget2;
	}

	public void setLastModelWidget(Widgets modelWidget) {
		this.modelWidget2 = modelWidget;
	}
	
	public Screen getModelScreen1() {
		return modelScreen1;
	}

	public void setModelScreen1(Screen modelScreen1) {
		this.modelScreen1 = modelScreen1;
	}

	public boolean isHideCommonCode() {
		return hideCommonCode;
	}

	public void setHideCommonCode(boolean hideCommonCode) {
		this.hideCommonCode = hideCommonCode;
	}


	private void setImageNameMagicNumber(long magicNumber, String file) {
		imageNameMagicNumber.put(magicNumber, file);
	}
	
	private String getImageNameByMagicNumber(long magicNumber) {
		return (String)imageNameMagicNumber.get(magicNumber);
	}

	public List getFirsSceneWidgetNames() {
		return firsSceneWidgetNames;
	}

	public String getInputFile() {
		return inputFile;
	}

	public String getOutputFile() {
		return outputFile;
	}
	
	public void setOutputFile(String outputFile) {
		this.outputFile = outputFile;
	}

	public String getOutfileName(String inputFile) {
		String retVal = inputFile;

		retVal = c.getStoryFileName(inputFile) + ".htm";

		return retVal;
	}
	
	public HashMap getImageNameMagicNumber() {
		return imageNameMagicNumber;
	}

	public void setImageNameMagicNumber(HashMap imageNameMagicNumber) {
		this.imageNameMagicNumber = imageNameMagicNumber;
	}
	
	public String getNativeSDKHome() {
		return androidSDKHome;
	}

	public void setNativeSDKHome(String androidSDKHome) {
		this.androidSDKHome = androidSDKHome;
	}

	public void addHeader(int totalScene, String listTextName, double releaseNumber, boolean useIDEText, boolean standalone) {
		rectangleOKRegionHandlerJSCodes = new StringBuffer();
		c.setRectangleOKRegion(new Integer[totalScene]);
//		textAreaHTML.append("<div id='kssTextArea'></div>");
//		textAreaHTML.append("<input type='hidden' value='0' id='kssIntVal'/>\n");
		screenHandlerJSCodes = new StringBuffer();
		textNameValueJSCodes = new StringBuffer();
		onTextJSCodes = new StringBuffer();
		finalJSCodes.append(textAreaHTML);
		finalJSCodes.append(scriptBeginDelimiter + "\n" + commentDelimiter + "------- Machine/script can change the following table to (pre)load the real text dynamically\n");
		finalJSCodes.append("var componentId = '" + componentId + "'\n");
	}

	private void addImageSrcHandler(StringBuffer finalJSCodes) {
		Collection c = imageNameMagicNumber.values();
		Iterator k = imageNameMagicNumber.keySet().iterator();
		Iterator itr = c.iterator();
		finalJSCodes.append("function JSGetImageSrc(lImageID) {\n");
		finalJSCodes.append("var retVal\n");
		
			if(itr.hasNext()) {
				finalJSCodes.append("if(lImageID == " + k.next() + ") {\n");
				finalJSCodes.append("retVal = '" + itr.next() + "'\n");
				finalJSCodes.append("}\n");
				while(itr.hasNext()) {	
					finalJSCodes.append("else if(lImageID == " + k.next() + ") {\n");
					finalJSCodes.append("retVal = '" + itr.next() + "'\n");
					finalJSCodes.append("}\n");
				}
				finalJSCodes.append("else {\n");
				String pathSeparator = System.getProperty("file.separator");
				String temp = "retVal = '" + androidSDKHome + pathSeparator + "Img" + pathSeparator + "' + lImageID + '.png'";
				finalJSCodes.append(CommonUtil.replaceAllString(temp, "\\", "/") + "\n");
				finalJSCodes.append("}\n");
				finalJSCodes.append("return retVal\n");
			}
			finalJSCodes.append("}\n");
	}
	
	public void addFooter(boolean appendFlag, int totalScene, String cmPrefix, Integer[] rectangleOKRegion, String listTextName, boolean useIDEText, ViewType mode, boolean standalone, int textWindowWidth, int textWindowHeight) {
//		try {
			finalJSCodes.append("FDT" + componentId + "InitText(1, 1)" + lineDelimiter + "\n");
			finalJSCodes.append("\tGraphics.UpdateDisplay()" + lineDelimiter + "\n");
			finalJSCodes.append(methodEndDelimiter + lineDelimiter + "\n");
			finalJSCodes.append("g_FDT" + componentId + "_Scroll_BWDClippedAtX = " + mainBgX + lineDelimiter + "\n");
			finalJSCodes.append("g_FDT" + componentId + "_Scroll_BWDClippedAtY = " + mainBgY + lineDelimiter + "\n");
			finalJSCodes.append("g_FDT" + componentId + "_Scroll_FWDClippedAtX = " + textWindowWidth + lineDelimiter + "\n");
			finalJSCodes.append("g_FDT" + componentId + "_Scroll_FWDClippedAtY = " + textWindowHeight + lineDelimiter + "\n");

			canvasHTML.append("<canvas id='FDT" + componentId + "_MAIN_WINDOW_LAYER' style='position: absolute; left: " + (0 + LIBGDX_X_OFFSET) + "px; top: 0px border: 1px gray dashed' width='704' height='480'>");
			canvasHTML.append("Content that is shown to users using browsers that don't support the canvas tag");
			canvasHTML.append("</canvas>\n");
			canvasHTML.append("<canvas id='FDT" + componentId + "_TEXT_WINDOW_LAYER' style='position: absolute; left: "+ (mainBgX + LIBGDX_X_OFFSET) +"px; top: "+ (mainBgY + LIBGDX_Y_OFFSET) +"px' width='"+ mainBgWidth +"' height='"+ mainBgHeight +"' style='border: 1px gray dashed'>");
			canvasHTML.append("Content that is shown to users using browsers that don't support the canvas tag]");
			canvasHTML.append("</canvas>\n");
		
			finalJSCodes.append(screenHandlerJSCodes);
			finalJSCodes.append(rectangleOKRegionHandlerJSCodes);

			addScreenHandler(totalScene, cmPrefix, rectangleOKRegion, listTextName, useIDEText, mode, continuosAxisPlane, modelWidget1, modelWidget2);

			addImageSrcHandler(finalJSCodes);
			
			finalJSCodes.append("debug.info('javascript done')" + lineDelimiter + "\n");
			finalJSCodes.append(scriptEndDelimiter + "</body></html>");
			//System.out.println("script '" + finalJSCodes + "'");
/*			
			WebKitFactory app = new WebKitFactory(KSSFactory.getManager());
			KSSFactory.setFactory(app);
//			KSSFactory.loadObject("FDT.js");
//			KSSFactory.loadObject("Util.js");
//			KSSFactory.loadObject("Graphics.js");
//			KSSFactory.loadObject("EPG.js");
//			KSSFactory.loadObject("VOD.js");
			WebKitFactory.getScript().append(finalJSCodes);
			app.setEvaluateOnly(false);
			KSSFactory.runScript();
			if (app.isExecuted()) {
				String beginHTMLBody = "<html>\n" +
				"<body onkeydown=\"keyDown(event);this.focus();\">\n" 
				+ canvasHTML
				+ scriptBeginDelimiter + "\n"
//				+ commentDelimiter + "------- Human can change the following header text or make it empty during loading --\n"
				;
				if (!appendFlag) {
					FileUtils.writeStringToFile(new File(outputFile),
							beginHTMLBody + textNameValueJSCodes.toString() + scriptEndDelimiter + "\n" + 
							WebKitFactory.getScript().toString());
				} else {
					String temp = FileUtils.readFileToString(new File(
							outputFile));
					WebKitFactory.getScript().insert(0, temp);
					FileUtils.writeStringToFile(new File(outputFile),
							beginHTMLBody + textNameValueJSCodes.toString() + scriptEndDelimiter + "\n" + 
							WebKitFactory.getScript().toString());
				}
			}
			WebKitFactory.getScript().setLength(0);
			finalJSCodes.setLength(0);
			textNameValueJSCodes.setLength(0);
		} catch (Exception e) {
			// TODO Auto-generate catch block
			e.printStackTrace();
		}
*/		
	}

	private void addForwardActionHandler(AxisPlane autoScenePlane) {
		finalJSCodes.append("\t\tif(g_FDT" + componentId + "_Screen_Count > g_FDT" + componentId + "_Last_Screen - 1) " + ifBeginDelimiter + "\n");
		finalJSCodes.append("\t\t\tg_FDT" + componentId + "_Screen_Count = g_FDT" + componentId + "_Last_Screen" + lineDelimiter + "\n");
		finalJSCodes.append("\t\t" + ifEndDelimiter + " " + elseToken + " " + ifBeginDelimiter + "\n");
		finalJSCodes
			.append("\t\t\tg_FDT" + componentId + "_Screen_Count = g_FDT" + componentId + "_Screen_Count + 1" + lineDelimiter + "\n");
		finalJSCodes.append("\t\t" + ifEndDelimiter + "\n");
		finalJSCodes.append("\t\tFDTHandleScrolling(g_FDT" + componentId + "_Screen_Count, event.keyCode)" + lineDelimiter + "\n");
		finalJSCodes.append("\t\tFDT" + componentId + "HandleScrollingText(g_FDT" + componentId + "_Screen_Count, event.keyCode)" + lineDelimiter + "\n");
		if(autoScene > -1) {
			if(targetForwardStopperName != null && !"".equals(targetForwardStopperName)) {
				finalJSCodes.append("\tif("+targetForwardStopperName+") " + methodBeginDelimiter + "\n");
			} else {
				finalJSCodes.append("\tif("+ConverterBase.getForwardStopper(componentId)+") " + methodBeginDelimiter + "\n");
			}
			if(autoScenePlane == AxisPlane.Y) {
				finalJSCodes.append("\tg_FDT" + componentId + "_currentY = g_FDT" + componentId + "_currentY + g_FDT" + componentId + "_step\n");
				finalJSCodes.append("\tFDT" + CommonUtil.getName(outputFile) + "ScreenY(g_FDT" + componentId + "_currentY)\n");
			} else if(autoScenePlane == AxisPlane.X){
				finalJSCodes.append("\tg_FDT" + componentId + "_currentX = g_FDT" + componentId + "_currentX + g_FDT" + componentId + "_step\n");
				finalJSCodes.append("\tFDT" + CommonUtil.getName(outputFile) + "ScreenX(g_FDT" + componentId + "_currentX)\n");
			}
			finalJSCodes.append("\t" + methodEndDelimiter + "\n");
		}
		finalJSCodes.append("debug.info('back allowed '+JSSafeString(g_FDT" + componentId + "_Scroll_BWDAllowed)+' forward allowed '+JSSafeString(g_FDT" + componentId + "_Scroll_FWDAllowed))\n");
		finalJSCodes.append("\t\tdebug.info('[" + CommonUtil.getName(outputFile) + "]forw scene'+g_FDT" + componentId + "_Screen_Count+' current index='+g_FDT" + componentId + "_Scroll_ElementIndex)\n");
	}
	
	private void addBackwardActionHandler(AxisPlane autoScenePlane) {
		finalJSCodes.append("\t\tif(g_FDT" + componentId + "_Screen_Count < g_FDT" + componentId + "_First_Screen + 1) " + ifBeginDelimiter + "\n");
		finalJSCodes.append("\t\t\tg_FDT" + componentId + "_Screen_Count = g_FDT" + componentId + "_First_Screen" + lineDelimiter + "\n");
		finalJSCodes.append("\t\t" + ifEndDelimiter + " " + elseToken + " " + ifBeginDelimiter + "\n");
		finalJSCodes
			.append("\t\t\tg_FDT" + componentId + "_Screen_Count = g_FDT" + componentId + "_Screen_Count - 1" + lineDelimiter + "\n");
		
		finalJSCodes.append("\t\t" + ifEndDelimiter + "\n");
		finalJSCodes.append("\t\tFDTHandleScrolling(g_FDT" + componentId + "_Screen_Count, event.keyCode)" + lineDelimiter + "\n");
		finalJSCodes.append("\t\tFDT" + componentId + "HandleScrollingText(g_FDT" + componentId + "_Screen_Count, event.keyCode)" + lineDelimiter + "\n");
		if(autoScene > -1) {
			if(targetBackwardStopperName != null && !"".equals(targetBackwardStopperName)) {
				finalJSCodes.append("\tif("+targetBackwardStopperName+") {\n");
			} else {
				finalJSCodes.append("\tif("+ConverterBase.getBackwardStopper(componentId)+") {\n");
			}
			if(autoScenePlane == AxisPlane.Y) {
				finalJSCodes.append("\tg_FDT" + componentId + "_currentY = g_FDT" + componentId + "_currentY - g_FDT" + componentId + "_step\n");
				finalJSCodes.append("\tFDT" + CommonUtil.getName(outputFile) + "ScreenY(g_FDT" + componentId + "_currentY)\n");
			} else if(autoScenePlane == AxisPlane.X){
				finalJSCodes.append("\tg_FDT" + componentId + "_currentX = g_FDT" + componentId + "_currentX - g_FDT" + componentId + "_step\n");
				finalJSCodes.append("\tFDT" + CommonUtil.getName(outputFile) + "ScreenX(g_FDT" + componentId + "_currentX)\n");
			}
			finalJSCodes.append("\t"+ methodEndDelimiter+"\n");
		}
		finalJSCodes.append("debug.info('back allowed '+JSSafeString(g_FDT" + componentId + "_Scroll_BWDAllowed)+' forward allowed '+JSSafeString(g_FDT" + componentId + "_Scroll_FWDAllowed))\n");

		finalJSCodes.append("\t\tdebug.info('[" + CommonUtil.getName(outputFile) + "]backw scene'+g_FDT" + componentId + "_Screen_Count+' current index='+g_FDT" + componentId + "_Scroll_ElementIndex)\n");
	}
			  
	private void addScreenHandler(int totalScene, String cmPrefix, Integer[] rectangleOKRegion, String listTextName, boolean useIDEText, ViewType mode, AxisPlane autoScenePlane, Widgets w1, Widgets w2) {
		finalJSCodes.append("g_FDT" + componentId + "_Last_Screen = " + totalScene + "" + lineDelimiter + "\n");
		finalJSCodes.append(commentDelimiter + " Browser KeyCode Variables" + lineDelimiter + "\n");
		finalJSCodes.append("KEY_UP = 38" + lineDelimiter + "\n");
		finalJSCodes.append("KEY_DOWN = 40" + lineDelimiter + "\n");
		finalJSCodes.append("KEY_LEFT =  37" + lineDelimiter + "\n");
		finalJSCodes.append("KEY_RIGHT = 39" + lineDelimiter + "\n");
		finalJSCodes.append("KEY_OK = 13" + lineDelimiter + "\n");
		finalJSCodes.append("KEY_PAGEUP = 33" + lineDelimiter + "\n");
		finalJSCodes.append("KEY_PAGEDOWN = 33" + lineDelimiter + "\n");
		finalJSCodes.append("KEY_INFO = 51" + lineDelimiter + "\n");
		addListStringDelegate(totalScene, listTextName, mode);
		
		finalJSCodes
		.append("function FDT" + CommonUtil.getName(outputFile) + "GetAutoSceneStep() " + methodBeginDelimiter + "\n");
		if(autoScenePlane == AxisPlane.Y) {
			finalJSCodes
			.append("\toffsetAutoScene = " + (w2.getY() - w1.getY())+ "\n");
		} else if(autoScenePlane == AxisPlane.X){
			finalJSCodes
			.append("\toffsetAutoScene = " + (w2.getX() - w1.getX())+ "\n");
		}
		if(targetLastSceneName != null && !"".equals(targetLastSceneName)) {
			finalJSCodes
			.append("\tstep = offsetAutoScene/"+ targetLastSceneName + "\n");
		} else {
			finalJSCodes
			.append("\tstep = offsetAutoScene/"+ ConverterBase.getLastScene(componentId) + "\n");
		}
		finalJSCodes
		.append("\treturn step\n");
		finalJSCodes
		.append(methodEndDelimiter + "\n");
				
		if(autoScenePlane == AxisPlane.Y) {
			finalJSCodes
			.append("g_FDT" + componentId + "_currentY = " + w1.getY() + "\n");
		} else if(autoScenePlane == AxisPlane.X){
			finalJSCodes
			.append("g_FDT" + componentId + "_currentX = " + w1.getX() + "\n");
		}


		finalJSCodes.append("var keyDown = function(event) " + methodBeginDelimiter  + "\n");
		finalJSCodes.append("\tGraphics.ClearWindow(g_FDT" + componentId + "_Text_Window_Handle)" + lineDelimiter + "\n");
		
		finalJSCodes.append("\tif(event.keyCode == KEY_UP) " + ifBeginDelimiter + "\n");
		if(mode == ViewType.VERTICAL_LISTVIEW) {
			addBackwardActionHandler(continuosAxisPlane);
		} else {
			finalJSCodes.append("\t\tdebug.info('KEY_UP do nothing, as it is horizontal list view')\n");
		}
		finalJSCodes.append("\t" + ifEndDelimiter + " " + elseIfToken + " (event.keyCode == KEY_DOWN) " + ifBeginDelimiter + "\n");
		if(mode == ViewType.VERTICAL_LISTVIEW) {
			addForwardActionHandler(continuosAxisPlane);
		} else {
			finalJSCodes.append("\t\tdebug.info('KEY_DOWN do nothing, as it is horizontal list view')\n");
		}
		finalJSCodes.append("\t" + ifEndDelimiter + " " + elseIfToken + " (event.keyCode == KEY_LEFT) " + ifBeginDelimiter + "\n");
		if(mode == ViewType.HORIZONTAL_LISTVIEW) {
			addBackwardActionHandler(continuosAxisPlane);
		} else {
			finalJSCodes.append("\t\tdebug.info('KEY_LEFT do nothing, as it is vertical list view')\n");
		}
		finalJSCodes.append("\t" + ifEndDelimiter + " " + elseIfToken + " (event.keyCode == KEY_RIGHT) " + ifBeginDelimiter + "\n");
		if(mode == ViewType.HORIZONTAL_LISTVIEW) {
			addForwardActionHandler(continuosAxisPlane);
		} else {
			finalJSCodes.append("\t\tdebug.info('KEY_RIGHT do nothing, as it is vertical list view')\n");
		}
		finalJSCodes.append("\t" + ifEndDelimiter + " " + elseIfToken + " (event.keyCode == KEY_OK) " + ifBeginDelimiter + "\n");
			finalJSCodes.append("\t\tFDT" + componentId + "HandleScrollingText(g_FDT" + componentId + "_Screen_Count, event.keyCode)" + lineDelimiter + "\n");
			finalJSCodes.append("\t\tdebug.info('ok')" + lineDelimiter + "\n");
		finalJSCodes.append("\t" + ifEndDelimiter + " " + elseIfToken + " (event.keyCode == KEY_INFO) " + ifBeginDelimiter + "\n");
			finalJSCodes.append("\t\t\t--DrawBackground()" + lineDelimiter + "\n");
			finalJSCodes.append("\t\t\tdebug.info('info')" + lineDelimiter + "\n");
		finalJSCodes.append("\t" + ifEndDelimiter + " " + elseToken + ifBeginDelimiter + "\n");
			finalJSCodes.append("\t\tdebug.info('special key')" + lineDelimiter + "\n");
		finalJSCodes.append("\t" + ifEndDelimiter + "\n");
		
		for (int i = 1; i <= totalScene; i++) {
			finalJSCodes
					.append("\tif(g_FDT" + componentId + "_Screen_Count == " + i + ") " + ifBeginDelimiter + "\n");
			finalJSCodes.append("\t\t" + cmPrefix + "Screen" + i + "()" + lineDelimiter + "\n");
			if(rectangleOKRegion[i-1] > 0) {
				finalJSCodes.append("\t\tif(event.keyCode == KEY_OK) " + ifBeginDelimiter + "\n");
				finalJSCodes.append("\t\t\tFDTListScreenRectangleOKRegionHandler" + i + "()" + lineDelimiter + "\n");
				finalJSCodes.append("\t\t" + ifEndDelimiter + "\n");
			}
			finalJSCodes.append("\t" + ifEndDelimiter + "\n");
		}
		finalJSCodes.append("\tGraphics.UpdateDisplay()" + lineDelimiter + "\n");		
		finalJSCodes.append(methodEndDelimiter + "\n");
	}

	private void addTextConstant() {
		finalJSCodes.append(commentDelimiter + "------- Font display flag\n");
		finalJSCodes.append("var FONT_ATTRS_NORMAL = 1" + lineDelimiter + "\n");
		finalJSCodes.append("var FONT_ATTRS_ELIPSE = 2 " + lineDelimiter + "\n");
		finalJSCodes.append("var FONT_ATTRS_MULTILINE = 4" + lineDelimiter + "\n");
		finalJSCodes.append("var FONT_ATTRS_CLEARRECT = 8" + lineDelimiter + "\n");
		finalJSCodes.append("var FONT_ATTRS_RIGHT_JUST = 16" + lineDelimiter + "\n");
		finalJSCodes.append("var FONT_ATTRS_FADEOUT = 32" + lineDelimiter + "\n");
		finalJSCodes.append("var FONT_ATTRS_VERTICAL_BOTTOM_UP = 256" + lineDelimiter + "\n");
		finalJSCodes.append("var FONT_ATTRS_VERTICAL_TOP_DOWN = 512" + lineDelimiter + "\n");
		finalJSCodes.append("var mainCanvas" + lineDelimiter + "\n");
		finalJSCodes.append("var mainContext" + lineDelimiter + "\n");
		finalJSCodes.append("var textCanvas" + lineDelimiter + "\n");
		finalJSCodes.append("var textContext" + lineDelimiter + "\n");
		finalJSCodes.append("\n");
	}

	/**
	 * This function grabs the position of the primary background image.
	 * 
	 * @param w
	 * @param currentScene
	 */
	private void handleBackground(Widgets w, int currentScene) {
		if(currentScene == 1) {
			if ("model:Image".equals(w.getType())) {
				wImageCount++;
				if(wImageCount == 1) {
					mainBgX = w.getX();
					mainBgY = w.getY();
					mainBgWidth = w.getMeasuredWidth();
					mainBgHeight = w.getMeasuredHeight();
				}
			}
		}
	}
	
	/**
	 * Translate IDE based font size into HTML font size.
	 * 
	 * @param fontSize
	 */
	private int handleFontSize(int fontSize) {
		int retVal = fontSize;
		
		if(fontSize == 0) {
			retVal = 9;	//wireframesketcher default
		}
		
		return retVal;
	}
	
	/**
	 * This function treat the text as part of the List. Benefits include default scrolling capability if the list
	 * size is bigger than the total scene size.
	 * 
	 * @param w
	 * @param sb
	 * @param currentScene
	 * @param useIDEText
	 * @param uiText
	 * @param textFieldCount
	 */
	public void handleListText(Widgets w, StringBuffer sb, int currentScene, boolean useIDEText, Object uiText, int textFieldCount) {
		//System.out.println("+++++++++++++++ currentScene " + currentScene + " textFieldCount " + textFieldCount + " +++++++++++++++++++++++++++++++++++");
		//=== store text ordering based on key "frame"/scene (first screen)
		if(currentScene == 1) {
			if(useIDEText) {
				textNameValueJSCodes.append("var " + c.getTextName(w.getX(), w.getY(), componentId) + "= '" + c.filterIDEText(w.getText()) + "'" + lineDelimiter + "\n");
			} else {
				if(uiText == null) {
					textNameValueJSCodes.append("var " + c.getTextName(w.getX(), w.getY(), componentId) + "= " + "'CHANGE_YOUR_TEXT" + textFieldCount + "_HERE'" + lineDelimiter + "\n");
				} else {
					textNameValueJSCodes.append("var " + c.getTextName(w.getX(), w.getY(), componentId) + "= " + "'" + c.getText(1, textFieldCount) + "'" + lineDelimiter + "\n");
				}
			}
			firsSceneWidgetNames.add(w);
		}
		sb
				.append("\tnErr = Graphics.DrawString(iAttributeID, g_FDT" + componentId + "_Text_Window_Handle, "
						+ w.getX()
						+ "+" + LIBGDX_X_OFFSET
//						+ "+g_FDT" + componentId + "_Scroll_XOffset-g_FDT" + componentId + "_Scroll_BWDClippedAtX"
						+ ", "
						+ w.getY()
						+ "+" + LIBGDX_Y_OFFSET
//						+ "+g_FDT" + componentId + "_Scroll_YOffset-g_FDT" + componentId + "_Scroll_BWDClippedAtY"
						+ ", "
						+ w.getMeasuredWidth()
						+ ", "
						+ w.getMeasuredHeight()
						+ ", "+ c.getFontColor(w) +", "+ c.getFontBgColor(w) +", "
						+ handleFontSize(w.getFont().getSize())	//font size mapped directly to HTML font size
						+ ", FONT_ATTRS_MULTILINE, " + c.getTextName(w.getX(), w.getY(), componentId) + ")" + lineDelimiter + "\n");
	}

	/**
	 * This function handles static text in the image.
	 * 
	 * @param w
	 * @param sb
	 * @param currentScene
	 * @param useIDEText
	 * @param uiText
	 * @param textFieldCount
	 */
	public void handleNormalText(Widgets w, StringBuffer sb, int currentScene, boolean useIDEText, Object uiText, int textFieldCount) {
		sb
				.append("\tnNTErr = Graphics.DrawString(iAttributeID, g_FDT" + componentId + "_Text_Window_Handle, "
						+ w.getX()
						+ "+" + LIBGDX_X_OFFSET
						+ ", "
						+ w.getY()
						+ "+" + LIBGDX_Y_OFFSET
						+ ", "
						+ w.getMeasuredWidth()
						+ ", "
						+ w.getMeasuredHeight()
						+ ", "+ c.getFontColor(w) +", "+ c.getFontBgColor(w) +", "						
						+ handleFontSize(w.getFont().getSize()) //font size mapped directly to HTML font size
						+ ", FONT_ATTRS_MULTILINE, '" + c.filterIDEText(w.getText()) + "')\n");
	}
	
	public void addSceneHeader(String cmPrefix, int currentScene) {
		screenHandlerJSCodes.append("function " + cmPrefix + "Screen"
				+ currentScene + "() "+ methodBeginDelimiter  + "\n");
	}

	public void addSceneFooter() {
		screenHandlerJSCodes.append("\tGraphics.UpdateDisplay()" + lineDelimiter + "\n");
		screenHandlerJSCodes.append(methodEndDelimiter + "\n");
	}

	private void addRectangeOKRegionHandler(Widgets w, StringBuffer rectangleOKRegionHandlerJSCodes, String cmPrefix, int currentScene) {
		rectangleOKRegionHandlerJSCodes.append("function " + cmPrefix + "ScreenRectangleOKRegionHandler" + currentScene + "() "+ methodBeginDelimiter  + "\n");
		Color c = Color.decode(w.getForeground());
		rectangleOKRegionHandlerJSCodes.append("\tRECT_COLOR = '0xFF"+ Integer.toHexString(c.getRGB() & 0x00ffffff) +"'" + lineDelimiter + "\n");
		rectangleOKRegionHandlerJSCodes.append("\tGraphics.DrawLine(g_FDT" + componentId + "_Main_Window_Handle,"+w.getX()+","+w.getY()+","+w.getMeasuredWidth()+",0,RECT_COLOR)" + lineDelimiter + "\n");
		rectangleOKRegionHandlerJSCodes.append("\tGraphics.DrawLine(g_FDT" + componentId + "_Main_Window_Handle,"+w.getX()+","+w.getY()+","+w.getMeasuredHeight()+",1,RECT_COLOR)" + lineDelimiter + "\n");
		rectangleOKRegionHandlerJSCodes.append("\tGraphics.DrawLine(g_FDT" + componentId + "_Main_Window_Handle,"+w.getX()+","+w.getY()+"+"+w.getMeasuredHeight()+","+w.getMeasuredWidth()+",0,RECT_COLOR)" + lineDelimiter + "\n");
		rectangleOKRegionHandlerJSCodes.append("\tGraphics.DrawLine(g_FDT" + componentId + "_Main_Window_Handle,"+w.getX()+"+"+w.getMeasuredWidth()+","+w.getY()+","+w.getMeasuredHeight()+",1,RECT_COLOR)" + lineDelimiter + "\n");
		rectangleOKRegionHandlerJSCodes.append("\tGraphics.UpdateDisplay()" + lineDelimiter + "\n");
		rectangleOKRegionHandlerJSCodes.append(methodEndDelimiter + "\n");
	}
	
	/**
	 * Assign a delegate that takes care of string on behalf of list view object.
	 * @param totalScene 
	 * @param listTextName 
	 * @param mode 
	 * 
	 * @param w
	 * @param rectangleOKRegionHandlerJSCodes
	 */
	private void addListStringDelegate(int totalScene, String listTextName, ViewType mode) {
		finalJSCodes.append(commentDelimiter + " ######################## begin of text scrolling capability ##########################" + lineDelimiter + "\n");
		finalJSCodes.append(commentDelimiter + " Note: most important variables are scene #, key and g_FDT" + componentId + "_Scroll_ElementIndex" + lineDelimiter + "\n");
		finalJSCodes.append(commentDelimiter + " ######################################################################################" + lineDelimiter + "\n");
		finalJSCodes.append("g_FDT" + componentId + "_Screen_Count = g_FDT" + componentId + "_Last_Screen" + lineDelimiter + "\t" + commentDelimiter + " due to the preview in the onLoad" + lineDelimiter + "\n");
		finalJSCodes.append("g_FDT" + componentId + "_Scroll_ElementIndex = g_FDT" + componentId + "_Last_Screen" + lineDelimiter + "\t" + commentDelimiter + " due to the preview in the onLoad; assuming total list items are the same as scene counts\n");

		finalJSCodes.append("function FDTHandleScrolling(scene, key) "+ methodBeginDelimiter  + "\n");
		String bwdKey = null, fwdKey = null;
		if(mode == ViewType.HORIZONTAL_LISTVIEW) {
			bwdKey = "KEY_LEFT";
			fwdKey = "KEY_RIGHT";
		} else
		if(mode == ViewType.VERTICAL_LISTVIEW) {
			bwdKey = "KEY_UP";
			fwdKey = "KEY_DOWN";
		}
		finalJSCodes.append("\tg_FDT" + componentId + "_Scroll_BWDAllowed = true" + lineDelimiter + "\n");
		finalJSCodes.append("\tg_FDT" + componentId + "_Scroll_FWDAllowed = true" + lineDelimiter + "\n\n");
		
		finalJSCodes.append("\tif(scene == 1 " + andOperator + " key == "+ bwdKey +") " + ifBeginDelimiter + "\n");
		finalJSCodes.append("\t\tif(g_FDT" + componentId + "_Scroll_ElementIndex <= 1) " + ifBeginDelimiter + "\n");
		finalJSCodes.append("\t\t\tg_FDT" + componentId + "_Scroll_BWDAllowed = false" + lineDelimiter + "\n");
		finalJSCodes.append("\t\t" + ifEndDelimiter + "\n");
		finalJSCodes.append("\t\tif(" + notOperator + " g_FDT" + componentId + "_Scroll_BWDAllowed) " + ifBeginDelimiter + "\n");
		finalJSCodes.append("\t\t\tg_FDT" + componentId + "_Scroll_ElementIndex = 1" + lineDelimiter + "\n");
		finalJSCodes.append("\t\t" + ifEndDelimiter + elseToken + ifBeginDelimiter + "\n");
		finalJSCodes.append("\t\t\tg_FDT" + componentId + "_Scroll_ElementIndex = g_FDT" + componentId + "_Scroll_ElementIndex - 1" + lineDelimiter + "\n");
		finalJSCodes.append("\t\t" + ifEndDelimiter + "\n");
		finalJSCodes.append("\t" + ifEndDelimiter + elseToken + "\n");
		finalJSCodes.append("\tif(key == "+ bwdKey +") " + ifBeginDelimiter + "\n");
		finalJSCodes.append("\t\tg_FDT" + componentId + "_Scroll_ElementIndex = g_FDT" + componentId + "_Scroll_ElementIndex - 1" + lineDelimiter + "\n");
		finalJSCodes.append("\t" + methodEndDelimiter + "\n");
		finalJSCodes.append("\n");
		
		finalJSCodes.append("\tif(scene == " + totalScene + " " + andOperator + " key == "+ fwdKey +") " + ifBeginDelimiter + "\n");
		finalJSCodes.append("\t\tlastElementIndex = GetLastIndex(" + listTextName + ")" + lineDelimiter + "\n");
		finalJSCodes.append("\t\t//=== zero element and only at the last row\n");
		finalJSCodes.append("\t\tif(lastElementIndex <= 0 " + andOperator + " g_FDT_Scroll_ElementIndex == " + totalScene + ") {" + "\n");
		finalJSCodes.append("\t\t\tg_FDT" + componentId + "_Scroll_FWDAllowed = false" + lineDelimiter + "\n");
		finalJSCodes.append("\t\t} else" + "\n");
		finalJSCodes.append("\t\t//=== total data elements less than total rows in UI\n");
		finalJSCodes.append("\t\tif(lastElementIndex == 5 && g_FDT" + componentId + "_Scroll_ElementIndex == lastElementIndex) {" + "\n");
		finalJSCodes.append("\t\t\tg_FDT" + componentId + "_Scroll_FWDAllowed = false" + lineDelimiter + "\n");
		finalJSCodes.append("\t\t} else" + "\n");
		finalJSCodes.append("\t\t//=== boundary condition i.e. total data elements equals total rows in UI\n");
		finalJSCodes.append("\t\tif(lastElementIndex > 5 && g_FDT" + componentId + "_Scroll_ElementIndex == lastElementIndex) {" + "\n");
		finalJSCodes.append("\t\t\tg_FDT" + componentId + "_Scroll_FWDAllowed = false" + lineDelimiter + "\n");
		finalJSCodes.append("\t\t} else" + "\n");
		finalJSCodes.append("\t\t//=== total data elements more than total rows in UI\n");
		finalJSCodes.append("\t\tif(g_FDT" + componentId + "_Scroll_ElementIndex -1 == lastElementIndex) {" + "\n");
		finalJSCodes.append("\t\t\tg_FDT" + componentId + "_Scroll_FWDAllowed = false" + lineDelimiter + "\n");
		finalJSCodes.append("\t\t}" + "\n");

		finalJSCodes.append("\t\tif(" + notOperator + "g_FDT" + componentId + "_Scroll_FWDAllowed) " + ifBeginDelimiter + "\n");
		finalJSCodes.append("\t\t\t//leave the index alone, do nothing\n");
		finalJSCodes.append("\t\t\t//g_FDT" + componentId + "_Scroll_ElementIndex = lastElementIndex" + lineDelimiter + "\n");
		finalJSCodes.append("\t\t"  + methodEndDelimiter + elseToken + methodBeginDelimiter + "\n");
		finalJSCodes.append("\t\t\tg_FDT" + componentId + "_Scroll_ElementIndex = g_FDT" + componentId + "_Scroll_ElementIndex + 1" + lineDelimiter + "\n");
		finalJSCodes.append("\t\t" + ifEndDelimiter + "\n");
		finalJSCodes.append("\t"  + methodEndDelimiter + elseToken + "\n");
		finalJSCodes.append("\tif(key == "+ fwdKey +") " + ifBeginDelimiter + "\n");
		finalJSCodes.append("\t\tg_FDT" + componentId + "_Scroll_ElementIndex = g_FDT" + componentId + "_Scroll_ElementIndex + 1" + lineDelimiter + "\n");
		finalJSCodes.append("\t" + methodEndDelimiter + "\n");
		finalJSCodes.append("\n");
		
		finalJSCodes.append("\tErr = Graphics.ClearWindow(g_FDT" + componentId + "_Text_Window_Handle)" + lineDelimiter + "\n");
		//finalJSCodes.append("\tGraphics.UpdateDisplay()" + lineDelimiter + "\n");
		finalJSCodes.append(methodEndDelimiter + "\n");

		finalJSCodes.append("function FDT" + componentId + "HandleScrollingText(scene, key) "+ methodBeginDelimiter  + "\n");
		finalJSCodes.append("if(scene == 1 " + andOperator + " key == "+ bwdKey +" " + andOperator + " g_FDT" + componentId + "_Scroll_ElementIndex >= 1) " + ifBeginDelimiter + "\n");
		finalJSCodes.append("FDT" + componentId + "InitText(scene, key, g_FDT" + componentId + "_Scroll_ElementIndex)" + lineDelimiter + "\n");
		finalJSCodes.append(ifEndDelimiter + elseIfToken + " (scene == "+ totalScene +"-1 " + andOperator + " key == "+ bwdKey +" " + andOperator + " g_FDT" + componentId + "_Scroll_ElementIndex == "+ totalScene +"-1) " + ifBeginDelimiter + "\n");
		finalJSCodes.append("FDT" + componentId + "InitText(scene, key, g_FDT" + componentId + "_Scroll_ElementIndex -2 + ("+ JS_ELEMENT_OFFSET +"))" + lineDelimiter + "\n");	//TBD - 2? needs to test boundary!!!
		finalJSCodes.append(ifEndDelimiter + elseIfToken + " (scene == "+ totalScene +" " + andOperator + " key == "+ fwdKey +" " + andOperator + " g_FDT" + componentId + "_Scroll_ElementIndex >= "+ totalScene +"+1) " + ifBeginDelimiter + "\n");
		finalJSCodes.append("FDT" + componentId + "GetNextText(scene, key, g_FDT" + componentId + "_Scroll_ElementIndex)" + lineDelimiter + "\n");
		finalJSCodes.append(ifEndDelimiter + elseIfToken + " (scene == "+ totalScene + " " + andOperator + " key == KEY_OK " + andOperator + " g_FDT" + componentId + "_Scroll_ElementIndex == "+ totalScene +") " + ifBeginDelimiter + "\n");
		finalJSCodes.append("FDT" + componentId + "InitText(scene, key, 1)" + lineDelimiter + "\n");
		finalJSCodes.append(methodEndDelimiter + "\n");
		finalJSCodes.append(methodEndDelimiter + "\n");
		
		finalJSCodes.append("function FDT" + componentId + "InitText(pageindex, key, index) "+ methodBeginDelimiter  + "\n");
		Iterator it = firsSceneWidgetNames.iterator();
		Widgets w = null;
		int i = 0+JS_ELEMENT_OFFSET;
		while(it.hasNext()) {
			w = (Widgets)it.next();
			finalJSCodes.append(c.getTextName(w.getX(), w.getY(), componentId) + " = "+ listTextName +"[index+(" + i + ")]" + lineDelimiter + "\n");
			i++;
		}
		finalJSCodes.append(ifEndDelimiter + "\n");
		it = firsSceneWidgetNames.iterator();
		finalJSCodes.append("function FDT" + componentId + "GetNextText(pageindex, key, index)" + ifBeginDelimiter + "\n");
		i = i-JS_ELEMENT_OFFSET-JS_ELEMENT_OFFSET;
		while(it.hasNext()) {
			w = (Widgets)it.next();
			i--;
			finalJSCodes.append(c.getTextName(w.getX(), w.getY(), componentId) + " = "+ listTextName +"[index-" + i + "]" + lineDelimiter + "\n");
		}
		finalJSCodes.append(methodEndDelimiter + "\n");
		finalJSCodes.append(commentDelimiter + " ######################## end of text scrolling capability ##########################" + lineDelimiter + "\n");
		finalJSCodes.append("function GetLastIndex(t) "+ methodBeginDelimiter  + "\n");
		finalJSCodes.append("\tretVal = -1\n");
		finalJSCodes.append("\tif(typeof(t)!='undefined') {\n");
		finalJSCodes.append("\t\tretVal = t.length\n");
		finalJSCodes.append("\t}\n");
		finalJSCodes.append("\treturn retVal\n");
		finalJSCodes.append(methodEndDelimiter + "\n");
	}

	private String handleImagePath(String src) {
		String retVal = src;
		if(src != null) {
			int index = src.indexOf("/resource/KSSToolkit/");
			if(index > -1) {
				retVal = src.substring(index, src.length());
			} else
			//=== if not found, try to look for "../../../img/lua"
			if(index == -1) {
				String temp = "..";
				index = src.lastIndexOf(temp);
				retVal = src.substring(index + temp.length() + 1, src.length());
			}
		}
		return retVal;
	}
	
	private void handleUserFriendlyImageName(Widgets w, String imgName) {
		if(imageReduction) {
			screenHandlerJSCodes.append("\t"
					+ imgName
					+ " = "
					+ c.getImageNameMagicNumber(ImageUtil.getReducedFileName(w)) + "\n");
		} else
		if (w.getSrc() != null && w.getGrayscale()) {
			String temp1 = c.getImageFileName(w.getSrc());
			String temp2 = null;
			try {
				temp2 = GraphicsUtil.toGrayScaleImage(temp1);	//TODO obviously this is not optimized
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			screenHandlerJSCodes.append("\t"
					+ imgName
					+ " = "
					+ c.getImageNameMagicNumber(c.getImageName(temp2)) + "\n");
		} else
		if (w.getSrc() != null && !c.isBinImageFile(w.getSrc())) {
			screenHandlerJSCodes.append("\t"
					+ imgName
					+ " = "
					+ c.getImageNameMagicNumber(c.getImageName(w
							.getSrc())) + "\n");
		}
	}
	
	public void convert(Widgets w, int wCount, Integer[] rectangleOKRegion, String imgName, String cmPrefix, int textFieldCount, int currentScene, boolean useIDEText, String[][] uiText, String listTextName) {
		System.out.println("widget " + wCount + " x " + w.getX()
				+ " y " + w.getY() + " width "
				+ w.getMeasuredWidth() + " height "
				+ w.getMeasuredHeight());
		finalJSCodes.append("\tdebug.debug('on load " + wCount
				+ "')" + lineDelimiter + "\n");
		//=== all scene default is no selection region
		rectangleOKRegion[0] = 0;
		if ("model:VideoPlayer".equals(w.getType())) {
			finalJSCodes
					.append("\tVOD.DrawPoster(1, g_FDT" + componentId + "_Main_Window_Handle + "
							+ wCount
							+ ", 1, 1, "
							+ w.getX()
							+ ", "
							+ w.getY()
							+ ", "
							+ w.getMeasuredWidth()
							+ ", "
							+ w.getMeasuredHeight() + ", 0)" + lineDelimiter + "\n");
		}  else if("model:HLine".equals(w.getType())) {
			finalJSCodes.append("\tnErr = Graphics.DrawLine(g_FDT" + componentId + "_Main_Window_Handle, "
		 			 + w.getX()
		 			 + ", "
		 			 + w.getY()
		 			 + ", "
		 			 + w.getMeasuredWidth()
		 			 + ", 0, "
		 			 + "'" + ConverterBase.getColorCode(w.getForeground())+"')\n");

		} else if("model:VLine".equals(w.getType())) {
			finalJSCodes.append("\tnErr = Graphics.DrawLine(g_FDT" + componentId + "_Main_Window_Handle, "
		 			 + w.getX()
		 			 + ", "
		 			 + w.getY()
		 			 + ", "
		 			 + w.getMeasuredHeight()
		 			 + ", 1, "
		 			 + "'" + ConverterBase.getColorCode(w.getForeground())+"')\n");

		} else if("model:Rectangle".equals(w.getType())) {
			finalJSCodes.append("\tnErr = Graphics.DrawRect(g_FDT" + componentId + "_Main_Window_Handle, "
					 + w.getX()
					 + ", "
					 + w.getY()
					 + ", " 
					 + w.getMeasuredWidth()
					 + ", "
					 + w.getMeasuredHeight()
					 + ", "
					 + "'"+ConverterBase.getColorCode(w.getBackground())+"', 1)\n");

		} else if ("model:Image".equals(w.getType())) {
			//handleBackground(w, currentScene);
			finalJSCodes.append(cmPrefix + "Screen" + wCount
					+ "()" + lineDelimiter + "\n");

			screenHandlerJSCodes.append("function " + cmPrefix
					+ "Screen" + wCount + "()" + methodBeginDelimiter + "\n");
			/*if (w.getSrc() != null && w.getGrayscale()) {
				String temp1 = c.getImageFileName(w.getSrc());
				String temp2 = null;
				try {
					temp2 = GraphicsUtil.toGrayScaleImage(temp1);	//TODO obviously this is not optimized
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				screenHandlerJSCodes.append("\t"
						+ imgName
						+ " = "
						+ c.getImageNameMagicNumber(c.getImageName(temp2)) + "\n");
			} else
			if (w.getSrc() != null && !c.isBinImageFile(w.getSrc())) {
				setImageNameMagicNumber(c.getImageNameMagicNumber(c.getImageName(w.getSrc())), handleImagePath(w.getSrc()));
				screenHandlerJSCodes.append("\t"
						+ imgName
						+ " = "
						+ c.getImageNameMagicNumber(c.getImageName(w
								.getSrc())) + "" + lineDelimiter + "\n");
			}
			if (w.getSrc() != null) {
				screenHandlerJSCodes
						.append("\tnErr = Graphics.DrawImageExByID(iAttributeID, g_FDT" + componentId + "_Main_Window_Handle, "
								+ imgName
								+ ", "
								+ w.getX()
								+ ", "
								+ w.getY()
								+ ", "
								+ w.getMeasuredWidth()
								+ ", "
								+ w.getMeasuredHeight() + ", 64)" + lineDelimiter + "\n");
			}*/
			if (w.getSrc() != null && w.getGrayscale()) {
				String temp1 = c.getImageFileName(w.getSrc());
				String temp2 = null;
				try {
					temp2 = GraphicsUtil.toGrayScaleImage(temp1);	//TODO obviously this is not optimized
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				setImageNameMagicNumber(c.getImageNameMagicNumber(c.getImageName(temp2)), handleImagePath(w.getSrc()));
				screenHandlerJSCodes
						.append("\tnErr = Graphics.DrawImageExByID(iAttributeID, g_FDT" + componentId + "_Main_Window_Handle, "
								+ c.getImageNameMagicNumber(c.getImageName(temp2))
								+ ", "
								+ w.getX()
								+ ", "
								+ w.getY()
								+ ", "
								+ w.getMeasuredWidth()
								+ ", "
								+ w.getMeasuredHeight() + ", 64)" + lineDelimiter + "\n");
			} else {
				setImageNameMagicNumber(c.getImageNameMagicNumber(c.getImageName(w.getSrc())), handleImagePath(w.getSrc()));
				screenHandlerJSCodes
				.append("\tnErr = Graphics.DrawImageExByID(iAttributeID, g_FDT" + componentId + "_Main_Window_Handle, "
						+ c.getImageNameMagicNumber(c.getImageName(w.getSrc()))
						+ ", "
						+ w.getX()
						+ ", "
						+ w.getY()
						+ ", "
						+ w.getMeasuredWidth()
						+ ", "
						+ w.getMeasuredHeight() + ", 64)" + lineDelimiter + "\n");
			} 
			screenHandlerJSCodes
					.append("\tGraphics.UpdateDisplay()" + lineDelimiter + "\n");
			screenHandlerJSCodes.append(methodEndDelimiter + "\n");
		} else if ("model:TextField".equals(w.getType()) || "model:TextArea".equals(w.getType())) {
			textFieldCount++;
			handleListText(w, finalJSCodes, currentScene, useIDEText, uiText, textFieldCount);
		} else if (("model:Label".equals(w.getType()) || "model:Text".equals(w.getType())) && w.getText() != null && !"".equals(w.getText().trim())) {
			handleNormalText(w, finalJSCodes, currentScene, useIDEText, uiText, textFieldCount);
		} else {
			// TBD - faking the window since attributes is not
			// working
			finalJSCodes
					.append("\tnErr = Graphics.DrawImageExByID(iAttributeID, g_FDT" + componentId + "_Main_Window_Handle, 11192, "
							+ w.getX()
							+ ", "
							+ w.getY()
							+ ", "
							+ w.getMeasuredWidth()
							+ ", "
							+ w.getMeasuredHeight() + ", 64)" + lineDelimiter + "\n");
		}
	}

	public void convertContinuousAutoScene(String imgName, AxisPlane autoScenePlane) {
		if ("model:Image".equals(modelWidget1.getType())) {
			if(modelWidget1 == null) throw new RuntimeException("First model widget can not be empty or NULL.");
			if(modelWidget2 == null) throw new RuntimeException("Last model widget can not be empty or NULL.");
			if(autoScenePlane == AxisPlane.Y) {
				screenHandlerJSCodes.append("function FDT" + CommonUtil.getName(outputFile) + "ScreenY(y) " + methodBeginDelimiter + "\n");
				screenHandlerJSCodes.append("\tErr = Graphics.ClearWindow(g_FDT" + componentId + "_Main_Window_Handle)\n");
				handleUserFriendlyImageName(modelWidget1, imgName);
				screenHandlerJSCodes
				.append("\tnErr = Graphics.DrawImageExByID(iAttributeID, g_FDT" + componentId + "_Main_Window_Handle, "
						+ imgName
						+ ", "
						+ modelWidget1.getX()
						+ ", "
						+ "y"
						+ ", "
						+ modelWidget1.getMeasuredWidth()
						+ ", "
						+ modelWidget1.getMeasuredHeight() + ", 64)\n");
			} else if(autoScenePlane == AxisPlane.X){
				screenHandlerJSCodes.append("function FDT" + CommonUtil.getName(outputFile) + "ScreenX(x)\n");
				screenHandlerJSCodes.append("\tErr = Graphics.ClearWindow(g_FDT" + componentId + "_Main_Window_Handle)\n");
				handleUserFriendlyImageName(modelWidget1, imgName);
				screenHandlerJSCodes
				.append("\tnErr = Graphics.DrawImageExByID(iAttributeID, g_FDT" + componentId + "_Main_Window_Handle, "
						+ imgName
						+ ", "
						+ "x"
						+ ", "
						+ modelWidget1.getY()
						+ ", "
						+ modelWidget1.getMeasuredWidth()
						+ ", "
						+ modelWidget1.getMeasuredHeight() + ", 64)\n");
			}
			if (modelScreen1 != null) {
				System.out.println("auto scene background widget count = "
						+ modelScreen1.getWidgets().size());
				Iterator<Widgets> it = modelScreen1.getWidgets().iterator();
				Widgets w = null;
				while (it.hasNext()) {
					w = (Widgets) it.next();
					if ("model:Image".equals(w.getType()) && ConverterBase.BACKGROUND_ONLY.equals(w.getCustomId())) {
						ConverterBase c = new ConverterBase();
						c.setNativeSDK(true);
						c.setImageReduction(true);	//XXX false does not work?
						imgName = c.handleImage(w);
						handleUserFriendlyImageName(w, imgName);
						screenHandlerJSCodes
						.append("\tnErr = Graphics.DrawImageExByID(iAttributeID, g_FDT" + componentId + "_Main_Window_Handle, "
								+ imgName
								+ ", "
								+ w.getX()
								+ ", "
								+ w.getY()
								+ ", "
								+ w.getMeasuredWidth()
								+ ", "
								+ w.getMeasuredHeight() + ", 64)\n");
					}
				}
			}
			
			screenHandlerJSCodes.append("\tGraphics.UpdateDisplay()\n");
			screenHandlerJSCodes.append(methodEndDelimiter + "\n");
		}
	}
	public void convertScene(Widgets w, int wCount, Integer[] rectangleOKRegion, String imgName, String cmPrefix, int textFieldCount, int currentScene, boolean useIDEText, String[][] uiText, String listTextName, int totalScene) {
		System.out.println("widget " + wCount + " x " + w.getX()
				+ " y " + w.getY() + " width "
				+ w.getMeasuredWidth() + " height "
				+ w.getMeasuredHeight());
		finalJSCodes.append("\tdebug.debug('on load " + wCount
				+ "')" + lineDelimiter + "\n");
		//=== all scene default is no selection region
		rectangleOKRegion[currentScene-1] = 0;
		if ("model:VideoPlayer".equals(w.getType())) {
			finalJSCodes
					.append("\tVOD.DrawPoster(1, g_FDT" + componentId + "_Main_Window_Handle + "
							+ wCount
							+ ", 1, 1, "
							+ w.getX()
							+ ", "
							+ w.getY()
							+ ", "
							+ w.getMeasuredWidth()
							+ ", "
							+ w.getMeasuredHeight() + ", 0)" + lineDelimiter + "\n");
		} else if ("model:Image".equals(w.getType())) {
			//handleBackground(w, currentScene);
			currentSceneToken = cmPrefix + "Screen" + currentScene + "()\n";
			if(!currentSceneToken.equals(previousSceneToken)) {
				finalJSCodes.append("\t" + cmPrefix + "Screen" + currentScene
						+ "()\n");
			}
			previousSceneToken = currentSceneToken;

			if (w.getSrc() != null && w.getGrayscale()) {
				String temp1 = c.getImageFileName(w.getSrc());
				String temp2 = null;
				try {
					temp2 = GraphicsUtil.toGrayScaleImage(temp1);	//TODO obviously this is not optimized
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				screenHandlerJSCodes.append("\t"
						+ imgName
						+ " = "
						+ c.getImageNameMagicNumber(c.getImageName(temp2)) + "\n");
			} else
			if (w.getSrc() != null && !c.isBinImageFile(w.getSrc())) {
				setImageNameMagicNumber(c.getImageNameMagicNumber(c.getImageName(w.getSrc())), handleImagePath(w.getSrc()));
				screenHandlerJSCodes.append("\t"
						+ imgName
						+ " = "
						+ c.getImageNameMagicNumber(c.getImageName(w
								.getSrc())) + "" + lineDelimiter + "\n");
			}
			if (w.getSrc() != null) {
				screenHandlerJSCodes
						.append("\tnErr = Graphics.DrawImageExByID(iAttributeID, g_FDT" + componentId + "_Main_Window_Handle, "
								+ imgName
								+ ", "
								+ w.getX()
								+ ", "
								+ w.getY()
								+ ", "
								+ w.getMeasuredWidth()
								+ ", "
								+ w.getMeasuredHeight() + ", 64)" + lineDelimiter + "\n");
			}
		} else if ("model:TextField".equals(w.getType()) || "model:TextArea".equals(w.getType())) {
			textFieldCount++;
			handleListText(w, screenHandlerJSCodes, currentScene, useIDEText, uiText, textFieldCount);
		} else if (("model:Label".equals(w.getType()) || "model:Text".equals(w.getType())) && w.getText() != null && !"".equals(w.getText().trim())) {
			handleNormalText(w, screenHandlerJSCodes, currentScene, useIDEText, uiText, textFieldCount);
		} else if (("model:Rectangle".equals(w.getType())) && w.getAlpha() == 0) {
			addRectangeOKRegionHandler(w, rectangleOKRegionHandlerJSCodes, cmPrefix, currentScene);
			rectangleOKRegion[currentScene-1] = 1;	//TBD - one only per screen for now :)
		} else {
			// TBD - faking the window since attributes is not
			// working
			finalJSCodes
					.append("\tnErr = Graphics.DrawImageExByID(iAttributeID, g_FDT" + componentId + "_Main_Window_Handle, 11192, "
							+ w.getX()
							+ ", "
							+ w.getY()
							+ ", "
							+ w.getMeasuredWidth()
							+ ", "
							+ w.getMeasuredHeight() + ", 64)" + lineDelimiter + "\n");
		}
	}

	public String getComponentId() {
		return componentId;
	}

	public void setComponentId(String componentId) {
		this.componentId = componentId;
	}

	public String getTargetBackwardStopperName() {
		return targetBackwardStopperName;
	}

	public void setTargetBackwardStopperName(String targetBackwardStopperName) {
		this.targetBackwardStopperName = targetBackwardStopperName;
	}

	public String getTargetForwardStopperName() {
		return targetForwardStopperName;
	}

	public void setTargetForwardStopperName(String targetForwardStopperName) {
		this.targetForwardStopperName = targetForwardStopperName;
	}
	@Override
	public int getRowCount() {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public void setRowCount(int rowCount) {
		// TODO Auto-generated method stub
		
	}
	
}
