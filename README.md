# 🛡️ DMFirewall – iOS Anti-Fraud & Device Integrity Framework

DMFirewall is a Swift package focused on anti-fraud protection and device integrity validation for iOS applications.

It helps identify non-standard runtime environments such as simulators, jailbroken devices, emulators, automated environments, and modified device states commonly associated with abuse, fake traffic, testing automation, or suspicious activity.

DMFirewall is designed for easy integration into both UIKit and SwiftUI projects with a lightweight and modular architecture.


---

# 🚀 Features

- Detect simulators, emulators, jailbroken or modified devices
- Multi-layer runtime environment analysis
- SwiftUI & UIKit compatibility
- Configurable logging and debug behavior
- Optional secure UI components for additional interaction validation
- Lightweight and modular architecture

---


# 🧠 Overview

DMFirewall can help identify:

- ✅ Standard device environments
- ❌ Simulators
- ❌ Jailbroken devices
- ❌ Emulators or modified environments
- ❌ Automated/debug runtime environments (optional)


The framework is intended for:
- anti-fraud systems
- abuse prevention
- analytics validation
- device integrity checks
- runtime environment awareness

DMFirewall does not collect personal user data and performs all checks locally on-device.

⚙️ Configuration

/// DMFirewall configuration object
```isDebugEnvironmentSuspicious
struct DMFirewallConfiguration {
    let isDetectionEnabled: Bool         // Disable to turn off detection logic
    let isLoggingEnabled: Bool           // Enable to log detection steps
    let isDebugEnvironmentSuspicious: Bool  // Treat debug mode as a threat if true
}
```

🔒 DMFirewall Singleton

```
class DMFirewall {
    static let sharedInstance = DMFirewall()

    /// Called when detection finishes. May be triggered multiple times.
    public var detectionBlock: ((DMFEnvironmentType) -> Void)?

    /// Indicates detection logic enabled
    public var isDetectionEnabled: Bool

    /// Indicates is treating debug builds as suspicious or not
    public var isDebugEnvironmentSuspicious: Bool

    /// Apply configuration at app launch
    func setConfiguration(_ configuration: DMFConfiguration)
}
```

👤 DMFEnvironmentType Enum

```
public enum DMFEnvironmentType: String {
    case trusted
    case suspicious
    case unknown
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
 • Useful for authentication and other sensitive user flows.

 • Supports all TextField initializers.

UIKit DMFUITextField


/// A secure drop-in replacement for UIKit's UITextField
```
class DMFirewallUITextField: UITextField {
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
        isDebugEnvironmentSuspicious: false
    )
    let firewall = DMFirewall(configuration: config)

    firewall.detectionBlock = { type in
        print("DMFirewall: \(type.rawValue) detected")
    }

    return true
}

## 🏗️ Architecture

DMFirewall uses a modular detection pipeline where independent detectors contribute signals to a unified environment assessment.

Detection categories include:
- simulator heuristics
- jailbreak indicators
- debugger detection
- runtime validation
- environment consistency checks

The framework is designed to be lightweight, extensible, and configurable for different application security requirements.
```

📦 Installation (Swift Package Manager)

Add DMFirewall to your project using Swift Package Manager.

Repository URL:

https://github.com/InfiniteThreadsOfficial/DMFirewall.git

In Xcode:

File → Add Packages…

Paste the repository URL and add the package to your target.

🎯 Use Cases

DMFirewall may be useful for:

subscription-based applications
anti-abuse systems
analytics validation
fraud prevention
runtime integrity monitoring
internal enterprise applications
apps with sensitive business logic

📄 Licensing

DMFirewall is available under a commercial license.

For licensing or integration inquiries: epremyanartak@gmail.com




