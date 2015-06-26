package com.google.code.kss.tool.fios;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;

import com.google.code.kss.core.util.CommonUtil;
import com.google.code.kss.tool.common.AxisPlane;
import com.google.code.kss.tool.common.ConverterBase.ViewType;
import com.google.code.kss.tool.webkit.HTML5Javascript;

public class FIOSStart {

	/** 
	 * This program demonstrate FDT's capability to use/integrate existing script which is not generated by the tool.
	 * 
	 * @param args
	 */
	public static void main(String[] args) {
		FIOSConverter.initClasspath();
		FIOSImageConverter img = null;
		//img.getC1().setWorker(new HTML5Javascript(img.getC1()));
		String temp = null;
		try {
			temp = "Login.story";
			img = new FIOSImageConverter();
			img.getC1().setNativeSDK(true);	//open this if Iris is installed
//			img.getC1().setImageReduction(true);
			img.setTargetStory(temp);
			img.getC1().setComponentId(CommonUtil.getName(temp));
			img.getC1().setStandalone(false);
			img.getC1().setHideCommonCode(true);
			img.getC1().setMode(ViewType.VERTICAL_LISTVIEW);
			img.getC1().setDefaultFontColor("'0xFFffffff'");	//gray color
			img.processModify();
			
			int ROW_COUNT = 5;
			temp = "List.story";
			img = new FIOSImageConverter();
			img.setTargetStory(temp);
			img.getC1().setComponentId(CommonUtil.getName(temp));
			img.getC1().setStandalone(false);
			img.getC1().setHideCommonCode(true);
			img.getC1().setRowCount(ROW_COUNT);			
			img.getC1().setMode(ViewType.VERTICAL_LISTVIEW);
			img.getC1().setDefaultFontColor("'0xFFffffff'");	//gray color
			//img.getC1().setDefaultFontColor("'0xFF978ED1'");	//gray color
			//img.getC1().setDefaultFontColor("'0xFFb2b2b2'");	//gray color
			//img.getC1().setDefaultFontBgColor("'0xFF333333'");		//black color
			img.processModify();
			String targetListName = img.getC1().getListTextName(img.getC1().getComponentId());
			String targetLastSceneName = img.getC1().getLastScene(img.getC1().getComponentId());
			String fwdStopper = FIOSConverter.getForwardStopper(img.getC1().getComponentId());
			String bwdStopper = FIOSConverter.getBackwardStopper(img.getC1().getComponentId());
			
			temp = "ScrollerBall.story";
//			temp = "ListSlider.story";
			img = new FIOSImageConverter();
			img.setTargetStory(temp);
			img.setAutoScene(true, AxisPlane.Y, img.getC1());
			img.getC1().setComponentId(CommonUtil.getName(temp));
			img.getC1().setStandalone(false);
			img.getC1().setTargetListName(targetListName);
			img.getC1().setTargetLastSceneName(targetLastSceneName);
			img.getC1().setTargetBackwardStopperName(bwdStopper);
			img.getC1().setTargetForwardStopperName(fwdStopper);
			img.getC1().setHideCommonCode(true);
			img.getC1().setRowCount(ROW_COUNT);			
			img.getC1().setMode(ViewType.VERTICAL_LISTVIEW);
			img.getC1().setDefaultFontColor("'0xFFffffff'");	//gray color
			img.processModify();
		} catch (Exception e) {
			e.printStackTrace();
		}
		String newScript = FIOSScriptUtil.handleDoFile("NEW_VERIZON_DEMO.lua");
		try {
			FileUtils.writeStringToFile(new File("WIDGET-0.2.lua"), newScript);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}