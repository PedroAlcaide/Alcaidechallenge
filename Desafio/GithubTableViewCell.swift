//
//  GithubTableViewCell.swift
//  Desafio
//
//  Created by Pedro Alcaide on 22/10/2019.
//  Copyright © 2019 Pedro Alcaide. All rights reserved.
//

import UIKit

class GithubTableViewCell: UITableViewCell {

    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userGitName: UILabel!
    @IBOutlet weak var userStars: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        userPhoto.layer.cornerRadius = userPhoto.frame.width / 2
        userPhoto.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
