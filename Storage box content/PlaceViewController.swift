//
//  PlaceViewController.swift
//  Storage box content
//
//  Created by Simon Sawert on 2018-10-29.
//  Copyright © 2018 Simon Sawert. All rights reserved.
//

import UIKit

class PlaceViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var box : Box!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return box.Items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "boxItemCell", for: indexPath)

        cell.textLabel?.text = box.Items[indexPath.row].Label

        return cell
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sourceView : ViewController = segue.source as! ViewController
        let indexPath : IndexPath = sender as! IndexPath

        box = sourceView.positions[indexPath.section].Boxes[indexPath.row]
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
