//  Configuration.swift
//  Yammit
//
//  Created by Eric Rabil on 10/6/21.
//
//

import Foundation
import Yams
import Swog

public protocol Configuration: Codable {
    init()
    
    static var path: String { get }
}

public extension Configuration {
    static var url: URL { URL(fileURLWithPath: path) }
    
    static func read() throws -> Data {
        try Data(contentsOf: URL(fileURLWithPath: path))
    }
    
    static func load() -> Self {
        do {
            let config: Self = try YAMLDecoder().decode(from: read())
            config.save()
            
            return config
        } catch {
            let defaults = Self()
            defaults.save()
            
            return defaults
        }
    }
    
    func serialize() throws -> Data {
        try Data(YAMLEncoder().encode(self).utf8)
    }
    
    func save() {
        do {
            try serialize().write(to: Self.url)
        } catch {
            CLWarn("LMDConfig", "Failed to save config at %@", Self.path)
        }
    }
}
