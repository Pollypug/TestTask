//
//  NibLoadable.swift
//  TestTask
//
//  Created by Polina on 8/18/19.
//  Copyright © 2019 Polina. All rights reserved.
//

import Foundation
import UIKit

protocol NibLoadable: class {
    static var nib: UINib { get }
}

extension NibLoadable {
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }

    static func initFromNIB() -> Self {
        guard let view = nib.instantiate(withOwner: nil, options: nil).first as? Self else {
            fatalError("Could not instantiate view from nib")
        }

        return view
    }
}
