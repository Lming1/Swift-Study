//
//  MainViewController.swift
//  Include AI
//
//  Created by 이민혁 on 2017. 8. 7..
//  Copyright © 2017년 이민혁. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let sampleData = SampleData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView(frame: .zero)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sampleData.samples.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainFeatureCell", for: indexPath) as! MainFeatureCell
        
        let sample = self.sampleData.samples[indexPath.row]
        cell.titleLabel.text = sample.title
        cell.descriptionLable.text = sample.description
        cell.featureImageView.image = UIImage(named: sample.image)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0: self.performSegue(withIdentifier: "photoObjectDetection", sender: nil)
        case 1: self.performSegue(withIdentifier: "realTimeObjectDetection", sender: nil)
        case 2: self.performSegue(withIdentifier: "facialAnalysis", sender: nil)
        default:
            return
        }
    }

}
