package com.google.code.kss.tool.common;

import com.google.code.kss.core.model.ui.wireframesketcher.Screen;
import com.google.code.kss.core.model.ui.wireframesketcher.Widgets;
import com.google.code.kss.tool.fios.FIOSConverter;
import com.google.code.kss.tool.common.ConverterBase.ViewType;

public interface Converter {

	public void addHeader(int totalScene, String listTextName, double releaseNumber, boolean useIDEText, boolean standalone);
	public void addFooter(boolean appendFlag, int totalScene, String cmPrefix, Integer[] rectangleOKRegion, String listTextName, boolean useIDEText, ViewType mode, boolean standalone, int textWindowWidth, int textWindowHeight);
	public void convert(Widgets w, int wCount, Integer[] rectangleOKRegion, String imgName, String cmPrefix, int textFieldCount, int currentScene, boolean useIDEText, String[][] uiText, String listTextName);
	public void convertScene(Widgets w, int wCount, Integer[] rectangleOKRegion, String imgName, String cmPrefix, int textFieldCount, int currentScene, boolean useIDEText, String[][] uiText, String listTextName, int totalScene);
	public void addSceneHeader(String cmPrefix, int currentScene);
	public void addSceneFooter();
	public String getOutputFile();
	public String getOutfileName(String inputFile);
	public void setOutputFile(String outputFile);
	public String getNativeSDKHome();
	public void setNativeSDKHome(String fiosIrisHome);
	public int getAutoScene();
	public void setAutoScene(int autoScene);
	public String getComponentId();
	public void setComponentId(String componentId);
	public boolean isHideCommonCode();
	public void setHideCommonCode(boolean hideCommonCode);
	public boolean isImageReduction();
	public void setImageReduction(boolean imageReduction);
	public AxisPlane getContinuosAxisPlane();
	public void setContinuosAxisPlane(AxisPlane continuosAxisPlane);
	public void convertContinuousAutoScene(String imgName, AxisPlane autoScenePlane);
	public Widgets getFirstModelWidget();
	public void setFirstModelWidget(Widgets modelWidget);
	public Widgets getLastModelWidget();
	public void setLastModelWidget(Widgets modelWidget);
	public String getTargetListName();
	public void setTargetListName(String targetListName);
	public String getTargetLastSceneName();
	public void setTargetLastSceneName(String targetLastSceneName);
	public String getTargetBackwardStopperName();
	public void setTargetBackwardStopperName(String targetBackwardStopperName);
	public String getTargetForwardStopperName();
	public void setTargetForwardStopperName(String targetForwardStopperName);
	public Screen getModelScreen1();
	public void setModelScreen1(Screen modelScreen1);
	public int getRowCount();
	public void setRowCount(int rowCount);

}