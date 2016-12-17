//
//  AppDelegate.swift
//  TipCalc
//
//  Created by Barbara Ristau on 12/5/16.
//  Copyright © 2016 FeiLabs. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    let userDefaults = UserDefaults.standard
    let isFirstLoad = userDefaults.bool(forKey: "is_first_load")
    
    userDefaults.integer(forKey: "_poorService")
    userDefaults.integer(forKey: "_averageService")
    userDefaults.integer(forKey: "_excellentService")
    userDefaults.integer(forKey: "_persons")
    userDefaults.string(forKey: "colorTheme")
    userDefaults.integer(forKey: "segmentIndex")
    userDefaults.bool(forKey: "roundUp")
    userDefaults.double(forKey: "bill")
    userDefaults.string(forKey: "billfield")
    userDefaults.double(forKey: "total")
    userDefaults.double(forKey: "perPerson")
    userDefaults.integer(forKey: "tipPct")
    userDefaults.double(forKey: "tip")
    userDefaults.string(forKey: "savedAmt")
    userDefaults.double(forKey: "savedTip")
    userDefaults.integer(forKey: "savedTipPct")
    userDefaults.double(forKey: "savedTotal")
    userDefaults.integer(forKey: "savedPersons")
    userDefaults.double(forKey: "savedPerPerson")
  
    
    if(!isFirstLoad) {
      userDefaults.set(10, forKey: "_poorService")
      userDefaults.set(15, forKey: "_averageService")
      userDefaults.set(20, forKey: "_excellentService")
      userDefaults.set(2, forKey: "_persons")
      userDefaults.set("light", forKey: "colorTheme")
      userDefaults.set(0, forKey: "segmentIndex")
      userDefaults.set(false, forKey: "roundUp")
      userDefaults.set(0.00, forKey: "bill")
      userDefaults.set(0.00, forKey: "total")
      userDefaults.set(0.00, forKey: "perPerson")
      userDefaults.set(0.00, forKey: "tip")
      userDefaults.set(15, forKey: "tipPct") 
      userDefaults.set(true, forKey: "is_first_load")
    }
    
   
    Style.colorTheme = userDefaults.string(forKey: "colorTheme")
    
    userDefaults.synchronize()
    Style.loadTheme(name: Style.colorTheme!)
    
    
    
    return true
  }

  func applicationWillResignActive(_ application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(_ application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }


}

