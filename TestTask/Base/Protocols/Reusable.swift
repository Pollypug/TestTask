//
//  Reusable.swift
//  TestTask
//
//  Created by Polina on 8/18/19.
//  Copyright © 2019 Polina. All rights reserved.
//

import Foundation

protocol Reusable {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
