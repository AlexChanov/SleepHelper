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


    // MARK: - Properties

	var presenter: MainPresenterProtocol?

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

    // MARK: - Private functions

    private func setupApperance() {
        view.backgroundColor = #colorLiteral(red: 0.8901960784, green: 0.9294117647, blue: 0.968627451, alpha: 1)
        clockBackgroundImage.image = #imageLiteral(resourceName: "Progress bar circle")
        chartView.backgroundColor = .clear

        clockNumberImage.image = #imageLiteral(resourceName: "clockNumberIcon")
        clockNumberImage.tintColor = .black

        setDataCount(Int(2), range: UInt32(100))

        view.addSubview(clockBackgroundImage)
        view.addSubview(chartView)
        view.addSubview(clockNumberImage)
    }

    private func clockBackgroundImageLayout() {
        clockBackgroundImage.frame.size = CGSize(width: 300, height: 300)
        clockBackgroundImage.center = view.center

        clockNumberImage.frame.size = CGSize(width: 160, height: 160)
        clockNumberImage.center = view.center

        chartView.frame.size = CGSize(width: 340, height: 650)
        chartView.center = CGPoint(x: view.center.x, y: view.center.y + 15)
    }

    func setupPieChartView() {
        chartView.usePercentValuesEnabled = true
        chartView.drawSlicesUnderHoleEnabled = false
        chartView.holeRadiusPercent = 0.80
        chartView.transparentCircleRadiusPercent = 0.61
        chartView.chartDescription?.enabled = false
        chartView.setExtraOffsets(left: 5, top: 10, right: 5, bottom: 5)
        chartView.holeColor = .clear //#colorLiteral(red: 0.8901960784, green: 0.9294117647, blue: 0.968627451, alpha: 1)
//        chartView.ho

        chartView.drawCenterTextEnabled = false


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

        chartView.drawHoleEnabled = true
        chartView.rotationAngle = 0
        chartView.rotationEnabled = true
        chartView.highlightPerTapEnabled = true

//        let l = chartView.legend
//        l.horizontalAlignment = .right
//        l.verticalAlignment = .top
//        l.orientation = .vertical
//        l.drawInside = false
//        l.xEntrySpace = 7
//        l.yEntrySpace = 0
//        l.yOffset = 0
//        chartView.legend = l


        chartView.delegate = self

//        let l = chartView.legend
//        l.horizontalAlignment = .right
//        l.verticalAlignment = .top
//        l.orientation = .vertical
//        l.xEntrySpace = 7
//        l.yEntrySpace = 0
//        l.yOffset = 0
//        chartView.legend = l

        // entry label styling
        chartView.entryLabelColor = .white
        chartView.entryLabelFont = .systemFont(ofSize: 12, weight: .light)


        chartView.animate(xAxisDuration: 1.4, easingOption: .easeOutBack)
    }

func setDataCount(_ count: Int, range: UInt32) {
    let entries = (0..<count).map { (i) -> PieChartDataEntry in
        // IMPORTANT: In a PieChart, no values (Entry) should have the same xIndex (even if from different DataSets), since no values can be drawn above each other.
        return PieChartDataEntry(value: Double(arc4random_uniform(range) + range / 5),
                                 label: "",
                                 icon: nil)
    }

    let set = PieChartDataSet(entries: entries, label: "Election Results")
    set.drawIconsEnabled = false
    set.sliceSpace = 2
//    set.label.


    set.colors = [.clear, .green]
        //ChartColorTemplates.vordiplom()
//        + ChartColorTemplates.joyful()
//        + ChartColorTemplates.colorful()
//        + ChartColorTemplates.liberty()
//        + ChartColorTemplates.pastel()
//        + [UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1)]

    let data = PieChartData(dataSet: set)

    let pFormatter = NumberFormatter()
    pFormatter.numberStyle = .percent
    pFormatter.maximumFractionDigits = 1
    pFormatter.multiplier = 1
    pFormatter.percentSymbol = " %"
//    data.setValueFormatter(DefaultValueFormatter(formatter: pFormatter))

    data.setValueFont(.systemFont(ofSize: 11, weight: .light))
    data.setValueTextColor(.white)

    chartView.data = data
    chartView.highlightValues(nil)
}
}

extension MainViewController: ChartViewDelegate {

}

