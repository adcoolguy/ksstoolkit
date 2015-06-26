package com.google.code.kss.core.util;

import static java.nio.file.StandardWatchEventKind.ENTRY_CREATE;
import static java.nio.file.StandardWatchEventKind.ENTRY_DELETE;
import static java.nio.file.StandardWatchEventKind.ENTRY_MODIFY;
import static java.nio.file.StandardWatchEventKind.OVERFLOW;
import java.io.File;
import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.WatchEvent;
import java.nio.file.WatchKey;
import java.nio.file.WatchService;

public class FileWatcher {

	/**
	 * Currently this function does not scan any sub-directory.
	 * 
	 * @param directory
	 */
	public static final void start(String directory,
			FileWatcherCallback callback) {

		Path _directotyToWatch = Paths.get(directory);
		System.out.format("Monitoring resource under "
				+ _directotyToWatch.toAbsolutePath() + "\n");
		WatchService watcher = null;
		try {
			WatchKey key;
			watcher = FileSystems.getDefault().newWatchService();
			key = _directotyToWatch.register(watcher, ENTRY_CREATE,
					ENTRY_DELETE, ENTRY_MODIFY);

			while (true) {
				System.out.println("READY");
				key = watcher.take();
				for (WatchEvent<?> event : key.pollEvents()) {
					WatchEvent<Path> watchEvent = castEvent(event);
					System.out.println(event.kind().name().toString() + " "
							+ _directotyToWatch.resolve(watchEvent.context()));
					if(watchEvent.kind() == ENTRY_CREATE) {
						callback.processCreate();
					}
					if(watchEvent.kind() == ENTRY_DELETE) {
						callback.processDelete();
					}
					if(watchEvent.kind() == ENTRY_MODIFY) {
						callback.processModify();						
					}
					if(event.kind() == OVERFLOW) {
						callback.processOverflow();
					}
					key.reset();
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	static <T> WatchEvent<T> castEvent(WatchEvent<?> event) {
		return (WatchEvent<T>) event;
	}
}
