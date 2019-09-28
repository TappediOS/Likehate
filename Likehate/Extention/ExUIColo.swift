//
//  ExUIColo.swift
//  Likehate
//
//  Created by jun on 2019/09/27.
//  Copyright © 2019 jun. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
   public class func dynamicColor(light: UIColor, dark: UIColor) -> UIColor {
       if #available(iOS 13, *) {
           return UIColor { (traitCollection) -> UIColor in
               if traitCollection.userInterfaceStyle == .dark {
                   return dark
               } else {
                   return light
               }
           }
       }
       return light
   }
}
