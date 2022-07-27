//
//  GDString.swift
//  BaseApp
//
//  Created by Guglielmo Deletis on 23/04/22.
//

import Foundation

extension String {
    func lastPathComponent() -> String {
        return URL(string: self)?.lastPathComponent ?? ""
    }
    
    func stripTags() -> String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
