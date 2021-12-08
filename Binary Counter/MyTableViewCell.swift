//coco touch
//  MyTableViewCell.swift
//  Binary Counter
//
//  Created by administrator on 08/12/2021.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    var delegate: MyCellDelegate?
    
    @IBOutlet weak var valueLabel: UILabel!
    
    @IBAction func operationButton(_ sender: UIButton) {
        guard let value =  valueLabel?.text else {return}
        guard let decimalValue = Decimal(string: value) else{return}
        
        let operation:String = sender.tag == 1 ? "+" : "-"
        
        delegate?.changeTotalValue(value: decimalValue, operation: operation)
    }
}
