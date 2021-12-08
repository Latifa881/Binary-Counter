//
//  MyCellDelegate.swift
//  Binary Counter
//
//  Created by administrator on 08/12/2021.
//

import Foundation
import UIKit
protocol MyCellDelegate: class {
    func changeTotalValue(value:Decimal,operation:String)
}
