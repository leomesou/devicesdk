import Foundation
import Testing
@testable import DeviceSDK

@Test func testGetDeviceIDGeneratesNewID() async throws {
	// Clear UserDefaults to ensure a fresh start
	UserDefaults.standard.removeObject(forKey: DeviceManager.deviceIDKey)

	let deviceID = try await DeviceManager.getDeviceID()

	// Check that a valid UUID string is returned
	#expect(deviceID != nil)
	#expect(UUID(uuidString: deviceID) != nil)

	// Check that the device ID is saved in UserDefaults
	let savedID = UserDefaults.standard.string(forKey: DeviceManager.deviceIDKey)
	#expect(savedID == deviceID)
}

@Test func testGetDeviceIDRetrievesSavedID() async throws {
	// Clear UserDefaults to ensure a fresh start
	UserDefaults.standard.removeObject(forKey: DeviceManager.deviceIDKey)

	// First call to generate and save a device ID
	let firstID = try await DeviceManager.getDeviceID()

	// Now, retrieve the same ID again
	let secondID = try await DeviceManager.getDeviceID()

	// Ensure both IDs are the same
	#expect(firstID == secondID)
}
