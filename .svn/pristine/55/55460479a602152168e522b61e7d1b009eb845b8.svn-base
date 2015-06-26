package com.google.code.kss.core.util;

import javax.script.ScriptEngineManager;
import javax.script.ScriptException;
import javax.script.Invocable;
import com.google.code.kss.core.util.ScriptProcessor;

public class KSSFactory {

	public static ScriptEngineManager initScriptEngineManager() {
		if(JVM.isMSWindows()) {
			manager = new ScriptEngineManager();
		}
		return manager;
	}
	
	private static ScriptEngineManager manager = null;
	private static ScriptProcessor factory = null;
	private static Object application = null;
	
	public static ScriptEngineManager getManager() {
		return manager;
	}

	public static ScriptProcessor getFactory() {
		return factory;
	}
	
	public static void setFactory(ScriptProcessor factory) {
		KSSFactory.factory = factory;
	}

	public static void setApplication(Object application) {
		KSSFactory.application = application;
	}

	public static Object getApplication() {
		return application;
	}

	public static boolean isExecuted() {
		boolean retVal = false;
		if("0".equals(application.toString())) {
			retVal = true;
		}
		return retVal;
	}
	
	public static void printStatus() throws Exception {
		getScriptProcessor().yield();
		
		if (application != null) {
			System.out.println("script "
					+ ("0".equals(application.toString()) ? "executed"
							: "did not run properly"));
		} 
//		else {
//			System.out
//					.println("aborted, script engine is not initialized (init was not invoked?) or script application has not completed!");
//		}
	}

	private static ScriptProcessor getScriptProcessor() throws Exception {
		if(factory == null)
			throw new Exception("ScriptProcessor is empty!");
		
		return factory;
	}
	
	/**
	 * Method to load the whole script. It does not run the script.
	 * 
	 * @return 
	 * @throws Exception 
	 */
	public static void loadScript(String scriptFileName) throws Exception {
		getScriptProcessor().loadScript(scriptFileName);
	}
	
	/*
	 * Method to run the current script.
	 * 
	 * This is generally not used. It does not handle the SDK specific initialization
	 * routine.
	 */
	public static void runScript(String scriptFileName) throws Exception {
		getScriptProcessor().runScript(scriptFileName);
		printStatus();
	}
	
	/**
	 * Method to run the current script.
	 * @throws Exception 
	 */
	public static void runScript() throws Exception {
		getScriptProcessor().runScript();
		printStatus();
	}
	
	public void invokeFunction(ScriptEngineManager engine, String name, Object[] args) 
	throws NoSuchMethodException, ScriptException {
		Invocable inv = (Invocable)engine;
		inv.invokeFunction(name, args);
	}
	
	public void invokeMethod(ScriptEngineManager engine, Object thiz, String name, Object[] args) 
	throws NoSuchMethodException, ScriptException {
		Invocable inv = (Invocable)engine;
		inv.invokeMethod(thiz, name, args);
	}

	/**
	 * Method to load partial codes/object into an existing script.
	 * @throws Exception 
	 */
	public static void loadObject(String scriptFileName) throws Exception {
		getScriptProcessor().loadObject(scriptFileName);
	}

	/**
	 * This is the same as runScript() except that it is multi-threaded.
	 * 
	 * @throws Exception
	 */
	public static void execute() throws Exception {
		getScriptProcessor().execute();
		printStatus();
	}
	
}
