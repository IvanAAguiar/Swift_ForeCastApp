//
//  CellTempView.swift
//  ForeCast
//
//  Created by user225360 on 7/31/22.
//

import SwiftUI

class CellTempView: UIViewController {

    

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        updateViewConstraints()
    }
    
    internal override func updateViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
//    let cellId = "cellId"
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        navigationItem.title = "CityName"
//        navigationController?.navigationBar.prefersLargeTitles = true
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        10
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for:indexPath )
//
//        cell.textLabel?.text = "Day"
//
//        return cell
//    }
}

extension CellTempView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "UITableViewCell")
        cell.textLabel?.text = "Hour"
        return cell
    }
}
