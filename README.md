# DeviceSDK

DeviceSDK is a Swift-based SDK designed for iOS applications to generate and manage unique device IDs asynchronously. This SDK retrieves a unique device ID and persists it using UserDefaults, ensuring that the ID remains consistent across app launches.

## Installation

To integrate DeviceSDK into your iOS project, simply add the SDK files to your project directory.

## Usage

### Getting the Device ID

To retrieve the device ID, call the `getDeviceID` method:

```swift
import DeviceSDK

do {
    let deviceID = try await DeviceSDK.getDeviceID()
    print("Device ID: \(deviceID)")
} catch {
    print("Error retrieving device ID: \(error)")
}
```


### Error Handling

The SDK provides an `ErrorHandler` class that defines the following possible errors:

- **deviceIDGenerationFailed**: Occurs if the SDK fails to generate a new device ID.
- **persistenceFailed**: Indicates a failure in saving the device ID to UserDefaults.
- **unknownError**: Represents any unforeseen errors.

You can handle these errors in your code as shown below:

```swift
catch let error as ErrorHandler.DeviceSDKError {
    let errorMessage = ErrorHandler.handleError(error)
    print("Error: \(errorMessage)")
}
```


## Testing

The SDK includes unit tests to ensure the proper functionality of device ID generation and retrieval. To run the tests, use the following methods:

### Test 1: Generating a New Device ID

This test verifies that a new device ID is generated and saved to UserDefaults:

```swift
@Test func testGetDeviceIDGeneratesNewID() async throws {
    // Test implementation
}
```


### Test 2: Retrieving a Saved Device ID

This test checks that the saved device ID can be retrieved successfully:

```swift
@Test func testGetDeviceIDRetrievesSavedID() async throws {
    // Test implementation
}
```


## Analysis of Device ID

The device ID in the DeviceSDK is generated using the UUID class, ensuring high uniqueness. Each UUID is virtually guaranteed to be unique, minimizing duplication risks.

### Uniqueness

- UUID Generation: Each ID is a fresh UUID, making conflicts unlikely across different devices and app sessions.
- Application Scope: The ID is specific to the application, avoiding conflicts with other apps.

### Persistence

- UserDefaults Storage: The ID is stored in UserDefaults, allowing it to persist across app launches until explicitly removed.
- Consistent Identity: This ensures that the same ID is available in future sessions, providing reliable device identification.


## License

This SDK is available under the MIT License.

## Contributing

Contributions are welcome! Please submit a pull request or open an issue if you encounter any problems or have suggestions for improvements.
