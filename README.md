🛡️ DMFirewall – iOS Threat Detection Swift Package


DMFirewall is a powerful Swift package designed to detect unauthorized or malicious environments such as simulators, emulators, jailbroken devices, and other non-official or malformed devices often used by hackers to exploit iOS applications.

It leverages 5+ layers of detection and provides real-time response hooks to help you secure your app at runtime. DMFirewall offers plug-and-play integration for both UIKit and SwiftUI projects.

⚠️ DMFirewall allows 10 free detections. A premium subscription is required after that. Contact: InfiniteThreadsOfficial@proton.me


🚀 Features


 • Detect simulators, emulators, jailbroken or malformed devices

 • Five levels of detection for maximum protection

 • SwiftUI & UIKit compatibility

 • Configurable behavior for debugging and logging

 • Optional custom views to catch threats through user input

 • Easy-to-use public API


🧠 Overview


DMFirewall can detect:

 • ✅ Real users on real devices

 • ❌ Simulators

 • ❌ Jailbroken devices

 • ❌ Emulators or modified devices

 • ❌ Debug environments (optionally)
 

⚙️ Configuration


/// DMFirewall configuration object
```
struct DMFirewallConfiguration {
    let isDetectionEnabled: Bool         // Disable to turn off detection logic
    let isLoggingEnabled: Bool           // Enable to log detection steps
    let threatDebugModeAsNotHuman: Bool  // Treat debug mode as a threat if true
}
```

🔒 DMFirewall Singleton

```
class DMFirewall {
    static let sharedInstance = DMFirewall()

    /// Called when detection finishes. May be triggered multiple times.
    public var detectionBlock: ((DMFUserType) -> Void)?

    /// Indicates detection logic enabled
    public var isDetectionEnabled: Bool

    /// Indicates is treating debug builds as notHuman or not
    public var threatDebugModeAsNotHuman: Bool

    /// Apply configuration at app launch
    func setConfiguration(_ configuration: DMFConfiguration)
}
```

👤 DMFUserType Enum

```
public enum DMFirewallUserType: String {
    case unknown   // Detection could not determine status (super rare)
    case human     // Safe, regular user
    case notHuman  // Threat detected (simulator, emulator, jailbreak, etc.)
}
```

🧩 Custom Views

SwiftUI DMFirewallTextField

```
/// A secure drop-in replacement for SwiftUI's TextField
struct DMFTextField: View {
    ...
}
```
 • Use in login or sensitive screens to better trace threat sources.

 • Supports all TextField initializers.

UIKit DMFUITextField


/// A secure drop-in replacement for UIKit's UITextField
```
struct DMFirewallUITextField: UIView {
    ...
}
```

UIKit DMFirewallUIView

/// Drop-in replacement for any UIView (button, label, customView etc.)
```
struct DMFUIView: UIView {
    ...
}
```

 • Detects suspicious interactions.

 • SwiftUI version not yet available — use bridging where needed.

 • Supports subclassing or direct usage in Storyboards.
 
🧠 Using DMF views is optional but recommended for full coverage.

💡 Example Usage

```
func application(
  _ application: UIApplication,
  didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
) -> Bool {
    
    let config = DMFConfiguration(
        isDetectionEnabled: true,
        isLoggingEnabled: false,
        threatDebugModeAsNotHuman: false
    )
    let firewall = DMFirewall(configuration: config)

    firewall.detectionBlock = { type in
        print("DMFirewall: \(type.rawValue) detected")
    }

    return true
}
```

📦 Adding DMFirewall to Your Xcode Project
You can integrate DMFirewall into your iOS or macOS project using Swift Package Manager (SPM), which is built into Xcode.
✅ Steps
Open your Xcode project
Launch Xcode and open the project you want to add DMFirewall to.
Go to Package Dependencies
In the top menu, click:
File → Add Packages…
Enter the repository URL
In the search field at the top right, paste this GitHub URL:
https://github.com/InfiniteThreadsOfficial/DMFirewall.git

💰 Licensing & Purchase Info
🔓 Free Tier: First 10 detections.

🔒 Premium Required: After 10 detections, subscription is needed.

📬 Contact: InfiniteThreadsOfficial@proton.me for pricing and access.




