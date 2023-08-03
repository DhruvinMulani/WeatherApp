//
//  ViewController.swift
//  WeatherApp
//
//  Created by Grishma Dave on 28/07/23.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet private weak var txtSearch: UITextField?
    @IBOutlet private weak var lblTemprature: UILabel?
    @IBOutlet private weak var lblCityName: UILabel?
    @IBOutlet private weak var imgWeatherCondition: UIImageView?
    @IBOutlet private weak var lblWeatherCondition: UILabel?
    @IBOutlet private weak var btnC: UIButton!
    @IBOutlet private weak var btnF: UIButton!
    
    let locationManager = CLLocationManager()
    var tempCelc: String = ""
    var tempFern: String = ""
    var currLatLong: String = ""
    var arrayCityDetail: [WeatherModel] = [WeatherModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtSearch?.delegate = self
        btnC?.layer.cornerRadius = 5
        btnF?.layer.cornerRadius = 5
        setUpWeatherIcon()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }

    func getCurrentWeather(city: String) {
        APIManager.shared.request(route: .getCurrentWeather(key: "0a0b14a2ddd749798a741659232807", city: city), type: WeatherModel.self) { result in
            DispatchQueue.main.async {
                self.arrayCityDetail.append(result)
                self.lblCityName?.text = result.location.name ?? ""
                self.tempCelc = "\(result.current.temp_c ?? 0)"
                self.tempFern = "\(result.current.temp_f ?? 0)"
                self.lblTemprature?.text = self.tempCelc
            }
            print(result.location)
            print(result.current)
        }
    }
    
    func setUpWeatherIcon() {
        let colorsConfig = UIImage.SymbolConfiguration(paletteColors: [.blue, .yellow])
        let sizeConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .bold)
        let image = UIImage(systemName: "cloud.sun.fill", withConfiguration: colorsConfig.applying(sizeConfig))
        imgWeatherCondition?.image = image
    }
    
    @IBAction private func didTapOnSearch() {
        getCurrentWeather(city: "\(txtSearch?.text ?? "")")
    }
    
    @IBAction private func didTapOnCelc(_ sender: UIButton) {
        lblTemprature?.text = tempCelc
        sender.backgroundColor = UIColor(named: "SelectedTemp")
        btnF.backgroundColor = UIColor(named: "UnSelectedTemp")
        sender.isSelected = true
        btnF.isSelected = false
    }
    
    @IBAction private func didTapnOnFernhit(_ sender: UIButton) {
        lblTemprature?.text = tempFern
        sender.backgroundColor = UIColor(named: "SelectedTemp")
        btnC.backgroundColor = UIColor(named: "UnSelectedTemp")
        sender.isSelected = true
        btnC.isSelected = false
    }
    
    @IBAction private func didTapOnCities() {
        if let cityVC = storyboard?.instantiateViewController(withIdentifier: "CityViewController") as? CityViewController {
            cityVC.arrayDetailData = arrayCityDetail
            if btnC.isSelected {
                cityVC.btnC.isSelected = true
            } else if btnF.isSelected {
                cityVC.btnF.isSelected = true
            }
            self.navigationController?.pushViewController(cityVC, animated: true)
        }
    }
    
    @IBAction private func didTapOnCurrentWeather() {
        locationManager.requestWhenInUseAuthorization()
        let lat = locationManager.location?.coordinate.latitude
        let longit = locationManager.location?.coordinate.longitude
        self.currLatLong = "\(lat ?? 0),\(longit ?? 0)"
        getCurrentWeather(city: self.currLatLong)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        getCurrentWeather(city: "\(txtSearch?.text ?? "")")
        return true
    }
}
