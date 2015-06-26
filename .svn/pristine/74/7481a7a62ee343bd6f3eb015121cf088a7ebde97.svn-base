package com.google.code.kss.core.model.ui.wireframesketcher;

import java.util.Collection;

import org.simpleframework.xml.ElementList;
import org.simpleframework.xml.Root;

import com.google.code.kss.tool.common.ConverterTarget;

@Root(strict=false)
public class Screen implements ConverterTarget {
	
	@ElementList(inline=true)
	private Collection<Widgets> widgets;
	private String name;
	
	public Collection<Widgets> getWidgets() {
		return widgets;
	}

	public String getName() {
		// TODO Auto-generated method stub
		return name;
	}

	public void setName(String name) {
		// TODO Auto-generated method stub
		this.name = name;
	}

}
