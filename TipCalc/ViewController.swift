//
//  ViewController.swift
//  TipCalc
//
//  Created by Barbara Ristau on 12/5/16.
//  Copyright © 2016 FeiLabs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  // service categories
  var excellentService: Int?
  var averageService: Int?
  var poorService: Int?

  // settings 
  var persons: Int?
  var tipPercentage: Int?
  var roundTip: Bool?
  
  // bill related
  var bill: Double?
  var tip: Double?
  var total: Double?
  var perPerson: Double?
  
  let currencyFormatter = NumberFormatter()
  
  
  @IBOutlet weak var tipLabel: UILabel!
  @IBOutlet weak var totalLabel: UILabel!
  @IBOutlet weak var billField: UITextField!
  @IBOutlet weak var numPersons: UILabel!
  @IBOutlet weak var perPersonBill: UILabel!
  @IBOutlet weak var tipPercentageLabel: UILabel!
  

  @IBOutlet var textLabels: [UILabel]!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    self.title = "Tip Calculator"
    
    self.view.alpha = 0.1
    animateView()
    
    let nav = self.navigationController?.navigationBar
    nav?.barStyle = UIBarStyle.black
    nav?.tintColor = Style.textColor
    nav?.titleTextAttributes = [NSForegroundColorAttributeName: Style.textColor]
    
    billField.keyboardAppearance = UIKeyboardAppearance.dark
    
    loadSavedFields()
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    billField.becomeFirstResponder()
    
    let userDefaults = UserDefaults.standard
    
    excellentService = userDefaults.integer(forKey: "_excellentService")
    averageService = userDefaults.integer(forKey: "_averageService")
    poorService = userDefaults.integer(forKey: "_poorService")
    roundTip = userDefaults.bool(forKey: "roundUp")

    calcTip()
    
    Style.colorTheme = userDefaults.string(forKey: "colorTheme")
    Style.loadTheme(name: Style.colorTheme!)
  
    updateStyling()
    updateValueLabels()
  
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    
    // save bill field amount in user defaults
    UserDefaults.standard.set(Date(), forKey: "savedTime")
    UserDefaults.standard.set(billField.text, forKey: "savedAmt")

   // UserDefaults.standard.set(billField.text, forKey: "billfield")
     UserDefaults.standard.set(tip, forKey: "savedTip")
     UserDefaults.standard.set(total, forKey: "savedTotal")
     UserDefaults.standard.set(perPerson, forKey: "savedPerPerson")
     UserDefaults.standard.set(persons, forKey: "savedPersons")
     UserDefaults.standard.set(tipPercentage, forKey: "savedTipPct")
    
    UserDefaults.standard.synchronize()
    
  }
  
  
  
  
  
  @IBAction func poorService(_ sender: AnyObject) {
    tipPercentage = poorService
    self.tipPercentageLabel.text = String(describing: tipPercentage!) + "%"
    calcTip()
  }
  
  
  @IBAction func averageService(_ sender: AnyObject) {
    tipPercentage = averageService
    self.tipPercentageLabel.text = String(describing: tipPercentage!) + "%"
    calcTip()
  }
  
  
  @IBAction func excellentService(_ sender: AnyObject) {
    tipPercentage = excellentService
    self.tipPercentageLabel.text = String(describing: tipPercentage!) + "%"
    calcTip()
  }
  
  
  @IBAction func tipUp(_ sender: AnyObject) {
    tipPercentage! += 1
    self.tipPercentageLabel.text = String(describing: tipPercentage!) + "%"
    calcTip()
  }
  
  
  @IBAction func tipDown(_ sender: AnyObject) {
    tipPercentage! -= 1
    self.tipPercentageLabel.text = String(describing: tipPercentage!) + "%"
    calcTip()
  }
  
  
  
  @IBAction func incrementPerson(_ sender: AnyObject) {
    persons! += 1
    self.numPersons.text = String(describing: persons!)
    calcTip()
  }
  
  @IBAction func decrementPerson(_ sender: AnyObject) {
    persons! -= 1
    self.numPersons.text = String(describing: persons!)
    calcTip()
  }
  
  
  @IBAction func calculateTip(_ sender: AnyObject) {
    
    calcTip()
    
  }
  
  func calcTip() {
    
    formatCurrency()

    bill = Double(billField.text!) ?? 0
    
    if ((bill != nil) && (bill != 0)) {
      tip = bill! * (Double(tipPercentage!)/100)
      total = bill! + tip!
      perPerson = total! / Double(persons!)
    
      if (roundTip)!{

        perPerson = (total! / Double(persons!)).rounded(.up)
        total = perPerson! * Double(persons!)
        tip = total! - bill!
      }
        updateValueLabels()
    }
    
    else if ((bill == nil) || (bill == 0)) {
      tip = 0.0
      bill = 0.0
      total = 0.0
      perPerson = 0.0
    }
      updateValueLabels()
  }

  
  
  func updateValueLabels(){
    
    tipPercentageLabel.text = String(describing: tipPercentage!) + "%"
    tipLabel.text = currencyFormatter.string(from: NSNumber(value: tip!))
    totalLabel.text = currencyFormatter.string(from: NSNumber(value: total!))
    numPersons.text = String(describing: persons!)
    perPersonBill.text = currencyFormatter.string(from: NSNumber(value: perPerson!))
  }

  
  func updateStyling() {
    
    // set initial elements with styling
    self.view.backgroundColor = Style.bgColor
    self.view.viewWithTag(1)?.backgroundColor = Style.barColor
    self.view.viewWithTag(2)?.backgroundColor = Style.barColor
    self.view.viewWithTag(3)?.backgroundColor = Style.barColor
    
    // need to get array for this working, this is interim code
    self.textLabels[0].textColor = Style.textColor
    self.textLabels[1].textColor = Style.textColor
    self.textLabels[2].textColor = Style.textColor
    self.textLabels[3].textColor = Style.textColor
    self.textLabels[4].textColor = Style.textColor
    self.textLabels[5].textColor = Style.textColor
    self.textLabels[6].textColor = Style.textColor
    
    self.tipLabel.textColor = Style.textColor
    self.totalLabel.textColor = Style.textColor
    self.numPersons.textColor = Style.textColor
    self.tipPercentageLabel.textColor = Style.textColor
    self.perPersonBill.textColor = Style.textColor
    
    
  }
  
  func animateView() {
    UIView.animate(withDuration: 2.0, animations: {
      self.view.alpha = 1.0
    })
  }
  
  func formatCurrency() {
    // adding locale specific currency and thousands separator
    
    currencyFormatter.usesGroupingSeparator = true
    currencyFormatter.numberStyle = NumberFormatter.Style.currency
    currencyFormatter.locale = Locale.current
  }
  
  
  @IBAction func onTap(_ sender: AnyObject) {
    view.endEditing(true)
  }
  
  
  func loadSavedFields() {
    
    let userDefaults = UserDefaults.standard
    
    let now = Date()
    let then = userDefaults.object(forKey: "savedTime") as? Date
    
    if(then != nil && now.timeIntervalSince(then!)<600) {
      billField.text = userDefaults.string(forKey: "savedAmt")
  
      tip = userDefaults.double(forKey: "savedTip")
      tipPercentage = userDefaults.integer(forKey: "savedTipPct")
      total = userDefaults.double(forKey: "savedTotal")
      
      persons = userDefaults.integer(forKey: "savedPersons")
      perPerson = userDefaults.double(forKey: "savedPerPerson")
      
    } else {
      loadDefaultFields()
    }
    
    
  }
  
  func loadDefaultFields() {
    
    let userDefaults = UserDefaults.standard

    billField.text = userDefaults.string(forKey: "billfield")
    
    tip = userDefaults.double(forKey: "tip")
    tipPercentage = userDefaults.integer(forKey: "tipPct")
    total = userDefaults.double(forKey: "total")
    
    persons = userDefaults.integer(forKey: "_persons")
    perPerson = userDefaults.double(forKey: "perPerson")
    
  }
  
  
  
  
}

