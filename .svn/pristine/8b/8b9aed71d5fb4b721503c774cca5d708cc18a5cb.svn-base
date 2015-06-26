package com.google.code.kss.core.util;

public class JVM {

	private static boolean scriptDone = false;
	
	public static boolean isScriptDone() {
		return scriptDone;
	}

	public static void setScriptDone(boolean scriptDone) {
		JVM.scriptDone = scriptDone;
	}

	public static void raiseError(String msg) {
		System.out.println("Exception raised, reason = '" + msg + "'");
		System.exit(-1);
	}

	public static boolean isMSWindows() {
		boolean retVal = false;
		
		if(System.getProperty("os.name").indexOf("Windows") > -1) {
			retVal = true;
		}
		return retVal;
	}
}
