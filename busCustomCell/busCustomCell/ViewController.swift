//
//  ViewController.swift
//  busCustomCell
//
//  Created by apple on 29/09/22.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource
{
    @IBOutlet weak var TaxiTableView: UITableView!
    var taxiInfoArray:[TaxiInfo] = []
    
    
    override func viewDidLoad() {
        
        let t1:TaxiInfo = TaxiInfo(taxiNo: "MP09", source: "Indore", destination: "Ujjain", departTime: "06:30AM", reachTime: "8:00AM", fare: "12000", taxiPhoto: "taxi1")
        let t2:TaxiInfo = TaxiInfo(taxiNo: "MP04", source: "Bhopal", destination: "Jabalpur", departTime: "17:50PM", reachTime: "07:40AM", fare: "25000", taxiPhoto: "taxi2")
        taxiInfoArray.append(t1)
        taxiInfoArray.append(t2)
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let nib:UINib = UINib(nibName: "TaxiInfoCell", bundle: nil)
        TaxiTableView.register(nib, forCellReuseIdentifier: "taxi_cell_id")
        TaxiTableView.dataSource = self
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taxiInfoArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TaxiInfoCell = TaxiTableView.dequeueReusableCell(withIdentifier: "taxi_cell_id") as! TaxiInfoCell
        
        let taxiInfo:TaxiInfo = taxiInfoArray[indexPath.row]
        
        cell.taxiNoLabel!.text = taxiInfo.taxiNo
        cell.fromLabel!.text = "\(taxiInfo.source)"
        cell.toLabel!.text = "\(taxiInfo.destination)"
        cell.departLabel!.text = "\(taxiInfo.departTime)"
        cell.reachLabel!.text = "\(taxiInfo.reachTime)"
        cell.fareLabel!.text = "Rs:\(taxiInfo.fare)"
        cell.imageLabel!.image = UIImage(named: taxiInfo.taxiPhoto)
        cell.indexPath = indexPath
        cell.viewCon = self
        return cell
    }

}

