//
//  EditableNavigationTitle.swift
//  tastingnotes
//
//  Created by iellis on 13/5/17.
//  Copyright © 2017 IanEllis. All rights reserved.
//

import Foundation
import UIKit


class EditableNavigationTitleView : UIView, UITextFieldDelegate {
    
    public typealias EventHandler = (String) -> Void
    
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    
    public let updated:Event<String> = Event<String>()
    
    override  func awakeFromNib() {
        super.awakeFromNib()
        self.setup()
    }
    
    var title:String {
        get {return titleLabel.text ?? ""}
        set {
            titleLabel.text = newValue
            titleText.text = newValue
        }
    }
    
    private var editing:Bool {
        get {return !titleText.isHidden}
        set {
            titleText.isHidden = newValue
            titleLabel.isHidden = !newValue
        }
    }
    
    private func setup(){
        titleText.isHidden = true
        titleLabel.isHidden = false
        
        titleLabel.isUserInteractionEnabled = true
        titleLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(EditableNavigationTitleView.edit)))
        titleText.delegate = self
    }
    
    func edit(gestureRecognizer: UIGestureRecognizer){
        titleText.isHidden = false
        titleLabel.isHidden = true
    }
    
    
    // UITextField Delegates
    
    func textFieldDidEndEditing(_ textField: UITextField) {
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
