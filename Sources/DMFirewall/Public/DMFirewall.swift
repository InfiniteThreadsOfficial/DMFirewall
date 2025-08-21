
import DMFirewallInternal
import SwiftUI

@available(iOS 15.6, *)

public class DMFirewall {
    
    public static var sharedInstance = DMFirewall()
    public var detectionBlock: ((DMFirewallUserType) -> Void)?
    
    private init() {
        DMFirewallInternal.Firewall.sharedInstance.detectionBlock = { type in
            switch type {
            case .human:
                self.detectionBlock?(.human)
            case .notHuman:
                self.detectionBlock?(.machine)
            case .unknown:
                break
            @unknown default:
                break
            }
        }
    }
    
    func setConfiguration(_ configuration: DMFirewallConfiguration) {
        let config = DMFConfiguration.init(isDetectionEnabled: configuration.isDetectionEnabled, isLoggingEnabled: configuration.isLoggingEnabled, threatDebugModeAsNotHuman: configuration.threatDebugModeAsNotHuman)
        
        DMFirewallInternal.Firewall.sharedInstance.setConfiguration(config)
    }
}

public enum DMFirewallUserType {
    case human
    case machine
}

public struct DMFirewallConfiguration {
    public  let isDetectionEnabled: Bool
    public  let isLoggingEnabled: Bool
    public  let threatDebugModeAsNotHuman: Bool
    
    public init(isDetectionEnabled: Bool, isLoggingEnabled: Bool, threatDebugModeAsNotHuman: Bool) {
        self.isDetectionEnabled = isDetectionEnabled
        self.isLoggingEnabled = isLoggingEnabled
        self.threatDebugModeAsNotHuman = threatDebugModeAsNotHuman
    }
    
    public static var defaultConfiguration: DMFConfiguration {
        .init(isDetectionEnabled: true,
              isLoggingEnabled: false,
              threatDebugModeAsNotHuman: false)
    }
}

public class DMFirewallUIView: DMFirewallInternal.DMFUIView {
    
}

public class DMFirewallUITextFieldView: DMFirewallInternal.DMFUITextField {
    
}

public struct DMFirewallTextFieldView: View {
    
    @Binding public  var text: String

    // MARK: - Initializer Specific Properties
    
    private var titleKey: LocalizedStringKey?
    private var title: String?
    private var prompt: Text?
    private var label: Text?
    
    // MARK: - Initializers
    
    public init(_ titleKey: LocalizedStringKey, text: Binding<String>) {
        self._text = text
        self.titleKey = titleKey
    }
    
    public init(_ title: String, text: Binding<String>) {
        self._text = text
        self.title = title
    }
    
    public init(
        text: Binding<String>,
        prompt: Text? = nil,
        label: () -> Text
    ) {
        self._text = text
        self.prompt = prompt
        self.label = label()
    }
    
    public var body: some View {
        Group {
            if let titleKey = titleKey {
                DMFirewallInternal.DMFTextField(titleKey, text: $text)
            } else if let title = title {
                DMFirewallInternal.DMFTextField(title, text: $text)
            } else if let label = label {
                DMFirewallInternal.DMFTextField(text: $text, prompt: prompt, label: { label })
            }
        }
    }
}
