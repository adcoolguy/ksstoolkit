package com.google.code.kss;

import javax.tv.xlet.XletStateChangeException;

import com.google.code.kss.adapter.ocap.example.HelloOCAP;

/**
 * This sample test program demonstrate the capability of OCAP Development Toolkit.
 *
 * Pre-requisite -
 * 
 * It has to be run as AspectJ application.
 * 
 */
public class TestJava {

	public static void main(String[] args) {
		HelloOCAP o = new HelloOCAP();
		try {
			o.initXlet(null);
			o.startXlet();
		} catch (XletStateChangeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("OCAP done");
	}
}
