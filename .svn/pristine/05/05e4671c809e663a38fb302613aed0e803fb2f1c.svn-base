package com.google.code.kss.tool.webkit;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;

import org.eclipse.swt.SWT;
import org.eclipse.swt.layout.FillLayout;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Shell;

import com.genuitec.blinki.webkit.swt.WebKitBrowser;
import com.google.code.kss.core.util.CommonUtil;
import com.google.code.kss.core.util.KSSFactory;
import com.google.code.kss.core.util.ScriptProcessor;

/**
 * Please set -Djava.library.path=./lib in the VM argument
 * 
 * http://www.genuitec.com/about/javadoc/com/genuitec/blinki/webkit/swt/WebKitBrowser.html
 * 
 * TODO to set -Djava.library.path=./lib programatically
 */
public class WebKitFactory implements ScriptProcessor {

	private static StringBuffer script = new StringBuffer();
	private static ScriptEngineManager manager = null;
	private ScriptEngine engine = null;
	private static WebKitBrowser browser = null;
	private static boolean evaluateOnly = true;
	private Display display;
	private Shell shell;
	
	public static boolean isEvaluateOnly() {
		return evaluateOnly;
	}

	public static void setEvaluateOnly(boolean evaluateOnly) {
		WebKitFactory.evaluateOnly = evaluateOnly;
	}

	public WebKitFactory(ScriptEngineManager manager) {		
		//=== not until we get JSR 223 compliant webkit engine
		//WebKitFactory.manager = manager;
		//this.engine = manager.getEngineByName("JavaScript");
		init();
	}
	
	private void init() {
		display = new Display();
		shell = new Shell(display); // create window
		shell.setLayout(new FillLayout());
		browser = new WebKitBrowser(shell, SWT.NONE); // create
	}

	/**
		Method to load the whole JavaScript script.
	 */
	public void loadScript(String scriptFileName) {
		try {
			script.append(CommonUtil.loadScriptText(scriptFileName));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/*		
	 * Method to run the current JavaScript script.
	 * 
	*/	
	public void runScript(String scriptFileName) {
		try {
			//KSSFactory.setApplication((Object)engine.eval(CommonUtil.loadScript(scriptFileName)));
			String retVal = null;
			if(evaluateOnly) {
				retVal = "" + browser.evaluate(CommonUtil.loadScriptText(scriptFileName));
			} else {
				retVal = "" + browser.execute(CommonUtil.loadScriptText(scriptFileName));
			}
			System.out.println("\nrunScript(" + scriptFileName + "):evaluateOnly '" + evaluateOnly + "' script return status = '" + retVal + "'");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
		Method to run the current JavaScript script.
	 */
	public void runScript() {
		try {
			if(script != null) {
				String temp = script.toString();
				//System.out.println("running '" + temp + "' ...");
				//KSSFactory.setApplication((Object)engine.eval(temp));
				String retVal = null;
				if(evaluateOnly) {
					retVal = "" + browser.evaluate(temp);
				} else {
					retVal = "" + browser.execute(temp);
				}
				System.out.println("\nrunScript():evaluateOnly '" + evaluateOnly + "' script return status = '" + retVal + "'");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
		
	/**
		Method to load partial codes/object into an existing JavaScript script.
	 */
	public void loadObject(String scriptFileName) {
		try {
			script.append(CommonUtil.loadScriptText(scriptFileName));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void execute() {
		Thread s = new Thread(this);
		s.start();
	}
	
	public void run() {
		runScript();
	}

	/**
	 * 	General purpose update/refresh method. It is used to update status change, either GUI or otherwise.
	 */
	public void refresh() {
	}

	public void yield() {
		// TODO Auto-generated method stub
		
	}

	public boolean isExecuted() {
		return display.readAndDispatch();
	}

	public static StringBuffer getScript() {
		return script;
	}
}
