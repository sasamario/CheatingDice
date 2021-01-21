//
//  HelpViewController.swift
//  CheatingDice
//
//  Created by 笹間巧馬 on 2021/01/20.
//

import UIKit

class HelpViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var gestureIconList = ["tap", "longpress", "up", "right", "down", "left", "caution"]

    var gestureMessageList = [
        "タップすると1が出ます",
        "ロングプレスすると2が出ます",
        "上にスワイプすると3が出ます",
        "右にスワイプすると4が出ます",
        "下にスワイプすると5が出ます",
        "左にスワイプすると6が出ます",
        "※サイコロを振るはフェイクボタン"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //セルの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return gestureIconList.count
    }
    
    //セルに値を設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.imageView?.image = UIImage(named: "\(gestureIconList[indexPath.row])")
        
        cell.textLabel?.text = gestureMessageList[indexPath.row]
        
        return cell
    }
    
    //セルの高さを設定
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return view.frame.size.height / 8
    }
    
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
