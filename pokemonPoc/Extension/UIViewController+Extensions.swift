//
//  UIViewController+Extensions.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 04/11/21.
//

import Foundation
import UIKit

extension UIViewController {
    
    /// Hide keyboard when tapped on a UIVIewController if this is open
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.closeKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    /// Selector method called to hide keyboard when open
    ///
    /// - Parameter sender: Gesture sender
    @objc private func closeKeyboard() {
        self.view.endEditing(true)
    }
    
    /// Show an alert with custom title and message with one cancel button that close the alert
    ///
    /// - Parameters:
    ///   - title: Alert title
    ///   - message: Alert message
    ///   - actionButtonTitle: Button title. Optional value if not present the default button title will be Ok
    func showCancelAlert(title: String, message: String, actionButtonTitle: String = "OK") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: actionButtonTitle, style: .cancel) { (done) in
            LOGP("[Alert closed] - \(message)")
        }
        alert.addAction(okAction)
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    /// Show an alert with custom actions
    ///
    /// - Parameters:
    ///   - title: Alert title
    ///   - message: Alert message
    ///   - actions: Array of custom UIAlertAction
    func showCustomActionAlert(title: String, message: String, actions: [UIAlertAction]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for act in actions {
            alert.addAction(act)
        }
        
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}
