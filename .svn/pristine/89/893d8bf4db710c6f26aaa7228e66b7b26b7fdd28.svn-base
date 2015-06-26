package com.google.code.kss.tool.ide;

import java.util.Scanner;


import com.google.code.kss.core.model.ui.wireframesketcher.Widgets;
import com.google.code.kss.core.util.GraphicsUtil;
import com.google.code.kss.tool.fios.FIOSConverter;

public class Wireframesketcher {

	public static String getProperty(Widgets w, String key) {
		String retVal = null;

		if (w != null && w.getCustomData() != null) {
			Scanner s = new Scanner(w.getCustomData());
			s.useDelimiter(",");
			Scanner s1 = null;
			String temp = null;
			int count = 0;
			while (s.hasNext()) {
				s1 = new Scanner(s.next());
				s1.useDelimiter("=");
				while (s1.hasNext()) {
					temp = s1.next();
					// System.out.println(++count + "=" + temp);
					if (key != null && key.equals(temp)) {
						retVal = s1.next();
						break;
					}
				}
			}
		}

		return retVal;
	}
	
	//TODO need to put this into FileUtil!
	public static String getImageFileExtension(String src) {
		int begin;
		String retVal = null;
		if (src != null) {
			begin = src.lastIndexOf(".");
			retVal = src.substring(begin + 1, src.length());
		}
		return retVal;
	}
	
	//TODO need to put this into FileUtil!
	public static String getImageFileNameWithoutExtension(String src) {
		int begin;
		String retVal = src;
		if (src != null) {
			begin = src.lastIndexOf("/");
			retVal = src.substring(begin + 1, getImageFileExtension(src).length() + 3);
		}
		return retVal;
	}	
	
	public static void main(String[] args) {
		FIOSConverter.initClasspath();
		try {
			GraphicsUtil.toGrayScaleImage("HPList.PNG");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
