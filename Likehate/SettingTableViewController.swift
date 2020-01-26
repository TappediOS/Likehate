//
//  SettingTableViewController.swift
//  Likehate
//
//  Created by jun on 2020/01/26.
//  Copyright © 2020 jun. All rights reserved.
//

import Foundation
import UIKit
import TapticEngine
import Firebase

class SettingTableViewController: UITableViewController {
   
   let numOfSection = 1
   let firstNumberOfRowsInSection = 1
   let secondNumberOfRowsInSection = 3
   
   
   @IBOutlet weak var DataErasingLabel: UILabel!
   
   @IBOutlet weak var AppReviewLabel: UILabel!
   @IBOutlet weak var ContacuUsLabel: UILabel!
   @IBOutlet weak var CreditsLabel: UILabel!
   
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      SetUpView()
      SetUpNavigationBar()
      SetUpLabelText()
   }
   
   private func SetUpView() {
      self.view.backgroundColor = UIColor.init(red: 255 / 255, green: 255 / 255, blue: 240 / 255, alpha: 1)
   }
   
   private func SetUpNavigationBar() {
      //let stopItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(TapDoneButton))
      //stopItem.tintColor = .black
      //self.navigationItem.leftBarButtonItem = stopItem
   }
   
   private func SetUpLabelText() {
      DataErasingLabel.text = NSLocalizedString("delete", comment: "")
      
      AppReviewLabel.text = NSLocalizedString("PlayCount", comment: "")
      ContacuUsLabel.text = NSLocalizedString("ContactUs", comment: "")
      CreditsLabel.text = NSLocalizedString("AppRevie", comment: "")

   }
   
   // MARK: - Table view data source
   // セクションの数を返します
   override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
      return numOfSection
   }

   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
   switch section {
      case 0:
         return firstNumberOfRowsInSection
      case 1:
         return secondNumberOfRowsInSection
      default:
         print("設定ミスってるぞ！！！")
         return 0
      }
   }
   
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

      print("section 番号: \(indexPath.section)")
      print("index   番号: \(indexPath.row)")
      
      switch indexPath.section {
      case 0:
         TapNicName()
         print("")
      case 1:
         TapUserInfo(rowNum: indexPath.row)
         print("")
      case 2:
         //TapOther(rowNum: indexPath.row)
         print("")
      default:
         print("設定ミスってるぞ！！！")
         return
      }
      
      tableView.deselectRow(at: indexPath, animated: true)
   }
   
   
   func TapNicName() {
      
   }
   
   func TapUserInfo(rowNum: Int) {
      
   }
   
   func Play3DtouchLight()  { TapticEngine.impact.feedback(.light) }
   func Play3DtouchMedium() { TapticEngine.impact.feedback(.medium) }
   func Play3DtouchHeavy()  { TapticEngine.impact.feedback(.heavy) }
   func Play3DtouchError() { TapticEngine.notification.feedback(.error) }
   func Play3DtouchSuccess() { TapticEngine.notification.feedback(.success) }
}
