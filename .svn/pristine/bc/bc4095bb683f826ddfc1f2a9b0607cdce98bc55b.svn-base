package com.google.code.kss;

import org.eclipse.swt.SWT;
import org.eclipse.swt.layout.FillLayout;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Shell;

import com.genuitec.blinki.webkit.swt.WebKitBrowser;
import com.google.code.kss.core.util.KSSFactory;
import com.google.code.kss.tool.fios.FIOSFactory;
import com.google.code.kss.tool.rhino.RhinoFactory;
import com.google.code.kss.tool.webkit.WebKitFactory;

/**
 * This sample test program demonstrate the capability of KSSToolkit.
 * 
 */
public class TestWebKit {
	/**
	 * This test program demonstrate the capability of KSS Toolkit with WebKit
	 * engine.
	 * 
	 */
	public static void main1(String[] args) {
		try {
			//initialize the KSS framework
			//RhinoFactory app = new RhinoFactory(KSSFactory.getManager());
			WebKitFactory app = new WebKitFactory(KSSFactory.getManager());
			app.setEvaluateOnly(false);
			KSSFactory.setFactory(app);
			//setup any dependent external js needed by the script
//			KSSFactory.loadObject("processing-0.8.js");
			//showtime!
			KSSFactory.loadScript("WebKit.js");
			KSSFactory.runScript();
			System.out.println("TestWebKit done");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		Display display = new Display();
		Shell shell = new Shell(display); // create window
		shell.setLayout(new FillLayout());
		WebKitBrowser browser = new WebKitBrowser(shell, SWT.NONE); // create
																	// browser
		browser.setUrl("http://www.google.com");
		shell.open();
		while (!shell.isDisposed()) {
			if (!display.readAndDispatch())
				display.sleep();
		}
	}
}
