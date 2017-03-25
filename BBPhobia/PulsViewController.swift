//
//  FirstViewController.swift
//  BBPhobia
//
//  Created by Martin Weber on 04/02/2017.
//  Copyright © 2017 Martin Weber. All rights reserved.
//

import UIKit
import Charts

class PulsViewController: UIViewController, PulsView {
    
    @IBOutlet weak var lineChartView: LineChartView!
    @IBOutlet weak var btnStartWorkout: UIButton!
    @IBOutlet weak var btnStopWorkout: UIButton!
    @IBOutlet weak var textHeartRate: UILabel!
    var presenter: PulsPresenter? = nil

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        presenter = PulsPresenter(view: self,
                                    watchSession: AppComponent.instance.getWatchSession(),
                                    healthController: AppComponent.instance.getHealthController())
        
        btnStartWorkout.addTarget(self, action: #selector(self.onClick(_:)), for: .touchUpInside)
        btnStopWorkout.addTarget(self, action: #selector(self.onClick(_:)), for: .touchUpInside)
        
        setUpLineChart()
        
        presenter?.requestContent()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setUpLineChart(){
        let myAppColor = AppColor()
        lineChartView.noDataText = "No chart data available. Start measuring to see the Data"
        lineChartView.chartDescription?.text = ""
        lineChartView.noDataTextColor = myAppColor.textColorDark
        lineChartView.tintColor = myAppColor.primaryColor
        lineChartView.animate(xAxisDuration: 1.5, yAxisDuration: 0.5)
        
        lineChartView.dragEnabled = true
        lineChartView.setScaleEnabled(true)
        
        
        lineChartView.xAxis.drawLabelsEnabled = false
        lineChartView.xAxis.drawAxisLineEnabled = false
        lineChartView.xAxis.drawGridLinesEnabled = false
        
        lineChartView.leftAxis.axisMinimum = 15
        lineChartView.leftAxis.axisMaximum = 145
        
        lineChartView.rightAxis.enabled = false
        
        let data :LineChartData = LineChartData()
        lineChartView.data = data
        
        let chartLimitTop: ChartLimitLine = ChartLimitLine(limit: 80)
        let chartLimitBottom: ChartLimitLine = ChartLimitLine(limit: 60)
        
        lineChartView.leftAxis.addLimitLine(chartLimitTop)
        lineChartView.leftAxis.addLimitLine(chartLimitBottom)
    }
    
    private func createLineChartDataset() -> LineChartDataSet{
        let charDataSet: LineChartDataSet = LineChartDataSet(values: nil, label: "Puls")
        charDataSet.axisDependency = .left
        
        let myAppColor = AppColor()
        let gradientColors = [myAppColor.primaryColor.cgColor, myAppColor.primaryColorBg.cgColor] as CFArray
        let colorLocations:[CGFloat] = [1.0, 0.0]
        let gradient = CGGradient.init(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: gradientColors, locations: colorLocations) // GradientObject
        charDataSet.setColor(myAppColor.primaryColor)
        charDataSet.setCircleColor(myAppColor.primaryColorDark)
        charDataSet.fill = Fill.fillWithLinearGradient(gradient!, angle: 90.0) // Set the Gradient
        charDataSet.drawFilledEnabled = true
        
        charDataSet.lineWidth = 2.0
        charDataSet.circleRadius = 2.5
        charDataSet.drawValuesEnabled = false
        
        return charDataSet
    }
    
    func onClick(_ sender: UIButton){
        switch sender {
            case btnStartWorkout:
                presenter?.startMeasure()
            case btnStopWorkout:
                presenter?.stopMeasure()
            default: break
        }
    }
    
    func viewError(errMsg:String) {
        let alert = UIAlertController(title: "Schade", message: errMsg, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    func drawState(isMeasure: Bool){
        if(isMeasure){
            btnStartWorkout.isHidden = true
            btnStopWorkout.isHidden = false
        }else{
            btnStartWorkout.isHidden = false
            btnStopWorkout.isHidden = true
        }
    }
    func drawHeartRate(value: Int){
        DispatchQueue.main.async {
            self.textHeartRate.text = String(value)
            
            let data = self.lineChartView.data
            if(data == nil){
                return
            }
            
            var set = data?.getDataSetByIndex(0)
            
            if(set == nil){
                set = self.createLineChartDataset()
                data?.addDataSet(set)
            }

            data?.addEntry(ChartDataEntry(x: Double((set?.entryCount)!), y: Double(value)), dataSetIndex: 0)
            data?.notifyDataChanged()
            
            self.lineChartView.notifyDataSetChanged()
            
            self.lineChartView.setVisibleXRangeMaximum(120.0)
            self.lineChartView.moveViewToX(Double((data?.entryCount)!))
            
        }
    }
}

