//
//  DeviceManager.swift
//  DeviceSDK
//
//  Created by Leandro Sousa on 2024. 09. 21..
//

import Foundation

public class DeviceManager {

	static let deviceIDKey = "com.leandro.seon.deviceid"

	private init() { }

#if os(iOS)
	public static func getDeviceID() async throws -> String {
		return try await withCheckedThrowingContinuation { continuation in
			DispatchQueue.global(qos: .background).async {
				let deviceID: String
				do {
					if let savedID = UserDefaults.standard.string(forKey: deviceIDKey) {
						deviceID = savedID
					} else {
						guard let newDeviceID = generateDeviceID() else {
							throw DeviceSDK.ErrorHandler.DeviceSDKError.deviceIDGenerationFailed
						}
						deviceID = newDeviceID

						UserDefaults.standard.set(deviceID, forKey: deviceIDKey)
					}
					DispatchQueue.main.async {
						continuation.resume(returning: deviceID)
					}
				} catch let error as DeviceSDK.ErrorHandler.DeviceSDKError {
					let errorMessage = DeviceSDK.ErrorHandler.handleError(error)
					print("Error: \(errorMessage)")
					DispatchQueue.main.async {
						continuation.resume(throwing: error)
					}
				} catch {
					let errorMessage = DeviceSDK.ErrorHandler.handleError(.unknownError)
					print("Error: \(errorMessage)")
					DispatchQueue.main.async {
						continuation.resume(throwing: DeviceSDK.ErrorHandler.DeviceSDKError.unknownError)
					}
				}
			}
		}
	}
#else
	public static func getDeviceID() -> String {
		return "This function is not supported on this platform."
	}
#endif

	private static func generateDeviceID() -> String? {
		let uuid = UUID().uuidString
		return uuid.isEmpty ? nil : uuid
	}
}
