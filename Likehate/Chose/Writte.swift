//
//  Writte.swift
//  Likehate
//
//  Created by jun on 2018/06/23.
//  Copyright © 2018年 jun. All rights reserved.
//

import UIKit
import Lottie
import ChameleonFramework

class WritteViewController: UIViewController {
   
   @IBOutlet weak var hate: UIButton!
   @IBOutlet weak var like: UIButton!
   
   let Zukei = AnimationView(name: "Patch")
   let MaruMaru = AnimationView(name: "Good")
   let MaruZukei = AnimationView(name: "Egg")
   let Henka = AnimationView(name: "MaruKuru")
   
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      self.view.backgroundColor = UIColor.flatWhite()
      
      hate.layer.borderWidth = 2
      hate.layer.borderColor = UIColor.flatBlack()?.cgColor
      hate.layer.cornerRadius = 35
      hate.accessibilityIdentifier = "seeHateButton"
      hate.layer.shadowOffset = CGSize(width: 2.85, height: 2.85)
      hate.layer.shadowColor = UIColor.black.cgColor
      hate.layer.shadowOpacity = 0.3
      hate.layer.shadowRadius = 2
      
      like.layer.borderWidth = 2
      like.layer.borderColor = UIColor.flatBlack()?.cgColor
      like.layer.cornerRadius = 35
      like.accessibilityIdentifier = "seeLikeButton"
      like.layer.shadowOffset = CGSize(width: 2.85, height: 2.85)
      like.layer.shadowColor = UIColor.black.cgColor
      //1にすれば真っ黒，0にすれば透明に
      like.layer.shadowOpacity = 0.3
      like.layer.shadowRadius = 2
      
      if #available(iOS 13.0, *) {
         view.backgroundColor = UIColor.systemBackground
         like.backgroundColor = UIColor.systemGray6
         like.setTitleColor(.systemPink, for: .normal)
         hate.backgroundColor = .systemGray6
         hate.setTitleColor(.systemIndigo, for: .normal)
      }
      
      SetUpLateButton()
      SetUpLikeButton()
      
      InitZukei()
      InitMsruMaru()
      InitMaruZukei()
      InitHenka()
      
      SetUpNavigationItemSetting()
   }
   
   private func SetUpLateButton() {
      let ViewW = self.view.frame.width
      let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
      let navigationBarHeight = self.navigationController?.navigationBar.frame.size.height
      let ViewH = self.view.frame.height - (statusBarHeight + navigationBarHeight!)
      
      let ButtonSliceNum: CGFloat = 25
      
      let ButtonWide = ViewW / ButtonSliceNum * (ButtonSliceNum - 2)
      let ButtonHeight = ViewH / 25 * 9
      
      let StartX = ViewW / ButtonSliceNum
      let StartY = ViewH / 25 * 3 + (statusBarHeight + navigationBarHeight!)
      
      like.frame = CGRect(x: StartX, y: StartY, width: ButtonWide, height: ButtonHeight)
      like.setTitle(NSLocalizedString("Like", comment: ""), for: .normal)
      like.titleLabel?.adjustsFontSizeToFitWidth = true
   }
   
   private func SetUpLikeButton() {
      let ViewW = self.view.frame.width
      let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
      let navigationBarHeight = self.navigationController?.navigationBar.frame.size.height
      let ViewH = self.view.frame.height - (statusBarHeight + navigationBarHeight!)
      
      let ButtonSliceNum: CGFloat = 25
      
      let ButtonWide = ViewW / ButtonSliceNum * (ButtonSliceNum - 2)
      let ButtonHeight = ViewH / 25 * 9
      
      let StartX = ViewW / ButtonSliceNum
      let StartY = ViewH / 25 * 13 + (statusBarHeight + navigationBarHeight!)
      
      hate.frame = CGRect(x: StartX, y: StartY, width: ButtonWide, height: ButtonHeight)
      hate.setTitle(NSLocalizedString("Hate", comment: ""), for: .normal)
      hate.titleLabel?.adjustsFontSizeToFitWidth = true
   }
   
   override func viewWillAppear(_ animated: Bool) {
      SetUpNavigationItemSetting()
      
      MaruMaru.play()
      MaruZukei.play()
      Zukei.play()
      Henka.play()
   }
   
   private func SetUpNavigationItemSetting() {
      self.navigationItem.title = NSLocalizedString("register", comment: "")
      self.navigationController?.navigationBar.barTintColor = UIColor.flatMint()
      self.navigationController?.navigationBar.tintColor = .white
      self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
   }
   
   
   private func InitZukei() {
      let ViewW = self.view.frame.width
      let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
      let navigationBarHeight = self.navigationController?.navigationBar.frame.size.height
      let ViewH = self.view.frame.height - (statusBarHeight + navigationBarHeight!)
      
      let ViewSliceNum: CGFloat = 25
      
      let AniViewW = ViewW / ViewSliceNum * 10
      let AniViewH = ViewH / 25 * 7
      
      let StartX = ViewW / ViewSliceNum * 1.5
      let StartY = ViewH / 25 * 2.5 + (statusBarHeight + navigationBarHeight!)
      
      Zukei.frame = CGRect(x: StartX, y: StartY, width: AniViewW, height: AniViewH)
      Zukei.alpha = 1
      Zukei.loopMode = .loop
      Zukei.isUserInteractionEnabled = false
      Zukei.play()
      self.view.addSubview(Zukei)
   }
   
   private func InitMsruMaru() {
      let ViewW = self.view.frame.width
      let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
      let navigationBarHeight = self.navigationController?.navigationBar.frame.size.height
      let ViewH = self.view.frame.height - (statusBarHeight + navigationBarHeight!)
      
      let ViewSliceNum: CGFloat = 25
      
      let AniViewW = ViewW / ViewSliceNum * 12
      let AniViewH = ViewH / 25 * 6
      
      let StartX = ViewW / ViewSliceNum * 13.5
      let StartY = ViewH / 25 * 6 + (statusBarHeight + navigationBarHeight!)
      
      MaruMaru.frame = CGRect(x: StartX, y: StartY, width: AniViewW, height: AniViewH)
      MaruMaru.alpha = 1
      MaruMaru.loopMode = .loop
      MaruMaru.isUserInteractionEnabled = false
      MaruMaru.play()
      self.view.addSubview(MaruMaru)
   }
   
   
   private func InitMaruZukei() {
      let ViewW = self.view.frame.width
      let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
      let navigationBarHeight = self.navigationController?.navigationBar.frame.size.height
      let ViewH = self.view.frame.height - (statusBarHeight + navigationBarHeight!)
      
      let ViewSliceNum: CGFloat = 25
      
      let AniViewW = ViewW / ViewSliceNum * 10
      let AniViewH = ViewH / 25 * 6
      
      let StartX = ViewW / ViewSliceNum
      let StartY = ViewH / 25 * 16 + (statusBarHeight + navigationBarHeight!)
      
      MaruZukei.frame = CGRect(x: StartX, y: StartY, width: AniViewW, height: AniViewH)
      MaruZukei.alpha = 1
      MaruZukei.loopMode = .loop
      MaruZukei.isUserInteractionEnabled = false
      MaruZukei.play()
      self.view.addSubview(MaruZukei)
   }
   
   private func InitHenka() {
      let ViewW = self.view.frame.width
      let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
      let navigationBarHeight = self.navigationController?.navigationBar.frame.size.height
      let ViewH = self.view.frame.height - (statusBarHeight + navigationBarHeight!)
      
      let ViewSliceNum: CGFloat = 25
      
      let AniViewW = ViewW / ViewSliceNum * 10
      let AniViewH = ViewH / 25 * 6
      
      let StartX = ViewW / ViewSliceNum * 14
      let StartY = ViewH / 25 * 13 + (statusBarHeight + navigationBarHeight!)
      
      Henka.frame = CGRect(x: StartX, y: StartY, width: AniViewW, height: AniViewH)
      Henka.loopMode = .loop
      MaruZukei.alpha = 1
      Henka.isUserInteractionEnabled = false
      Henka.animationSpeed = 0.25
      Henka.play()
      self.view.addSubview(Henka)
      
   }
   
   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
   
   
}
