//
//  ViewController.swift
//  SleepHelper
//
//  Created by Чанов Алексей Михайлович on 03.10.2020.
//

import UIKit
import Charts

protocol MainViewProtocol: class {

}

final class MainViewController: UIViewController, MainViewProtocol{

    // MARK: - Views

    let chartView = PieChartView()
    let addButton = UIButton(type: .system)
    let clockBackgroundImage = UIImageView()
    let clockNumberImage = UIImageView()
    let profileButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
    let settingsButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))

    let wakeUpLabel = UILabel()
    let bedTimeLabel = UILabel()

    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [wakeUpLabel, bedTimeLabel])
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 50
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    // MARK: - Properties

	var presenter: MainPresenterProtocol?
    let clockHelper = ClockHelper()
    let startSleepHour: Float = 24.00
    var wakeUpTime: CGFloat = 7.00

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupApperance()
        setupPieChartView()
    }

    override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
        clockBackgroundImageLayout()
	}

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    // MARK: - Private functions

    private func setupApperance() {
        view.backgroundColor = #colorLiteral(red: 0.8901960784, green: 0.9294117647, blue: 0.968627451, alpha: 1)

        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = UIColor.clear

        wakeUpLabel.text = "Wake up \n \(wakeUpTime)"
        wakeUpLabel.numberOfLines = 0
        wakeUpLabel.textAlignment = .center

        bedTimeLabel.text = "BedTime \n \(startSleepHour)"
        bedTimeLabel.numberOfLines = 0
        bedTimeLabel.textAlignment = .center

        clockBackgroundImage.image = #imageLiteral(resourceName: "Progress bar circle")

        clockNumberImage.image = #imageLiteral(resourceName: "clockNumberIcon")
        clockNumberImage.tintColor = .black

        addButton.setImage(#imageLiteral(resourceName: "addButtomIcon"), for: .normal)

        setDataCount(Int(3), range: UInt32(24))

        profileButton.setBackgroundImage(#imageLiteral(resourceName: "arrow-left-line"), for: .normal)
        profileButton.addTarget(self, action: #selector(showProfile), for: .touchUpInside)

        settingsButton.setBackgroundImage(#imageLiteral(resourceName: "heart-fill"), for: .normal)
        settingsButton.addTarget(self, action: #selector(showSettings), for: .touchUpInside)

        view.addSubview(clockBackgroundImage)
        view.addSubview(chartView)
        view.addSubview(clockNumberImage)
        view.addSubview(addButton)
        view.addSubview(profileButton)
        view.addSubview(settingsButton)
        view.addSubview(stackView)
    }

    @objc
    private func showProfile() {

    }

    @objc
    private func showSettings() {

    }

    private func clockBackgroundImageLayout() {
        stackView.center = CGPoint(x: view.center.x, y: profileButton.frame.maxY + 62)
        stackView.frame.size = CGSize(width: view.bounds.width - 20, height: 50)

        profileButton.frame = CGRect(x: 40, y: 30 + view.safeAreaInsets.top, width: 30, height: 30)
        settingsButton.frame = CGRect(x: Int(view.bounds.maxX - 40 - profileButton.bounds.width), y: 30 + Int(view.safeAreaInsets.top), width: 30, height: 30)

        clockBackgroundImage.frame.size = CGSize(width: 300, height: 300)
        clockBackgroundImage.center = view.center

        clockNumberImage.frame.size = CGSize(width: 160, height: 160)
        clockNumberImage.center = view.center

        chartView.frame.size = CGSize(width: 340, height: 650)
        chartView.center = CGPoint(x: view.center.x, y: view.center.y + 15)

        addButton.frame.size = CGSize(width: 100, height: 100)
        addButton.center = CGPoint(x: view.center.x, y: view.bounds.maxY - addButton.bounds.height)
    }

    func setupPieChartView() {
        chartView.backgroundColor = .clear
        chartView.usePercentValuesEnabled = true
        chartView.drawSlicesUnderHoleEnabled = false
        chartView.holeRadiusPercent = 0.70
        chartView.transparentCircleRadiusPercent = 0.61
        chartView.chartDescription?.enabled = false
        chartView.setExtraOffsets(left: 5, top: 10, right: 5, bottom: 5)
        chartView.holeColor = .clear
        chartView.drawCenterTextEnabled = false
        chartView.drawHoleEnabled = true
        chartView.drawEntryLabelsEnabled = false
        chartView.rotationAngle = CGFloat(clockHelper.getAngelFromHour(startSleepHour))
        chartView.rotationEnabled = true
        chartView.highlightPerTapEnabled = true

        let paragraphStyle = NSParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
        paragraphStyle.lineBreakMode = .byTruncatingTail
        paragraphStyle.alignment = .center

        let centerText = NSMutableAttributedString(string: "Charts\nby Daniel Cohen Gindi")
        centerText.setAttributes([.font : UIFont(name: "HelveticaNeue-Light", size: 13)!,
                                  .paragraphStyle : paragraphStyle], range: NSRange(location: 0, length: centerText.length))
        centerText.addAttributes([.font : UIFont(name: "HelveticaNeue-Light", size: 11)!,
                                  .foregroundColor : UIColor.gray], range: NSRange(location: 10, length: centerText.length - 10))
        centerText.addAttributes([.font : UIFont(name: "HelveticaNeue-Light", size: 11)!,
                                  .foregroundColor : UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1)], range: NSRange(location: centerText.length - 19, length: 19))
        chartView.centerAttributedText = centerText;

        chartView.delegate = self

        chartView.entryLabelColor = .white
        chartView.entryLabelFont = .systemFont(ofSize: 12, weight: .light)


        chartView.animate(xAxisDuration: 1.4, easingOption: .easeOutBack)
    }

func setDataCount(_ count: Int, range: UInt32) {
    let entries = (0..<count).map { (i) -> PieChartDataEntry in
        // IMPORTANT: In a PieChart, no values (Entry) should have the same xIndex (even if from different DataSets), since no values can be drawn above each other.
        return PieChartDataEntry(value: Double(arc4random_uniform(range) + range / 5),
                                 label: nil,
                                 icon: nil)
    }

    let set = PieChartDataSet(entries: entries, label: "")
    set.drawIconsEnabled = false
    set.sliceSpace = 2
    set.colors = [.green, .clear, .red]

    let data = PieChartData(dataSet: set)
    data.setValueTextColor(.clear)

    chartView.data = data
    chartView.highlightValues(nil)
}
}

extension MainViewController: ChartViewDelegate {}
