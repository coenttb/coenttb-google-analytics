//
//  File.swift
//  coenttb-google-analytics
//
//  Created by Coen ten Thije Boonkkamp on 21/12/2024.
//

import Foundation
import MemberwiseInit

extension Client {
    @MemberwiseInit(.public)
    public struct EnvVars: Codable {
        public var id: String
    }
}
