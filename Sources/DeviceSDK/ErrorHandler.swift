//
//  ErrorHandler.swift
//  DeviceSDK
//
//  Created by Leandro Sousa on 2024. 09. 21..
//

import Foundation

public class ErrorHandler {

	public enum DeviceSDKError: Error {
		case deviceIDGenerationFailed
		case persistenceFailed
		case unknownError
	}

	public static func handleError(_ error: DeviceSDKError) -> String {
		switch error {
		case .deviceIDGenerationFailed:
			return "Failed to generate a unique device ID."
		case .persistenceFailed:
			return "Failed to save the device ID to persistent storage."
		case .unknownError:
			return "An unknown error occurred."
		}
	}
}
