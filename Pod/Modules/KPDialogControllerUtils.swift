//
//  KPDAlertable.swift
//  KPDAlertable
//
//  Created by Karun on 10/06/19.
//  Copyright © 2019 KarunPant. All rights reserved.
//

import Foundation
import UIKit

final class BundleProvider {
    static var shared: BundleProvider = BundleProvider()
    private var _bundle: Bundle? = nil
    var bundle: Bundle? {
        get {
            if _bundle == nil, let resourceBundle = Bundle.init(identifier: "org.cocoapods.KPDialogController") {
                if let resourcesBundleUrl = resourceBundle.resourceURL?.appendingPathComponent("KPDialogController.bundle") {
                    _bundle = Bundle(url: resourcesBundleUrl)
                }
            }
            return _bundle
        }
    }
    private init() {
        
    }
}

public class KPDialogAction {
    var title: String
    var onTap: (()->())?
    var attributedTitle: NSAttributedString!
    public init(_ name: String, onTap: (() -> ())?) {
        self.title = name
        self.onTap = onTap
    }
    
}

public protocol KPDAlertable: UIViewController {
    var titleAttributes: [NSAttributedString.Key: Any] { get set }
    var messageAttributes: [NSAttributedString.Key: Any] { get set }
    var actionAttributes: [NSAttributedString.Key: Any] { get set }
    var alertBGColor: UIColor { get set }
    
    
    /// Method will be used for creating and presenting dialog.
    ///
    /// - Parameters:
    ///   - title: header title to be shown.
    ///   - message: description of alert.
    ///   - actions: list of KPDialogAction [KPDialogAction("<title>", onTap: { debugPrint("action Tapped") })]
    func showKPDialog(title: String?, message: String?, actions: [KPDialogAction]?)
}

public extension KPDAlertable {
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
    
    private func getAttributedActions(_ actions: [KPDialogAction]?) -> [KPDialogAction]? {
        if let actions = actions {
            var attributedActions: [KPDialogAction] = [KPDialogAction]()
            actions.forEach({ action in
                if let attributedAction = getAttributed(action.title, attributes: actionAttributes) {
                    action.attributedTitle = attributedAction
                    attributedActions.append(action)
                }
            })
            return attributedActions
        }
        return nil
    }
    
    func showKPDialog(title: String?, message: String?, actions: [KPDialogAction]?) {
        if let resourceBundle = BundleProvider.shared.bundle {
            let storyBoard = UIStoryboard.init(name: "KPDC", bundle: resourceBundle)
            if let alertVC = storyBoard.instantiateInitialViewController() as? KPDialogController {
                alertVC.alertBGColor = alertBGColor
                alertVC.initialize(title: getAttributed(title, attributes: titleAttributes),
                                   message: getAttributed(message, attributes: messageAttributes),
                                   actions: getAttributedActions(actions))
                alertVC.modalPresentationStyle = .overCurrentContext
                alertVC.modalTransitionStyle = .crossDissolve
                self.present(alertVC, animated: true, completion: nil)
            }
        }
    }
}
