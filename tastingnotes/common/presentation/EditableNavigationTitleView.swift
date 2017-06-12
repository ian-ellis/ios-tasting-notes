//
//  EditableNavigationTitle.swift
//  tastingnotes
//
//  Created by iellis on 13/5/17.
//  Copyright © 2017 IanEllis. All rights reserved.
//

import Foundation
import UIKit
import CoreGraphics


class EditableNavigationTitleView : UIView, UITextFieldDelegate {
    
    private let MIN_TEXT_SIZE:CGFloat = 40
    public typealias EventHandler = (String) -> Void
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleText: UITextField!
    
    
    public let updated:Event<String> = Event<String>()
    
    override  func awakeFromNib() {
        super.awakeFromNib()
        self.setup()
    }
    
    var title:String {
        get {return titleLabel.text ?? "BLAH"}
        set {
            titleLabel.text = newValue
            titleText.text = newValue
            resize()
            positionElements()
        }
    }
    
    private var editing:Bool {
        get {return !titleText.isHidden}
        set {
            titleText.isHidden = newValue
            titleLabel.isHidden = !newValue
        }
    }
    
    override var bounds: CGRect {
        didSet {
            positionElements()
        }
    }

    
    private func setup(){
        titleText.isHidden = true
        titleLabel.isHidden = false

        titleLabel.isUserInteractionEnabled = true
        titleLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(EditableNavigationTitleView.edit)))
        titleText.delegate = self
        
        resize()
        positionElements()
        
    }
    
    func edit(gestureRecognizer: UIGestureRecognizer){
        titleText.isHidden = false
        titleLabel.isHidden = true
    }
    @IBAction func editChanged(_ sender: Any) {
        resize()
        positionElements()
    }
    
    
    @IBAction func textTouchedOutside(_ sender: Any) {
        editingFinished()
    }
    
    
    private func resize(){
        
        let text = titleText.text ?? ""
        let nsString = text as NSString
        let fontSize = titleText.font?.pointSize ?? 17.0
        
        let stringSize = nsString.size(attributes: [
            NSFontAttributeName: titleText.font ?? UIFont.systemFont(ofSize: fontSize)
        ]).width + CGFloat(20)
        
        let width = CGFloat.maximum(
            MIN_TEXT_SIZE,
            CGFloat.minimum(stringSize, self.frame.width)
        )
        
        let newFrame = CGRect(
            x:titleText.frame.origin.x,
            y:titleText.frame.origin.y,
            width:width,
            height:titleText.frame.height
        )
        titleText.frame = newFrame
        titleLabel.frame = newFrame
        
        
        
    }
    
    private func positionElements(){
        let frame = self.frame
        let textFrame = titleText.frame
        
        if let parent = self.superview {
        
            let parentWidth:CGFloat = parent.frame.width
            let totalSpace = parentWidth - self.frame.width
            let leftSpace = self.frame.origin.x
            let rightSpace = totalSpace - leftSpace
            let xOffset = (leftSpace / 2) - (rightSpace / 2)
        
            let x = CGFloat.maximum(
                CGFloat((frame.width / 2) - (textFrame.width / 2) - xOffset),
                CGFloat(0)
            )
            
            let y = CGFloat((frame.height / 2) - (textFrame.height / 2))
        
            titleText.frame = CGRect(
                x: x,
                y: y,
                width: textFrame.width,
                height: textFrame.height
            )
        
            titleLabel.frame = titleText.frame
        }
    }
    
    private func editingFinished(){
        let editedTitle = titleText.text ?? ""
        
        titleText.isHidden = true
        titleLabel.isHidden = false
        
        if(editedTitle.isEmpty){
            titleText.text = title
            return
        }
        
        self.title = editedTitle
        updated.raise(data: self.title)
    }
    
    // UITextField Delegates
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        editingFinished()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true;
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true;
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true;
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true;
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }
}
