import Fluent
import Vapor
import Foundation

func routes(_ app: Application) throws {
    app.get { req async in
        "It works!"
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }
    
    app.get("app-info") { req async -> AppInfo in
        return .init(currentVersion: "2.5.5", currentBuild: "9", bundleIdentifier: "com.nullteam.music")
    }
}
/// hI7fJ8mG5quD
