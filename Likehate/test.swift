//
//  test.swift
//  
//
//  Created by jun on 2018/06/26.
//

import UIKit
import HeartLoadingView
import FlatUIKit
import ChameleonFramework
import SCLAlertView
import StoreKit
import Firebase

class testViewController: UIViewController {
   
   @IBOutlet weak var testView: HeartLoadingView!
   
   @IBOutlet weak var label: UILabel!
   
   @IBOutlet weak var done: FUIButton!
   
   var LikeArray: [String] = []
   var num = 0
   let defaults = UserDefaults.standard
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      if #available(iOS 13.0, *) {
         view.backgroundColor = UIColor.systemBackground
         label.textColor = .label
      }
      
      if defaults.object(forKey: "OpenLikeKey") != nil {
         
         let object = defaults.object(forKey: "OpenLikeKey") as? [String]
         for nameString in object! {
            LikeArray.append(nameString as String)
         }
      }else{
         
      }
      
      let Progress: Double = Double(LikeArray.count) * 0.01
      
      
      //let heartLoadingView = HeartLoadingView()
      testView.progress = Progress
      testView.heartAmplitude = 25
      //testView.progressTextFont = UIFont.systemFont(ofSize: 15.0)
      //testView.heavyHeartColor = UIColor.cyan
      testView.isAnimated = true
      
      testView.translatesAutoresizingMaskIntoConstraints = false
      label.translatesAutoresizingMaskIntoConstraints = false
      done.translatesAutoresizingMaskIntoConstraints = false
      
      done.accessibilityIdentifier = "OKButton"
      
      let navi = (self.navigationController?.navigationBar.frame.size.height)!
      let sta = UIApplication.shared.statusBarFrame.size.height
      
      label.topAnchor.constraint(equalTo: view.topAnchor, constant: navi + sta + 40).isActive = true
      label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
      label.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
      label.heightAnchor.constraint(equalToConstant: 20).isActive = true
      
      testView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30).isActive = true
      testView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
      testView.widthAnchor.constraint(equalToConstant: view.frame.width - 20).isActive = true
      testView.heightAnchor.constraint(equalToConstant: view.frame.width - 20).isActive = true
      
      done.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -34).isActive = true
      done.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
      done.widthAnchor.constraint(equalToConstant: 120).isActive = true
      done.heightAnchor.constraint(equalToConstant: 100).isActive = true
      
      SetUpDoneButton()
      
  
   }
   
   
   
   @IBAction func TapOKButton(_ sender: Any) {
      self.navigationController?.popToRootViewController(animated: true)
   }
   
   
   

   private func SetUpDoneButton() {
      done?.titleLabel?.adjustsFontSizeToFitWidth = true
      done?.titleLabel?.adjustsFontForContentSizeCategory = true
      done?.buttonColor = UIColor.flatWatermelon()
      done?.shadowColor = UIColor.flatWatermelonColorDark()
      done?.shadowHeight = 3.0
      done?.cornerRadius = 6.0
      done?.titleLabel?.font = UIFont.boldFlatFont (ofSize: 16)
      done?.setTitleColor(UIColor.clouds(), for: UIControl.State.normal)
      done?.setTitleColor(UIColor.clouds(), for: UIControl.State.highlighted)
   }
   
   
   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
   
   
}

