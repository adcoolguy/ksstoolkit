package com.google.code.kss.tool.rhino;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;

import com.google.code.kss.core.util.CommonUtil;
import com.google.code.kss.core.util.KSSFactory;
import com.google.code.kss.core.util.ScriptProcessor;

public class RhinoFactory implements ScriptProcessor {

	private static StringBuffer script = new StringBuffer();
	private static ScriptEngineManager manager = null;
	private ScriptEngine engine = null;
	
	public RhinoFactory(ScriptEngineManager manager) {		
		RhinoFactory.manager = manager;
		this.engine = manager.getEngineByName("JavaScript");
		init();
	}
	
	private void init() {
		try {
			script.append(CommonUtil.loadScriptText("InitKSS.js"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
		Method to load the whole rhino script.
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
	 * Method to run the current rhino script.
	 * 
	*/	
	public void runScript(String scriptFileName) {
		try {
			KSSFactory.setApplication((Object)engine.eval(CommonUtil.loadScript(scriptFileName)));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
		Method to run the current rhino script.
	 */
	public void runScript() {
		try {
			if(script != null) {
				//loadObject("InitRhino.js");
				String temp = script.toString();
				//System.out.println("running '" + temp + "' ...");
				KSSFactory.setApplication((Object)engine.eval(temp));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
		
	/**
		Method to load partial codes/object into an existing rhino script.
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
}
