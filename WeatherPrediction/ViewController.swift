//
//  ViewController.swift
//  WeatherPrediction
//
//  Created by M'haimdat omar on 20-08-2019.
//  Copyright © 2019 M'haimdat omar. All rights reserved.
//
import UIKit
import CoreML

class ViewController: UIViewController {
    
    /////////////////////////////
    // MARK: - Class's attributes
    /////////////////////////////
    lazy var datePicker = UIDatePicker()
    lazy var label = UILabel()
    
    ////////////////////////////////////////
    // MARK: - Entry point of the controller
    ////////////////////////////////////////
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8380756974, green: 0.7628322244, blue: 0, alpha: 1)
        setupLabel()
        setupPicker()
    }
    
    ///////////////////////////////////////////////////////////
    // MARK: - Setup the label layout and add it to the subview
    ///////////////////////////////////////////////////////////
    private func setupLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir-Heavy", size: 100)
        view.addSubview(label)
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
    }
    
    ///////////////////////////////////////
    // MARK: - Setup the date picker layout
    ///////////////////////////////////////
    private func setupPicker() {
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = #colorLiteral(red: 0.8380756974, green: 0.7628322244, blue: 0, alpha: 1)
        datePicker.addTarget(self, action: #selector(datePickerChanged(picker:)), for: .valueChanged)
        
        view.addSubview(datePicker)
        
        datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        datePicker.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        datePicker.heightAnchor.constraint(equalToConstant: view.bounds.height/2).isActive = true
        datePicker.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
    }
    
    //////////////////////////////
    // MARK: - The picker's target
    //////////////////////////////
    @objc private func datePickerChanged(picker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        let year: String = dateFormatter.string(from: picker.date)
        dateFormatter.dateFormat = "MM"
        let month: String = dateFormatter.string(from: picker.date)
        dateFormatter.dateFormat = "dd"
        let day: String = dateFormatter.string(from: picker.date)
        let date = "\(day)\(month)\(year)"
        getPrediction(date: date)
    }
    
    /////////////////////////////////////////////////////////////////////////
    // MARK: - Get the prediction from the API, parse it and change the label
    /////////////////////////////////////////////////////////////////////////
    func getPrediction(date: String) {
        
        var request = URLRequest(url: URL(string: "http://127.0.0.1:5000/\(date)")!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                if let respond = json.values.first {
                    DispatchQueue.main.async {
                        let temp = respond as! String
                        let tempFloat = Float(temp)
                        self.label.text = String(format: "%.2f", tempFloat!)
                    }
                }
                
            } catch {
                print("error")
            }
        })
        
        task.resume()
    }
    
    
}

