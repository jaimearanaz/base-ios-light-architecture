//
//  SecondViewController.swift
//  clean-architecture
//
//  Created by Jaime Aranaz on 22/12/2021.
//

import Foundation
import UIKit

class SecondViewController: BaseViewController {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var viewModel: SecondViewModel? { didSet { baseViewModel = viewModel } }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        viewModel?.fooMethod()
    }
    
    override func customization() {
        
        super.customization()
        descriptionLabel.text = ""
    }
    
    override func binds() {
    
        super.binds()
        viewModel?.foo.bindAndFire({ foo in
            self.descriptionLabel.text = foo.param1
        })
    }
}
