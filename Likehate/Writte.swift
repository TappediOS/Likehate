//
//  Writte.swift
//  Likehate
//
//  Created by jun on 2018/06/23.
//  Copyright © 2018年 jun. All rights reserved.
//

import UIKit

class WritteViewController: UIViewController {
   
   
   @IBOutlet weak var hate: UIButton!
   
   @IBOutlet weak var like: UIButton!
   override func viewDidLoad() {
      super.viewDidLoad()
      
      hate.layer.borderWidth = 0.25
      hate.layer.borderColor = UIColor.black.cgColor
      hate.layer.cornerRadius = 10
      
      like.layer.borderWidth = 0.25
      like.layer.borderColor = UIColor.black.cgColor
      like.layer.cornerRadius = 10
      
      view.backgroundColor = UIColor.white
      
      SetUpLateButton()
      SetUpLikeButton()
      
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
   }
   
   override func viewWillAppear(_ animated: Bool) {
      SetUpNavigationItemSetting()
   }
   
   private func SetUpNavigationItemSetting() {
      self.navigationItem.title = NSLocalizedString("register", comment: "")
      self.navigationController?.navigationBar.barTintColor = UIColor.flatMint()
      self.navigationController?.navigationBar.tintColor = .white
      self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
   }
   
   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
   
   
}
