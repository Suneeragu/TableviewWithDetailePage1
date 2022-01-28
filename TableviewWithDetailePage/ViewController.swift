//
//  ViewController.swift
//  TableviewWithDetailePage
//
//  Created by Suneetha Ragupatula on 1/25/22.
//https://api.opendota.com/api/heroStats

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var herosTableview: UITableView!
    
    var heros = [HeroStates]()

    override func viewDidLoad() {
        super.viewDidLoad()
        getHeroData()
        
        
    }
}
// Mark Tableview

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heros.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let myCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TableViewCell
        let hero = heros[indexPath.row]
        myCell?.mainNameLabel?.text = hero.localized_name.capitalized
        
        return myCell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowDetails", sender: self)
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Hero Names"
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController{
            destination.heroo = heros[(self.herosTableview.indexPathForSelectedRow?.row)!]
        }
    }
    
}

// Mark API Call

extension ViewController {
    func getHeroData() {
        
        if let url = URL(string: "https://api.opendota.com/api/heroStats") {
           URLSession.shared.dataTask(with: url) { data, response, error in
        if let data = data {
        let jsonDecoder = JSONDecoder()
        do {
        let modelData = try jsonDecoder.decode([HeroStates].self, from: data)
            print(modelData)
            self.heros = modelData
          
            DispatchQueue.main.async {
                self.herosTableview.reloadData()
            }
            
                } catch {
        print(error)
                }
               }
           }.resume()
        }
    }
}

