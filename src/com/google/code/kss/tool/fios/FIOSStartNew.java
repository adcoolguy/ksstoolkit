package com.google.code.kss.tool.fios;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;

import com.google.code.kss.core.util.CommonUtil;
import com.google.code.kss.tool.common.AxisPlane;
import com.google.code.kss.tool.common.ConverterBase.ViewType;
import com.google.code.kss.tool.webkit.HTML5Javascript;

public class FIOSStartNew {

	/** 
	 * This program generates the FDT component(s) individually and allow unit test to be performed in mutually exclusive way.
	 */
	public static void main(String[] args) {
		FIOSConverter.initClasspath();
		FIOSImageConverter img = null;
		String temp = null;
		try {
			temp = "Login.story";
			img = new FIOSImageConverter();
			img.setTargetStory(temp);
			img.getC1().setComponentId(CommonUtil.getName(temp));
			img.getC1().setImageReduction(true);
//			img.getC1().setImageReduction(false);	//this is buggy!!!???
			img.getC1().setStandalone(true);
			img.getC1().setHideCommonCode(false);
			img.getC1().setMode(ViewType.VERTICAL_LISTVIEW);
			img.getC1().setDefaultFontColor("'0xFFffffff'");	//gray color
			img.getC1().setNativeSDK(true);	//open this if Iris is installed
//			img.getC1().setWorker(new HTML5Javascript(img.getC1()));
//			img.processModify();

			int ROW_COUNT = 5;
			temp = "List.story";
			img = new FIOSImageConverter();
			img.setTargetStory(temp);
			img.getC1().setComponentId(CommonUtil.getName(temp));
			img.getC1().setStandalone(true);
			img.getC1().setHideCommonCode(false);
			img.getC1().setRowCount(ROW_COUNT);
			img.getC1().setMode(ViewType.VERTICAL_LISTVIEW);
			img.getC1().setDefaultFontColor("'0xFFffffff'");	//gray color
			//img.getC1().setDefaultFontColor("'0xFF978ED1'");	//gray color
			//img.getC1().setDefaultFontColor("'0xFFb2b2b2'");	//gray color
			//img.getC1().setDefaultFontBgColor("'0xFF333333'");		//black color
			img.getC1().setNativeSDK(true);	//open this if Iris is installed
//			img.getC1().setWorker(new HTML5Javascript(img.getC1()));
//			img.processModify();

//			temp = "ListSlider.story";
			temp = "ScrollerBall.story";
			img = new FIOSImageConverter();
			img.setTargetStory(temp);
			img.getC1().setComponentId(CommonUtil.getName(temp));
			img.getC1().setNativeSDK(true);	//open this if Iris is installed
			img.setAutoScene(true, AxisPlane.Y, img.getC1());	//this has to be invoked after the worker is set, otherwise continuosAxisPlane will be null!
			img.getC1().setStandalone(true);
			img.getC1().setHideCommonCode(false);
			img.getC1().setRowCount(ROW_COUNT);
			img.getC1().setMode(ViewType.VERTICAL_LISTVIEW);
			img.getC1().setDefaultFontColor("'0xFFffffff'");	//gray color
//			img.getC1().setWorker(new HTML5Javascript(img.getC1()));
			img.processModify();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
