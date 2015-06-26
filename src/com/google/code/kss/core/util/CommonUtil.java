package com.google.code.kss.core.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;

import org.apache.commons.io.FileUtils;

public class CommonUtil {

	public static final String FS = System.getProperty("file.separator");

	public static BufferedReader loadScript(String fileName) throws Exception {
		BufferedReader r = null;
		try {
			r = new BufferedReader(new InputStreamReader(ClassLoader
					.getSystemResourceAsStream(fileName)));
		} catch (Exception e) {
			throw new Exception(
					e
							+ " - exception occured while reading script text, is the directory of the script "
							+ fileName + " in the classpath?");
		}

		return r;
	}

	public static String loadScriptText(String fileName) throws Exception {
		String r = null;
		try {
			URL source = ClassLoader.getSystemResource(fileName);
			r = FileUtils.readFileToString(new File(source.toURI()));
		} catch (Exception e) {
			throw new Exception(
					e
							+ " - exception occured while reading script text, is the directory of the script "
							+ fileName + " in the classpath?");
		}

		return r;
	}

	public static String toString(BufferedReader in) {
		String str;
		String retVal = "";

		try {
			while ((str = in.readLine()) != null) {
				// System.out.println(str);
				retVal += str + System.getProperty("line.separator");
			}
			in.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return retVal;
	}

	/**
	 * Get the name of the file without its path and the extension.
	 * 
	 * @param src
	 * @return
	 */
	public static String getName(String src) {
		int begin, end;
		String retVal = src;
		if (src != null) {
			begin = src.lastIndexOf(FS);
			if (begin == -1) {
				begin = src.lastIndexOf("/"); // for Wireframesketcher's path, I
												// know this could be redundant
												// if FS is already "/"
			}
			end = src.lastIndexOf(".");
			if (end > -1) {
				retVal = src.substring(begin + 1, end);
			}
		}

		return retVal;
	}

	/**
	 * Taken from http://binodjava.blogspot.com/2009/05/stringreplaceall-not-working-solution.html.
	 * 
	 * @param strOrig
	 * @param strFind
	 * @param strReplace
	 * @return
	 */
	public static String replaceAllString(String strOrig, String strFind,
			String strReplace) {
		if (strOrig == null) {
			return null;
		}
		StringBuffer sb = new StringBuffer(strOrig);
		String toReplace = "";
		if (strReplace == null)
			toReplace = "";
		else
			toReplace = strReplace;
		int pos = strOrig.length();
		while (pos > -1) {
			pos = strOrig.lastIndexOf(strFind, pos);
			if (pos > -1)
				sb.replace(pos, pos + strFind.length(), toReplace);
			pos = pos - strFind.length();
		}
		return sb.toString();
	}

}
