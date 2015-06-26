package com.google.code.kss.adapter.ocap.example;

import java.awt.Toolkit;

import org.havi.ui.HScene;
import org.havi.ui.HSceneFactory;

import sun.awt.windows.WToolkit;

import com.google.code.kss.tool.ocap.OCAP;
import com.google.code.kss.tool.ocap.OCAPFactory;

public aspect OCAPVirtualizingAspect {

	private int windowX;
	private int windowY;
	private int windowWidth;
	private int windowHeight;
	
	public HSceneFactory.new(String dummy) {
	}

	class MockupHScene extends HScene {
	}
	
	abstract static class MockupToolkit extends Toolkit {
	    public static synchronized Toolkit getDefaultToolkit() {
	    	return new WToolkit();
	    }
	}
	
	HelloOCAPUI mContent = null;
 	
	pointcut newContainer(): call(public com.google.code.kss.adapter.ocap.example.HelloOCAPUI.new(..));
	pointcut drawString(): call(public void java.awt.Graphics.drawString(String, int, int));
	pointcut getInstance();//: call(public static * org.havi.ui.HSceneFactory.getInstance());
	pointcut getDefaultHScene(): call(public * org.havi.ui.HSceneFactory.getDefaultHScene());
	pointcut getDefaultToolkit(): call(public static * java.awt.Toolkit.getDefaultToolkit());
	pointcut validate(): call(public void java.awt.Container.validate());
	pointcut fontMetrics(): call(public * java.awt.FontMetrics.get*(..));
	pointcut fontMetricsStringWidth(): call(public * java.awt.FontMetrics.string*(..));
	pointcut component(): call(public * java.awt.Component.get*(..)) && !call(public * java.awt.Component.validate(..)) && !call(public * java.awt.Component.paint(..));
	pointcut setWindowLocation(): call(public void java.awt.Container.setLocation(int, int));
	pointcut setWindowSize(): call(public void java.awt.Container.setSize(int, int));

	after() returning(Object obj):newContainer(){
		mContent = (HelloOCAPUI)obj;
	}

/*	Object around():newContainer(){
		return new HelloOCAPUI();
	}
*/
	Object around():getDefaultHScene(){
		return new MockupHScene();
	}

	Object around():getInstance(){
		HSceneFactory hSceneFactory = HSceneFactory.getInstance();
		return null;
	}

	Object around():getDefaultToolkit(){
		//OCAP.initResolution(1280, 800);
		OCAP.initResolution(704, 480);
		
		return MockupToolkit.getDefaultToolkit();
	}
	
	Object around():drawString(){
		Object args[] = thisJoinPoint.getArgs();

		String szText = (String)args[0];
		int x = ((Integer)args[1]).intValue();
		int y = ((Integer)args[2]).intValue();
		
		OCAP ocap = OCAPFactory.getInstance();
		
		try {
			ocap.drawString(x, y, 50, 50, szText);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return proceed();
	}

	Object around():validate(){
		OCAP ocap = OCAPFactory.getInstance();

		try {
			System.out.println("calling paint ...");
			mContent.paint(new MockupGraphics2D());
			System.out.println("exit paint");
			ocap.createWindow(windowX, windowY, windowWidth, windowHeight);
			ocap.saveOutput();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return proceed();
	}
	
	Object around():fontMetrics() {
		return new Integer(100);
	}

	Object around():fontMetricsStringWidth() {
		return new Integer(100);
	}

	Object around():component() {
		return proceed();
	}

	Object around():setWindowLocation(){
		Object args[] = thisJoinPoint.getArgs();

		windowX = ((Integer)args[0]).intValue();
		windowY = ((Integer)args[1]).intValue();

		return proceed();
	}

	Object around():setWindowSize(){
		Object args[] = thisJoinPoint.getArgs();

		windowWidth = ((Integer)args[0]).intValue();
		windowHeight = ((Integer)args[1]).intValue();

		return proceed();
	}
}