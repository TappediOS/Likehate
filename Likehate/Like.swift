//
//  Like.swift
//  Likehate
//
//  Created by jun on 2018/06/23.
//  Copyright © 2018年 jun. All rights reserved.
//

import UIKit
import ChameleonFramework

class LikeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
   
   @IBOutlet weak var tableView: UITableView!
   
   var LikeArray: [String] = []
   let defaults = UserDefaults.standard
 
   override func viewDidLoad() {
      super.viewDidLoad()
      
      if #available(iOS 13.0, *) {
         view.backgroundColor = UIColor.systemGray6
      } else {
         view.backgroundColor = UIColor.white
         tableView.backgroundColor = UIColor.white
      }
      tableView.delegate = self
      tableView.dataSource = self
      
      tableView.accessibilityIdentifier = "LikeTableView"
      
      if defaults.object(forKey: "OpenLikeKey") != nil {
         
         let object = defaults.object(forKey: "OpenLikeKey") as? [String]
         for nameString in object! {
            LikeArray.append(nameString as String)
         }
      }else{
         
      }
      
      tableView.estimatedRowHeight = 10
      tableView.rowHeight = 100
      
      SetUpNavigationItemSetting()
   }
   
   override func setEditing(_ editing: Bool, animated: Bool) {
       super.setEditing(editing, animated: animated)
       tableView.isEditing = editing
   }
   
   //SetUp
   private func SetUpNavigationItemSetting() {
      self.navigationItem.title = NSLocalizedString("likething", comment: "")
      self.navigationController?.navigationBar.barTintColor = UIColor.flatWatermelon()
      self.navigationController?.navigationBar.tintColor = .white
      self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
      self.navigationItem.rightBarButtonItem = editButtonItem
   }
   
   /// セルの個数を指定するデリゲートメソッド（必須）
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return LikeArray.count
   }
   
   /// セルに値を設定するデータソースメソッド（必須）
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      // セルの型を作る
      let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "myCell")
      // セルに表示するテキストを作る
      cell.textLabel?.text = LikeArray[indexPath.row]
      cell.textLabel?.font = UIFont(name: "HiraginoSans-W3", size: 30)
      cell.textLabel?.adjustsFontSizeToFitWidth = true
      
      // セルをリターンする
      return cell
   }
   
   /// セルが選択された時に呼ばれるデリゲートメソッド
//   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}
   

   /*
    Buttonを拡張する.
    */
   func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {

      // deleteボタン.
      let myArchiveButton: UITableViewRowAction = UITableViewRowAction(style: .normal, title: NSLocalizedString("Delete", comment: "")) { (action, index) -> Void in
         self.LikeArray.remove(at: indexPath.row)
         tableView.deleteRows(at: [indexPath], with: .fade)
         self.defaults.set(self.LikeArray, forKey: "OpenLikeKey")
         self.defaults.synchronize()
         tableView.isEditing = false
         print("archive")
         
      }
      myArchiveButton.backgroundColor = UIColor(red: 0.9568627451, green: 0.2745098039, blue: 0.3647058824, alpha: 1)
      
      return [myArchiveButton]
   }
   
   func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
   }

   func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
   }
   
   func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
   }

   func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
   
   func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
       let sourceCellItem = LikeArray[sourceIndexPath.row]
       guard let indexPath = LikeArray.index(of: sourceCellItem) else { return }
      
       LikeArray.remove(at: indexPath)
       LikeArray.insert(sourceCellItem, at: destinationIndexPath.row)
   }


   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
   
}
