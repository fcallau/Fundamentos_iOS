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
        
        self.title = model.name
    }
    
    // Chapuza de los de Cupertino (relacionada con los nil)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        // Creamos botones en la barra del navigationController
        let wiki = UIBarButtonItem(title: "Wiki",
                                   style: .plain,
                                   target: self,
                                   action: #selector(displayWiki))
        
        let members = UIBarButtonItem(title: "Members",
                                      style: .plain,
                                      target: self,
                                      action: #selector(displayMembers))
        
        // Añadimos
        // navigationItem.rightBarButtonItems = [wiki, members]
        navigationItem.rightBarButtonItems = [members, wiki]
    }
    
    @objc func displayWiki() {
        // Creamos un wikiVC
        let wikiVC = WikiViewController(model: model)
        
        // Lo cargamos en el navigation
        navigationController?.pushViewController(wikiVC, animated: true)
    }
    
    @objc func displayMembers() {
        // Creamos el controlador
        let dataSource = DataSources.membersDataSource(model: model.sortedMembers())
        let delegate = Delegates.membersDelegate(model: model.sortedMembers())
        let membersVC = ArrayTableViewController(dataSource: dataSource,
                                                 delegate: delegate,
                                                 title: "Members",
                                                 style: .plain)
        
        navigationController?.pushViewController(membersVC, animated: true)

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
        
        setupUI()
        
        syncViewWithModel()
    }
}
