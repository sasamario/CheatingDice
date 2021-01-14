//
//  ViewController.swift
//  CheatingDice
//
//  Created by 笹間巧馬 on 2021/01/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func roll() {
        
        result.text = String(Int.random(in: 1...6))
    }
    
    
    @IBAction func diceRoll(_ sender: Any) {
        roll()
    }
    
}

