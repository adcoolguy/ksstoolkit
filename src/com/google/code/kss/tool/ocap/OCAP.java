package com.google.code.kss.tool.ocap;

import com.google.code.kss.core.util.GraphicsProcessor;
import com.google.code.kss.tool.common.Graphics;

public class OCAP implements GraphicsProcessor {

	private static GraphicsProcessor ocap = null;
	Graphics graphics = null;
	
	private OCAP() {
	}

	static GraphicsProcessor getInstance() {
		if(ocap == null) {
			ocap = new OCAP();
			ocap.setGraphics(new com.google.code.kss.tool.common.CanvasGraphics());
		}
		
		return ocap;
	}
	
	public void setGraphics(Graphics graphics) {
		this.graphics = graphics;
	}

	public void init(int resWidth, int resHeight) {
		graphics.init(resWidth, resHeight);
	}
	
	public void setRGB(int r, int g, int b) {
		graphics.setRGB(r, g, b);
	}
	
	public void drawBackground(int x, int y, int width, int height) throws Exception {
		if(graphics == null) {
			throw new Exception("OCAP toolkit not initialized!");
		}

		graphics.drawBackground(x, y, width, height);
	}

	public void createWindow(int x, int y, int width, int height) throws Exception {
		if(graphics == null) {
			throw new Exception("OCAP toolkit not initialized!");
		}

		graphics.createWindow(x, y, width, height);
	}

	public void drawString (int x, int y, int Width, int Height, String szText) throws Exception {
		if(graphics == null) {
			throw new Exception("OCAP toolkit not initialized!");
		}
		
		graphics.drawString(x, y, Width, Height, szText);
	}

	public void createVOD(String poster, String asset, int x, int y, int width, int height) throws Exception {
		if(graphics == null) {
			throw new Exception("OCAP toolkit not initialized!");
		}

		graphics.createVOD(poster, asset, x, y, width, height);
	}
	
	public static void initResolution(int resWidth, int resHeight) {
		/*		
		Digital TV - SDTV:
			480i - 704x480 interlaced
			480p - 704x480 progressive
		Digital-HDTV:
			720p - 1280x720 progressive
			1080i - 1920x1080 interlaced
			1080p - 1920x1080 progressive
 		*/			
		OCAPFactory.getInstance().init(resWidth, resHeight);
	}
	
	public String getOutput() {
		return graphics.getOutput();
	}

	public void saveOutput() {
		graphics.saveOutput();
	}
}
