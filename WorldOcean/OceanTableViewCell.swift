//
//  OceanTableViewCell.swift
//  WorldOcean
//
//  Created by Aslan  on 15.12.2024.
//

import UIKit
import SDWebImage

class OceanTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var vallueLabel: UILabel!
    @IBOutlet weak var averageDepthLabel: UILabel!
    
    @IBOutlet weak var urlImageView: UIImageView!
    @IBOutlet weak var pictureImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        urlImageView.layer.cornerRadius = 16
        pictureImageView.layer.cornerRadius = 21
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(ocean: WorldOcean){
        nameLabel.text = ocean.name
        vallueLabel.text = ocean.vallue
        averageDepthLabel.text = ocean.AverageDepth
        
        urlImageView.sd_setImage(with: URL(string: ocean.URL))
        pictureImageView.sd_setImage(with: URL(string: ocean.picture))
    }

}
