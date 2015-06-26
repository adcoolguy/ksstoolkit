package com.google.code.kss.tool.fios;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;

import com.google.code.kss.adapter.fios.api.Graphics;
import com.google.code.kss.core.util.CommonUtil;
import com.google.code.kss.core.util.JVM;
import com.google.code.kss.core.util.KSSFactory;
import com.google.code.kss.core.util.ScriptProcessor;

public class FIOSFactory implements ScriptProcessor {

	private static StringBuffer script = new StringBuffer();
	private static ScriptEngineManager manager = null;
	private ScriptEngine engine = null;
	private static FIOS fios;
	private static boolean busy = false;
	private boolean executed = false;
	private static boolean evaluateOnly = true;

	public static FIOS getInstance() {
		if (fios == null) {
			fios = FIOS.getInstance();
			fios.setGraphics(new com.google.code.kss.tool.common.CanvasGraphics());
		}

		return fios;
	}

	public static boolean isEvaluateOnly() {
		return evaluateOnly;
	}

	public static void setEvaluateOnly(boolean evaluateOnly) {
		FIOSFactory.evaluateOnly = evaluateOnly;
	}

	public FIOSFactory(ScriptEngineManager manager) {
		if(manager == null) {
			manager = KSSFactory.initScriptEngineManager();		
		}
		FIOSFactory.manager = manager;
		if(JVM.isMSWindows()) {
			this.engine = manager.getEngineByName("lua");
		}
		init();
	}

	private void init() {
		try {
			//TODO - weird issue - characters jumble up!!!
			//script.append(CommonUtil.loadScriptText("InitKSS.lua"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * Method to load the whole lua script.
	 */
	public void loadScript(String scriptFileName) {
		try {
			script.append(CommonUtil.loadScriptText(scriptFileName));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static StringBuffer getScript() {
		return script;
	}

	public static void setScript(StringBuffer script) {
		FIOSFactory.script = script;
	}

	/*
	 * Method to run the current lua script.
	 * 
	 * This is generally not used. It does not handle the Fios initialization
	 * routine etc and is created for the sake of completeness.
	 */
	public void runScript(String scriptFileName) {
		try {
			executed = false;
			KSSFactory.setApplication((Object) engine.eval(CommonUtil
					.loadScript(scriptFileName)));
			if(KSSFactory.getApplication() != null) {
				executed = true;
			}
			System.out.println("\nrunScript(" + scriptFileName + "):evaluateOnly '" + evaluateOnly + "' script return status = '" + executed + "'");		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * Method to run the current lua script.
	 */
	public void runScript() {
		try {
			if (script != null) {
				executed = false;				
				loadObject("InitFios.lua");
				String temp = script.toString();
				// System.out.println("running '" + temp + "' ...");
				if(JVM.isMSWindows()) {
					KSSFactory.setApplication((Object) engine.eval(temp));
					if(KSSFactory.getApplication() != null) {
						executed = true;
					}
				} else {
					executed = true;	//fake it :)
					System.out.println("--- Non windows platform, JSR 223 script execution skipped! ---");
				}
				System.out.println("\nrunScript():evaluateOnly '" + evaluateOnly + "' script return status = '" + executed + "'");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * Method to load partial codes/object into an existing lua script.
	 */
	public void loadObject(String scriptFileName) {
		try {
			script.append(CommonUtil.loadScriptText(scriptFileName));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void updateDisplay() {
		(new Graphics()).updateDisplay();
	}

	public void yield() {
//		synchronized (this) {
//			while (busy) {
//				try {
//					System.out.println("waiting ...");
//					this.wait();
//				} catch (InterruptedException e) {
//					e.printStackTrace();
//				} // stop other thread from coming in
////				busy = true;
//			}
//		}
	}

	public void execute() {
		Thread s = new Thread(this);
		s.start();
	}

	public void run() {
			runScript();
	}

	/**
	 * General purpose update/refresh method. It is used to update status
	 * change, either GUI or otherwise.
	 */
	public void refresh() {
		updateDisplay();
	}

	public boolean isExecuted() {
		return executed;
	}
}
