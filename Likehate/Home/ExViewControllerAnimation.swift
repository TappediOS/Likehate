//
//  ExViewControllerAnimation.swift
//  Likehate
//
//  Created by jun on 2020/01/27.
//  Copyright © 2020 jun. All rights reserved.
//

import Foundation
import UIKit

extension ViewController {
   func Kira1AniStart() {
      UIView.animate(withDuration: 4,
                     delay: 0.25,
                     options: [.autoreverse, .repeat, .curveEaseInOut],
                     animations: {
                        self.KiraKiraView1.transform = CGAffineTransform(scaleX: 2.9, y: 2.9)
                     },
                     completion: { _ in
                        self.KiraKiraView1.transform = CGAffineTransform.identity
      })
   }
   
   func Kira2AniStart() {
      UIView.animate(withDuration: 4.85,
                     delay: 0.1,
                     options: [.autoreverse, .repeat, .curveEaseOut],
                     animations: {
                        self.KiraKiraView2.transform = CGAffineTransform(scaleX: 2.9, y: 2.9)
                     },
                     completion: { _ in
                        self.KiraKiraView2.transform = CGAffineTransform.identity
      })
   }
   
   func KaminariAni() {
      UIView.animate(withDuration: 4.25,
                     delay: 0.25,
                     options: [.autoreverse, .repeat, .curveEaseInOut],
                     animations: {
                        let frame = self.Kaminari.frame
                        let aniX = frame.minX + self.view.frame.width / 3 * 1.5
                        self.Kaminari.frame = CGRect(x: aniX, y: frame.minY, width: frame.width, height: frame.height)
                     },
                     completion: { _ in
                        let frame = self.Kaminari.frame
                        let aniX = frame.minX - self.view.frame.width / 3 * 1.5
                        self.Kaminari.frame = CGRect(x: aniX, y: frame.minY, width: frame.width, height: frame.height)
      })
   }
}
