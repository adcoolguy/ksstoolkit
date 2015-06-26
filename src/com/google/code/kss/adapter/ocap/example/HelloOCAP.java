package com.google.code.kss.adapter.ocap.example;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.FontMetrics;
import java.awt.Graphics;
import java.awt.Toolkit;

import javax.tv.xlet.Xlet;
import javax.tv.xlet.XletContext;
import javax.tv.xlet.XletStateChangeException;

import org.havi.ui.HScene;
import org.havi.ui.HSceneFactory;

/**
 * This source code is retrieved from
 * http://www.ibm.com/developerworks/java/library/j-ocap2/index.html.
 * 
 * Dependency -
 * 
 * http://jinahya-files.googlecode.com/svn/maven/2/repo/com/cablelabs/ocap/1.1.2
 * -2009.09.30/ocap-1.1.2-2009.09.30.jar
 * 
 * Resource -
 * 
 * https://community.cablelabs.com/svn/OCAPRI
 * 
 * @author ADMIN
 * 
 */
public class HelloOCAP implements Xlet {
	private HScene mScene;
	private HelloOCAPUI mContent;

	public void initXlet(XletContext ctx) throws XletStateChangeException {
		System.out.println("HelloOCAP initXlet");
		HSceneFactory factory = HSceneFactory.getInstance();
		mScene = factory.getDefaultHScene();

		mContent = new HelloOCAPUI();
		mContent.setVisible(true);

		mScene.setLayout(new BorderLayout());
		mScene.add(mContent, BorderLayout.CENTER);

		Toolkit toolkit = Toolkit.getDefaultToolkit();
		Dimension d = toolkit.getScreenSize();

		mScene.setLocation(0, 0);
		mScene.setSize(d.width, d.height);
		mScene.validate();
	}

	public void startXlet() throws XletStateChangeException {
		mScene.setVisible(true);
	}

	public void pauseXlet() {
	}

	public void destroyXlet(boolean forced) throws XletStateChangeException {
	}
}

class HelloOCAPUI extends Container {
	private boolean mInitialized;
	private Font mFont;
	private int mX, mY;

	public HelloOCAPUI() {
		mInitialized = false;
		mFont = null;
		mX = mY = -1;
	}

	public void paint(Graphics g) {
		String s = "Hello, OCAP!";

		if (mInitialized == false) {
			mFont = new Font("Serif", Font.PLAIN, 96);
			int w = getWidth();
			int h = getHeight();
			FontMetrics fm = g.getFontMetrics(mFont);
			int sw = fm.stringWidth(s);
			int sh = fm.getHeight();
			int sd = fm.getDescent();
			mX = (w - sw) / 2;
			mY = (h + sh) / 2 - sd;
			mInitialized = true;
		}

		g.setFont(mFont);
		g.setColor(Color.blue);
		g.drawString("Hello, OCAP!", mX, mY);
	}
}