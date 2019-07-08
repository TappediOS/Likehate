//
//  ViewController.swift
//  Likehate
//
//  Created by jun on 2018/06/23.
//  Copyright © 2018年 jun. All rights reserved.
//

import UIKit
import Lottie
import ChameleonFramework

class ViewController: UIViewController {

   @IBOutlet weak var Top: UIButton!
   
   @IBOutlet weak var Second: UIButton!
   
   @IBOutlet weak var Bottom: UIButton!
   
   let KiraKiraView1 = AnimationView(name: "KiraKira")
   let KiraKiraView2 = AnimationView(name: "KiraKira")
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      
   
      view.backgroundColor = UIColor(red: 0.941176, green: 0.937254, blue: 0.960784, alpha: 1)
      
      Top.accessibilityIgnoresInvertColors = true
      Second.accessibilityIgnoresInvertColors = true
      Bottom.accessibilityIgnoresInvertColors = true
      
      Top.translatesAutoresizingMaskIntoConstraints = false
      Second.translatesAutoresizingMaskIntoConstraints = false
      Bottom.translatesAutoresizingMaskIntoConstraints = false
     
      
      
      Bottom.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -5).isActive = true
      Bottom.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: self.view.frame.width / 20).isActive = true
      Bottom.widthAnchor.constraint(equalToConstant: self.view.frame.width / 20 * 18).isActive = true
      Bottom.heightAnchor.constraint(equalToConstant: self.view.frame.height / 5).isActive = true
      
      Second.bottomAnchor.constraint(equalTo: Bottom.topAnchor, constant: -self.view.frame.width / 20).isActive = true
      Second.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: self.view.frame.width / 20).isActive = true
      Second.widthAnchor.constraint(equalToConstant: self.view.frame.width / 20 * 18).isActive = true
      Second.heightAnchor.constraint(equalToConstant: self.view.frame.height / 5).isActive = true
      
      Top.bottomAnchor.constraint(equalTo: Second.topAnchor, constant: -self.view.frame.width / 20).isActive = true
      Top.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: self.view.frame.width / 20).isActive = true
      Top.widthAnchor.constraint(equalToConstant: self.view.frame.width / 20 * 18).isActive = true
      Top.heightAnchor.constraint(equalToConstant: self.view.frame.height / 5).isActive = true
      
    
      
      print(self.view.frame)
      
      Top.layer.borderWidth = 0.7
      Top.layer.borderColor = UIColor.flatBlack()?.cgColor
      Top.layer.cornerRadius = 10
      
      Second.layer.borderWidth = 0.7
      Second.layer.borderColor = UIColor.flatBlack()?.cgColor
      Second.layer.cornerRadius = 10
      
      Bottom.layer.borderWidth = 0.7
      Bottom.layer.borderColor = UIColor.flatBlack()?.cgColor
      Bottom.layer.cornerRadius = 10
      

      Second.setImage(UIImage(named: NSLocalizedString("like", comment: "")), for: .normal)
      Bottom.setImage(UIImage(named: NSLocalizedString("hate", comment: "")), for: .normal)
      Top.setImage(UIImage(named: NSLocalizedString("set", comment: "")), for: .normal)
      
      SetUpNavigationItemSetting()
      InitKiraView1()
      InitKiraView2()
   }

   @objc func TapSettingButton(sender: UIBarButtonItem) {
      self.performSegue(withIdentifier: "HomeToSetting", sender: nil)
   }
   
   private func SetUpNavigationItemSetting() {
      let ButtonItems = UIBarButtonItem(image: UIImage(named: "setting"), style: .plain, target: self, action: #selector(TapSettingButton(sender:)))
      self.navigationItem.setLeftBarButton(ButtonItems, animated: true)
      self.navigationItem.title = NSLocalizedString("home", comment: "")
      self.navigationController?.navigationBar.barTintColor = UIColor.flatMagenta()
      self.navigationController?.navigationBar.tintColor = .white
      self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
   }
   
   private func Kira1AniStart() {
      UIView.animate(withDuration: 10, animations: {
         self.KiraKiraView1.transform = CGAffineTransform(scaleX: 2.8, y: 2.8)
      }) { (finished) in
         UIView.animate(withDuration: 9, animations: {
            self.KiraKiraView1.transform = CGAffineTransform.identity
         }) { (finished) in
            self.Kira1AniStart()
         }
      }
   }
   
   private func Kira2AniStart() {
      UIView.animate(withDuration: 12, animations: {
         self.KiraKiraView2.transform = CGAffineTransform(scaleX: 3.2, y: 3.2)
      }) { (finished) in
         UIView.animate(withDuration: 10.5, animations: {
            self.KiraKiraView2.transform = CGAffineTransform.identity
         }) { (finished) in
            self.Kira2AniStart()
         }
      }
   }
   
   private func InitKiraView1() {
      let StartY = self.view.frame.height - (self.view.frame.height / 20 * 9.5 + self.view.frame.height / 20)
      let StartX = self.view.frame.width / 20
      let Wide = StartX * 18 / 2
      let Hight = self.view.frame.height / 5
      let Rect = CGRect(x: StartX, y: StartY, width: Wide, height: Hight)
      
      KiraKiraView1.frame = Rect
      KiraKiraView1.alpha = 0.8
      KiraKiraView1.loopMode = .loop
      KiraKiraView1.isUserInteractionEnabled = false
      KiraKiraView1.play()
      self.view.addSubview(KiraKiraView1)
      Kira1AniStart()
   }
   
   private func InitKiraView2() {
      let StartY = self.view.frame.height - (self.view.frame.height / 20 * 9.5 - self.view.frame.height / 20)
      let StartX = self.view.frame.width / 20 * 9
      let Wide = self.view.frame.width / 20 * 18 / 2
      let Hight = self.view.frame.height / 5
      let Rect = CGRect(x: StartX, y: StartY, width: Wide, height: Hight)
      
      KiraKiraView2.frame = Rect
      KiraKiraView2.alpha = 0.8
      KiraKiraView2.loopMode = .loop
      KiraKiraView2.isUserInteractionEnabled = false
      KiraKiraView2.play()
      self.view.addSubview(KiraKiraView2)
      Kira2AniStart()
   }
   
   override func viewWillAppear(_ animated: Bool) {
      SetUpNavigationItemSetting()
      KiraKiraView2.play()
      KiraKiraView1.play()
   }
   
   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }


}

