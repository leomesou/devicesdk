//
//  DeviceIdManager.swift
//  DeviceIdSDK
//
//  Created by Leandro Sousa on 2024. 09. 21..
//

import Foundation
import UIKit

public class DeviceIdManager {

	private static let deviceIdKey = "com.leandro.seon.deviceid"

	private init() { }

	public static func getDeviceID() -> String {
		if let savedID = UserDefaults.standard.string(forKey: deviceIdKey) {
			return savedID
		}
		let newDeviceID = generateDeviceID()
		UserDefaults.standard.set(newDeviceID, forKey: deviceIdKey)
		return newDeviceID
	}

	private static func generateDeviceID() -> String {
		return UUID().uuidString
	}
}
