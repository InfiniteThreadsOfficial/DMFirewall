@available(iOS 15.6, *)
public enum DMFirewall {
    public static func activate(config: Configuration) {
        print("active")
    }
    
    public static func deactivate() {
        print("inActive")
    }
    
    public static var isActive: Bool {
        return false
    }
    
    public struct Configuration {
        public let strictMode: Bool
        public let logLevel: Int
        
        public init(strictMode: Bool, logLevel: Int) {
            self.strictMode = strictMode
            self.logLevel = logLevel
        }
    }
}
