//
//  KisiTableViewCell.swift
//  PhoneBook
//
//  Created by Serhat on 2.08.2023.
//

import UIKit

class KisiTableViewCell: UITableViewCell {

    @IBOutlet weak var kisiBilgiLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
