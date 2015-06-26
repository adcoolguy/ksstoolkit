package com.google.code.kss.core.util;

public interface FileWatcherCallback {

	public void processCreate() throws Exception;
	public void processDelete() throws Exception;
	public void processModify() throws Exception;
	public void processOverflow() throws Exception;
	
}
