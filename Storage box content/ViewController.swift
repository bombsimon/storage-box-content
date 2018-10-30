//
//  ViewController.swift
//  Storage box content
//
//  Created by Simon Sawert on 2018-10-27.
//  Copyright © 2018 Simon Sawert. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var items = [
        BoxItem(Label: "Small santa red"),
        BoxItem(Label: "Advent candelabra"),
        BoxItem(Label: "Screw driver"),
        BoxItem(Label: "Old CDs"),
        BoxItem(Label: "Random Bastard DVDs"),
        BoxItem(Label: "PS2 games")
    ]

    lazy var boxes = [
        Box(Label: "Christmas", LastOpened: nil, Items: [ items[0], items[1] ]),
        Box(Label: "Media", LastOpened: nil, Items: [ items[3], items[4], items[5] ]),
        Box(Label: "Tools", LastOpened: nil, Items: [ items[2] ])
    ]

    lazy var positions = [
        Position(Label: "Basement large", Boxes: [ boxes[0], boxes[1] ]),
        Position(Label: "Basement small", Boxes: [ boxes[2] ])
    ]

    func numberOfSections(in tableView: UITableView) -> Int {
        return positions.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "pushToPlaces", sender: indexPath)
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return positions[section].Label
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return positions[section].Boxes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "placesCell", for: indexPath)

        cell.textLabel?.text = positions[indexPath.section].Boxes[indexPath.row].Label
        cell.accessoryType = .disclosureIndicator

        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationView : PlaceViewController = segue.destination as! PlaceViewController
        let indexPath : IndexPath = sender as! IndexPath

        destinationView.box = positions[indexPath.section].Boxes[indexPath.row]
        destinationView.title = positions[indexPath.section].Boxes[indexPath.row].Label
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.title = "Places"
    }
}
