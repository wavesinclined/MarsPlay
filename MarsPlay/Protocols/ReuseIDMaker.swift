//
//  Protocols.swift
//  MarsPlay
//
//  Created by alice singh on 05/10/18.
//  Copyright © 2018 alice singh. All rights reserved.
//

import Foundation
import UIKit

protocol ReuseableIdentifier: class {
    static var reuseId: String { get }
}

extension ReuseableIdentifier where Self: UIView  {
    static var reuseId: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReuseableIdentifier { }
extension UICollectionViewCell: ReuseableIdentifier { }


