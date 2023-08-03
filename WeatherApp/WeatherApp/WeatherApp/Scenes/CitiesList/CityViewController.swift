//
//  CityViewController.swift
//  WeatherApp
//
//  Created by Grishma Dave on 30/07/23.
//

import UIKit

class CityViewController: UIViewController {
    
    @IBOutlet private weak var cityTableView: UITableView?
    var btnC: UIButton = UIButton()
    var btnF: UIButton = UIButton()

    var arrayDetailData: [WeatherModel] = [WeatherModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        title = " City's Weather Information"
        self.loadXIB()
        cityTableView?.reloadData()
        // Do any additional setup after loading the view.
    }
    
    private func loadXIB() {
        cityTableView?.register(UINib(nibName: "CityTableCell", bundle: nil), forCellReuseIdentifier: "CityTableCell")
    }
    
}

extension CityViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayDetailData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableCell", for: indexPath) as? CityTableCell
        cell?.detailCityData = arrayDetailData[indexPath.row]
        if btnC.isSelected {
            cell?.lblTemp?.text = "\(arrayDetailData[indexPath.row].current.temp_c ?? 0.0) C"
        } else if btnF.isSelected {
            cell?.lblTemp?.text = "\(arrayDetailData[indexPath.row].current.temp_f ?? 0.0) F"
        }
        return cell ?? UITableViewCell()
    }
}
