//
//  ViewController.swift
//  Test-PieChart
//
//  Created by Alireza on 12/7/21.
//

import UIKit
import Charts

class ViewController: UIViewController {
    
    @IBOutlet weak var chartView: PieChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChart()
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

