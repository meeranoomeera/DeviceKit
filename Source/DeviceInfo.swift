//
//  DeviceInfo.swift
//  RoadsApp Reborn
//
//  Created by Maxim Semenov on 29/05/2019.
//  Copyright © 2019 HOMERA. All rights reserved.
//

import DeviceKit
import Foundation

public enum DevicePerformanceSegment: Int {
	case low
	case middle
	case top
}

public struct DeviceInfo {
	public var model: String {
		device.description
	}

	public var systemVersion: String {
		device.systemVersion ?? ""
	}

	public var performanceSegment: DevicePerformanceSegment {
		switch device {
		case .iPhone7,
		     .iPhone7Plus,
		     .iPhone8,
		     .iPhone8Plus:
			return .middle
		case .iPhoneX,
		     .iPhoneXS,
		     .iPhoneXSMax,
		     .iPhoneXR:
			return .top
		case .iPhone5,
		     .iPhone6,
		     .iPhone5c,
		     .iPhone5s,
		     .iPhone6s,
		     .iPhone6Plus,
		     .iPhoneSE:
			return .low
		default:
			return .top
		}
	}

	public var deviceHasDynamicIsland: Bool {
		#if DEBUG
		Device.current == .iPhone14Pro ||
			Device.current == .iPhone14ProMax ||
			Device.current == .simulator(.iPhone14Pro) ||
			Device.current == .simulator(.iPhone14ProMax) ||
			Device.current == .iPhone15Pro ||
			Device.current == .iPhone15ProMax ||
			Device.current == .simulator(.iPhone15Pro) ||
			Device.current == .simulator(.iPhone15ProMax)
		#else
		Device.current == .iPhone14Pro ||
			Device.current == .iPhone14ProMax ||
			Device.current == .iPhone15Pro ||
			Device.current == .iPhone15ProMax
		#endif
	}

	public let device = Device.current

	public init() {}
}

public protocol DeviceInfoDP {
	var deviceInfo: DeviceInfo { get }
}
