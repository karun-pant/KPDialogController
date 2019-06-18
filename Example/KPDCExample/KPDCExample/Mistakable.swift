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

protocol Mistakable: KPDAlertable {
    func showAlert()
}

extension Mistakable {
    func showAlert() {
        let actions = ["Ok": {
            debugPrint("OK Pressed")
            },
                       "Cancel": {
                        debugPrint("Cancel Pressed")
            }];
        self.showKPDialog(title: "Hello", message: "This message is to show that message is available here for you to edit.", actions: actions)
    }
}