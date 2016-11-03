//
//  Cell.swift
//  AutoExpandingTextView
//
//  Created by Dmitry Labetsky on 03/11/16.
//  Copyright © 2016 DmiLab. All rights reserved.
//

import UIKit

class Cell: UITableViewCell, UITextViewDelegate {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!

    var onHeightUpdate: (() -> ())?

    func textViewDidChange(_ textView: UITextView) {
        let size = textView.sizeThatFits(CGSize(width: self.frame.width,
                                                height: CGFloat.greatestFiniteMagnitude))
        if size.height < autoExpandingTextViewMinimumHeight {
            heightConstraint.constant = autoExpandingTextViewMinimumHeight
        } else {
            heightConstraint.constant = size.height
        }
        onHeightUpdate?()
    }

}
