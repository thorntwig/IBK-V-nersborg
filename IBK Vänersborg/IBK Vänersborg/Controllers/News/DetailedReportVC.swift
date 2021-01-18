//
//  DetaildNewsVC.swift
//  IBK Vänersborg
//
//  Created by Robin Törnqvist on 2020-02-08.
//  Copyright © 2020 Robin Törnqvist. All rights reserved.
//

import UIKit

class DetailedReportVC: UIViewController, UIScrollViewDelegate {
    
    var deleget: backButtonDeleget?
    var report: Report!
    let detailedView = DetailedReportView()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        deleget?.setBackButton(to: "transparent")
        setNavBarAndBackButton()
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
    override func loadView() {
        view = detailedView
        detailedView.configureView(with: report)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailedView.scrollView.delegate = self
        
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        setNavBarAndBackButton()
    }
    
    func setNavBarAndBackButton() {
        if detailedView.scrollView.contentOffset.y > (detailedView.imageView.frame.height * 0.7) {
            deleget?.setBackButton(to: "normal")
            navigationItem.title = report.title
        }
        
        if detailedView.scrollView.contentOffset.y < (detailedView.imageView.frame.height * 0.7) {
            deleget?.setBackButton(to: "transparent")
            navigationItem.title = nil
        }
    }
    
}
