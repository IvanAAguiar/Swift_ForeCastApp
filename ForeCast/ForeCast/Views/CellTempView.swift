//
//  CellTempView.swift
//  ForeCast
//
//  Created by user225360 on 7/31/22.
//

import SwiftUI

class CellTempView: UITableViewController {
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "CityName"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for:indexPath )
        
        cell.textLabel?.text = "Day"
        
        return cell
    }
}

//struct CellTempView_Previews: PreviewProvider {
//    static var previews: some View {
//        CellTempView()
//    }
//}
