//
//  ViewController.swift
//  Swift_Project
//
//  Created by aa on 2020/12/15.
//  Copyright © 2020 aa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate  {
  

    @IBOutlet weak var Height: UITextField!
    @IBOutlet weak var Weight: UITextField!
    @IBOutlet weak var Result: UILabel!
    @IBOutlet weak var BMI_Result: UILabel!
    @IBOutlet weak var Picker: UIPickerView!
    let data = ["輕度工作","中度工作","重度工作"]
    var select:String = ""
    @IBAction func ButtonPress(_ sender: Any) {
        var BMI:Float = 1
        var height_M:Float
        guard let heightText = Height.text,let weightText = Weight.text, let  height = Int(heightText),let weight = Float(weightText)
        else {
            Result.text! = "請輸入完整資訊"
            return
        }
       
        
        height_M = Float(height)
        height_M /= 100
        height_M = height_M * height_M
        var str = String(format: "%.2f", Float(weight) / height_M)
        BMI = Float(str)!
        print("\(select)")
        if BMI < 18 {
            BMI_Result.text = "你的ＢＭＩ為\(BMI)，體重過輕"
            switch select {
            case "輕度工作":
                Result.text = "每日建議攝取熱量\(weight*35)卡"
            case "中度工作":
                Result.text = "每日建議攝取熱量\(weight*40)卡"
            default:
                Result.text = "每日建議攝取熱量\(weight*45)卡"
            }
            
            
        }else if BMI >= 24 && BMI <= 27{
            BMI_Result.text = "你的ＢＭＩ為\(BMI)，體重過重"
            switch select {
            case "輕度工作":
                Result.text = "每日建議攝取熱量\(weight*20)卡"
            case "中度工作":
                Result.text = "每日建議攝取熱量\(weight*30)卡"
            default:
                Result.text = "每日建議攝取熱量\(weight*35)卡"
            }
            
        }else if  BMI >= 30 && BMI <= 35 {
            BMI_Result.text = "你的ＢＭＩ為\(BMI)，中度肥胖"
            switch select {
            case "輕度工作":
                Result.text = "每日建議攝取熱量\(weight*20)卡"
            case "中度工作":
                Result.text = "每日建議攝取熱量\(weight*30)卡"
            default:
                Result.text = "每日建議攝取熱量\(weight*35)卡"
            }
        }else if BMI >= 35{
            switch select {
            case "輕度工作":
                Result.text = "每日建議攝取熱量\(weight*20)卡"
            case "中度工作":
                Result.text = "每日建議攝取熱量\(weight*30)卡"
            default:
                Result.text = "每日建議攝取熱量\(weight*35)卡"
            }
            BMI_Result.text = "你的ＢＭＩ為\(BMI)，重度肥胖"
        }else{
           
            BMI_Result.text = "你的ＢＭＩ為\(BMI)，你很健康"
            switch select {
                       case "輕度工作":
                           Result.text = "每日建議攝取熱量\(weight*30)卡"
                       case "中度工作":
                           Result.text = "每日建議攝取熱量\(weight*35)卡"
                       default:
                           Result.text = "每日建議攝取熱量\(weight*40)卡"
                       }
            
        }
   
        
        
    }
//    過重：24≦BMI＜27
//    輕度肥胖：27≦BMI＜30
//    中度肥胖：30≦BMI＜35
//    重度肥胖：BMI≧35
//每天活動量    體重過輕者所需熱量             體重正常者所需熱量    體重過重、肥胖者所需熱量
//輕度工作    35大卡 X 目前體重（公斤）    30大卡 X 目前體重（公斤）    20~25大卡 X 目前體重（公斤）
//中度工作    40大卡 X 目前體重（公斤）    35大卡 X 目前體重（公斤）    30大卡 X 目前體重（公斤）
//重度工作    45大卡 X 目前體重（公斤）    40大卡 X 目前體重（公斤）    35大卡 X 目前體重（公斤）


    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Height.delegate = self
        Weight.delegate = self
        Picker.delegate = self
        Picker.dataSource = self
        
        
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    

}
extension ViewController :UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
    
}

extension ViewController:UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        select = data[row] as String
        return data[row]
    }
}



