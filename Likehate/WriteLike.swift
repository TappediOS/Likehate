//
//  WriteLike.swift
//  Likehate
//
//  Created by jun on 2018/06/23.
//  Copyright © 2018年 jun. All rights reserved.
//

import UIKit
import ChameleonFramework
import FlatUIKit
import Lottie
import Firebase
import FirebaseRemoteConfig

class WritteLikeViewController: UIViewController, UITextFieldDelegate {
   
   
   @IBOutlet weak var Label: UILabel!
   @IBOutlet weak var TextField: FUITextField!
   
   @IBOutlet  var RegiButton: FUIButton!
   
   
   let AniView1 = AnimationView(name: "MoreHarts")
   let AniView2 = AnimationView(name: "Fuwa")
   let AniView3 = AnimationView(name: "KuruKuru")
   
   //リモートコンフィグろとるやつ
   var RemorteConfigs: RemoteConfig!
   
   
   //@IBOutlet weak var TextNumOfArray: UILabel!
   var LikeArray: [String] = []
   var num = 0
   let defaults = UserDefaults.standard
   
   @IBAction func done(_ sender: Any) {
      
      
      if TextField.text == "" { return }
      
      Analytics.logEvent("RegiLike", parameters: nil)
      
      LikeArray.append((self.TextField.text)!)
      defaults.set(LikeArray, forKey: "OpenLikeKey")
      defaults.synchronize()
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      view.backgroundColor = UIColor(red: 0.941176, green: 0.937254, blue: 0.960784, alpha: 1)
      
      InitTextField()
      InitRegiButton()
      
      TextField.accessibilityIdentifier = IdenMane.Like.LikeTextField
      RegiButton.accessibilityIdentifier = IdenMane.Like.LikeRegiButton
      
      TextField.delegate = self
      view.backgroundColor = UIColor.white      
      if defaults.object(forKey: "OpenLikeKey") != nil {
         
         let object = defaults.object(forKey: "OpenLikeKey") as? [String]
         //var nameString:AnyObject
         for nameString in object! {
            LikeArray.append(nameString as String)
         }
      }
      
      SetUpNavigationItemSetting()
      
      InitImageView(AniView: AniView1)
      InitImageView(AniView: AniView2)
      InitImageView(AniView: AniView3)
      
      InitConfig()
      SetUpRemoteConfigDefaults()
      SetUpAniView()
      FetchConfig()
   }
   
   override func viewWillAppear(_ animated: Bool) {
      SetUpNavigationItemSetting()
   }
   
   private func SetUpRemoteConfigDefaults() {
      let defaultsValues = [
         "LOTKEY" : "MoreHarts" as NSObject
      ]
      
      
      self.RemorteConfigs.setDefaults(defaultsValues)
   }
   
   private func InitConfig() {
      self.RemorteConfigs = RemoteConfig.remoteConfig()
      //MARK: デベロッパモード　出すときはやめろ
      #if DEBUG
      print("RemoConデバッグモード")
      let RemortConfigSetting = RemoteConfigSettings(developerModeEnabled: true)
      self.RemorteConfigs.configSettings = RemortConfigSetting
      #else
      print("RemoConリリースモードでいくとよ。")
      let RemortConfigSetting = RemoteConfigSettings(developerModeEnabled: false)
      self.RemorteConfigs.configSettings = RemortConfigSetting
      #endif
   }
   
   func FetchConfig() {
      // ディベロッパーモードの時、expirationDurationを0にして随時更新できるようにする。
      let expirationDuration = RemorteConfigs.configSettings.isDeveloperModeEnabled ? 0 : 3600
      print("RemoteConfigのフェッチする間隔： \(expirationDuration)")
      RemorteConfigs.fetch(withExpirationDuration: TimeInterval(expirationDuration)) { [unowned self] (status, error) -> Void in
         guard error == nil else {
            print("Firebase Config フェッチあかん買った")
            print("Error: \(error?.localizedDescription ?? "No error available.")")
            return
         }
         
         print("フェッチできたよ")
         self.RemorteConfigs.activateFetched()
         self.SetUpAniView()
      }
   }
   
   private func SetUpAniView() {
      print(RemorteConfigs["LOTKEY"].stringValue!)
      switch RemorteConfigs["LOTKEY"].stringValue! {
      case "MoreHarts":
         RemoFuwa()
         RemoKuruKuru()
         DisplayMoreHarts()
      case "KuruKuru":
         RemoMoreHarts()
         RemoFuwa()
         DisplayKuruKuru()
      case "Fuwa":
         RemoMoreHarts()
         RemoKuruKuru()
         DisplayFuwa()
      default:
         Analytics.logEvent("ErroRemoCon", parameters: nil)
         RemoFuwa()
         RemoKuruKuru()
         DisplayMoreHarts()
      }
   }
   
   private func RemoMoreHarts() {
      AniView1.isHidden = true
      AniView1.stop()
   }
   
   private func DisplayMoreHarts() {
      AniView1.isHidden = false
      AniView1.play()
   }
   
   private func RemoFuwa() {
      AniView2.isHidden = true
      AniView2.stop()
   }
   
   private func DisplayFuwa() {
      AniView2.isHidden = false
      AniView2.play()
   }
   
   private func RemoKuruKuru() {
      AniView3.isHidden = true
      AniView3.stop()
   }
   
   private func DisplayKuruKuru() {
      AniView3.isHidden = false
      AniView3.play()
   }
   
   private func InitImageView(AniView: AnimationView) {
      let StartX = self.view.frame.width / 50
      let Wide = StartX * 48
      let StartY = RegiButton.frame.maxY + 30
      let RemoveY = self.view.frame.height - StartY
      let Hight = RemoveY - 15
      AniView.frame = CGRect(x: StartX, y: StartY, width: Wide, height: Hight)
      AniView.contentMode = .scaleAspectFit

      AniView.loopMode = .loop
      AniView.isUserInteractionEnabled = false
      self.view.addSubview(AniView)
      AniView.isHidden = true
   }
   
   
   
   private func InitTextField() {
      TextField?.font = UIFont.boldFlatFont (ofSize: 16)
      TextField?.backgroundColor = .clear
      TextField?.edgeInsets = UIEdgeInsets(top: 4.0, left: 15.0, bottom: 4.0, right: 15.0)
      TextField?.textFieldColor = .white
      TextField?.borderColor = UIColor.turquoise()
      TextField?.borderWidth = 2.0;
      TextField?.cornerRadius = 3.0;
   }
   
   private func InitRegiButton() {
      RegiButton?.setTitle(NSLocalizedString("register", comment: ""), for: .normal)
      RegiButton?.titleLabel?.adjustsFontSizeToFitWidth = true
      RegiButton?.titleLabel?.adjustsFontForContentSizeCategory = true
      RegiButton?.buttonColor = UIColor.flatWatermelon()
      RegiButton?.shadowColor = UIColor.flatWatermelonColorDark()
      RegiButton?.shadowHeight = 3.0
      RegiButton?.cornerRadius = 6.0
      RegiButton?.titleLabel?.font = UIFont.boldFlatFont (ofSize: 16)
      RegiButton?.setTitleColor(UIColor.clouds(), for: UIControl.State.normal)
      RegiButton?.setTitleColor(UIColor.clouds(), for: UIControl.State.highlighted)
   }
   
   private func SetUpNavigationItemSetting() {
      self.navigationItem.title = NSLocalizedString("Like", comment: "")
      self.navigationController?.navigationBar.barTintColor = UIColor.flatWatermelon()
      self.navigationController?.navigationBar.tintColor = .white
      self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
   }
   
 
   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
   
   /*
    UITextFieldが編集された直後に呼ばれるデリゲートメソッド.
    */
   func textFieldDidBeginEditing(_ textField: UITextField){
      print("textFieldDidBeginEditing:" + textField.text!)
   }
   
   /*
    UITextFieldが編集終了する直前に呼ばれるデリゲートメソッド.
    */
   func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
      print("textFieldShouldEndEditing:" + textField.text!)
      
      return true
   }
   
   /*
    改行ボタンが押された際に呼ばれるデリゲートメソッド.
    */
   func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      textField.resignFirstResponder()
      
      return true
   }
   
   
   
   

   
   
}
