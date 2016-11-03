//
//  Cell.swift
//  AutoExpandingTextView
//
//  Created by Money Making on 03/11/16.
//  Copyright © 2016 DmiLab. All rights reserved.
//

import UIKit

class Cell: UITableViewCell, UITextViewDelegate {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!

    let minHeight: CGFloat = 50

    var onHeightUpdate: (() -> ())?

    func textViewDidChange(_ textView: UITextView) {
        let size = textView.sizeThatFits(CGSize(width: self.frame.width,
                                                height: CGFloat.greatestFiniteMagnitude))
        if size.height < minHeight {
            heightConstraint.constant = minHeight
        } else {
            heightConstraint.constant = size.height
        }
        onHeightUpdate?()
    }

}
