//
//  BaseViewController.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 04/11/21.
//

import UIKit

class BaseViewController: UIViewController {

    private var activityIndicator: UIActivityIndicatorView!
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if #available(iOS 13, *) {
            activityIndicator = UIActivityIndicatorView(style: .large)
        } else {
            activityIndicator = UIActivityIndicatorView()
        }
        
        hideKeyboardWhenTappedAround()
        
        view.addSubview(activityIndicator)

        activityIndicator.color = .white
        activityIndicator.hidesWhenStopped = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
    }
    
    /// Show activity
    func showLoadingActivity() {
        DispatchQueue.main.async {
            self.view.bringSubviewToFront(self.activityIndicator)
            self.activityIndicator.startAnimating()
            self.activityIndicator.isHidden = false
        }
    }

    /// Hide activity
    func hideLoadingActivity() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
        }
    }

}
