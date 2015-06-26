package com.google.code.kss.junit;

import org.eclipse.swt.SWTException;

import junit.framework.TestCase;

import com.google.code.kss.core.util.KSSFactory;
import com.google.code.kss.tool.fios.FIOSConverter;
import com.google.code.kss.tool.fios.FIOSImageConverter;
import com.google.code.kss.tool.webkit.HTML5Javascript;
import com.google.code.kss.tool.webkit.HTMLImageConverter;

public class FDTFunctionalTest extends TestCase {

	FIOSConverter con;
	
    protected void setUp() {
    	con = new FIOSConverter();
	}
	
	/**
	 * Test basic conversion - based on screen mockup only.
	 */
	public void testBasicConversion() {
		con.setInputFile("Mockup.screen");
		con.processModify();
		assertTrue(KSSFactory.isExecuted());
	}
	 
	/**
	 * Test other conversion.
	 */
	public void testOtherConversion() {
		String targetScreen = null;
		targetScreen = "Screen1.screen";
		con.setInputFile(targetScreen);
		con.processModify();
		assertTrue(targetScreen + " was not converted properly", KSSFactory.isExecuted());
		targetScreen = "Screen2.screen";
		con.setInputFile(targetScreen);
		con.processModify();
		assertTrue(targetScreen + " was not converted properly", KSSFactory.isExecuted());
		targetScreen = "Screen3.screen";
		con.setInputFile(targetScreen);
		con.processModify();
		assertTrue(targetScreen + " was not converted properly", KSSFactory.isExecuted());
		targetScreen = "Screen4.screen";
		con.setInputFile(targetScreen);
		con.processModify();
		assertTrue(targetScreen + " was not converted properly", KSSFactory.isExecuted());
		targetScreen = "Screen5.screen";
		con.setInputFile(targetScreen);
		con.processModify();
		assertTrue(targetScreen + " was not converted properly", KSSFactory.isExecuted());
	}
	
	/**
	 * Test basic scene conversion.
	 * @throws Exception 
	 */
	public void testBasicSceneConversion() throws Exception {
		FIOSImageConverter img = new FIOSImageConverter();
		img.processModify();
		assertTrue(img.getTargetStory() + " was not converted properly", KSSFactory.isExecuted());
	}

	/**
	 * Test other scene conversion.
	 * @throws Exception 
	 */
	public void testOtherSceneConversion() throws Exception {
		FIOSImageConverter img = new FIOSImageConverter();
		img.setTargetStory("HPDemo.story");
		img.processModify();
		assertTrue(img.getTargetStory() + " was not converted properly", KSSFactory.isExecuted());
	}

	/**
	 * Test basic HTML 5 scene conversion.
	 * @throws Exception 
	 */
	public void testBasicHTML5SceneConversion() throws Exception {
		HTMLImageConverter img = new HTMLImageConverter();
		con.setWorker(new HTML5Javascript(con));
		img.processModify();
		assertTrue(img.getTargetStory() + " was not converted properly in HTML 5", KSSFactory.isExecuted());
	}

	/**
	 * Test basic HTML 5 scene conversion.
	 * @throws Exception 
	 */
	public void testOtherHTML5SceneConversion() throws Exception {
		HTMLImageConverter img = new HTMLImageConverter();
		img.setTargetStory("HPDemo.story");
		con.setWorker(new HTML5Javascript(con));		
		try {
			img.processModify();
		} catch(SWTException e) {
			//known issue http://dev.eclipse.org/mhonarc/lists/platform-swt-dev/msg05036.html
			if(!"Invalid thread access".equals(e.getMessage())) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		assertTrue(img.getTargetStory() + " was not converted properly in HTML 5", KSSFactory.isExecuted());
	}
}
