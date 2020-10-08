//
//  postCell.swift
//  Reddit
//
//  Created by Valeriia Zakharova on 01.09.2020.
//  Copyright © 2020 Valeriia Zakharova. All rights reserved.
//

import UIKit

protocol PostCellDelegate: class {
    func getFullPic(cell: PostCell)
    func awardTapped(cell: PostCell)
    func shareTapped(cell: PostCell)
    func commentsTapped(cell: PostCell, button: UIButton)
    func scoreTapped(cell: PostCell)
}

class PostCell: UITableViewCell {
    
    //MARK: - Outlets
    
    @IBOutlet weak var groupnameLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var timeagoLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var contentImageView: UIImageView!
    
    @IBOutlet weak var userAvatarImageView: UIImageView!
    
    @IBOutlet weak var scoreButton: UIButton!
    
    @IBOutlet weak var commentsButton: UIButton!
    
    weak var delegate: PostCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    override func prepareForReuse() {
        
    }
    

    @IBAction func getFullPic(_ sender: UIButton) {
        delegate?.getFullPic(cell: self)
    }
    
    @IBAction func awardTapped(_ sender: UIButton) {
        delegate?.awardTapped(cell: self)
    }
    
    @IBAction func shareTapped(_ sender: UIButton) {
        delegate?.shareTapped(cell: self)
    }
    
    @IBAction func commentsTapped(_ sender: UIButton) {
        delegate?.commentsTapped(cell: self, button: sender)
    }
    
    @IBAction func scoreTapped(_ sender: UIButton) {
        delegate?.scoreTapped(cell: self)
    }
    
}
