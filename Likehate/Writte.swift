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
      
      SetUpNavigationItemSetting()
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
