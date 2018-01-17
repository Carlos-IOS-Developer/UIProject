//
//  ViewController.swift
//  UIProject
//
//  Created by Carlos Reda on 1/1/18.
//  Copyright © 2018 Carlos. All rights reserved.
//

import UIKit
import StoreKit


class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var cityPickerText: UITextField!
    let cities = ["London","Paris","Dubai","NY","Rome","Miami"]
    var pickerView = UIPickerView()
    let runIncrementerSetting = "numberOfRuns"
    // UserDefauls dictionary key where we store number of runs
    let minimumRunCount = 5
    // Minimum number of runs that we should have until we ask for review
    override func viewDidLoad() {
        super.viewDidLoad()

       showReview()
      
        pickerView.delegate=self
        pickerView.dataSource=self
        
        cityPickerText.inputView = pickerView
        cityPickerText.textAlignment = .center
        
    }

    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        cityPickerText.text = cities[row]
        cityPickerText.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // request user review
    func incrementAppRuns() {                   // counter for number of runs for the app. You can call this from App Delegate
        
        let usD = UserDefaults()
        let runs = getRunCounts() + 1
        usD.setValuesForKeys([runIncrementerSetting: runs])
        usD.synchronize()
        
    }
    
    func getRunCounts () -> Int {               // Reads number of runs from UserDefaults and returns it.
        
        let usD = UserDefaults()
        let savedRuns = usD.value(forKey: runIncrementerSetting)
        
        var runs = 0
        if (savedRuns != nil) {
            
            runs = savedRuns as! Int
        }
        
        print("Run Counts are \(runs)")
        return runs
        
    }
    
    func showReview() {
        
        let runs = getRunCounts()
        print("Show Review")
        
        if (runs > minimumRunCount) {
            
            if #available(iOS 10.3, *) {
                print("Review Requested")
                SKStoreReviewController.requestReview()
                
            } else {
                // Fallback on earlier versions
            }
            
        } else {
            
            print("Runs are now enough to request review!")
            
        }
    }


}

