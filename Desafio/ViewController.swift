//
//  ViewController.swift
//  Desafio
//
//  Created by Pedro Alcaide on 15/10/2019.
//  Copyright © 2019 Pedro Alcaide. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private(set) weak var tableView: UITableView!
    @IBOutlet private(set) weak var viewLoading: UIView!
    @IBOutlet private(set) weak var loading: UIActivityIndicatorView!
    
    var refreshControl = UIRefreshControl()
    var user: [GHItem] = []
    var apiResource = ApiResourcer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.setup()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup() {
        tableView.rowHeight = UITableViewAutomaticDimension
        self.viewLoading.isHidden = false
        self.loading.startAnimating()
        self.takeGithubInfo()
        
        refreshControl.attributedTitle = NSAttributedString(string: "Atualizando informações")
        refreshControl.backgroundColor = UIColor.lightGray
        refreshControl.addTarget(self, action: #selector(refresh), for: UIControlEvents.valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    func takeGithubInfo() {
        apiResource.getTopRatedSwiftRepositories(page: 1) { (itens) in
            self.user = itens
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
            self.viewLoading.isHidden = true
            self.loading.stopAnimating()
        }
    }
    
    @objc func refresh(sender: AnyObject) {
        self.takeGithubInfo()
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GithubTableViewCell
        
        let userInfo = user[indexPath.row]
        
        cell.userName.text = userInfo.fullName
        cell.userPhoto.image = userInfo.avatarUrl.transformUrlinImage()
        cell.userStars.text = String(userInfo.starsCount)
        cell.userGitName.text = userInfo.login
        return cell
    }
    
}

extension ViewController: UITableViewDelegate { }

extension String {
    
    func transformUrlinImage() -> UIImage? {
        let url = URL(string: self)
        if let data = try? Data(contentsOf: url!) {
            let image = UIImage(data: data)
            return image
        }
        
        return nil
    }
    
}


