package com.google.code.kss.tool.fios;

import java.io.File;
import java.util.Iterator;

import com.google.code.kss.adapter.fios.api.Graphics;
import com.google.code.kss.core.model.ui.wireframesketcher.Panels;
import com.google.code.kss.core.model.ui.wireframesketcher.Screen;
import com.google.code.kss.core.model.ui.wireframesketcher.Story;
import com.google.code.kss.core.model.ui.wireframesketcher.Widgets;
//import com.google.code.kss.core.util.FileWatcher;
import com.google.code.kss.core.util.FileWatcherCallback;
import com.google.code.kss.tool.common.AxisPlane;
import com.google.code.kss.tool.common.Converter;
import com.google.code.kss.tool.common.ConverterBase;
import com.google.code.kss.tool.common.ConverterBase.ViewType;
import com.google.code.kss.tool.webkit.HTML5Javascript;

//import static com.google.code.kss.tool.fios.FIOSConverter.ViewType;	//conflicts with another class in JDK 1.7 ???

/*
 * Optional: Please set -Diris=[IRIS HOME] in VM argument for the image to work in Iris.
 * 
 * Note: If your worker depends on native library like .dll, please make sure it exists in ./lib and set -Djava.library.path=./lib.
 * 
 * @version $Revision: 100 $ ($Author: fios $)
 */
public class FIOSImageConverter extends ConverterBase implements
		FileWatcherCallback {

	static {
		FIOSConverter.initClasspath();
	}

	String targetStory = "List.story";
	FIOSConverter c1 = new FIOSConverter();
	// advanced continuous scene
	private boolean continuos;
	private AxisPlane continuosAxisPlane;
	private int offsetAutoScene = -1;
	private int totalAutoScene = 0;
	private int stepAutoScene = -1;
	private Widgets firstWidgetAutoScene;
	private Widgets lastWidgetAutoScene;
	private String modelScreenFile;
	
	public FIOSImageConverter() {
		super();
	}

	public boolean isContinuos() {
		return continuos;
	}

	public void setContinuos(boolean continuos) {
		this.continuos = continuos;
	}

	public AxisPlane getContinuosAxisPlane() {
		return continuosAxisPlane;
	}

	public void setContinuosAxisPlane(AxisPlane continuosAxisPlane) {
		this.continuosAxisPlane = continuosAxisPlane;
	}

	public int getOffsetAutoScene() {
		return offsetAutoScene;
	}

	public int getTotalAutoScene() {
		return totalAutoScene;
	}

	public int getStepAutoScene() {
		return stepAutoScene;
	}

	public String getTargetStory() {
		return targetStory;
	}

	public void setTargetStory(String targetStory) {
		this.targetStory = targetStory;
	}

	public FIOSConverter getC1() {
		return c1;
	}

	public void setC1(FIOSConverter c1) {
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

		retVal = "FDT" + getStoryFileName(input);

		return retVal;
	}

	public void initAutoScene(Story sto, AxisPlane mode, ConverterBase c1)
			throws Exception {
		Panels p = null;
		String fileName = null;
		Iterator<?> it0 = sto.getPanels().iterator();
		Widgets w[] = new Widgets[2];
		Widgets wi = null;
		int i = 0;
		Screen modelScreen1 = null;
		while (it0.hasNext()) {
			p = (Panels) it0.next();
			fileName = handleHref(p.getPanelsScreen().getHref());
			Screen scr = new Screen();
			scr.setName(fileName);
			setScreen(scr);
			modelScreenFile = fileName;
			String[][] tri = getUiText();
			for (int r = 0; r < tri.length; r++) {
				for (int c = 0; c < tri[r].length; c++) {
					totalAutoScene++;
				}
			}

			if ((scr = getScreen()) != null) {
				System.out.println("auto scene widget count = "
						+ scr.getWidgets().size());
				Iterator<?> it = scr.getWidgets().iterator();
				while (it.hasNext()) {
					wi = (Widgets) it.next();
					if ("model:Image".equals(wi.getType()) && !ConverterBase.DO_NOT_CONVERT.equals(wi.getCustomId())) {
						if(!ConverterBase.BACKGROUND_ONLY.equals(wi.getCustomId())) {
							w[i++] = wi;
						}
					}
				}
			}
		}
		if (w[0] == null || w[1] == null) {
			throw new Exception(
					"Automatic scene can be generated with only two scenes!");
		} else {
			firstWidgetAutoScene = w[0];
			lastWidgetAutoScene = w[1];
			c1.setRectangleOKRegion(new Integer[totalAutoScene]);
			c1.setTotalScene(totalAutoScene);
			c1.setFirstModelWidget(firstWidgetAutoScene);
			c1.setLastModelWidget(lastWidgetAutoScene);
			Screen scr = new Screen();
			scr.setName(modelScreenFile);
			setScreen(scr);
			c1.setModelScreen1(getScreen());
			c1.convertContinuousAutoScene("autoImage", mode);
		}
		if (mode == AxisPlane.X) {
			offsetAutoScene = w[1].getX() - w[0].getX();
		} else {
			offsetAutoScene = w[1].getY() - w[0].getY();
		}
		stepAutoScene = (offsetAutoScene / totalAutoScene);
		stepAutoScene = stepAutoScene + (stepAutoScene/totalAutoScene);
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

	public void setAutoScene(boolean continuos, AxisPlane continuosAxisPlane,
			ConverterBase c1) {
		this.continuos = continuos;
		this.continuosAxisPlane = continuosAxisPlane;
		c1.setAutoScene(1);
		c1.setContinuosAxisPlane(continuosAxisPlane);
	}

	@Override
	public void processModify() throws Exception {
		try {
			// targetStory = "HPDemo.story";
			// targetStory = "List.story";
			// targetStory = "ListSlider.story";
			// setAutoScene(true, AxisPlane.Y, c1);
			// targetStory = "VerizonFiOSTV.story";
			Graphics.initResolution(704, 480); // TBD - should not have to do
			// it!!!
			Story sto = new Story();
			sto.setName(targetStory);
			setStory(sto);
			// process story file
			if ((sto = getStory()) != null) {
				// c1.setWorker(new HTML5Javascript(c1));
				// c1.setNativeSDK(false);
//				c1.setNativeSDK(true);
//				c1.getWorker().setNativeSDKHome(c1.getFiosIrisHome());
				c1.setOutputFile(c1.getWorker().getOutfileName(targetStory));
				c1.setCmPrefix(getCmPrefixName(targetStory));
				c1.setUseIDEText(false); // TODO - if true, logic breaks
				// c1.setStandalone(false);
				// c1.setMode(ViewType.VERTICAL_LISTVIEW);
				// c1.setMode(ViewType.HORIZONTAL_LISTVIEW);
				// c1.setDefaultFontColor("'0x00550000'"); //purple color
				// c1.setDefaultFontColor("'0xFF999999'"); //white color
				// c1.setDefaultFontColor("'0xFFb2b2b2'"); //gray color
				// c1.setDefaultFontColor("'0xFF333333'"); //black color
				// String text[][]=
				// {{"text1","text2","text3","text4"},{"text5","text6","text7","text8"}};
				String text[][] = { { "Demo Text1", "Demo Text2", "Demo Text3",
						"Demo Text4 (hit up/down key to load real text)" } };
				setUiText(text);
				c1.setUiText(uiText);
				System.out.println("image count = " + sto.getPanels().size());
				c1.setTotalScene(sto.getPanels().size());
				c1.addHeader(c1.getComponentId());
				Iterator<?> it = sto.getPanels().iterator();
				Panels p = null;
				int count = 0;
				String fileName;
				Screen scr = null;
				int sceneCount = 1;

				System.out.println("total row '" + c1.getRowCount() + "'");

				it = sto.getPanels().iterator();
				if (!continuos) {
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
				} else {
					// === get the first scene and last, build the offset etc
					initAutoScene(sto, continuosAxisPlane, c1);
					it = sto.getPanels().iterator();
					// === generate the sequences
					while (sceneCount <= totalAutoScene) {
						System.out.println("auto scene image " + ++count);
						// process screen files
						c1.setCurrentScene(sceneCount);
						c1.addSceneHeader();
						c1.modifyAutoScene(continuosAxisPlane, totalAutoScene,
								stepAutoScene, firstWidgetAutoScene, lastWidgetAutoScene, c1
										.getComponentId());
						c1.addSceneFooter();
						sceneCount++;
					}
				}
				c1.addFooter(c1.getComponentId(), continuosAxisPlane, textWindowWidth, textWindowHeight);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	public static void main(String[] args) {
		//=== This is currently not working, please use FIOSStart or FIOSStartNew for now
		//FileWatcher.start(new File(".").getAbsolutePath(), new FIOSImageConverter());
		int textWindowWidth = 704;
		int textWindowHeight = 480;
		FIOSImageConverter img = new FIOSImageConverter();
		img.setTextWindowWidth(textWindowWidth);
		img.setTextWindowHeight(textWindowHeight);
//		img.setTargetStory("HPDemo.story");
		img.setTargetStory("Test.story");
//		img.setTargetStory("List.story");
//		img.setTargetStory("NewStoryboard.story");
//		img.setTargetStory("Mockup.story");
		img.getC1().setMode(ViewType.HORIZONTAL_LISTVIEW);
		try {
			img.processModify();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}