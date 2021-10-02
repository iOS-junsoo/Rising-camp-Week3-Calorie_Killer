//
//  foodAddViewController.swift
//  food-management
//
//  Created by 준수김 on 2021/09/28.
//

import UIKit
import Foundation

class foodAddViewController: UIViewController{
    
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var foodName: UITextField!
    @IBOutlet weak var foodAmount: UITextField!
    @IBOutlet weak var foodCalorie: UITextField!
    
    var selectRow = 0
    let data = ["탄수화물", "단백질", "지방", "비타민", "무기질", "물"]
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
    }
   
    @IBAction func tappedBtn(_ sender: UIButton) {
        foodList.add(foodImage: data[selectRow], foodname: foodName.text!, foodweight: foodAmount.text!, foodcalorie: foodCalorie.text!)
        
    }
}
extension foodAddViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectRow = row
    }
}

extension foodAddViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent: Int) -> String? {
        return data[row]
    }
}


