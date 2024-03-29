//
//  KPDialogController.swift
//  KPDialogController
//
//  Created by Karun on 10/06/19.
//  Copyright © 2019 KarunPant. All rights reserved.
//

import UIKit

open class KPDialogController: UIViewController {
    
    @IBOutlet weak var alertBG: UIView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    
    @IBOutlet weak var buttonStack: UIStackView!
    
    private var alertActions: [KPDialogAction]?
    private var alertTitle: NSAttributedString?
    private var alertMessage: NSAttributedString?
    
    var alertBGColor: UIColor?
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        configureAlert()
    }
    
    private func configureAlert() {
        lblTitle.attributedText = alertTitle
        lblMessage.attributedText = alertMessage
        createAndAddActions()
        alertBG.layer.cornerRadius = 4
        alertBG.layer.masksToBounds = false
        alertBG.layer.shadowOffset = CGSize.init(width: 0, height: 5)
        alertBG.layer.shadowOpacity = 0.24
        alertBG.layer.shadowColor = UIColor.black.cgColor
        alertBG.layer.shadowRadius = 24
    }
    
    func initialize(title: NSAttributedString?, message: NSAttributedString?, actions: [KPDialogAction]?) {
        self.alertTitle = title
        self.alertMessage = message
        self.alertActions = actions
    }
    
    private func createAndAddActions() {
        if let actions = alertActions, actions.count > 0 {
            actions.enumerated().forEach { (offset, action) in
                let actionButton = createButton(action.attributedTitle, tag: offset, actionCount: actions.count)
                buttonStack.addArrangedSubview(actionButton)
            }
        }else {
            //create one action for cancel
            let cancelButton = createButton(NSAttributedString.init(string: "CANCEL", attributes: [.font: UIFont.boldSystemFont(ofSize: 16), .kern: 0.4, .foregroundColor: UIColor(white: 0, alpha: 0.56)]), tag: -1)
            buttonStack.addArrangedSubview(cancelButton)
        }
    }
    
    private func createButton(_ title: NSAttributedString, tag: Int, actionCount: Int = 1) -> UIButton {
        let actionButton = UIButton()
        actionButton.backgroundColor = .clear
        actionButton.addTarget(self, action: #selector(KPDialogController.onTapActionButton(_:)), for: .touchUpInside)
        actionButton.tag = tag
        actionButton.setAttributedTitle(title, for: .normal)
        var selectionAttributes = title.attributes(at: 0, effectiveRange: nil)
        if let foreColor = selectionAttributes[.foregroundColor] as? UIColor {
            let alpha = foreColor.cgColor.alpha
            selectionAttributes[.foregroundColor] = foreColor.withAlphaComponent(alpha/2.0)
        }
        actionButton.setAttributedTitle(NSAttributedString.init(string: title.string, attributes: selectionAttributes), for: .highlighted)
        
        if actionCount >= 2 {
            if tag == 0 {
                //first
                actionButton.contentHorizontalAlignment = .left
                actionButton.contentEdgeInsets = .init(top: 16, left: 24, bottom: 16, right: 5)
            }else if tag == actionCount - 1 {
                //last
                actionButton.contentHorizontalAlignment = .right
                actionButton.contentEdgeInsets = .init(top: 16, left: 5, bottom: 16, right: 24)
            }else {
                //others
                actionButton.contentHorizontalAlignment = .center
                actionButton.contentEdgeInsets = .init(top: 16, left: 10, bottom: 16, right: 10)
            }
        }else {
            actionButton.contentHorizontalAlignment = .right
            actionButton.contentEdgeInsets = .init(top: 16, left: 10, bottom: 16, right: 24)
        }
        
        return actionButton
    }
    
    @objc private func onTapActionButton(_ sender: UIButton) {
        let allActions = self.alertActions
        let index = sender.tag
        self.dismiss(animated: true) {
            if let actions = allActions, (actions.count - 1) >= index {
                let selectedAction = actions[sender.tag]
                if let onTap = selectedAction.onTap {
                    onTap()
                }
            }
        }
    }
}

