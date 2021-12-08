//
//  ViewController.swift
//  Binary Counter
//
//  Created by administrator on 08/12/2021.
//

import UIKit

class ViewController: UIViewController , MyCellDelegate {

    

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var powerOf10=[Decimal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for value in 0...16{
            powerOf10.append(pow(10, value))
        }
        
        tableView.dataSource = self
    
    
    }
    func changeTotalValue(value: Decimal, operation: String) {
        guard let total = totalLabel.text else{return}
        guard let decimalTotal = Decimal(string:total) else{return}
        if operation == "+"
        {
            totalLabel.text = "\(decimalTotal+value)"
        }else {
            
                totalLabel.text = "\(decimalTotal-value)"
        }
        tableView.reloadData()
        
    }
 
}

extension ViewController: UITableViewDataSource {
    //Datasource
    // How many cells are we going to need?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return an integer that indicates how many rows (cells) to draw
        return powerOf10.count
    }
    
    // How should I create each cell?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MyTableViewCell
        cell.valueLabel?.text = "\(powerOf10[indexPath.row])"
        // This line is very important! Now the cell has a reference to the view controller itself.
        cell.delegate = self
        return cell
    }

    
}
