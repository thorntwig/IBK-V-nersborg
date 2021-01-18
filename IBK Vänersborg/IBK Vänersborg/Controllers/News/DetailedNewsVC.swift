//
//  DetailedNewsVC.swift
//  IBK Vänersborg
//
//  Created by Robin Törnqvist on 2020-02-12.
//  Copyright © 2020 Robin Törnqvist. All rights reserved.
//

import UIKit

class DetailedNewsVC: UIViewController, UIScrollViewDelegate {

    var deleget: backButtonDeleget?
    var report: Report!
    let detailNewsView = DetailedNewsView()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        deleget?.setBackButton(to: "transparent")
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    override func loadView() {
        view = detailNewsView
        detailNewsView.configureView(with: report)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailNewsView.scrollView.delegate = self
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if detailNewsView.scrollView.contentOffset.y > (detailNewsView.imageView.frame.height * 0.7) {
                deleget?.setBackButton(to: "normal")
        }
            
        if detailNewsView.scrollView.contentOffset.y < (detailNewsView.imageView.frame.height * 0.7) {
                deleget?.setBackButton(to: "transparent")
        }
    }
}
