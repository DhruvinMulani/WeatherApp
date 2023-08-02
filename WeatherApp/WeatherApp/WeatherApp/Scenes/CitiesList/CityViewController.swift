//
//  CityViewController.swift
//  WeatherApp
//
//  Created by Grishma Dave on 30/07/23.
//

import UIKit

class CityViewController: UIViewController {
    
    @IBOutlet private weak var cityTableView: UITableView?


    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        cityTableView?.reloadData()
        // Do any additional setup after loading the view.
    }
    
    private func loadXIB() {
        cityTableView?.register(UINib(nibName: "CityTableCell", bundle: nil), forCellReuseIdentifier: "CityTableCell")
    }
    
}

extension CityViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableCell", for: indexPath) as? CityTableCell
        return cell ?? UITableViewCell()
    }
}
