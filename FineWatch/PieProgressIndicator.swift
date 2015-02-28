//
//  PieProgressIndicator.swift
//  FineWatch
//
//  Created by Hiroki Ishiura on 2015/02/28.
//  Copyright (c) 2015年 Hiroki Ishiura. All rights reserved.
//

import Cocoa

@IBDesignable
class PieProgressIndicator: NSView {

	@IBInspectable var foregroundColor : NSColor = NSColor.darkGrayColor() {
		didSet {
			self.setNeedsDisplayInRect(self.bounds)
		}
	}

	@IBInspectable var backgroundColor : NSColor = NSColor.lightGrayColor() {
		didSet {
			self.setNeedsDisplayInRect(self.bounds)
		}
	}
	
	@IBInspectable var minimumValue: Float = 0.0 {
		didSet {
			self.setNeedsDisplayInRect(self.bounds)
		}
	}
	@IBInspectable var maximumValue: Float = 1.0 {
		didSet {
			self.setNeedsDisplayInRect(self.bounds)
		}
	}
	@IBInspectable var currentValue: Float = 1.0 / 3.0 {
		didSet {
			self.setNeedsDisplayInRect(self.bounds)
		}
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}

    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)
		let context = NSGraphicsContext.currentContext()?.CGContext

		let center = NSPoint(x: self.bounds.width / 2.0, y: self.bounds.height / 2.0)
		let radius = (CGFloat)((self.bounds.width > self.bounds.height ? self.bounds.height : self.bounds.width) / 2.0)
	
		NSColor.lightGrayColor().set()
		var overallPath = NSBezierPath()
		overallPath.moveToPoint(center)
		overallPath.appendBezierPathWithArcWithCenter(center, radius: radius, startAngle: 0.0, endAngle: 360.0)
		overallPath.fill()
		
		var ratio: Float = 0.0
		if ((self.maximumValue - self.minimumValue) > 0.0) {
			ratio = (self.currentValue - self.minimumValue) / (self.maximumValue - self.minimumValue)
		}
		let startAngle: CGFloat = (CGFloat)(90.0 - 360.0 * ratio)
		let endAngle: CGFloat = 90.0

		NSColor.darkGrayColor().set()
		var piePath = NSBezierPath()
		piePath.moveToPoint(center)
		piePath.appendBezierPathWithArcWithCenter(center, radius: radius, startAngle: startAngle, endAngle: endAngle)
		piePath.fill()
	}
	
}
