//
//  YemekTableViewCell.swift
//  TableView Detail
//
//  Created by Serhat on 19.02.2023.
//

import UIKit

protocol YemekTableViewCellProtocol{
    func siparisVer(indexPath:IndexPath)
}

class YemekTableViewCell: UITableViewCell {

    @IBOutlet weak var yemekResimImageView: UIImageView!
    
    @IBOutlet weak var labelYemekAdi: UILabel!
    
    @IBOutlet weak var labelYemekFiyati: UILabel!
    
    var hucreProtocol: YemekTableViewCellProtocol?
    var indexPath: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func btnSiparisVer(_ sender: Any) {
        
        hucreProtocol?.siparisVer(indexPath: indexPath!)
        
    }
}
