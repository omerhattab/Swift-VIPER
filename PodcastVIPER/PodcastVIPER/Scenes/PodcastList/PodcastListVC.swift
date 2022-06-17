//
//  ViewController.swift
//  PodcastVIPER
//
//  Created by omer-mac on 22.04.2022.
//

import UIKit

class PodcastListVC: UIViewController, PodcastListViewProtocol {
    
    @IBOutlet weak var tableView: UITableView!
  
    
    private var podcast : [PodcastPresentation] = []
    var presenter: PodcastListPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let presenter = presenter{
            presenter.load()
        }
    }
    
    func handleOutput(_ output: PodcastListPresenterOutput) {
        switch output {
        case .updateTitle(let title):
            self.title = title
        case .setLoading(let isLoading):
            print(isLoading)
//            UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
        case .showPodcastList(let podcast):
            self.podcast = podcast
            tableView.reloadData()
        }
    }
}

extension PodcastListVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Pods ", podcast)
        return podcast.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = podcast[indexPath.row].title
        cell.detailTextLabel?.text = podcast[indexPath.row].detail
        return cell
    }
}

