//
//  ViewController.swift
//  WeatherApp
//
//  Created by Grishma Dave on 28/07/23.
//

import UIKit
import CoreLocation

//struct DataWeather {
//    var tempF: String?
//    var tempC: String?
//    var cityName: String?
//    var icon: String?
//
//    init(tempF: String? = nil, tempC: String? = nil, cityName: String? = nil, icon: String? = nil) {
//        self.tempF = tempF
//        self.tempC = tempC
//        self.cityName = cityName
//        self.icon = icon
//    }
//
//}
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
    
    @IBAction private func didTapOnSearch() {
        getCurrentWeather(city: "\(txtSearch?.text ?? "")")
    }
    
    @IBAction private func didTapOnCelc(_ sender: UIButton) {
        lblTemprature?.text = tempCelc
    }
    
    @IBAction private func didTapnOnFernhit(_ sender: UIButton) {
        lblTemprature?.text = tempFern
    }
    
    @IBAction private func didTapOnCities() {
        let cityVC = storyboard?.instantiateViewController(withIdentifier: "CityViewController") as? CityViewController
        cityVC?.arrayDetailData = arrayCityDetail
//        if btnC.isSelected {
//            cityVC?.btnC.isSelected = true
//        } else if btnF.isSelected {
//            cityVC?.btnC.isSelected = true
//        }
        cityVC?.navigationController?.pushViewController(cityVC ?? CityViewController(), animated: true)
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
