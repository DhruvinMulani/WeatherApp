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
    @IBOutlet private weak var viewWeatherTop: UIView!
    @IBOutlet private weak var activityLoaderView: UIActivityIndicatorView!
    
    var selectedTempUnit: TemperatureUnits = .celsius
    
    let locationManager = CLLocationManager()
    var tempCelc: String = ""
    var tempFern: String = ""
    var arrayCityDetail: [WeatherModel] = [WeatherModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        prepareView()
    }
    
    private func prepareView() {
        activityLoaderView.stopAnimating()
        activityLoaderView.hidesWhenStopped = true
        viewWeatherTop.isHidden = false
        locationManager.requestWhenInUseAuthorization()
        btnC?.layer.cornerRadius = 5
        btnF?.layer.cornerRadius = 5
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }

    func getCurrentWeather(city: String) {
        showLoadingView(isLoading: true)
        APIManager.shared.request(route: .getCurrentWeather(key: APIKEY , city: city), type: WeatherModel.self) { result in
            self.showLoadingView(isLoading: false)
            if self.arrayCityDetail.contains(where: {$0.location.name == result.location.name}) {
                self.arrayCityDetail.removeAll(where: {$0.location.name == result.location.name})
            }
            self.arrayCityDetail.append(result)
            self.lblCityName?.text = result.location.name ?? ""
            self.tempCelc = "\(result.current.temp_c ?? 0)"
            self.tempFern = "\(result.current.temp_f ?? 0)"
            if self.selectedTempUnit == .celsius {
                self.lblTemprature?.text = self.tempCelc
            } else {
                self.lblTemprature?.text = self.tempFern
            }
            self.lblWeatherCondition?.text = result.current.condition?.text
            if let code = result.current.condition?.code,
                let codition = WeatherCondition(rawValue: code) {
                self.imgWeatherCondition?.image = codition.icon
            }
        } failure: { message in
            self.showLoadingView(isLoading: false)
            self.showAlert(title: "Error", message: message)
        }
    }
    
    
    @IBAction private func didTapOnSearch() {
        if let searchText = txtSearch?.text?.trimmingCharacters(in: .whitespaces), !searchText.isEmpty {
            getCurrentWeather(city: searchText)
        } else {
            txtSearch?.becomeFirstResponder()
            showAlert(title: "Error", message: "Please enter valid city name.")
        }
    }
    
    @IBAction private func didTapOnCelc(_ sender: UIButton) {
        selectedTempUnit = .celsius
        lblTemprature?.text = tempCelc
        sender.backgroundColor = WAColors.SwitchButton.selectedButton
        btnF.backgroundColor = WAColors.SwitchButton.unSelectedButton
        sender.isSelected = true
        btnF.isSelected = false
    }
    
    @IBAction private func didTapnOnFernhit(_ sender: UIButton) {
        selectedTempUnit = .fahrenheit
        lblTemprature?.text = tempFern
        sender.backgroundColor = WAColors.SwitchButton.selectedButton
        btnC.backgroundColor = WAColors.SwitchButton.unSelectedButton
        sender.isSelected = true
        btnC.isSelected = false
    }
    
    @IBAction private func didTapOnCities() {
        if let cityVC = storyboard?.instantiateViewController(withIdentifier: "CityViewController") as? CityViewController {
            let weathers = arrayCityDetail.reversed()
            cityVC.arrayDetailData = Array(weathers)
            cityVC.selectedTempUnit = selectedTempUnit
            self.navigationController?.pushViewController(cityVC, animated: true)
        }
    }
    
    @IBAction private func didTapOnCurrentWeather() {
        if locationManager.authorizationStatus == .denied || locationManager.authorizationStatus == .notDetermined || locationManager.authorizationStatus == .restricted {
            showAlert(title: "Error", message: "Please allow location permission to get weather condition of your location from Settings > WeatherApp")
        } else if let location = locationManager.location?.coordinate{
            getCurrentWeather(city: "\(location.latitude),\(location.longitude)")
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alertController, animated: true)
    }
    
    private func showLoadingView(isLoading: Bool) {
        viewWeatherTop.isHidden = !isLoading
        if isLoading {
            activityLoaderView.startAnimating()
        } else {
            activityLoaderView.stopAnimating()
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let searchText = textField.text?.trimmingCharacters(in: .whitespaces), !searchText.isEmpty {
            getCurrentWeather(city: "\(txtSearch?.text ?? "")")
        } else {
            txtSearch?.becomeFirstResponder()
            showAlert(title: "Error", message: "Please enter valid city name.")
        }
        
        return true
    }
}
