//
//  SeasonViewController.swift
//  Westeros
//
//  Created by Francesc Callau Brull on 25/8/17.
//  Copyright © 2017 fcallau. All rights reserved.
//

import UIKit

class SeasonViewController: UIViewController {
    @IBOutlet weak var airDateView: UILabel!
    @IBOutlet weak var episodesView: UILabel!
    
    let model: Season
    
    init(model: Season) {
        self.model = model
        
        super.init(nibName: nil, bundle: nil)
        
        self.title = model.name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func displayEpisodes() {
        let episodes = model.sortedEpisodes()
        
        let episodeDataSource = DataSources.episodesDataSource(model: episodes)
        let episodeDelegate = Delegates.episodesDelegate(model: episodes)
        let episodesVC = ArrayTableViewController(dataSource: episodeDataSource,
                                                  delegate: episodeDelegate,
                                                  title: "Episodes",
                                                  style: .plain)
        
        navigationController?.pushViewController(episodesVC, animated: true)
    }
    
    func setupUI() {
        let episodes = UIBarButtonItem(title: "Episodes",
                                       style: .plain,
                                       target: self,
                                       action: #selector(displayEpisodes))
        
        navigationItem.rightBarButtonItem = episodes
    }
    
    func syncViewWithModel() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        
        // model -> view
        airDateView.text = "Air date: \(dateFormatter.string(from: model.airDate))"
        episodesView.text = "\(model.count) episodes"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        syncViewWithModel()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
