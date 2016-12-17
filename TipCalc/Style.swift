//
//  Style.swift
//  TipCalc
//
//  Created by Barbara Ristau on 12/7/16.
//  Copyright © 2016 FeiLabs. All rights reserved.
//

import Foundation
import UIKit

struct Style {
  
  //static let availableThemes = ["dark", "light"]
 
  static var bgColor: UIColor = UIColor.white
  static var barColor: UIColor = UIColor.black
  static var textColor: UIColor = UIColor.black
  
  static var colorTheme: String?
  
  // MARK: DARK COLOR SCHEME
  
  static func themeDark() {
    bgColor = UIColor.black
    barColor = UIColor.lightGray
    textColor = UIColor.lightGray
}
  
  // MARK: LIGHT COLOR SCHEME

  static func themeLight() {
    bgColor = UIColor(red: 0.91, green: 0.94, blue: 0.94, alpha: 1.0)
    barColor = UIColor(red:0.56, green:0.68, blue:0.7, alpha:1.0)
    textColor = UIColor(red:0.56, green:0.68, blue:0.7, alpha:1.0)
       //barColor = UIColor(white:0.67, alpha:1.0)
    
  }
  
  // MARK: - LOAD FUNCTION
  
  static func loadTheme(name: String) {
  colorTheme = name
    if (colorTheme == "light") {
      themeLight()
    }
    else if (colorTheme == "dark") {
      themeDark()
    }
  }
 
 
 
 }
  
  
  

