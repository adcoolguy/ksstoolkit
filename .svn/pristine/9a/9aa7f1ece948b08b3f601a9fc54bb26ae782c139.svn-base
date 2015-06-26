package com.google.code.kss.tool.webkit;

import java.io.File;
import java.util.Iterator;

import com.google.code.kss.adapter.fios.api.Graphics;
import com.google.code.kss.core.model.ui.wireframesketcher.Panels;
import com.google.code.kss.core.model.ui.wireframesketcher.Screen;
import com.google.code.kss.core.model.ui.wireframesketcher.Story;
//import com.google.code.kss.core.util.FileWatcher;
import com.google.code.kss.core.util.FileWatcherCallback;
import com.google.code.kss.tool.common.ConverterBase;
import com.google.code.kss.tool.webkit.HTML5Javascript;

import static com.google.code.kss.tool.common.ConverterBase.ViewType;

public class HTMLImageConverter extends ConverterBase implements
		FileWatcherCallback {

	static {
		HTMLConverter.initClasspath();
	}

	String targetStory = "Test.story";
	HTMLConverter c1 = new HTMLConverter();
	
	public HTMLImageConverter() {
		super();
	}
	
	public String getTargetStory() {
		return targetStory;
	}

	public void setTargetStory(String targetStory) {
		this.targetStory = targetStory;
	}

	public HTMLConverter getC1() {
		return c1;
	}

	public void setC1(HTMLConverter c1) {
		this.c1 = c1;
	}

	/**
	 * Filter the trailing anchors (#/) as it is not needed in this converter.
	 * 
	 * @param src
	 * @return
	 */
	public String handleHref(String src) {
		String retVal = src;
		if (src != null) {
			retVal = src.substring(0, src.length() - 2);
		}

		return retVal;
	}

	private String getCmPrefixName(String input) {
		String retVal = input;

		retVal = "KSS" + getStoryFileName(input);

		return retVal;
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
	
	@Override
	public void processModify() throws Exception {
		try {
//			targetStory = "HPDemo.story";
			Graphics.initResolution(704, 480); // TBD - should not have to do
												// it!!!
			Story sto = new Story();
			sto.setName(targetStory);
			setStory(sto);
			// process story file
			if ((sto = getStory()) != null) {
//				c1.setWorker(new HTML5Javascript(c1));
				c1.getWorker().setNativeSDKHome(c1.getNativeSDKHome());
				c1.setOutputFile(c1.getWorker().getOutfileName(targetStory));
				c1.setCmPrefix(getCmPrefixName(targetStory));
				c1.setUseIDEText(false);
//				c1.setStandalone(false);
//				c1.setMode(ViewType.VERTICAL_LISTVIEW);
				c1.setMode(ViewType.HORIZONTAL_LISTVIEW);
//				c1.setDefaultFontColor("'0x00550000'");		//purple color
				c1.setDefaultFontColor("'0xFF999999'");		//white color
//				c1.setDefaultFontColor("'0xFFb2b2b2'");		//gray color
//				c1.setDefaultFontColor("'0xFF333333'");		//black color				
//				String text[][]= {{"text1","text2","text3","text4"},{"text5","text6","text7","text8"}};
				String text[][]= {{"Demo Text1","Demo Text2","Demo Text3","Demo Text4 (hit up/down key to load real text)"}};
				c1.setUiText(text);
				System.out.println("image count = " + sto.getPanels().size());
				c1.setTotalScene(sto.getPanels().size());
				c1.addHeader(targetStory);
				Iterator<?> it = sto.getPanels().iterator();
				Panels p = null;
				int count = 0;
				String fileName;
				Screen scr = null;
				int sceneCount = 1;
				while (it.hasNext()) {
					p = (Panels) it.next();
					fileName = handleHref(p.getPanelsScreen().getHref());
					System.out.println("image " + ++count + " screen '"
							+ fileName + "'");
					// process screen files
					c1.setInputFile(fileName);
					c1.setCurrentScene(sceneCount);
					c1.addSceneHeader();
					c1.modifyScene(c1.getComponentId());
					c1.addSceneFooter();
					sceneCount++;
				}
				c1.addFooter(c1.getComponentId(), null, textWindowWidth, textWindowWidth);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	public static void main(String[] args) {
//		FileWatcher.start(new
//		File("./script/lua/wireframe").getAbsolutePath(), new
//		FIOSImageConverter());
		HTMLImageConverter img = new HTMLImageConverter();
		try {
			img.processModify();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}