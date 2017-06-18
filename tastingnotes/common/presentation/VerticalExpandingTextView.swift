//
//  VerticalExpandingTextView.swift
//  tastingnotes
//
//  Created by iellis on 18/6/17.
//  Copyright © 2017 IanEllis. All rights reserved.
//

import Foundation
import CoreGraphics
import UIKit

class VerticalExpandingTextView : UITextView {
    
    private let MIN_HEIGHT = CGFloat(50)
    
    @IBInspectable var hint: String = "Add tasting notes..." {
        didSet {
            hintLabel.text = hint
        }
    }
    
    @IBInspectable var hintColor: UIColor = UIColor.gray {
        didSet {
            hintLabel.textColor = hintColor
        }
    }
    
    @IBOutlet var heightConstraint:NSLayoutConstraint!
    
    
    let hintLabel:UILabel = UILabel()
    
    override  func awakeFromNib() {
        super.awakeFromNib()
        self.setup()
    }
    
    private func setup(){
        hintLabel.text = hint
        hintLabel.textColor = hintColor
        hintLabel.font = self.font
        hintLabel.textAlignment = self.textAlignment
        hintLabel.numberOfLines = 0
        
        addSubview(hintLabel)
        
        showHideHint()
        
        NotificationCenter.default.addObserver(self, selector: #selector(VerticalExpandingTextView.textChanged), name: NSNotification.Name.UITextViewTextDidChange, object: nil)
    }
    
    func textChanged() {
        adjustSize()
        showHideHint()
    }
    
    private func showHideHint(){
        hintLabel.isHidden = !self.text.isEmpty
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UITextViewTextDidChange, object: nil);
    }
    
    private func adjustSize(){
        let contentSize = self.sizeThatFits(self.bounds.size)
        var frame = self.frame
        frame.size.height = CGFloat.maximum(contentSize.height, MIN_HEIGHT)
        self.frame = frame
        heightConstraint.constant = frame.size.height
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        adjustSize()
        
        var frame:CGRect = self.frame
        frame.origin.x = self.layoutMargins.left / 2
        frame.origin.y = self.layoutMargins.top
        frame.size.width = self.frame.width
        frame.size.height = self.frame.height
        hintLabel.frame = frame
        
        hintLabel.sizeToFit()
    }
    
    
}
