package com.google.code.kss.tool.fios;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import com.google.code.kss.core.util.CommonUtil;

public class FIOSScriptUtil {

	private static Set findAllDoFile(String luaScript) {
		Set a = new HashSet<String>();
	    BufferedReader br = new BufferedReader(new StringReader(luaScript));
	    String strLine;
	    try {
			while ((strLine = br.readLine()) != null)   {
			  //System.out.println (strLine);
			  if((strLine.trim().indexOf("--") == -1)) { /* as it is a comment */
				  int begin = strLine.indexOf("dofile(");
				  int end = strLine.indexOf(")");
				  if(begin != -1 && end != -1 && end > begin) {
					  a.add(strLine);
				  }
			  }
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return a;
	}

	private static String readDoFile(String doFileCommand) {
		String retVal = "";
		if(doFileCommand != null) {
			String startToken = "dofile(";
			int begin = doFileCommand.indexOf(startToken);
			int end = doFileCommand.indexOf(")");
			String luaScriptFile = doFileCommand.substring(begin + startToken.length(), end);
			luaScriptFile = CommonUtil.replaceAllString(luaScriptFile, "'", "");
			luaScriptFile = CommonUtil.replaceAllString(luaScriptFile, "\"", "");

			try {
				retVal = CommonUtil.loadScriptText(luaScriptFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return retVal;
	}
	
	/**
	 * This function overcome the issue to FiOS LUA which does not support dofile() in the script.
	 * It allows developer's to use dofile() conveniently and support the command by embedding the script automatically.
	 * 
	 * TODO Limitation:
	 * 
	 * 1. This function will blindly search and replace any text "dofile", grab it parameter, load the file
	 * and replace the original text with the content of the file.
	 * 2. Also if the replaced script contains another dofile() which points back to the caller script, there
	 * will be infinite loop. This has to be fixed in the future.
	 *
	 * @param luaScript
	 * @return
	 */
	public static String handleDoFile(String luaScriptFile) {
		String content = null;
		try {
			content = CommonUtil.loadScriptText(luaScriptFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		Set l = findAllDoFile(content);
		Iterator it = l.iterator();
		String currentDoFile = null;
		while(it.hasNext()) {
			currentDoFile = (String)it.next();
			content = CommonUtil.replaceAllString(content, currentDoFile, readDoFile(currentDoFile));
		}
		return content;
	}

	/**
	 * This function stubs out require() as it is not supported in FiOS/Iris.
	 * 
	 * @param luaScriptFile
	 * @return
	 */
	public static String handleRequire(String luaScriptFile) {
		//TODO
		return null;
	}
	
	public static void main(String[] args) {
		FIOSConverter.initClasspath();
		String newScript = FIOSScriptUtil.handleDoFile("NEW_VERIZON_DEMO.lua");
		System.out.println(newScript);
	}

}
