//
//  ViewController.swift
//  AutoExpandingTextView
//
//  Created by Dmitry Labetsky on 03/11/16.
//  Copyright © 2016 DmiLab. All rights reserved.
//

import UIKit

let autoExpandingTextViewMinimumHeight: CGFloat = 50

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    let reusableCellIdentifier = "cell"

    override func viewDidLoad() {
        tableView.estimatedRowHeight = autoExpandingTextViewMinimumHeight
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reusableCellIdentifier, for: indexPath)

        if let cell = cell as? Cell {
            cell.onHeightUpdate = { [weak self] in
                self?.tableView.beginUpdates()
                self?.tableView.endUpdates()
            }
        }

        return cell
    }

}

