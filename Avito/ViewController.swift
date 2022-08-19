//
//  ViewController.swift
//  Avito
//
//  Created by Islomjon on 19/08/22.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    var employes:[EmployesDM] = []
    let url:String = "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c"

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.separatorStyle = .none
            tableView.register(TableViewCell.uinib(), forCellReuseIdentifier: TableViewCell.identifier)
            tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    func getData() {
        if Reachability.isConnectedToNetwork() {
            AF.request(url, method: .get).response { response in
                if let data = response.data {
                    let json = JSON(data)
                    for i in json["company"]["employees"].arrayValue {
                        let employ = EmployesDM(employes: i)
                        self.employes.append(employ)
                    }
                }
                self.tableView.reloadData()
            }
        } else {
            print("Not connection")
        }
    }
}

//MARK: - UITableView -

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employes.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        cell.updateCell(data: employes[indexPath.row])
        return cell
    }
    
}

