//
//  DetailViewController.swift
//  TableviewWithDetailePage
//
//  Created by Suneetha Ragupatula on 1/26/22.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var attributeLable: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var legsLabel: UILabel!
    
    var heroo:HeroStates?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = heroo?.localized_name
        attributeLable.text = heroo?.primary_attr
        attackLabel.text = heroo?.attack_type
        legsLabel.text = "\((heroo?.legs)!)"
        
        let urlStr = "https://api.opendota.com"+(heroo?.img)!
        let _url = URL(string: urlStr)
        heroImage?.downloaded(from: _url!)
        

    }
    

  
}
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
