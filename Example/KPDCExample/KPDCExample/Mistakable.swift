//
//  Mistakable.swift
//  KPDCExample
//
//  Created by Karun on 17/06/19.
//  Copyright © 2019 KarunPant. All rights reserved.
//

import Foundation
import UIKit
import KPDialogController


struct AvenirFonts {
    static let avenirRegular14 = UIFont.init(name: "Avenir-Roman", size: 14.0)!
    static let avenirBold14 = UIFont.init(name: "Avenir-Heavy", size: 17.0)!
    static let avenirSemiBold20 = UIFont.init(name: "Avenir-Medium", size: 20.0)!
}


struct Colors {
    static let hsDarkBlack : UIColor = UIColor.init(white: 0, alpha: 0.80)
    static let hsMediumBlack : UIColor = UIColor.init(white: 0, alpha: 0.56)
}

protocol Mistakable: KPDAlertable {
    func showAlert()
}

extension Mistakable {
    
    
    var titleAttributes: [NSAttributedString.Key: Any] {
        get {
            return [.font: AvenirFonts.avenirSemiBold20, .kern: 0.2, .foregroundColor: Colors.hsDarkBlack];
        }
        set {}
    }
    var messageAttributes: [NSAttributedString.Key: Any] {
        get {
            return [.font: AvenirFonts.avenirRegular14, .kern: 0.2, .foregroundColor: Colors.hsDarkBlack];
        }
        set {}
    }
    var actionAttributes: [NSAttributedString.Key: Any] {
        get {
            return [.font: AvenirFonts.avenirBold14, .kern: 0.4, .foregroundColor: Colors.hsMediumBlack];
        }
        set {}
    }
    
    func showAlert() {
        let actions: [KPDialogAction] = [KPDialogAction("EXCHANGE ORDER", onTap: { debugPrint("PLACE") }), KPDialogAction("RETURN", onTap: { debugPrint("CANCEL Tapped") })]
        
        self.showKPDialog(title: "Hello", message: "This message is to show that message is available here for you to edit.", actions: actions)
    }
}
