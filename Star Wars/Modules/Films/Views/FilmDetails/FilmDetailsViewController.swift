//
//  FilmDetailsViewController.swift
//  Star Wars
//
//  Created by TejaDanasvi on 20/11/21.
//

import UIKit

final class FilmDetailsViewController: UIViewController {
    
    @IBOutlet weak var filmTitle: UILabel!
    @IBOutlet weak var episodeId: UILabel!
    @IBOutlet weak var openingCrawl: UILabel!
    @IBOutlet weak var director: UILabel!
    @IBOutlet weak var producer: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    
    var viewModel: IFilmsViewModel
    
    init(viewModel: IFilmsViewModel = FilmsViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: "FilmDetailsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        setup()
    }

    func setup() {
        guard let film = viewModel.filmDetails else { return }
        self.filmTitle.text = film.title
        self.episodeId.text = "\(film.episodeId)"
        self.openingCrawl.text = film.openingCrawl
        self.director.text = film.director
        self.producer.text = film.producer
        self.releaseDate.text = film.releaseDate
    }
}
