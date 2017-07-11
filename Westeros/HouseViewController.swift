//
//  HouseViewController.swift
//  Westeros
//
//  Created by Francesc Callau Brull on 10/7/17.
//  Copyright © 2017 fcallau. All rights reserved.
//

import UIKit

class HouseViewController: UIViewController {

    @IBOutlet weak var houseNameView: UILabel!
    @IBOutlet weak var wordsTextView: UILabel!
    @IBOutlet weak var sigilImageView: UIImageView!
    
    let model: House
    
    init(model: House) {
        self.model = model
        
        super.init(nibName: nil, bundle: nil)
        
        self.tabBarItem = UITabBarItem(title: model.name, image: UIImage(named: model.nameIcon), selectedImage: nil)
    }
    
    // Chapuza de los de Cupertino (relacionada con los nil)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func syncViewWithModel() {
        // model -> view
        houseNameView.text = "House \(model.name)"
        sigilImageView.image = model.sigil.image
        wordsTextView.text = model.words
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        syncViewWithModel()
    }

}
