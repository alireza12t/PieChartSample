//
//  ViewController.swift
//  Test-PieChart
//
//  Created by Alireza on 12/7/21.
//

import UIKit
import Charts

class ViewController: UIViewController {
    
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var chartView: PieChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChart()
        button.drawGradient(colors: [.blue, .systemPink], cornerRadius: 6)
        lineView.drawGradient(colors: [.white, .systemGray, .white], isVertical: false)
    }
    
    func setupChart() {
        chartView.legend.enabled = false
        chartView.drawHoleEnabled = false
        chartView.rotationEnabled = false
        chartView.rotationAngle = 0
        chartView.isUserInteractionEnabled = false
        
        let dataSet = PieChartDataSet(entries: [
            PieChartDataEntry(value: 9),
            PieChartDataEntry(value: 12),
            PieChartDataEntry(value: 34),
            PieChartDataEntry(value: 56)
        ], label: nil)
        dataSet.colors = [
            .red,
            .green,
            .purple,
            .systemPink
        ]
        
        dataSet.drawValuesEnabled = false
        chartView.data = PieChartData(dataSet: dataSet)
    }
}

extension UIView {
    func drawGradient(colors: [UIColor], cornerRadius: CGFloat = 0, isVertical: Bool = true) {
        // Apply Gradient Color
        let gradientLayer:CAGradientLayer = CAGradientLayer()
        gradientLayer.frame.size = self.frame.size
        gradientLayer.colors =
        colors.compactMap({$0.cgColor})
        gradientLayer.cornerRadius = cornerRadius
        self.layer.cornerRadius = cornerRadius
        if !isVertical {
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        }
        //Use diffrent colors
        self.layer.addSublayer(gradientLayer)
    }
}
