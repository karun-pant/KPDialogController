//
//  GYAlertContorllerUtils.swift
//  GYAlertController
//
//  Created by GeekYondaime on 05/06/19.
//  Copyright © 2019 GeekYondaime. All rights reserved.
//

import Foundation
import UIKit

protocol KPDAlertable: UIViewController {
    var titleAttributes: [NSAttributedString.Key: Any] { get set }
    var messageAttributes: [NSAttributedString.Key: Any] { get set }
    var actionAttributes: [NSAttributedString.Key: Any] { get set }
    var alertBGColor: UIColor { get set }
    func showKPDialog(title: String?, message: String?, actions: [String: (()->())?]?)
}

extension KPDAlertable {
    var titleAttributes: [NSAttributedString.Key: Any] {
        get {
            return [.font: UIFont.boldSystemFont(ofSize: 20), .kern: 0.2, .foregroundColor: UIColor.black];
        }
        set {}
    }
    var messageAttributes: [NSAttributedString.Key: Any] {
        get {
            return [.font: UIFont.systemFont(ofSize: 14), .kern: 0.2, .foregroundColor: UIColor.black];
        }
        set {}
    }
    var actionAttributes: [NSAttributedString.Key: Any] {
        get {
            return [.font: UIFont.boldSystemFont(ofSize: 16), .kern: 0.4, .foregroundColor: UIColor(white: 0, alpha: 0.56)];
        }
        set {}
    }
    var alertBGColor: UIColor { get { return .white } set {} }
    
    private func getAttributed(_ str: String?, attributes: [NSAttributedString.Key: Any]) -> NSAttributedString? {
        if let str = str {
            return NSAttributedString.init(string: str, attributes: attributes)
        }
        return nil
    }
    
    private func getAttributedActions(_ actions: [String: (()->())?]?) -> [NSAttributedString: (()->())?]? {
        if let actions = actions {
            var attributedActions: [NSAttributedString: (()->())?] = [NSAttributedString: (()->())?]()
            actions.keys.forEach({ key in
                if let attributedAction = getAttributed(key, attributes: actionAttributes) {
                    attributedActions[attributedAction] = actions[key]
                }
            })
            return attributedActions
        }
        return nil
    }
    
    func showKPDialog(title: String?, message: String?, actions: [String: (()->())?]?) {
        let storyBoard = UIStoryboard.init(name: "KPDC", bundle: nil)
        if let alertVC = storyBoard.instantiateInitialViewController() as? KPDialogController {
            alertVC.alertBGColor = alertBGColor
            alertVC.initialize(title: getAttributed(title, attributes: titleAttributes),
                               message: getAttributed(message, attributes: messageAttributes),
                               actions: getAttributedActions(actions))
            self.present(alertVC, animated: true, completion: nil)
        }
    }
    
}
