//
//  AppDelegate.swift
//  FineWatch
//
//  Created by Hiroki Ishiura on 2015/02/08.
//  Copyright (c) 2015年 Hiroki Ishiura. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

	func applicationDidFinishLaunching(_ aNotification: Notification) {
	}

	func applicationWillTerminate(_ aNotification: Notification) {
	}

	func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
		return true
	}
}

