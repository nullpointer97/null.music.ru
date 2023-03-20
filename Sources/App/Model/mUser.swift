//
//  File.swift
//  
//
//  Created by nullptr on 20.03.2023.
//

import Foundation
import FluentPostgresDriver
import Vapor

final class mUser: Model, Content {
    enum Status: String, Codable {
        case active
        case offline
        case banned
    }
    
    static var schema: String = "users"

    @ID() var id: UUID?

    @Field(key: .vkId) var vkId: String
    @Field(key: .boomId) var boomId: String
    @Field(key: .lastAppRun) var lastAppRun: Double
    @Field(key: .status) var status: Status
    @Field(key: .access) var access: String
    @Field(key: .bundle) var bundle: String
    @Field(key: .appVersion) var appVersion: String
    @Field(key: .appBuild) var appBuild: String
    @Field(key: .teamName) var teamName: String
    @Field(key: .teamId) var teamId: String
    @Field(key: .savedMusicIds) var savedMusicIds: [String]
    
    init() {}
    
    init(vkId: String, boomId: String, lastAppRun: Double, status: mUser.Status, access: String, bundle: String, appVersion: String, appBuild: String, teamName: String, teamId: String, savedMusicIds: [String]) {
        self.id = UUID()
        self.vkId = vkId
        self.boomId = boomId
        self.lastAppRun = lastAppRun
        self.status = status
        self.access = access
        self.bundle = bundle
        self.appVersion = appVersion
        self.appBuild = appBuild
        self.teamName = teamName
        self.teamId = teamId
    }
}

extension mUser: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema(mUser.schema)
            .id()
            .field(.vkId, .string, .required)
            .field(.boomId, .string, .required)
            .field(.lastAppRun, .double, .required)
            .field(.status, .string, .required)
            .field(.access, .string, .required)
            .field(.bundle, .string, .required)
            .field(.appVersion, .string, .required)
            .field(.appBuild, .string, .required)
            .field(.teamName, .string, .required)
            .field(.teamId, .string, .required)
            .field(.savedMusicIds, .array(of: .string))
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema(mUser.schema).delete()
    }
}

extension FieldKey {
    static var vkId: Self { "vk_id" }
    static var boomId: Self { "boom_id" }
    static var lastAppRun: Self { "last_app_run" }
    static var status: Self { "status" }
    static var access: Self { "access" }
    static var bundle: Self { "bundle" }
    static var appVersion: Self { "app_version" }
    static var appBuild: Self { "app_build" }
    static var teamName: Self { "team_name" }
    static var teamId: Self { "team_id" }
    static var savedMusicIds: Self { "saved_music_ids" }
}
