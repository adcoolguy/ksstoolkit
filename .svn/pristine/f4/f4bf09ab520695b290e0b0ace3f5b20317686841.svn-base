package com.google.code.kss.tool.fios;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Pattern;

import org.apache.commons.io.FileUtils;

import com.google.code.kss.adapter.fios.api.Graphics;
import com.google.code.kss.core.model.ui.wireframesketcher.Screen;
import com.google.code.kss.core.model.ui.wireframesketcher.Widgets;
import com.google.code.kss.core.util.CommonUtil;
import com.google.code.kss.core.util.GraphicsUtil;
import com.google.code.kss.core.util.ImageUtil;
import com.google.code.kss.core.util.KSSFactory;
import com.google.code.kss.tool.common.AxisPlane;
import com.google.code.kss.tool.common.Converter;
import com.google.code.kss.tool.common.ConverterBase;
import com.google.code.kss.tool.common.ConverterBase.ViewType;

public class FIOSLua implements Converter {

	private ConverterBase c = null;
	private String inputFile;
	private String outputFile = "Mockup.lua";
	private String commentDelimiter = "//";
	private String methodBeginDelimiter = "";
	private String methodEndDelimiter = "end";
	private String lineDelimiter = "";
	private String ifBeginDelimiter = "then";
	private String ifEndDelimiter = "end";
	private String elseIfToken = "elseif";
	private String elseToken = "else";
	private String nullToken = "nil";
	private String andOperator = "and";
	private String orOperator = "or";
	private String notOperator = "not";
	private String whileBeginDelimiter = "{";
	private String whileEndDelimiter = "}";
	private final String NEQ = "~=";
	private final String NEQEQ = "!=";
	private final String EQEQEQ = "==";
	private static final int JS_ELEMENT_OFFSET = -1;		//no offset, as it is lua and lua element starts with 1
	private StringBuffer rectangleOKRegionHandlerLUACodes;
	private StringBuffer finalLUACodes;
	private StringBuffer screenHandlerLUACodes;
	private StringBuffer textNameValueLUACodes;
	private StringBuffer onTextLUACodes;
	private int onTextCount = 1;
	private int mainBgX;
	private int mainBgY;
	/*private int mainBgWidth = 704;
	private int mainBgHeight = 480;*/
	private int mainBgWidth;
	private int mainBgHeight;
	private int wImageCount = 0;
	private List<Widgets>firsSceneWidgetNames = new ArrayList();
	private String previousSceneToken;
	private String currentSceneToken;
	private int MAGIC_ENFORCER_OFFSET = 2;	//to prevent scrolling :)
	private int ideTextInitCount = 0;
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
	private int rowCount = 0;
	
	public FIOSLua(ConverterBase c) {
		super();
		this.c = c;
	}

	public int getRowCount() {
		return rowCount;
	}

	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
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

		retVal = c.getStoryFileName(inputFile) + ".lua";

		return retVal;
	}
	
	public void addHeader(int totalScene, String listTextName, double releaseNumber, boolean useIDEText, boolean standalone) {
		rectangleOKRegionHandlerLUACodes = new StringBuffer();
		c.setRectangleOKRegion(new Integer[totalScene]);
		screenHandlerLUACodes = new StringBuffer();
		textNameValueLUACodes = new StringBuffer();
		onTextLUACodes = new StringBuffer();
		finalLUACodes = new StringBuffer();
//		if(!hideCommonCode) {
			if(useIDEText) {
				textNameValueLUACodes.append(listTextName + "= {}\n");
			}
			finalLUACodes.append("-- Machine/script can change the following table to (pre)load the real text dynamically --\n");
			if(!useIDEText && standalone) {
//				finalLUACodes.append(listTextName + "= {}\n");	//this is not supported
//				finalLUACodes.append(listTextName + "= {''}\n");	//this work until the last row - 1, not all the way
//				finalLUACodes.append(listTextName + "= {'Real FiOS Text1','Real FiOS Text2','Real FiOS Text3','Real FiOS Text4'}\n");
//				finalLUACodes.append(listTextName + "= {'Real FiOS Text1','Real FiOS Text2','Real FiOS Text3','Real FiOS Text4','Real FiOS Text5'}\n");
				finalLUACodes.append(listTextName + "= {'Real FiOS Text1','Real FiOS Text2','Real FiOS Text3','Real FiOS Text4','Real FiOS Text5','Real FiOS Text6','7 (second to last element)','8 (last element)'}\n");
			} else if(!standalone) {
				finalLUACodes.append(listTextName + "= {}\n");	//not sure what is this!?
			} else {
				//finalLUACodes.append(listTextName + "= {}\n");
			}
//		}
		finalLUACodes.append("\n--------- begin FDT " + releaseNumber + " (" + new Date() + ") ---------\n");
		finalLUACodes.append("-- Global variable\n");
		finalLUACodes.append("g_FDT" + componentId + "_Main_Window_Handle = -1\n");
		finalLUACodes.append("g_FDT" + componentId + "_Text_Window_Handle = -1\n");		
		finalLUACodes.append("g_FDT" + componentId + "_Screen_Count = 0\n");
		finalLUACodes.append("g_FDT" + componentId + "_First_Screen = 1\n");
		finalLUACodes.append("g_FDT" + componentId + "_Scroll_Up = nil\n");
		finalLUACodes.append("g_FDT" + componentId + "_Scroll_Down = nil\n");
		finalLUACodes.append("g_FDT" + componentId + "_Scroll_Left = nil\n");
		finalLUACodes.append("g_FDT" + componentId + "_Scroll_Right = nil\n");
		finalLUACodes.append("g_FDT" + componentId + "_Scroll_XOffset = 0\n");
		finalLUACodes.append("g_FDT" + componentId + "_Scroll_YOffset = 0\n");
		finalLUACodes.append("g_FDT" + componentId + "_Scroll_ElementIndex = 1\n");
		finalLUACodes.append(ConverterBase.getForwardStopper(componentId) + " = true\n");
		finalLUACodes.append(ConverterBase.getBackwardStopper(componentId) + " = true\n");
		finalLUACodes.append("g_FDT" + componentId + "_step = 0\n");
		finalLUACodes.append("-- Global constant\n");
		finalLUACodes.append("FDT" + componentId + "_TEXT_WINDOW_LAYER = 3\n");	//I know it is weird that text layer has a lower layer than the background, suspect it is a bug
		finalLUACodes.append("FDT" + componentId + "_MAIN_WINDOW_LAYER = 3\n");
		
		finalLUACodes.append("\n");
		addTextConstant();
		if(!hideCommonCode) {
		finalLUACodes.append("function lua_onInit(nAppId, strParam)\n");
		// sb.append("\tnErr = Graphics.ClearWindow(0)\n");
		finalLUACodes.append("end\n");
		finalLUACodes.append("function lua_onLoad()\n");
		//finalLUACodes.append("\tnErr = Graphics.RestoreDefaultAttributes()\n");
		finalLUACodes
				.append("\tnErr, iAttributeID = Graphics.CreateWindowAttrib()\n");
		finalLUACodes
		.append("\tnErr, g_FDT" + componentId + "_Main_Window_Handle = Graphics.CreateWindow(FDT" + componentId + "_MAIN_WINDOW_LAYER, iAttributeID, 0, 0, 0, 704, 480)\n");
		finalLUACodes
		.append("\tnErr, g_FDT" + componentId + "_Text_Window_Handle = Graphics.CreateWindow(FDT" + componentId + "_TEXT_WINDOW_LAYER, iAttributeID, 0, g_FDT" + componentId + "_Scroll_BWDClippedAtX, g_FDT" + componentId + "_Scroll_BWDClippedAtY, g_FDT" + componentId + "_Scroll_FWDClippedAtX, g_FDT" + componentId + "_Scroll_FWDClippedAtY)\n");
		}
	}

	public void addFooter(boolean appendFlag, int totalScene, String cmPrefix, Integer[] rectangleOKRegion, String listTextName, boolean useIDEText, ViewType mode, boolean standalone, int textWindowWidth, int textWindowHeight) {
		try {
			if(!hideCommonCode) {
				finalLUACodes.append("\tFDT" + componentId + "InitText(1,1,1)\n");
				finalLUACodes.append("\tGraphics.UpdateDisplay()\n");
				if(autoScene > -1) {
					finalLUACodes.append("\tGraphics.ClearWindow(g_FDTS1_Main_Window_Handle)\n");
					finalLUACodes.append("\tGraphics.ClearWindow(g_FDTS1_Text_Window_Handle)\n");
					finalLUACodes.append("\tGraphics.UpdateDisplay()\n");
					finalLUACodes.append("\tOnLoad" + componentId + "()\n");
					finalLUACodes.append("\tOnText" + componentId + "()\n");
				}
				finalLUACodes.append("end\n");
				finalLUACodes.append("function lua_onUnload()\n");
				finalLUACodes.append("\tApp.Cleanup()\n");
				finalLUACodes
						.append("\tGraphics.DestroyWindow(g_FDT" + componentId + "_Main_Window_Handle)\n");
				finalLUACodes.append("\tGraphics.DestroyWindow(g_FDT" + componentId + "_Text_Window_Handle)\n");
				finalLUACodes.append("\tGraphics.UpdateDisplay()\n");
				finalLUACodes.append("end\n");
			}
			finalLUACodes.append("g_FDT" + componentId + "_Scroll_BWDClippedAtX = " + mainBgX + "\n");
			finalLUACodes.append("g_FDT" + componentId + "_Scroll_BWDClippedAtY = " + mainBgY + "\n");
			finalLUACodes.append("g_FDT" + componentId + "_Scroll_FWDClippedAtX = " + textWindowWidth + "\n");
			finalLUACodes.append("g_FDT" + componentId + "_Scroll_FWDClippedAtY = " + textWindowHeight + "\n");
			finalLUACodes.append(screenHandlerLUACodes);
			finalLUACodes.append(rectangleOKRegionHandlerLUACodes);
			
			addScreenHandler(totalScene, cmPrefix, rectangleOKRegion, listTextName, useIDEText, mode, continuosAxisPlane, modelWidget1, modelWidget2);
			
			finalLUACodes.append("\n-- ##################### begin of note to integrate this component to the other widget #####################\n");
			finalLUACodes.append("-- *** In the caller script ***, the following code should be defined (preferably at the top of the script):\n");
			finalLUACodes.append("-- FDTObserver = {}\n");
			finalLUACodes.append("-- dofile('" + outputFile + "')\n");
			finalLUACodes.append("-- The following code should be invoked directly/indirectly from the caller script's lua_onKey function:\n");
			finalLUACodes.append("-- TBD\n");
			finalLUACodes.append("function OnLoad" + componentId + "()\n");
			finalLUACodes.append("\tnErr, iAttributeID = Graphics.CreateWindowAttrib()\n");
			finalLUACodes.append("\tnErr, g_FDT" + componentId + "_Main_Window_Handle = Graphics.CreateWindow(FDT" + componentId + "_MAIN_WINDOW_LAYER, iAttributeID, 0, 0, 0, 704, 480)\n");
			finalLUACodes.append("\tnErr, g_FDT" + componentId + "_Text_Window_Handle = Graphics.CreateWindow(FDT" + componentId + "_TEXT_WINDOW_LAYER, iAttributeID, 0, g_FDT" + componentId + "_Scroll_BWDClippedAtX, g_FDT" + componentId + "_Scroll_BWDClippedAtY, g_FDT" + componentId + "_Scroll_FWDClippedAtX, g_FDT" + componentId + "_Scroll_FWDClippedAtY)\n");
			finalLUACodes.append("\tFDT" + CommonUtil.getName(outputFile) + "Screen1()\n");
			finalLUACodes.append("\tg_FDT" + componentId + "_Screen_Count = 1\n");
			finalLUACodes.append("\tg_FDT" + componentId + "_Scroll_ElementIndex = 1\n");
			finalLUACodes.append("\tGraphics.UpdateDisplay()\n");
			finalLUACodes.append("end\n");
			finalLUACodes.append("function OnText" + componentId + "()\n");
			finalLUACodes.append(onTextLUACodes);
			if(autoScene > -1) {
			finalLUACodes
			.append("\tg_FDT" + componentId + "_step = FDT" + CommonUtil.getName(outputFile) + "GetAutoSceneStep()\n");
			}
			finalLUACodes.append("\tGraphics.UpdateDisplay()\n");
			finalLUACodes.append("end\n");
			finalLUACodes.append("function Show" + componentId + "()\n");
			finalLUACodes.append("\tnErr = Graphics.SetWindowVisibility(g_FDT" + componentId + "_Main_Window_Handle, TRUE)\n");
			finalLUACodes.append("\tnErr = Graphics.SetWindowVisibility(g_FDT" + componentId + "_Text_Window_Handle, TRUE)\n");
			finalLUACodes.append("\tGraphics.UpdateDisplay()\n");
			finalLUACodes.append("end\n");
			finalLUACodes.append("function Hide" + componentId + "()\n");
			finalLUACodes.append("\tnErr = Graphics.SetWindowVisibility(g_FDT" + componentId + "_Main_Window_Handle, FALSE)\n");
			finalLUACodes.append("\tnErr = Graphics.SetWindowVisibility(g_FDT" + componentId + "_Text_Window_Handle, FALSE)\n");
			finalLUACodes.append("\tGraphics.UpdateDisplay()\n");
			finalLUACodes.append("end\n");
			finalLUACodes.append("function GetText" + componentId + "()\n");
			finalLUACodes.append("\treturn " + listTextName + "\n");
			finalLUACodes.append("end\n");
			finalLUACodes.append("function SetText" + componentId + "(listTextTable)\n");
			finalLUACodes.append("\t" + listTextName + " = listTextTable\n");
			finalLUACodes.append("Util.DebugPrint('[" + CommonUtil.getName(outputFile) + "]listTextTable set to '.."+ listTextName + ")\n");
			finalLUACodes.append("end\n");
			finalLUACodes.append("function GetLastScene" + componentId + "()\n");
			finalLUACodes.append("\treturn " + ConverterBase.getLastScene(componentId) + "\n");
			finalLUACodes.append("end\n");
			finalLUACodes.append(CommonUtil.getName(outputFile) + " = {\n");
//			finalLUACodes.append("\tState = 'active',\n");
			finalLUACodes.append("\tOnKey = OnKey" + componentId + ",\n");
			finalLUACodes.append("\tOnLoad = OnLoad" + componentId + ",\n");
			finalLUACodes.append("\tOnText = OnText" + componentId + ",\n");
			finalLUACodes.append("\tGetText = GetText" + componentId + ",\n");
			finalLUACodes.append("\tSetText = SetText" + componentId + ",\n");
			finalLUACodes.append("\tGetLastScene = GetLastScene" + componentId + ",\n");
			finalLUACodes.append("\tOnUnLoad = lua_onUnLoad,\n");	//TODO need to implement this based on hideCommonCode or otherwise
			finalLUACodes.append("\tShow = Show" + componentId + ",\n");
			finalLUACodes.append("\tHide = Hide" + componentId + "\n");
			finalLUACodes.append("}\n");
//			finalLUACodes.append("function DeepCopy(t)\n");
//			finalLUACodes.append("if type(t) ~= 'table' then return t end\n");
//			finalLUACodes.append("local mt = getmetatable(t)\n");
//			finalLUACodes.append("local res = {}\n");
//			finalLUACodes.append("for k,v in pairs(t) do\n");
//			finalLUACodes.append("if type(v) == 'table' then\n");
//			finalLUACodes.append("v = Deepcopy(v)\n");
//			finalLUACodes.append("end\n");
//			finalLUACodes.append("res[k] = v\n");
//			finalLUACodes.append("end\n");
//			finalLUACodes.append("setmetatable(res,mt)\n");
//			finalLUACodes.append("return res\n");
//			finalLUACodes.append("end\n");
			String prefix = "";
			if(standalone) {
				prefix = "-- ";
			}
			finalLUACodes.append(prefix + "function " + CommonUtil.getName(outputFile) + ".Create()\n");
			finalLUACodes.append(prefix + "\tlocal self = DeepCopy(" + CommonUtil.getName(outputFile) + ")\n");
			finalLUACodes.append(prefix + "\treturn self\n");
			finalLUACodes.append(prefix + "end\n");
			finalLUACodes.append("-- *** In the current script ***, uncomment the following and change the #1 to whatever index as required by the application\n");
			finalLUACodes.append(prefix + " FDTObserver[\"" + componentId + "\"]=" + CommonUtil.getName(outputFile) + ".Create()\n");
			finalLUACodes.append("\n-- ##################### end of note to integrate this component to the other widget #####################\n");
			finalLUACodes.append("--------- end FDT ---------\n");
			finalLUACodes.append("Util.DebugPrint('" + outputFile + " script loaded successfully')\n");
			//System.out.println("script '" + finalLUACodes + "'");
			FIOSFactory app = new FIOSFactory(KSSFactory.getManager());
			KSSFactory.setFactory(app);
			KSSFactory.loadObject("FDT.lua");
			KSSFactory.loadObject("Util.lua");
			KSSFactory.loadObject("Graphics.lua");
			KSSFactory.loadObject("EPG.lua");
			KSSFactory.loadObject("VOD.lua");
//			KSSFactory.loadObject("Client.lua");
			FIOSFactory.getScript().append(finalLUACodes);
			KSSFactory.runScript();
			if (app.isExecuted()) {
				if (standalone) {
					finalLUACodes.append(CommonUtil.loadScriptText("Client.lua"));
				}
				String koolestText = "-- Human can change the following header text or make it empty during loading --\n";
				if (!appendFlag) {
					if(!useIDEText) {
						FileUtils.writeStringToFile(new File(outputFile),
								koolestText + textNameValueLUACodes.toString() + finalLUACodes.toString());
					} else {
						FileUtils.writeStringToFile(new File(outputFile), textNameValueLUACodes.toString() + finalLUACodes.toString());
					}
				} else {
					String temp = FileUtils.readFileToString(new File(
							outputFile));
					finalLUACodes.insert(0, temp);
					if(!useIDEText) {
						FileUtils.writeStringToFile(new File(outputFile),
								koolestText + textNameValueLUACodes.toString() + finalLUACodes.toString());
					} else {
						FileUtils.writeStringToFile(new File(outputFile), textNameValueLUACodes.toString() + finalLUACodes.toString());
					}
				}
			}
			finalLUACodes.setLength(0);
			textNameValueLUACodes.setLength(0);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void addForwardActionHandler(AxisPlane autoScenePlane) {
		finalLUACodes
		.append("\t\tif(g_FDT" + componentId + "_Screen_Count > g_FDT" + componentId + "_Last_Screen - 1) then\n");
		finalLUACodes.append("\t\t\tg_FDT" + componentId + "_Screen_Count = g_FDT" + componentId + "_Last_Screen\n");
		finalLUACodes.append("\t\telse\n");
		finalLUACodes
			.append("\t\t\tg_FDT" + componentId + "_Screen_Count = g_FDT" + componentId + "_Screen_Count + 1\n");
		finalLUACodes.append("\t\tend\n");
		finalLUACodes.append("\t\tFDT" + componentId + "HandleScrolling(g_FDT" + componentId + "_Screen_Count, nKeyCode)\n");
		finalLUACodes.append("\t\tFDT" + componentId + "HandleScrollingText(g_FDT" + componentId + "_Screen_Count, nKeyCode)\n");

		if(autoScene > -1) {
			if(targetForwardStopperName != null && !"".equals(targetForwardStopperName)) {
				finalLUACodes.append("\tif("+targetForwardStopperName+") then\n");
			} else {
				finalLUACodes.append("\tif("+ConverterBase.getForwardStopper(componentId)+") then\n");
			}
			if(autoScenePlane == AxisPlane.Y) {
				finalLUACodes.append("\tg_FDT" + componentId + "_currentY = g_FDT" + componentId + "_currentY + g_FDT" + componentId + "_step\n");
				finalLUACodes.append("\tFDT" + CommonUtil.getName(outputFile) + "ScreenY(g_FDT" + componentId + "_currentY)\n");
			} else if(autoScenePlane == AxisPlane.X){
				finalLUACodes.append("\tg_FDT" + componentId + "_currentX = g_FDT" + componentId + "_currentX + g_FDT" + componentId + "_step\n");
				finalLUACodes.append("\tFDT" + CommonUtil.getName(outputFile) + "ScreenX(g_FDT" + componentId + "_currentX)\n");
			}
			finalLUACodes.append("\tend\n");
		}
		finalLUACodes.append("Util.DebugPrint('back allowed '..tostring(g_FDT" + componentId + "_Scroll_BWDAllowed)..' forward allowed '..tostring(g_FDT" + componentId + "_Scroll_FWDAllowed))\n");
		finalLUACodes.append("\t\tUtil.DebugPrint('[" + CommonUtil.getName(outputFile) + "]forw scene'..g_FDT" + componentId + "_Screen_Count..' current index='..g_FDT" + componentId + "_Scroll_ElementIndex)\n");
	}
	
	private void addBackwardActionHandler(AxisPlane autoScenePlane) {
		finalLUACodes
		.append("\t\tif(g_FDT" + componentId + "_Screen_Count <= g_FDT" + componentId + "_First_Screen + 1) then\n");
		finalLUACodes.append("\t\t\tg_FDT" + componentId + "_Screen_Count = g_FDT" + componentId + "_First_Screen\n");
		finalLUACodes.append("\t\telse\n");
		finalLUACodes
				.append("\t\t\tg_FDT" + componentId + "_Screen_Count = g_FDT" + componentId + "_Screen_Count - 1\n");
		
		finalLUACodes.append("\t\tend\n");
		finalLUACodes.append("\t\tFDT" + componentId + "HandleScrolling(g_FDT" + componentId + "_Screen_Count, nKeyCode)\n");
		finalLUACodes.append("\t\tFDT" + componentId + "HandleScrollingText(g_FDT" + componentId + "_Screen_Count, nKeyCode)\n");

		if(autoScene > -1) {
			if(targetBackwardStopperName != null && !"".equals(targetBackwardStopperName)) {
				finalLUACodes.append("\tif("+targetBackwardStopperName+") then\n");
			} else {
				finalLUACodes.append("\tif("+ConverterBase.getBackwardStopper(componentId)+") then\n");
			}
			if(autoScenePlane == AxisPlane.Y) {
				finalLUACodes.append("\tg_FDT" + componentId + "_currentY = g_FDT" + componentId + "_currentY - g_FDT" + componentId + "_step\n");
				finalLUACodes.append("\tFDT" + CommonUtil.getName(outputFile) + "ScreenY(g_FDT" + componentId + "_currentY)\n");
			} else if(autoScenePlane == AxisPlane.X){
				finalLUACodes.append("\tg_FDT" + componentId + "_currentX = g_FDT" + componentId + "_currentX - g_FDT" + componentId + "_step\n");
				finalLUACodes.append("\tFDT" + CommonUtil.getName(outputFile) + "ScreenX(g_FDT" + componentId + "_currentX)\n");
			}
			finalLUACodes.append("\tend\n");
		}
		finalLUACodes.append("Util.DebugPrint('back allowed '..tostring(g_FDT" + componentId + "_Scroll_BWDAllowed)..' forward allowed '..tostring(g_FDT" + componentId + "_Scroll_FWDAllowed))\n");
		finalLUACodes.append("\t\tUtil.DebugPrint('[" + CommonUtil.getName(outputFile) + "]backw scene'..g_FDT" + componentId + "_Screen_Count..' current index='..g_FDT" + componentId + "_Scroll_ElementIndex)\n");
	}

	private void addScreenHandler(int totalScene, String cmPrefix, Integer[] rectangleOKRegion, String listTextName, boolean useIDEText, ViewType mode, AxisPlane autoScenePlane, Widgets w1, Widgets w2) {
		finalLUACodes.append(ConverterBase.getLastScene(componentId) + " = " + totalScene + "\n");
		if(!hideCommonCode) {
		finalLUACodes
				.append("function lua_onKey(nKeyCode, nKeyType, nKeyState)\n");
		finalLUACodes.append("\tUtil.DebugPrint('[" + CommonUtil.getName(outputFile) + "]lua_onKey')\n");
		finalLUACodes
				.append("\tOnKey" + componentId + "(nKeyCode, nKeyType, nKeyState)\n");
		finalLUACodes.append("\treturn HG_ERR_NONE\n");
		finalLUACodes.append("end\n");
		finalLUACodes.append("-- Remote KeyCode Global Variables\n");
		finalLUACodes.append("KEY_DOWN = 53\n");
		finalLUACodes.append("KEY_EXIT = 18\n");
		finalLUACodes.append("KEY_FWD = 29\n");
		finalLUACodes.append("KEY_INFO = 51\n");
		finalLUACodes.append("KEY_LEFT =  54\n");
		finalLUACodes.append("KEY_RIGHT = 55\n");
		finalLUACodes.append("KEY_OK = 17\n");
		finalLUACodes.append("KEY_BACK = 60\n");
		finalLUACodes.append("KEY_PAGEDOWN = 59\n");
		finalLUACodes.append("KEY_PAGEUP = 58\n");
		finalLUACodes.append("KEY_CH_UP = 11\n");
		finalLUACodes.append("KEY_CH_DN = 12\n");
		finalLUACodes.append("KEY_PAUSE = 31\n");
		finalLUACodes.append("KEY_PLAY = 27\n");
		finalLUACodes.append("KEY_REC = 49\n");
		finalLUACodes.append("KEY_REW = 30\n");
		finalLUACodes.append("KEY_STOP = 28\n");
		finalLUACodes.append("KEY_UP = 52\n");
		finalLUACodes.append("KEY_LAST = 19\n");
		finalLUACodes.append("KEY_GUIDE = 48\n");
		finalLUACodes.append("KEY_MENU = 25\n");
		finalLUACodes.append("KEY_VOD = 26\n");
		finalLUACodes.append("KEY_LIST = 61\n");
		}
		addListStringDelegate(totalScene, listTextName, useIDEText, mode);
//		addCallbackFunction();
		
		finalLUACodes
		.append("function FDT" + CommonUtil.getName(outputFile) + "GetAutoSceneStep()\n");
		if(autoScenePlane == AxisPlane.Y) {
			finalLUACodes
			.append("\toffsetAutoScene = " + (w2.getY() - w1.getY())+ "\n");
		} else if(autoScenePlane == AxisPlane.X){
			finalLUACodes
			.append("\toffsetAutoScene = " + (w2.getX() - w1.getX())+ "\n");
		}
		if(targetLastSceneName != null && !"".equals(targetLastSceneName)) {
			finalLUACodes
			.append("\tstep = offsetAutoScene/"+ targetLastSceneName + "\n");
		} else {
			finalLUACodes
			.append("\tstep = offsetAutoScene/"+ ConverterBase.getLastScene(componentId) + "\n");
		}
		
		if(rowCount == 0) {
			System.out.println("********** rowCount is not set, auto step will not be accurate! **********");
		} else {
			finalLUACodes.append("\tstep = step + (step/" + rowCount + ")\n");
			System.out.println("* rowCount is set to " + rowCount + " *");
		}
		finalLUACodes
		.append("\treturn step\n");
		finalLUACodes
		.append("end\n");
				
		if(autoScenePlane == AxisPlane.Y) {
			finalLUACodes
			.append("g_FDT" + componentId + "_currentY = " + w1.getY() + "\n");
		} else if(autoScenePlane == AxisPlane.X){
			finalLUACodes
			.append("g_FDT" + componentId + "_currentX = " + w1.getX() + "\n");
		}

		finalLUACodes
				.append("function OnKey" + componentId + "(nKeyCode, nKeyType, nKeyState)\n");
		finalLUACodes.append("\tErr = Graphics.ClearWindow(g_FDT" + componentId + "_Text_Window_Handle)\n");

		finalLUACodes.append("\tif(nKeyCode == KEY_UP) then\n");
		if(mode == ViewType.VERTICAL_LISTVIEW) {
			addBackwardActionHandler(continuosAxisPlane);
		} else {
			finalLUACodes.append("\t\tUtil.DebugPrint('[" + CommonUtil.getName(outputFile) + "]KEY_UP do nothing, as it is horizontal list view')\n");
		}
		finalLUACodes.append("\telseif(nKeyCode == KEY_DOWN) then\n");
		if(mode == ViewType.VERTICAL_LISTVIEW) {
			addForwardActionHandler(continuosAxisPlane);
		} else {
			finalLUACodes.append("\t\tUtil.DebugPrint('[" + CommonUtil.getName(outputFile) + "]KEY_DOWN do nothing, as it is horizontal list view')\n");
		}
		finalLUACodes.append("\telseif(nKeyCode == KEY_LEFT) then\n");
		if(mode == ViewType.HORIZONTAL_LISTVIEW) {
			addBackwardActionHandler(continuosAxisPlane);
		} else {
			finalLUACodes.append("\t\tUtil.DebugPrint('[" + CommonUtil.getName(outputFile) + "]KEY_LEFT do nothing, as it is vertical list view')\n");
		}
		finalLUACodes.append("\telseif(nKeyCode == KEY_RIGHT) then\n");
		if(mode == ViewType.HORIZONTAL_LISTVIEW) {
			addForwardActionHandler(continuosAxisPlane);
		} else {
			finalLUACodes.append("\t\tUtil.DebugPrint('[" + CommonUtil.getName(outputFile) + "]KEY_RIGHT do nothing, as it is vertical list view')\n");
		}
		finalLUACodes.append("\telseif(nKeyCode == KEY_OK) then\n");
		finalLUACodes.append("\t\tFDT" + componentId + "HandleScrollingText(g_FDT" + componentId + "_Screen_Count, nKeyCode)\n");
		finalLUACodes.append("\t\t--Util.DebugPrint('[" + CommonUtil.getName(outputFile) + "]ok')\n");
		finalLUACodes.append("\telseif (nKeyCode == KEY_INFO) then\n");
		finalLUACodes.append("\t\t\t--DrawBackground()\n");
		finalLUACodes.append("\t\t\t--Util.DebugPrint('[" + CommonUtil.getName(outputFile) + "]info')\n");
//		finalLUACodes.append("\t\telse\n");
//		finalLUACodes.append("\t\t\tFDT" + componentId + "HandleScrollingText(g_FDT" + componentId + "_Screen_Count, nKeyCode)\n");	//TBD - how about any other key like Page Up?
		finalLUACodes.append("\tend\n");
		
		if(autoScene == -1) {
			for (int i = 1; i <= totalScene; i++) {
				finalLUACodes
						.append("\tif(g_FDT" + componentId + "_Screen_Count == " + i + ") then\n");
				finalLUACodes.append("\t\t" + cmPrefix + "Screen" + i + "()\n");
				if(rectangleOKRegion != null && rectangleOKRegion[0] != null && rectangleOKRegion[i-1] > 0) {
					finalLUACodes.append("\t\tif(nKeyCode == KEY_OK) then\n");
					finalLUACodes.append("\t\t\tFDTListScreenRectangleOKRegionHandler" + i + "()\n");
					finalLUACodes.append("\t\tend\n");
				}
				finalLUACodes.append("\tend\n");
			}
		}
		finalLUACodes.append("\tGraphics.UpdateDisplay()\n");		
		finalLUACodes.append("end\n");
	}

	private void addTextConstant() {
//		if(!hideCommonCode) {
		finalLUACodes.append("-- Font display flag\n");
		finalLUACodes.append("FONT_ATTRS_NORMAL = 1\n");
		finalLUACodes.append("FONT_ATTRS_ELIPSE = 2 \n");
		finalLUACodes.append("FONT_ATTRS_MULTILINE = 4\n");
		finalLUACodes.append("FONT_ATTRS_CLEARRECT = 8\n");
		finalLUACodes.append("FONT_ATTRS_RIGHT_JUST = 16\n");
		finalLUACodes.append("FONT_ATTRS_FADEOUT = 32\n");
		finalLUACodes.append("FONT_ATTRS_VERTICAL_BOTTOM_UP = 256\n");
		finalLUACodes.append("FONT_ATTRS_VERTICAL_TOP_DOWN = 512\n");
//		}
	}

	/**
	 * This function grabs the position of the primary background image.
	 * 
	 * @param w
	 * @param currentScene
	 */
	@Deprecated
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
	 * This is the function that handle text which can be scroll inside the List.
	 * 
	 * @param w
	 * @param sb
	 * @param currentScene
	 * @param useIDEText
	 * @param uiText
	 * @param textFieldCount
	 * @param listTextName 
	 */
	public void handleListText(Widgets w, StringBuffer sb, int currentScene, boolean useIDEText, String[][] uiText, int textFieldCount, String listTextName, int totalScene) {
		//System.out.println("+++++++++++++++ currentScene " + currentScene + " textFieldCount " + textFieldCount + " +++++++++++++++++++++++++++++++++++");
		//=== store text ordering based on key "frame"/scene (first screen)
		//TODO the values are always the first element, need to do something about that!
		if(currentScene == 1) {
			if(useIDEText) {
				textNameValueLUACodes.append(c.getTextName(w.getX(), w.getY(), componentId) + " = '" + c.filterIDEText(w.getText()) + "'\n");
			} else
			if(!useIDEText) {
				if(uiText == null) {
					textNameValueLUACodes.append(c.getTextName(w.getX(), w.getY(), componentId) + " = " + "'CHANGE_YOUR_TEXT" + textFieldCount + "_HERE'\n");
				} else {
					textNameValueLUACodes.append(c.getTextName(w.getX(), w.getY(), componentId) + " = " + "'" + c.getText(1, textFieldCount) + "'\n");
				}
			}
			firsSceneWidgetNames.add(w);
			if(autoScene > -1) {
				onTextLUACodes.append("\t" + c.getTextName(w.getX(), w.getY(), componentId) + " = " + listTextName + "["+ onTextCount++ + "]\n");
			} else {
				//=== handle standalone converter
				onTextLUACodes.append("\t" + c.getTextName(w.getX(), w.getY(), componentId) + " = standalone["+ onTextCount++ + "]\n");
			}
		}
		if(useIDEText && ++ideTextInitCount <= totalScene) {
			textNameValueLUACodes.append(listTextName + "[" + ideTextInitCount + "]= " + c.getTextName(w.getX(), w.getY(), componentId) + "\n");
		}
		sb
				.append("\tnErr = Graphics.DrawString(iAttributeID, g_FDT" + componentId + "_Text_Window_Handle, "
						+ w.getX()
						+ "+g_FDT" + componentId + "_Scroll_XOffset-g_FDT" + componentId + "_Scroll_BWDClippedAtX, "
						+ w.getY()
						+ "+g_FDT" + componentId + "_Scroll_YOffset-g_FDT" + componentId + "_Scroll_BWDClippedAtY, "
						+ w.getMeasuredWidth()
						+ ", "
						+ w.getMeasuredHeight()
						+ ", "+ c.getFontColor(w) +", "+ c.getFontBgColor(w) +", "						
						+ Graphics.getFontStyle(w.getFont().getSize())
//						+ ", FONT_ATTRS_MULTILINE, " + c.getTextName(w.getX(), w.getY(), componentId) + ")\n");
		+ ", FONT_ATTRS_MULTILINE, SafeString(" + c.getTextName(w.getX(), w.getY(), componentId) + "))\n");
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
		sb.append("\tnErr = Graphics.DrawString(iAttributeID, g_FDT" + componentId + "_Text_Window_Handle, "
						+ w.getX()
						+ ", "
						+ w.getY()
						+ ", "
						+ w.getMeasuredWidth()
						+ ", "
						+ w.getMeasuredHeight()
						+ ", "+ c.getFontColor(w) +", "+ c.getFontBgColor(w) +", "						
						+ Graphics.getFontStyle(w.getFont().getSize())
						+ ", FONT_ATTRS_MULTILINE, '" + c.filterIDEText(w.getText()) + "')\n");
	}

	public void addSceneHeader(String cmPrefix, int currentScene) {
		screenHandlerLUACodes.append("function " + cmPrefix + "Screen"
				+ currentScene + "()\n");
	}

	public void addSceneFooter() {
		screenHandlerLUACodes.append("\tGraphics.UpdateDisplay()\n");
		screenHandlerLUACodes.append("end\n");
	}

	private void addRectangeOKRegionHandler(Widgets w, StringBuffer rectangleOKRegionHandlerLUACodes, String cmPrefix, int currentScene) {
		rectangleOKRegionHandlerLUACodes.append("function " + cmPrefix + "ScreenRectangleOKRegionHandler" + currentScene + "()\n");
//		Color c = Color.decode(w.getForeground());
//		rectangleOKRegionHandlerLUACodes.append("\tRECT_COLOR = '0xFF"+ Integer.toHexString(c.getRGB() & 0x00ffffff) +"'\n");
		rectangleOKRegionHandlerLUACodes.append("\tRECT_COLOR = '" + FIOSConverter.getColorCode(w.getForeground())+ "'\n");
		rectangleOKRegionHandlerLUACodes.append("\tGraphics.DrawLine(g_FDT" + componentId + "_Main_Window_Handle,"+w.getX()+","+w.getY()+","+w.getMeasuredWidth()+",0,RECT_COLOR)\n");
		rectangleOKRegionHandlerLUACodes.append("\tGraphics.DrawLine(g_FDT" + componentId + "_Main_Window_Handle,"+w.getX()+","+w.getY()+","+w.getMeasuredHeight()+",1,RECT_COLOR)\n");
		rectangleOKRegionHandlerLUACodes.append("\tGraphics.DrawLine(g_FDT" + componentId + "_Main_Window_Handle,"+w.getX()+","+w.getY()+"+"+w.getMeasuredHeight()+","+w.getMeasuredWidth()+",0,RECT_COLOR)\n");
		rectangleOKRegionHandlerLUACodes.append("\tGraphics.DrawLine(g_FDT" + componentId + "_Main_Window_Handle,"+w.getX()+"+"+w.getMeasuredWidth()+","+w.getY()+","+w.getMeasuredHeight()+",1,RECT_COLOR)\n");
		rectangleOKRegionHandlerLUACodes.append("\tGraphics.UpdateDisplay()\n");
		rectangleOKRegionHandlerLUACodes.append("end\n");
	}
	
	/**
	 * Assign a delegate that takes care of string on behalf of list view object.
	 * @param totalScene 
	 * @param listTextName 
	 * @param mode 
	 * 
	 * @param w
	 * @param rectangleOKRegionHandlerLUACodes
	 */
	private void addListStringDelegate(int totalScene, String listTextName, boolean useIDEText, ViewType mode) {
		finalLUACodes.append("-- ######################## begin of text scrolling capability ##########################\n");
		finalLUACodes.append("-- Note: most important variables are scene #, key and g_FDT" + componentId + "_Scroll_ElementIndex\n");
		finalLUACodes.append("-- ######################################################################################\n");
		finalLUACodes.append("g_FDT" + componentId + "_Screen_Count = g_FDT" + componentId + "_Last_Screen	-- due to the preview in the onLoad\n");
		finalLUACodes.append("g_FDT" + componentId + "_Scroll_ElementIndex = g_FDT" + componentId + "_Last_Screen	-- due to the preview in the onLoad; assuming total list items are the same as scene counts\n\n");
		//finalLUACodes.append("g_FDT" + componentId + "_NextYOffset = {44, 45, 46}\n");	//TBD - future enhancement
//		finalLUACodes.append("function FDTGetNextYOffset()\n");
//		finalLUACodes.append("\treturn " + rowHeight/2 + " -- kss: scrolling step assumes all row heights are the same\n");		//TBD - assumes all heights are the same
//		finalLUACodes.append("end\n");
		//=== constructing HandleScrolling function
		finalLUACodes.append("function FDT" + componentId + "HandleScrolling(scene, key)\n");
		String bwdKey = null, fwdKey = null;
		if(mode == ViewType.HORIZONTAL_LISTVIEW) {
			bwdKey = "KEY_LEFT";
			fwdKey = "KEY_RIGHT";
		} else
		if(mode == ViewType.VERTICAL_LISTVIEW) {
			bwdKey = "KEY_UP";
			fwdKey = "KEY_DOWN";
		}
		
		
		finalLUACodes.append("\t" + ConverterBase.getForwardStopper(componentId) + " = true\n");
		finalLUACodes.append("\t" + ConverterBase.getBackwardStopper(componentId) + " = true\n");
		finalLUACodes.append("\tif(scene == 1 " + andOperator + " key == "+ bwdKey +") " + ifBeginDelimiter + "\n");
		finalLUACodes.append("\t\tif(g_FDT" + componentId + "_Scroll_ElementIndex <= 1) " + ifBeginDelimiter + "\n");
		finalLUACodes.append("\t\t\tg_FDT" + componentId + "_Scroll_BWDAllowed = false" + lineDelimiter + "\n");
		finalLUACodes.append("\t\t" + ifEndDelimiter + "\n");
		finalLUACodes.append("\t\tif(" + notOperator + " g_FDT" + componentId + "_Scroll_BWDAllowed) " + ifBeginDelimiter + "\n");
		finalLUACodes.append("\t\t\tg_FDT" + componentId + "_Scroll_ElementIndex = 1" + lineDelimiter + "\n");
		finalLUACodes.append("\t\t" + elseToken + "\n");
		finalLUACodes.append("\t\t\tg_FDT" + componentId + "_Scroll_ElementIndex = g_FDT" + componentId + "_Scroll_ElementIndex - 1" + lineDelimiter + "\n");
		finalLUACodes.append("\t\t" + ifEndDelimiter + "\n");
		finalLUACodes.append("\t" + elseToken + "if(key == "+ bwdKey +") " + ifBeginDelimiter + "\n");
		finalLUACodes.append("\t\tg_FDT" + componentId + "_Scroll_ElementIndex = g_FDT" + componentId + "_Scroll_ElementIndex - 1" + lineDelimiter + "\n");
		finalLUACodes.append("\t" + methodEndDelimiter + "\n");
		finalLUACodes.append("\n");
		
		finalLUACodes.append("\tif(scene == " + totalScene + " " + andOperator + " key == "+ fwdKey +") " + ifBeginDelimiter + "\n");
		finalLUACodes.append("\t\tlastElementIndex = GetLastIndex(" + listTextName + ") - 1" + lineDelimiter + "\n");
		finalLUACodes.append("\t\t--=== zero element and only at the last row\n");
		finalLUACodes.append("\t\tif(lastElementIndex <= 1 " + andOperator + " g_FDT_Scroll_ElementIndex == " + totalScene + ") " + ifBeginDelimiter + "\n");
		finalLUACodes.append("\t\t\tg_FDT" + componentId + "_Scroll_FWDAllowed = false" + lineDelimiter + "\n");
		finalLUACodes.append("\t\t--=== total data elements less than the total rows in UI\n");
		finalLUACodes.append("\t\t" + elseToken + "if(lastElementIndex == " + rowCount + " " + andOperator + " g_FDT" + componentId + "_Scroll_ElementIndex == lastElementIndex) " + ifBeginDelimiter + "\n");
		finalLUACodes.append("\t\t\tg_FDT" + componentId + "_Scroll_FWDAllowed = false" + lineDelimiter + "\n");
		finalLUACodes.append("\t\t--=== boundary condition i.e. total data elements equals total rows in UI\n");
		finalLUACodes.append("\t\t" + elseToken + "if (lastElementIndex > " + rowCount + " " + andOperator + " g_FDT" + componentId + "_Scroll_ElementIndex == lastElementIndex) " + ifBeginDelimiter + "\n");
		finalLUACodes.append("\t\t\tg_FDT" + componentId + "_Scroll_FWDAllowed = false" + lineDelimiter + "\n");
		finalLUACodes.append("\t\t--=== total data elements more than total rows in UI\n");
		finalLUACodes.append("\t\t" + elseToken + "if(g_FDT" + componentId + "_Scroll_ElementIndex -1 == lastElementIndex) " + ifBeginDelimiter + "\n");
		finalLUACodes.append("\t\t\tg_FDT" + componentId + "_Scroll_FWDAllowed = false" + lineDelimiter + "\n");
		finalLUACodes.append("\t\t" + methodEndDelimiter + "\n");
		finalLUACodes.append("\t\t" + "\n");

		finalLUACodes.append("\t\tif(" + notOperator + " g_FDT" + componentId + "_Scroll_FWDAllowed) " + ifBeginDelimiter + "\n");
		finalLUACodes.append("\t\t\t--leave index alone and do nothing\n");
		finalLUACodes.append("\t\t\t--g_FDT" + componentId + "_Scroll_ElementIndex = lastElementIndex" + lineDelimiter + "\n");
		finalLUACodes.append("\t\t"  + elseToken + methodBeginDelimiter + "\n");
		finalLUACodes.append("\t\t\tg_FDT" + componentId + "_Scroll_ElementIndex = g_FDT" + componentId + "_Scroll_ElementIndex + 1" + lineDelimiter + "\n");
		finalLUACodes.append("\t\t" + ifEndDelimiter + "\n");
		finalLUACodes.append("\t"  + elseToken + "if(key == "+ fwdKey +") " + ifBeginDelimiter + "\n");
		finalLUACodes.append("\t\tg_FDT" + componentId + "_Scroll_ElementIndex = g_FDT" + componentId + "_Scroll_ElementIndex + 1" + lineDelimiter + "\n");
		finalLUACodes.append("\t" + methodEndDelimiter + "\n");
		finalLUACodes.append("\n");
		
		finalLUACodes.append("\tErr = Graphics.ClearWindow(g_FDT" + componentId + "_Text_Window_Handle)" + lineDelimiter + "\n");
		//finalLUACodes.append("\tGraphics.UpdateDisplay()" + lineDelimiter + "\n");
		finalLUACodes.append(methodEndDelimiter + "\n");

		finalLUACodes.append("function FDT" + componentId + "HandleScrollingText(scene, key) "+ methodBeginDelimiter  + "\n");
		finalLUACodes.append("if(scene == 1 " + andOperator + " key == "+ bwdKey +" " + andOperator + " g_FDT" + componentId + "_Scroll_ElementIndex >= 1) " + ifBeginDelimiter + "\n");
		finalLUACodes.append("FDT" + componentId + "InitText(scene, key, g_FDT" + componentId + "_Scroll_ElementIndex)" + lineDelimiter + "\n");
		finalLUACodes.append(elseIfToken + " (scene == "+ totalScene +"-1 " + andOperator + " key == "+ bwdKey +" " + andOperator + " g_FDT" + componentId + "_Scroll_ElementIndex == "+ totalScene +"-1) " + ifBeginDelimiter + "\n");
		finalLUACodes.append("FDT" + componentId + "InitText(scene, key, g_FDT" + componentId + "_Scroll_ElementIndex -2 + ("+ JS_ELEMENT_OFFSET +"))" + lineDelimiter + "\n");	//TBD - 2? needs to test boundary!!!
		finalLUACodes.append(elseIfToken + " (scene == "+ totalScene + " " + andOperator + " key == "+ fwdKey +" " + andOperator + " g_FDT" + componentId + "_Scroll_ElementIndex >= "+ totalScene +"+1) " + ifBeginDelimiter + "\n");
		finalLUACodes.append("FDT" + componentId + "GetNextText(scene, key, g_FDT" + componentId + "_Scroll_ElementIndex)" + lineDelimiter + "\n");
		finalLUACodes.append(elseIfToken + " (scene == "+ totalScene + " " + andOperator + " key == KEY_OK " + andOperator + " g_FDT" + componentId + "_Scroll_ElementIndex == "+ totalScene +") " + ifBeginDelimiter + "\n");
		finalLUACodes.append("FDT" + componentId + "InitText(scene, key, 1)" + lineDelimiter + "\n");
		finalLUACodes.append(methodEndDelimiter + "\n");
		finalLUACodes.append(methodEndDelimiter + "\n");
		
		
		
		
		finalLUACodes.append("function FDT" + componentId + "InitText(pageindex, key, index) "+ methodBeginDelimiter  + "\n");
		Iterator it = firsSceneWidgetNames.iterator();
		Widgets w = null;
		int i = 1;
		if(autoScene == -1) {	//TODO autoscene does not support text but future can support one
			it = firsSceneWidgetNames.iterator();
			if(it.hasNext()) {
				w = (Widgets)it.next();
				finalLUACodes.append(c.getTextName(w.getX(), w.getY(), componentId) + " = "+ listTextName +"[index]\n");
			}
			while(it.hasNext()) {
				w = (Widgets)it.next();
//				finalLUACodes.append("index," + c.getTextName(w.getX(), w.getY(), componentId) + " = next("+ listTextName +", index)\n");
				finalLUACodes.append(c.getTextName(w.getX(), w.getY(), componentId) + " = "+ listTextName +"[index + " + i++ + "]\n");
			}
		}
		finalLUACodes.append("end\n");
		
		finalLUACodes.append("function FDT" + componentId + "GetNextText(pageindex, key, index)\n");
		i = i - 1;
		if(autoScene == -1) {	//TODO autoscene does not support text but future can support one
			it = firsSceneWidgetNames.iterator();
			while(it.hasNext()) {
				w = (Widgets)it.next();
//				finalLUACodes.append("index," + c.getTextName(w.getX(), w.getY(), componentId) + " = next("+ listTextName +", index)\n");
				finalLUACodes.append(c.getTextName(w.getX(), w.getY(), componentId) + " = "+ listTextName +"[index - " + i-- + "]\n");
			}
		}
		finalLUACodes.append("end\n");
		finalLUACodes.append("-- ######################## end of text scrolling capability ##########################\n");
		if(!hideCommonCode) {
		finalLUACodes.append("function GetLastIndex(t)\n");
		finalLUACodes.append("\ti = 1\n");
		finalLUACodes.append("\twhile (t[i] ~= nil) do\n");
		finalLUACodes.append("\t\ti = i + 1\n");
		finalLUACodes.append("\tend\n");
		finalLUACodes.append("\treturn i\n");
		finalLUACodes.append("end\n");
		}
	}

	/*
	private void addCallbackFunction() {
		finalLUACodes.append("function FDTOnKey(nKeyCode, nKeyType, nKeyState)\n");
		finalLUACodes.append("\tnErr, iAttributeID = Graphics.CreateWindowAttrib()\n");
		finalLUACodes.append("\tnErr, g_FDT" + componentId + "_Main_Window_Handle = Graphics.CreateWindow(FDT_MAIN_WINDOW_LAYER" + componentId + ", iAttributeID, 0, 0, 0, 704, 480)\n");
		finalLUACodes.append("\tnErr, g_FDT" + componentId + "_Text_Window_Handle = Graphics.CreateWindow(FDT_TEXT_WINDOW_LAYER" + componentId + ", iAttributeID, 0, g_FDT" + componentId + "_Scroll_BWDClippedAtX, g_FDT" + componentId + "_Scroll_BWDClippedAtY, g_FDT" + componentId + "_Scroll_FWDClippedAtX, g_FDT" + componentId + "_Scroll_FWDClippedAtY)\n");
		finalLUACodes.append("\tGraphics.UpdateDisplay()\n");
		finalLUACodes.append("\tOnKey" + componentId + "(nKeyCode, nKeyType, nKeyState)\n");
		finalLUACodes.append("end\n");
	}
	*/
	
	/**
	 * As FiOS does not support grayscale, currently this is mapped to alpha blending.
	 * 
	 * This is not used currently.
	 * @deprecated
	 */
	private int handleGrayScale(Widgets w) {
		int retVal = 64;
		if(w.getGrayscale()) {
			retVal = 20;
		}
		return retVal;
	}
	
	public void convert(Widgets w, int wCount, Integer[] rectangleOKRegion, String imgName, String cmPrefix, int textFieldCount, int currentScene, boolean useIDEText, String[][] uiText, String listTextName) {
		System.out.println("widget " + wCount + " x " + w.getX()
				+ " y " + w.getY() + " width "
				+ w.getMeasuredWidth() + " height "
				+ w.getMeasuredHeight());
		finalLUACodes.append("\t--Util.DebugPrint('[" + CommonUtil.getName(outputFile) + "]lua_onLoad " + wCount
				+ "')\n");
		//=== all scene default is no selection region
		rectangleOKRegion[0] = 0;
		if ("model:VideoPlayer".equals(w.getType())) {
			finalLUACodes
					.append("\tVOD.DrawPoster(1, g_FDT" + componentId + "_Main_Window_Handle + "
							+ wCount
							+ ", 1, 1, "
							+ w.getX()
							+ ", "
							+ w.getY()
							+ ", "
							+ w.getMeasuredWidth()
							+ ", "
							+ w.getMeasuredHeight() + ", 0)\n");
			
		} else if("model:HLine".equals(w.getType())) {
				finalLUACodes.append("\tnErr = Graphics.DrawLine(g_FDT" + componentId + "_Main_Window_Handle, "
						 			 + w.getX()
						 			 + ", "
						 			 + w.getY()
						 			 + ", "
						 			 + w.getMeasuredWidth()
						 			 + ", 0, "
						 			 + "'" + FIOSConverter.getColorCode(w.getForeground())+"')\n");
			
		} else if("model:VLine".equals(w.getType())) {
				finalLUACodes.append("\tnErr = Graphics.DrawLine(g_FDT" + componentId + "_Main_Window_Handle, "
						 			 + w.getX()
						 			 + ", "
						 			 + w.getY()
						 			 + ", "
						 			 + w.getMeasuredHeight()
						 			 + ", 1, "
						 			 + "'" + FIOSConverter.getColorCode(w.getForeground())+"')\n");
				
		} else if("model:Rectangle".equals(w.getType())) {
				finalLUACodes.append("\tnErr = Graphics.DrawRect(g_FDT" + componentId + "_Main_Window_Handle, "
									 + w.getX()
									 + ", "
									 + w.getY()
									 + ", " 
									 + w.getMeasuredWidth()
									 + ", "
									 + w.getMeasuredHeight()
									 + ", "
									 + "'"+FIOSConverter.getColorCode(w.getBackground())+"', 1)\n");
				
		} else if ("model:Image".equals(w.getType())) {
			//handleBackground(w, currentScene);
			if(!hideCommonCode) {
			finalLUACodes.append(cmPrefix + "Screen" + wCount
					+ "()\n");
			}
			screenHandlerLUACodes.append("function " + cmPrefix
					+ "Screen" + wCount + "()\n");
			/*if (w.getSrc() != null && w.getGrayscale()) {
				String temp1 = c.getImageFileName(w.getSrc());
				String temp2 = null;
				try {
					temp2 = GraphicsUtil.toGrayScaleImage(temp1);	//TODO obviously this is not optimized
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				screenHandlerLUACodes.append("\t"
						+ imgName
						+ " = "
						+ c.getImageNameMagicNumber(c.getImageName(temp2)) + "\n");
			} else if (w.getSrc() != null && !c.isBinImageFile(w.getSrc())) {
				screenHandlerLUACodes.append("\t"
						+ imgName
						+ " = "
						+ c.getImageNameMagicNumber(c.getImageName(w
								.getSrc())) + "\n");
			} else 
			if (w.getSrc() != null) {
				imgName = c.getImageName(w.getSrc());
			}
			if (w.getSrc() != null) {
				screenHandlerLUACodes
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
			}*/
			 if (w.getSrc() != null && w.getGrayscale()) {
				 String temp1 = c.getImageFileName(w.getSrc());
					String temp2 = null;
					try {
						temp2 = GraphicsUtil.toGrayScaleImage(temp1);	//TODO obviously this is not optimized
						
					} catch (Exception e) {
						e.printStackTrace();
					}
				screenHandlerLUACodes
						.append("\tnErr = Graphics.DrawImageExByID(iAttributeID, g_FDT" + componentId + "_Main_Window_Handle, "
								+ c.getImageNameMagicNumber(c.getImageName(temp2))
								+ ", "
								+ w.getX()
								+ ", "
								+ w.getY()
								+ ", "
								+ w.getMeasuredWidth()
								+ ", "
								+ w.getMeasuredHeight() + ", 64)\n");
			} else {
				screenHandlerLUACodes
				.append("\tnErr = Graphics.DrawImageExByID(iAttributeID, g_FDT" + componentId + "_Main_Window_Handle, "
						+ c.getImageNameMagicNumber(c.getImageName(w.getSrc()))
						+ ", "
						+ w.getX()
						+ ", "
						+ w.getY()
						+ ", "
						+ w.getMeasuredWidth()
						+ ", "
						+ w.getMeasuredHeight() + ", 64)\n");
			} 
			screenHandlerLUACodes
					.append("\tGraphics.UpdateDisplay()\n");
			screenHandlerLUACodes.append("end\n");
		} else if ("model:TextField".equals(w.getType()) || "model:TextArea".equals(w.getType())) {
			textFieldCount++;
			handleListText(w, finalLUACodes, currentScene, useIDEText, uiText, textFieldCount, cmPrefix, ideTextInitCount);
		} else if (("model:Label".equals(w.getType()) || "model:Text".equals(w.getType())) && w.getText() != null && !"".equals(w.getText().trim())) {
			handleNormalText(w, finalLUACodes, currentScene, useIDEText, uiText, textFieldCount);
		} else{
			// TBD - faking the window since attributes is not
			// working
			if(!hideCommonCode) {
			finalLUACodes
					.append("\tnErr = Graphics.DrawImageExByID(iAttributeID, g_FDT" + componentId + "_Main_Window_Handle, 11192, "
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

	public void convertContinuousAutoScene(String imgName, AxisPlane autoScenePlane) {
		if ("model:Image".equals(modelWidget1.getType())) {
			if(modelWidget1 == null) throw new RuntimeException("First model widget can not be empty or NULL.");
			if(modelWidget2 == null) throw new RuntimeException("Last model widget can not be empty or NULL.");
			
			StringBuffer screenHandlerLUACodes2 = new StringBuffer();
			StringBuffer screenHandlerLUACodes1 = new StringBuffer();
			if(autoScenePlane == AxisPlane.Y) {
				screenHandlerLUACodes1.append("function FDT" + CommonUtil.getName(outputFile) + "ScreenY(y)\n");
				screenHandlerLUACodes1.append("\tErr = Graphics.ClearWindow(g_FDT" + componentId + "_Main_Window_Handle)\n");
				handleUserFriendlyImageName(screenHandlerLUACodes2, modelWidget1, imgName);
				screenHandlerLUACodes2
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
				screenHandlerLUACodes1.append("function FDT" + CommonUtil.getName(outputFile) + "ScreenX(x)\n");
				screenHandlerLUACodes1.append("\tErr = Graphics.ClearWindow(g_FDT" + componentId + "_Main_Window_Handle)\n");
				handleUserFriendlyImageName(screenHandlerLUACodes2, modelWidget1, imgName);
				screenHandlerLUACodes2
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
						FIOSConverter c = new FIOSConverter();
						c.setNativeSDK(true);
						c.setImageReduction(true);	//XXX false does not work if the image width is too small?
						imgName = c.handleImage(w);
						handleUserFriendlyImageName(screenHandlerLUACodes1, w, imgName);
						screenHandlerLUACodes1
						.append("\tnErr = Graphics.DrawImageExByID(iAttributeID, g_FDT" + componentId + "_Main_Window_Handle, "
								+ imgName
								+ ", "
								+ w.getX()
								+ ", "
								+ w.getY()
								+ ", "
								+ w.getMeasuredWidth()
								+ ", "
								+ w.getMeasuredHeight() + ", 32)\n");
					}
				}
			}
			
			//=== workaround as FiOS TV layering is not working yet
			screenHandlerLUACodes.append(screenHandlerLUACodes1);
			screenHandlerLUACodes.append(screenHandlerLUACodes2);
			
			screenHandlerLUACodes.append("\tGraphics.UpdateDisplay()\n");
			screenHandlerLUACodes.append("end\n");
		}
	}
	
	private void handleUserFriendlyImageName(StringBuffer screenHandlerLUACodes, Widgets w, String imgName) {
		if(imageReduction) {
			screenHandlerLUACodes.append("\t"
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
			screenHandlerLUACodes.append("\t"
					+ imgName
					+ " = "
					+ c.getImageNameMagicNumber(c.getImageName(temp2)) + "\n");
		} else
		if (w.getSrc() != null && !c.isBinImageFile(w.getSrc())) {
			screenHandlerLUACodes.append("\t"
					+ imgName
					+ " = "
					+ c.getImageNameMagicNumber(c.getImageName(w.getSrc())) + "\n");
		}
	}
	
	public void convertScene(Widgets w, int wCount, Integer[] rectangleOKRegion, String imgName, String cmPrefix, int textFieldCount, int currentScene, boolean useIDEText, String[][] uiText, String listTextName, int totalScene) {
		System.out.println("widget " + wCount + " x " + w.getX()
				+ " y " + w.getY() + " width "
				+ w.getMeasuredWidth() + " height "
				+ w.getMeasuredHeight());
		//finalLUACodes.append("\tUtil.DebugPrint('[" + CommonUtil.getName(outputFile) + "]lua_onLoad " + wCount + "')\n");
		//=== all scene default is no selection region
		rectangleOKRegion[currentScene-1] = 0;
		if ("model:VideoPlayer".equals(w.getType())) {
			finalLUACodes
					.append("\tVOD.DrawPoster(1, g_FDT" + componentId + "_Main_Window_Handle + "
							+ wCount
							+ ", 1, 1, "
							+ w.getX()
							+ ", "
							+ w.getY()
							+ ", "
							+ w.getMeasuredWidth()
							+ ", "
							+ w.getMeasuredHeight() + ", 0)\n");
		} else if("model:HLine".equals(w.getType())) {
			finalLUACodes.append("\tnErr = Graphics.DrawLine(g_FDT" + componentId + "_Main_Window_Handle, "
		 			 + w.getX()
		 			 + ", "
		 			 + w.getY()
		 			 + ", "
		 			 + w.getMeasuredWidth()
		 			 + ", 0, "
		 			 + "'" + FIOSConverter.getColorCode(w.getForeground())+"')\n");

		}  else if("model:VLine".equals(w.getType())) {
			finalLUACodes.append("\tnErr = Graphics.DrawLine(g_FDT" + componentId + "_Main_Window_Handle, "
		 			 + w.getX()
		 			 + ", "
		 			 + w.getY()
		 			 + ", "
		 			 + w.getMeasuredHeight()
		 			 + ", 1, "
		 			 + "'" + FIOSConverter.getColorCode(w.getForeground())+"')\n");

		} else if ("model:Image".equals(w.getType()) && !ConverterBase.DO_NOT_CONVERT.equals(w.getCustomId())) {
			if(autoScene > -1) {
				screenHandlerLUACodes.append("\tErr = Graphics.ClearWindow(g_FDT" + componentId + "_Main_Window_Handle)\n");
				if(!hideCommonCode) {
					finalLUACodes.append("\tErr = Graphics.ClearWindow(g_FDT" + componentId + "_Main_Window_Handle)\n");
				}
			}
			//handleBackground(w, currentScene);
			currentSceneToken = cmPrefix + "Screen" + currentScene + "()\n";
			if(!currentSceneToken.equals(previousSceneToken)) {
				if(!hideCommonCode) {
				finalLUACodes.append("\t" + cmPrefix + "Screen" + currentScene
						+ "()\n");
				}
			}
			previousSceneToken = currentSceneToken;

			//handleUserFriendlyImageName(screenHandlerLUACodes, w, imgName);
			if(imageReduction) {
				screenHandlerLUACodes
				.append("\tnErr = Graphics.DrawImageExByID(iAttributeID, g_FDT" + componentId + "_Main_Window_Handle, "
						+ c.getImageNameMagicNumber(ImageUtil.getReducedFileName(w))
						+ ", "
						+ w.getX()
						+ ", "
						+ w.getY()
						+ ", "
						+ w.getMeasuredWidth()
						+ ", "
						+ w.getMeasuredHeight() + ", 64)\n");
			} else 
			if (w.getSrc() != null && w.getGrayscale()) {
				 String temp1 = c.getImageFileName(w.getSrc());
					String temp2 = null;
					try {
						temp2 = GraphicsUtil.toGrayScaleImage(temp1);	//TODO obviously this is not optimized
						
					} catch (Exception e) {
						e.printStackTrace();
					}
				screenHandlerLUACodes
						.append("\tnErr = Graphics.DrawImageExByID(iAttributeID, g_FDT" + componentId + "_Main_Window_Handle, "
								+ c.getImageNameMagicNumber(c.getImageName(temp2))
								+ ", "
								+ w.getX()
								+ ", "
								+ w.getY()
								+ ", "
								+ w.getMeasuredWidth()
								+ ", "
								+ w.getMeasuredHeight() + ", 64)\n");
			} else {
				screenHandlerLUACodes
				.append("\tnErr = Graphics.DrawImageExByID(iAttributeID, g_FDT" + componentId + "_Main_Window_Handle, "
						+ c.getImageNameMagicNumber(c.getImageName(w.getSrc()))
						+ ", "
						+ w.getX()
						+ ", "
						+ w.getY()
						+ ", "
						+ w.getMeasuredWidth()
						+ ", "
						+ w.getMeasuredHeight() + ", 64)\n");
			}
			/*if (w.getSrc() != null) {
				screenHandlerLUACodes
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
			}*/
		} else if ("model:TextField".equals(w.getType()) || "model:TextArea".equals(w.getType())) {
			textFieldCount++;
			handleListText(w, screenHandlerLUACodes, currentScene, useIDEText, uiText, textFieldCount, listTextName, totalScene);
		} else if (("model:Label".equals(w.getType()) || "model:Text".equals(w.getType())) && w.getText() != null && !"".equals(w.getText().trim())) {
			handleNormalText(w, screenHandlerLUACodes, currentScene, useIDEText, uiText, textFieldCount);
		} else if (("model:Rectangle".equals(w.getType())) && w.getAlpha() == 0) {
			addRectangeOKRegionHandler(w, rectangleOKRegionHandlerLUACodes, cmPrefix, currentScene);
			rectangleOKRegion[currentScene-1] = 1;	//TBD - one only per screen for now :)
		} else {
			// TBD - faking the window since attributes is not
			// working
			if(!hideCommonCode) {
			finalLUACodes
					.append("\tnErr = Graphics.DrawImageExByID(iAttributeID, g_FDT" + componentId + "_Main_Window_Handle, 11192, "
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

	@Override
	public String getNativeSDKHome() {
		return null;
	}

	@Override
	public void setNativeSDKHome(String fiosIrisHome) {
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

}