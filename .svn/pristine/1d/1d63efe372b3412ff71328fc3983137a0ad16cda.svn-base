package com.google.code.kss;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.eclipse.swt.SWT;
import org.eclipse.swt.SWTError;
import org.eclipse.swt.browser.Browser;
import org.eclipse.swt.layout.FillLayout;
import org.eclipse.swt.ole.win32.OleClientSite;
import org.eclipse.swt.ole.win32.OleFrame;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Shell;

import com.genuitec.blinki.webkit.swt.WebKitBrowser;

/**
 * Source -
 * http://www.genuitec.com/about/labs-webkit-for-swt/WebKit%20For%20SWT%
 * 20Developer%20Guide.html.
 * 
 * Related issue - http://code.google.com/p/chromium/issues/detail?id=25448.
 */
public class TestChrome {

	public static void main1(String[] args) {
		Display display = new Display();
		Shell shell = new Shell(display);
		shell.setLayout(new FillLayout());
		shell.setMinimumSize(600, 400);

		OleFrame frame = new OleFrame(shell, SWT.NONE);
		OleClientSite site = null;
		try {
			// the VersionIndependentProgID for Chrome Google Frame is
			// ChromeTab.ChromeFrame
			site = new OleClientSite(frame, SWT.NONE, "ChromeTab.ChromeFrame");
			// site = new OleClientSite(frame, SWT.NONE, "Word.Document");
		} catch (org.eclipse.swt.SWTException e) {
			// probably not installed
			if (e.code == 1004) {
				// ClassID not found in the registry
				System.out
						.println("Chrome Google Frame is not installed. Available here: http://code.google.com/chrome/chromeframe/");
			} else {
				System.out
						.println("Could not load Chrome Google Frame. Exception: "
								+ e);
			}
			return;
		}
		frame.pack();

		shell.pack();
		shell.open();
		while (!shell.isDisposed()) {
			if (!display.readAndDispatch()) {
				display.sleep();
			}
		}
		display.dispose();
	}

	public static void main(String[] args) {
		String html = null;
		try {
			html = FileUtils.readFileToString(new File("canvas.htm"));
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		Display display = new Display();
		Shell shell = new Shell(display);
		shell.setLayout(new FillLayout());
		WebKitBrowser browser;
		try {
			browser = new WebKitBrowser(shell, SWT.NONE);
		} catch (SWTError e) {
			System.out.println("Could not instantiate Browser: "
					+ e.getMessage());
			display.dispose();
			return;
		}
		browser.setText(html);
		shell.open();
		while (!shell.isDisposed()) {
			if (!display.readAndDispatch())
				display.sleep();
		}
		display.dispose();
	}
}
