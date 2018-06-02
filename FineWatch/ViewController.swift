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
		let timer = Timer(timeInterval: millisecond, target: self, selector: #selector(ViewController.updateTimeLabel), userInfo: nil, repeats: true)
		RunLoop.current.add(timer, forMode: RunLoopMode.commonModes)
	}

	override var representedObject: Any? {
		didSet {
		}
	}

	@objc func updateTimeLabel() {
		let now = Date();
		let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
		let units = Set<Calendar.Component>([.hour, .minute, .second, .nanosecond])
		let components = calendar.dateComponents(units, from: now)
		if let hour = components.hour, let minute = components.minute, let second = components.second, let nanosecond = components.nanosecond {
			let millisecond = nanosecond / 1000000;
			let text = String(format: "%02d:%02d:%02d.%03d", hour, minute, second, millisecond)
			
			self.timeLabel.stringValue = text;
			self.hourPie.currentValue = Float(hour)
			self.minutePie.currentValue = Float(minute)
			self.secondPie.currentValue = Float(second)
			self.millisecondPie.currentValue = Float(millisecond)
		}
	}
}

