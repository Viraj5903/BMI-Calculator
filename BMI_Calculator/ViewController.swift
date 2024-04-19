//
//  ViewController.swift
//  BMI_Calculator
//
//  Created by Viraj Patel on 2024-01-29.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TextFieldHeight: UITextField!
    @IBOutlet weak var TextFieldWeight: UITextField!
    
    @IBOutlet weak var BMILabel: UILabel!
    @IBOutlet weak var ClassificationLabel: UILabel!
    
    @IBOutlet weak var ErrorLabel: UILabel!
    
    @IBAction func CalculateBMIButton(_ sender: UIButton) {
        // Get user input and store it
        // Checking the data enter by the user. Checking whether data is not null, checking whether converting String into Double and checking whether data is greater than zero.
        guard let heightText: String = TextFieldHeight.text, let weightText: String = TextFieldWeight.text,
              let height: Double = Double(heightText), let weight: Double = Double(weightText), height > 0 && weight > 0
        else {
            // Handle invalid input
            // Displaying the error.
            ErrorLabel.text = "Error! Invalid data."
            
            // Clearing the text field for weight and height.
            TextFieldHeight.text = nil
            TextFieldWeight.text = nil
            
            // Reseting the BMILabel and ClassificationLabel labels.
            BMILabel.text = "BMI"
            ClassificationLabel.text = "Classification"
            return
        }
        
        // Clearing the error label
        ErrorLabel.text = nil
        
        // Calculating the BMI
        let bmi = BMICalculator(height: height, weight: weight)
        
        // Classification of BMI
        let bmiClassification = BMIClassification(bmi: bmi)
        
        BMILabel.text = "BMI = \(String(format: "%.1f", bmi))"
        
        ClassificationLabel.text = "Classification = \(bmiClassification)"
    }
    
    // BMI Calculator function that calculate BMI
    func BMICalculator(height: Double, weight: Double) -> Double{
        // BMI = weight / (height * height)
        return (weight / pow(height / 100, 2))
    }
    
    // Function that classification according to BMI
    func BMIClassification(bmi: Double) -> String {
        
        var classification = ""
        
        // Classification of BMI
        if(bmi < 18.5) {
            classification = "Under weight"
        }
        else if (bmi < 25) {
            classification = "Normal weight"
        }
        else if (bmi < 30) {
            classification = "Overweight"
        }
        else {
            classification = "Obesity"
        }
        
        return classification
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}
