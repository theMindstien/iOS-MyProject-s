//
//  ViewController.swift
//  UICllectionView Shopping App
//
//  Created by apple on 04/10/22.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDataSource
{
    
    
    @IBOutlet weak var webSeriesCollectionViewCell: UICollectionView!
    var webSeriesArray:[webSeries] = []
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let w1 = webSeries(name: "Mirzapur", image: "mirzapur")
        let w2 = webSeries(name: "Asura", image: "asura")
        let w3 = webSeries(name: "Ashram", image: "ashram")
        let w4 = webSeries(name: "Aspirants", image: "aspirants")
        let w5 = webSeries(name: "Indianmurder", image: "indianmurder")
        let w6 = webSeries(name: "Patallok", image: "patallok")
        let w7 = webSeries(name: "Rangbaaz", image: "rangbaaz")
        let w8 = webSeries(name: "Apharan", image: "apharan")
        webSeriesArray.append(w1)
        webSeriesArray.append(w2)
        webSeriesArray.append(w3)
        webSeriesArray.append(w4)
        webSeriesArray.append(w5)
        webSeriesArray.append(w6)
        webSeriesArray.append(w7)
        webSeriesArray.append(w8)
        
        let nib:UINib = UINib(nibName: "WebseriesCollectionViewCell", bundle: nil)
        webSeriesCollectionViewCell.register(nib, forCellWithReuseIdentifier: "webseries_cell")
        webSeriesCollectionViewCell.dataSource = self
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return webSeriesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:WebseriesCollectionViewCell = webSeriesCollectionViewCell.dequeueReusableCell(withReuseIdentifier: "webseries_cell", for: indexPath) as! WebseriesCollectionViewCell
        let webseries = webSeriesArray[indexPath.row]
       
        cell.nameLabel.text = webseries.name
        cell.imageView.image = UIImage(named: webseries.image)
        cell.indexPath = indexPath
        cell.viewCon = self
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.red.cgColor
        
        return cell
    }
}

