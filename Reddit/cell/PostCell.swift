//
//  postCell.swift
//  Reddit
//
//  Created by Valeriia Zakharova on 01.09.2020.
//  Copyright © 2020 Valeriia Zakharova. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    //MARK: - Outlets
    
    @IBOutlet weak var dateofPostLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var commentsLabel: UILabel!
    
    @IBOutlet weak var contentImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
