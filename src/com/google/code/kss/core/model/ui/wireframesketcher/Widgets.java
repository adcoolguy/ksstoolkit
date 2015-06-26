package com.google.code.kss.core.model.ui.wireframesketcher;

import org.simpleframework.xml.Attribute;
import org.simpleframework.xml.Element;
import org.simpleframework.xml.Root;

@Root(strict=false)
public class Widgets {

	@Attribute
	private String type;	
	@Attribute(required=false)
	private int x;
	@Attribute(required=false)
	private int y;
	@Attribute(required=false)
	private int width;
	@Attribute(required=false)
	private int height;
	@Attribute(required=false)
	private int measuredWidth;
	@Attribute(required=false)
	private int measuredHeight;
	@Attribute(required=false)
	private String src;
	@Attribute(required=false)
	private String text;
	@Element(required=false)
	private Font font;
	@Attribute(required=false)
	private int alpha;
	@Attribute(required=false)
	private String background;
	@Attribute(required=false)
	private String foreground;
	@Attribute(required=false)
	private String customId;
	@Attribute(required=false)
	private String customData;
	@Attribute(required=false)
	private boolean grayscale;
	
	public String getSrc() {
		return src;
	}
	public void setSrc(String src) {
		this.src = src;
	}
	public int getX() {
		return x;
	}
	public void setX(int x) {
		this.x = x;
	}
	public int getY() {
		return y;
	}
	public void setY(int y) {
		this.y = y;
	}
	public int getMeasuredWidth() {
		return measuredWidth;
	}
	public void setMeasuredWidth(int measuredWidth) {
		this.measuredWidth = measuredWidth;
	}
	public int getMeasuredHeight() {
		return measuredHeight;
	}
	public void setMeasuredHeight(int measuredHeight) {
		this.measuredHeight = measuredHeight;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getText() {
		return text;
	}
	public Font getFont() {
		return font;
	}
	public int getAlpha() {
		return alpha;
	}
	public String getBackground() {
		if(background == null)
			if("model:Rectangle".equals(getType()))
				return "#ffffff";
		return background;	
	}
	public String getForeground() {
		if(foreground == null)
			if("model:HLine".equals(getType()) || "model:VLine".equals(getType()))
				return "#000000"; 
		return foreground;	
	}
	public String getCustomId() {
		return customId;
	}
	public String getCustomData() {
		return customData;
	}
	public boolean getGrayscale() {
		return grayscale;
	}
}