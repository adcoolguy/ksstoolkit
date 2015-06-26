package com.google.code.kss.core.model.ui.wireframesketcher;

import java.util.Collection;

import org.simpleframework.xml.ElementList;
import org.simpleframework.xml.Root;

import com.google.code.kss.tool.common.ConverterTarget;

@Root(name="Storyboard",strict = false)
public class Story implements ConverterTarget {

	@ElementList(inline=true)
	private Collection<Panels> panels;
	private String name;

	public Collection<Panels> getPanels() {
		return panels;
	}

	public void setPanels(Collection<Panels> panels) {
		this.panels = panels;
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
