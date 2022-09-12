//
//  AppInfo.swift
//  
//
//  Created by Ярослав Стрельников on 12.09.2022.
//

import Vapor
import Fluent
import Foundation

struct AppInfo: Content {
    var currentVersion: String?
    var currentBuild: String?
    var bundleIdentifier: String?
}

extension AppInfo {
    struct Decode: Content {
        var currentVersion: String?
        var currentBuild: String?
        var bundleIdentifier: String?
    }
}
