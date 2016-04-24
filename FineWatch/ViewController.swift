//
//  ViewController.swift
//  FineWatch
//
//  Created by Hiroki Ishiura on 2015/02/08.
//  Copyright (c) 2015年 Hiroki Ishiura. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

	@IBOutlet weak var timeLabel: NSTextField!
	@IBOutlet weak var hourPie: PieProgressIndicator!
	@IBOutlet weak var minutePie: PieProgressIndicator!
	@IBOutlet weak var secondPie: PieProgressIndicator!
	@IBOutlet weak var millisecondPie: PieProgressIndicator!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.hourPie.minimumValue = 0
		self.hourPie.maximumValue = 24
		self.hourPie.currentValue = 0
		self.minutePie.minimumValue = 0
		self.minutePie.maximumValue = 60
		self.minutePie.currentValue = 0
		self.secondPie.minimumValue = 0
		self.secondPie.maximumValue = 60
		self.secondPie.currentValue = 0
		self.millisecondPie.minimumValue = 0
		self.millisecondPie.maximumValue = 1000
		self.millisecondPie.currentValue = 0
		
		let millisecond: Double = 1 / 1000
		let timer = NSTimer(timeInterval: millisecond, target: self, selector: #selector(ViewController.updateTimeLabel), userInfo: nil, repeats: true)
		NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
	}

	override var representedObject: AnyObject? {
		didSet {
		}
	}

	func updateTimeLabel() {
		let now = NSDate();
		if let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian) {
			let units: NSCalendarUnit = [NSCalendarUnit.Hour, NSCalendarUnit.Minute, NSCalendarUnit.Second, NSCalendarUnit.Nanosecond]
			let componets = calendar.components(units, fromDate: now)
			let millisecond = componets.nanosecond / 1000000;
			let text = String(format: "%02d:%02d:%02d.%03d", componets.hour, componets.minute, componets.second, millisecond)
			
			self.timeLabel.stringValue = text;
			self.hourPie.currentValue = (Float)(componets.hour)
			self.minutePie.currentValue = (Float)(componets.minute)
			self.secondPie.currentValue = (Float)(componets.second)
			self.millisecondPie.currentValue = (Float)(millisecond)
		}
	}
}

