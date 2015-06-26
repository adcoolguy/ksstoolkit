package com.google.code.kss;

import com.google.code.kss.core.util.KSSFactory;
import com.google.code.kss.tool.rhino.RhinoFactory;

/**
 * This sample test program demonstrate the capability of KSSToolkit.
 * 
 */
public class TestJavascript {
	/**
	 * This test program demonstrate the capability of KSS Toolkit with Rhino (Javascript) engine.
	 * 
	 */
	public static void main(String[] args) {
		try {
			//initialize the KSS framework
			RhinoFactory app = new RhinoFactory(KSSFactory.getManager());
			KSSFactory.setFactory(app);
			//setup any dependent external js needed by the script
			//KSSFactory.loadObject("processing-0.8.js");
			//showtime!
			KSSFactory.loadScript("Alert.js");
//			KSSFactory.execute();
			KSSFactory.runScript();
			System.out.println("TestJavascript done");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
