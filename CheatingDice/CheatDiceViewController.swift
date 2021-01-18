//
//  CheatDiceViewController.swift
//  CheatingDice
//
//  Created by 笹間巧馬 on 2021/01/14.
//

import UIKit
import AVFoundation

class CheatDiceViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var result: UILabel!
    
    @IBOutlet weak var diceResultImage: UIImageView!
    
    @IBOutlet weak var diceResultView: UIView!
    
    var player = AVPlayer()
    
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
        
        //右スワイプ用のインスタンスを生成する
        let rightSwipe = UISwipeGestureRecognizer(
            target: self,
            action: #selector(CheatDiceViewController.didSwipe(_:))
        )
        rightSwipe.direction = .right
        self.view.addGestureRecognizer(rightSwipe)
        
        //下スワイプ用のインスタンスを生成する
        let downSwipe = UISwipeGestureRecognizer(
            target: self,
            action: #selector(CheatDiceViewController.didSwipe(_:))
        )
        downSwipe.direction = .down
        self.view.addGestureRecognizer(downSwipe)
        
        //左スワイプ用のインスタンスを生成する
        let leftSwipe = UISwipeGestureRecognizer(
            target: self,
            action: #selector(CheatDiceViewController.didSwipe(_:))
        )
        leftSwipe.direction = .left
        self.view.addGestureRecognizer(leftSwipe)
    }
    
    //シングルタップ時に実行されるメソッド
    @objc func singleTap(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            diceRoll(diceNumber: 1)
        }
    }
    
    //ロングプレス時に実行されるメソッド
    @objc func longPress(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .ended {
            diceRoll(diceNumber: 2)
        }
    }
    
    //スワイプ時に実行されるメソッド
    @objc func didSwipe(_ sender: UISwipeGestureRecognizer) {
        
        //スワイプ方向による実行処理をcase文で指定
        switch sender.direction {
        case .up:
            diceRoll(diceNumber: 3)
        case .right:
            diceRoll(diceNumber: 4)
        case .down:
            diceRoll(diceNumber: 5)
        case .left:
            diceRoll(diceNumber: 6)
        default:
            break
        }
    }
    
    //サイコロ動画再生する処理
    func playVideo() {
        //動画が流れる際は、画像を非表示にしたいため
        diceResultImage.image = nil
        
        let path = Bundle.main.path(forResource: "diceroll", ofType: "mov")
        player = AVPlayer(url: URL(fileURLWithPath: path!))
        
        //AVPlayer用のレイヤーを生成
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.diceResultView.bounds
        
        //画像を表示するImageViewより高さを低くするため
        playerLayer.zPosition = -1
        
        self.diceResultView.layer.addSublayer(playerLayer)
        
        //再生
        player.play()
    }
    
    func diceRoll(diceNumber: Int) {
        result.text = "確認中"
        
        //ジェスチャー（タップ、ロングプレス、スワイプ）の無効化処理を実装する必要あり
        
        
        //動画再生
        playVideo()
        
        //遅延処理（動画再生後に実行）
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            //resultLabelに反映
            self.result.text = String(diceNumber)
            
            //出た目のサイコロ画像を表示する
            self.diceResultImage.image = UIImage(named: "dice\(diceNumber)")
            
            //ジェスチャーの有効化処理を実装する必要あり
            
            
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
