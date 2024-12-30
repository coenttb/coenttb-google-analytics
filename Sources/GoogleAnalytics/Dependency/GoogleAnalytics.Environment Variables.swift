//
//  File.swift
//  coenttb-google-analytics
//
//  Created by Coen ten Thije Boonkkamp on 21/12/2024.
//

import Foundation

extension GoogleAnalytics.Client {
    public struct EnvVars: Codable {
        public var id: String
        
        public init(id: String) {
            self.id = id
        }
    }
}
