package com.google.code.kss.tool.common;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import com.google.code.kss.core.util.GraphicsProcessor;

public class CanvasGraphics implements Graphics {

	private String header = "<!DOCTYPE HTML> <html> <head> <meta http-equiv=\"X-UA-Compatible\" content=\"chrome=1\"> </head> <body> <canvas id=\"myCanvas\" width=\"%d\" height=\"%d\">I do not support HTML 5 canvas tag</canvas> <script type=\"text/javascript\"> var canvas = document.getElementById(\"myCanvas\"); var ctx    = canvas.getContext(\"2d\");";
	private String footer1 = "</script>";
	private String footer2 = "</body> </html>";
	private String boxTemplate = "ctx.fillStyle = \"rgba(%d, %d, %d, 0.5)\"; ctx.fillRect (%d, %d, %d, %d);";
	private String videoTemplate = "<div style=\"position:absolute;top:%dpx;left:%dpx;width:%d;height:%d\"><video width=\"%d\" height=\"%d\" poster=\"%s\" controls><source src=\"%s\" type=\"%s\" autobuffer></source></video></div>";
	private int r = 0, g = 0, b = 200;	//default is blue
	private StringBuffer sb = new StringBuffer();
	private StringBuffer sb2 = new StringBuffer();
	private int resWidth;
	private int resHeight;

	public void init(int resWidth, int resHeight) {
		this.resWidth = resWidth;
		this.resHeight= resHeight; 
	}
	
	public void setRGB(int r, int g, int b) {
		this.r = r;
		this.g = g;
		this.b = b;
	}
	
	public void drawBackground(int x, int y, int width, int height) throws Exception {
		if(sb == null) {
			throw new Exception("KSS toolkit graphics not initialized!");
		}
		
		Integer ex[] = { new Integer(x),new Integer(y),new Integer(width),new Integer(height) };
		String str = String.format("ctx.fillStyle = \"rgb(0,0,0)\"; ctx.fillRect (%d, %d, %d, %d);", (Object[])ex);
		sb.append(str);
	}

	public void createWindow(int x, int y, int width, int height) throws Exception {
		if(sb == null) {
			throw new Exception("KSS toolkit graphics not initialized!");
		}
		
		Integer ex[] = { new Integer(r), new Integer(g), new Integer(b), new Integer(x),new Integer(y),new Integer(width),new Integer(height) };
		String str = String.format(boxTemplate, (Object[])ex);
		sb.append(str);
	}

	public void drawString (int x, int y, int Width, int Height, String szText) throws Exception {
		if(sb == null) {
			throw new Exception("KSS toolkit graphics not initialized!");
		}
		if(szText == null) {
			szText = "";
		}
		//TBD - simple and stupid HTML safe handing :(
		szText = szText.replace("\\", "\\\\");
		
		//TBD - width and height are not specified
		Object ex[] = {szText, new Integer(x), new Integer(y)};
		String str = String.format("ctx.strokeText(\"%s\", %d, %d);", (Object[])ex);
		sb.append(str);
	}

	public void createVOD(String poster, String asset, int x, int y, int width, int height) throws Exception {
		if(sb2 == null) {
			throw new Exception("KSS toolkit graphics not initialized!");
		}
	
		Object ex[] = {new Integer(y), new Integer(x), new Integer(width), new Integer(height), new Integer(width), new Integer(height), poster, asset, "video/mp4"};
		String str = String.format(videoTemplate, (Object[])ex);
		sb2.append(str);
	}
	
	public String getOutput() {
		Integer ex[] = {new Integer(resWidth), new Integer(resHeight)};
		String temp = String.format(header, (Object[])ex);
		String retVal = temp + sb.toString() + footer1 + sb2.toString() + footer2;
		
		return retVal;
	}

	public void saveOutput() {
		try {
			String fileName = "canvas.htm";
			File f = new File(fileName);
			f.delete();
			FileWriter fstream = new FileWriter(fileName);
			BufferedWriter out = new BufferedWriter(fstream);
			out.write(getOutput());
			//System.out.println(getOutput());
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
