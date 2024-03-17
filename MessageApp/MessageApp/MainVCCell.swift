//
//  MainVCCell.swift
//  MessageApp
//
//  Created by Abdusamad Mamasoliyev on 17/03/24.
//

import UIKit

class MainVCCell: UITableViewCell {

    static let identifeir = "MainVCCell"
    
    let image = UIImageView()
    let title = UILabel()
    let desc = UILabel()
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        cellStyle()
        cellLayout()
    }
    func cellStyle() {
        
        contentView.backgroundColor = .white
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .gray
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 35
        image.image = UIImage(systemName: "person.circle")
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.systemFont(ofSize: 20, weight: .black)
        title.textColor = .black
        title.text = "Apple.com"
        
        desc.translatesAutoresizingMaskIntoConstraints = false
        desc.font = UIFont.systemFont(ofSize: 15)
        desc.textColor = .gray
        desc.numberOfLines = 2
        desc.text = "Your iphone 15 pro max 1 TB and price 1500$"
        
    }
    
    func cellLayout() {
        contentView.addSubview(image)
        contentView.addSubview(title)
        contentView.addSubview(desc)
        
        NSLayoutConstraint.activate([
        
            image.heightAnchor.constraint(equalToConstant: 70),
            image.widthAnchor.constraint(equalToConstant: 70),
            image.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            title.leftAnchor.constraint(equalTo: image.rightAnchor, constant: 8),
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 18),
            title.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8),
            
            desc.leftAnchor.constraint(equalTo: image.rightAnchor, constant: 8),
            desc.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            desc.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8),
        ])
    }

}
