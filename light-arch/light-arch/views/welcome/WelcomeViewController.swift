//
//  WelcomeViewController.swift
//  light-arch
//
//  Created by Jaime Aranaz on 27/12/2021.
//

import Foundation
import UIKit

class WelcomeViewController: BaseViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var nextButton: UIButton!
    
    var viewModel: WelcomeViewModel? { didSet { baseViewModel = viewModel } }
    var toSecondSegue = "toSecondSegue"
            
    override func viewDidLoad() {
        
        super.viewDidLoad()
        viewModel?.fooMethod()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        switch (segue.identifier) {
        case toSecondSegue:
            injector?.injectSecond(withSegue: segue)
        default:
            break
        }
    }

    override func localization() {
        
        super.localization()
        titleLabel.text = "welcome".localized
        nextButton.setTitle("next".localized, for: .normal)
    }
    
    override func customization() {

        super.customization()
        titleLabel.font = UIFont.bold(withSize: 17)
        titleLabel.textColor = UIColor.party
        descriptionLabel.text = ""
        nextButton.isEnabled = false
    }
    
    override func binds() {
    
        super.binds()

        viewModel?.foo.bindAndFire({ foo in
            self.descriptionLabel.text = foo.param1
        })
    }
    
    override func handleSuccess() {
        nextButton.isEnabled = true
    }
    
    override func handleError(_ error: Error) {
        
        nextButton.isEnabled = false
        switch error {
        case AppError.noInternet:
            self.descriptionLabel.text = "no_internet".localized
        default:
            self.descriptionLabel.text = "error".localized
        }
    }
    
    override func startLoading() {
        
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    
    override func stopLoading() {
        
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
    
    @IBAction func didSelectNext(_ sender: Any) {
        performSegue(withIdentifier: toSecondSegue, sender: self)
    }
}
