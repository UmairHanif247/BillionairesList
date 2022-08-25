//
//  PersonsTableViewCell.swift
//  Billionaires
//
//  Created by Umair Hanif on 22/08/2022.
//

import UIKit
import SDWebImage

class PersonsTableViewCell: UITableViewCell {
    
    //MARK: - @IBOutlet
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var rank: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var worth: UILabel!
    @IBOutlet weak var source: UILabel!
    @IBOutlet weak var age: UILabel!
    
    
    //MARK: - Variables
    var data = HomeViewModel()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.mainView.layer.borderColor = UIColor.systemGreen.cgColor
        self.mainView.layer.borderWidth = 1
        self.mainView.layer.cornerRadius = 10
        self.rank.layer.cornerRadius = self.rank.frame.size.height / 2
        self.avatar.layer.cornerRadius = 30
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    //MARK: - Custom Functions
    internal func assignData() {
        
        self.avatar.sd_setImage(with: URL(string: data.avatar ?? ""), placeholderImage: UIImage(systemName: "person.circle"))
        
        self.name.text = data.fullName
        self.rank.text = "\(data.rank ?? 0)"
        self.country.text = data.countryOfCitizenship
        self.worth.text = "$ \(data.netWorthInUSD ?? "Not Available")"
        self.source.text = data.source
        self.age.text = data.age
    }
    
    
    
    
    
    
    
}


extension UIImageView {

    func setCustomImage(_ imgURLString: String?) {
        guard let imageURLString = imgURLString else {
            self.image = UIImage(named: "default.png")
            return
        }
        DispatchQueue.global().async { [weak self] in
            let data = try? Data(contentsOf: URL(string: imageURLString)!)
            DispatchQueue.main.async {
                self?.image = data != nil ? UIImage(data: data!) : UIImage(named: "default.png")
            }
        }
    }
}
