//
//  ViewController.swift
//  CheatingDice
//
//  Created by 笹間巧馬 on 2021/01/14.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var result: UILabel!
    
    @IBOutlet weak var diceResultView: UIView!
    
    @IBOutlet weak var rollButton: UIButton!
    
    var player = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func roll() {
        
        result.text = String(Int.random(in: 1...6))
    }
    
    //サイコロを振るボタン
    @IBAction func diceRoll(_ sender: Any) {
        result.text = "確認中"
        
        //無効化
        rollButton.isEnabled = false
        
        //動画再生
        playVideo()
        
        //遅延処理（動画再生後に実行）
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.roll()
            self.rollButton.isEnabled = true
        }
    }
    
    //サイコロ動画再生する処理
    func playVideo() {
        let path = Bundle.main.path(forResource: "diceroll", ofType: "mov")
        player = AVPlayer(url: URL(fileURLWithPath: path!))
        
        //AVPlayer用のレイヤーを生成
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.diceResultView.bounds
        self.diceResultView.layer.addSublayer(playerLayer)
        
        //再生
        player.play()
    }
    
}

