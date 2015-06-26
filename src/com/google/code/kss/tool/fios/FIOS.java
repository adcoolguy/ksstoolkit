package com.google.code.kss.tool.fios;

import com.google.code.kss.core.util.GraphicsProcessor;
import com.google.code.kss.tool.common.Graphics;

public class FIOS implements GraphicsProcessor {

	private static FIOS fios = null;
	Graphics graphics = null;
	
	private FIOS() {
	}

	static FIOS getInstance() {
		if(fios == null) {
			fios = new FIOS();
		}
		
		return fios;
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
			throw new Exception("FiOS toolkit not initialized!");
		}

		graphics.drawBackground(x, y, width, height);
	}

	public void createWindow(int x, int y, int width, int height) throws Exception {
		if(graphics == null) {
			throw new Exception("FiOS toolkit not initialized!");
		}

		graphics.createWindow(x, y, width, height);
	}

	public void drawString (int x, int y, int Width, int Height, String szText) throws Exception {
		if(graphics == null) {
			throw new Exception("FiOS toolkit not initialized!");
		}
		
		graphics.drawString(x, y, Width, Height, szText);
	}

	public void createVOD(String poster, String asset, int x, int y, int width, int height) throws Exception {
		if(graphics == null) {
			throw new Exception("FiOS toolkit not initialized!");
		}

		graphics.createVOD(poster, asset, x, y, width, height);
	}
	
	public String getOutput() {
		return graphics.getOutput();
	}

	public void saveOutput() {
		graphics.saveOutput();
	}
}
