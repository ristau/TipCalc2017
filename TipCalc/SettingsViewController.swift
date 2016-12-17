//
//  SettingsViewController.swift
//  TipCalc
//
//  Created by Barbara Ristau on 12/5/16.
//  Copyright © 2016 FeiLabs. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController{
  
  let tipPercentages = [10, 15, 20]
  var persons: Int?
  var excellentService: Int?
  var averageService: Int?
  var poorService: Int?
  var colorThemeIndex: Int!
  var colorTheme: String!
  var roundTip: Bool!
  
  @IBOutlet weak var excellentServiceLabel: UILabel!
  @IBOutlet weak var averageServiceLabel: UILabel!
  @IBOutlet weak var poorServiceLabel: UILabel!
  @IBOutlet weak var numPersonsLabel: UILabel!
  
  @IBOutlet weak var colorThemeControl: UISegmentedControl!
  

  @IBOutlet weak var roundTipSwitch: UISwitch!
  
  
  @IBOutlet var textLabels: [UILabel]!
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    let userDefaults = UserDefaults.standard
    excellentService = userDefaults.integer(forKey:
    "_excellentService")
    averageService = userDefaults.integer(forKey: "_averageService")
    poorService = userDefaults.integer(forKey: "_poorService")
    persons = userDefaults.integer(forKey: "_persons")
    colorThemeIndex = userDefaults.integer(forKey: "segmentIndex")
    colorTheme = userDefaults.string(forKey: "colorTheme")
    roundTip = userDefaults.bool(forKey: "roundUp")
    
    self.excellentServiceLabel.text = String(excellentService!) + "%"
    self.averageServiceLabel.text = String(averageService!) + "%"
    self.poorServiceLabel.text = String(poorService!) + "%"
    self.numPersonsLabel.text = String(persons!)
    
    colorThemeControl.selectedSegmentIndex = colorThemeIndex
    
    
    if (roundTip == true) {
      print("RoundTip True")
      roundTipSwitch.setOn(true, animated:true)
    } else if (roundTip == false) {
      print("RoundTip False")
      roundTipSwitch.setOn(false, animated: true)
    }
  

  }
  
  override func viewDidLoad() {

    self.title = "Settings"
    updateStyles()
    
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    let userDefaults = UserDefaults.standard
    
    userDefaults.set(excellentService, forKey:"_excellentService")
    userDefaults.set(averageService, forKey: "_averageService")
    userDefaults.set(poorService, forKey: "_poorService")
    userDefaults.set(persons, forKey: "_persons")
    userDefaults.set(roundTip, forKey: "roundUp") 
    
    userDefaults.synchronize()
  }
  
  
  
  @IBAction func roundTip(sender: UISwitch) {
    
    if(sender.isOn) {
      roundTip = true
    }
    else {
      roundTip = false
    }
    
  }

  
  @IBAction func incrementExcellentService(_ sender: AnyObject) {
    excellentService! += 1
    self.excellentServiceLabel.text = String(excellentService!) + "%"
    
  }
  
  @IBAction func decrementExcellentService(_ sender: AnyObject) {
    excellentService! -= 1
    self.excellentServiceLabel.text = String(excellentService!) + "%"
  }
  
  @IBAction func incrementAvgService(_ sender: AnyObject) {
    averageService! += 1
      self.averageServiceLabel.text = String(averageService!) + "%"
  }
  
  
  @IBAction func decrementAvgService(_ sender: AnyObject) {
    averageService! -= 1
    self.averageServiceLabel.text = String(averageService!) + "%"
  }
  
  
  @IBAction func incrementPoorService(_ sender: AnyObject) {
      poorService! += 1
        self.poorServiceLabel.text = String(poorService!) + "%"
  }
  
  @IBAction func decrementPoorService(_ sender: AnyObject) {
    poorService! -= 1
    self.poorServiceLabel.text = String(poorService!) + "%"
  }

  
  @IBAction func incrementPersons(_ sender: AnyObject) {
    persons! += 1
   self.numPersonsLabel.text = String(persons!)
  }
  
  
  @IBAction func decrementPersons(_ sender: AnyObject) {
    persons! -= 1
     self.numPersonsLabel.text = String(persons!)
  }
  
  

  
  @IBAction func changeColorTheme(_ sender: AnyObject) {
    
    print("Index: \(colorThemeControl.selectedSegmentIndex)")
  
    colorThemeIndex = colorThemeControl.selectedSegmentIndex
    
    if(colorThemeIndex == 0) {
      print("Color theme changed to light")
      colorTheme = "light"
    }
    
    else if(colorThemeIndex == 1) {
      print("Color theme changed to dark")
      colorTheme = "dark"
    }

      let userDefaults = UserDefaults.standard
      userDefaults.set(colorThemeIndex, forKey: "segmentIndex")
      userDefaults.set(colorTheme, forKey: "colorTheme")
      userDefaults.synchronize()
    
      Style.colorTheme = userDefaults.string(forKey: "colorTheme")
      Style.loadTheme(name: Style.colorTheme!)
      updateStyles()
      
    }
  
  func updateStyles() {
    
    self.view.backgroundColor = Style.bgColor

    // REFACTORING: PUT THESE INTO AN ARRAY LOOP
    self.textLabels[0].textColor = Style.textColor
    self.textLabels[1].textColor = Style.textColor
    self.textLabels[2].textColor = Style.textColor
    self.textLabels[3].textColor = Style.textColor
    self.textLabels[4].textColor = Style.textColor
    self.textLabels[5].textColor = Style.textColor
    
    self.excellentServiceLabel.textColor = Style.textColor
    self.averageServiceLabel.textColor = Style.textColor
    self.poorServiceLabel.textColor = Style.textColor
    self.numPersonsLabel.textColor = Style.textColor
    
  }
  
  
  
}
