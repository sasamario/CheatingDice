//
//  CheatDiceViewController.swift
//  CheatingDice
//
//  Created by 笹間巧馬 on 2021/01/14.
//

import UIKit

class CheatDiceViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //シングルタップ用のインスタンスを生成する
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(CheatDiceViewController.singleTap(_:))
        )
        
        //デリゲートをセット
        tapGesture.delegate = self
        
        //viewにインスタンスを追加
        self.view.addGestureRecognizer(tapGesture)
        
    }
    
    //シングルタップ時に実行されるメソッド
    @objc func singleTap(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            
            //サイコロの目を1にする
            result.text = "1"
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
