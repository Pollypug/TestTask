//
//  BaseTableViewController.swift
//  TestTask
//
//  Created by Polina on 8/18/19.
//  Copyright © 2019 Polina. All rights reserved.
//

import UIKit
import RxSwift

class BaseTableViewController: UITableViewController {

    let disposeBag = DisposeBag()

    let loader = UIActivityIndicatorView(activityIndicatorStyle: .gray)

    override func viewDidLoad() {
        super.viewDidLoad()

        setupLoader()
        setupUI()
        setupBindings()
    }

    func setupUI() {}

    func setupBindings() {}

    func animateLoader(_ animate: Bool) {
        if animate {
            DispatchQueue.main.async {
                self.loader.startAnimating()
            }
        } else {
            DispatchQueue.main.async {
                self.loader.stopAnimating()
            }
        }
    }

    private func setupLoader() {
        loader.isHidden = true
        loader.hidesWhenStopped = true
        view.addSubviewAndCenter(loader)
    }

}
