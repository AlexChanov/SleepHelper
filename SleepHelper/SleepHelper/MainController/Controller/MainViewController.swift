//
//  ViewController.swift
//  SleepHelper
//
//  Created by Чанов Алексей Михайлович on 03.10.2020.
//

import UIKit

protocol MainViewProtocol: class {

}

final class MainViewController: UIViewController, MainViewProtocol{

    weak var presenter: MainPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}

