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
        
        
        //ロングプレス用のインスタンスを生成する
        let longPressGesture = UILongPressGestureRecognizer(
            target: self,
            action: #selector(CheatDiceViewController.longPress(_:))
        )
        
        //デリゲートをセット
        longPressGesture.delegate = self
        
        //viewにロングプレスジェスチャーインスタンスを追加
        self.view.addGestureRecognizer(longPressGesture)
        
        
        //上スワイプ用のインスタンスを生成する
        let upSwipe = UISwipeGestureRecognizer(
            target: self,
            action: #selector(CheatDiceViewController.didSwipe(_:))
        )
        upSwipe.direction = .up
        self.view.addGestureRecognizer(upSwipe)

        
    }
    
    //シングルタップ時に実行されるメソッド
    @objc func singleTap(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            
            //サイコロの目を1にする
            result.text = "1"
        }
    }
    
    //ロングプレス時に実行されるメソッド
    @objc func longPress(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .ended {
            result.text = "2"
        }
    }
    
    //スワイプ時に実行されるメソッド
    @objc func didSwipe(_ sender: UISwipeGestureRecognizer) {
        
        //スワイプ方向による実行処理をcase文で指定
        switch sender.direction {
        case .up:
            result.text = "3"
        default:
            break
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
