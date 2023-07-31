//
//  ViewController.swift
//  WeatherApp
//
//  Created by Grishma Dave on 28/07/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var txtSearch: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func getCurrentWeather() {
        let param1 : [String : String] = [
            "key":"0a0b14a2ddd749798a741659232807",
            "q":"\(txtSearch.text)"
        ]
        
        APIManager.shared.request(route: .getCurrentWeather(param1), type: WeatherModel.self) { (response) in
            print(response)
        }
    }
    
    @IBAction private func didTapOnSearch() {
        getCurrentWeather()
    }
}

