//
//  PurpleViewController.swift
//  NavigationViewController
//
//  Created by apple on 12/10/22.
//

import UIKit

class PurpleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let button1 = UIBarButtonItem(title: "First Screen!", style: UIBarButtonItem.Style.done, target: self, action: #selector(PurpleViewController.printBrown))
            navigationItem.rightBarButtonItem = button1
    }
    

    @objc func printBrown()-> Void
    {
        let firstcon:BrownViewController = self.storyboard!.instantiateViewController(withIdentifier: "brown_id") as! BrownViewController
        self.navigationController?.pushViewController(firstcon, animated: true)
    }
}
