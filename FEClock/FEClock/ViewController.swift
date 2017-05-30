//
//  ViewController.swift
//  FEClock
//
//  Created by keso on 2017/5/30.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var hourHandView:UIView?
    var minuteHandView:UIView?
    var secondHandView:UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUp()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setUp() {
        
        let bgView:UIView = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        bgView.center = self.view.center
        self.view.addSubview(bgView)
        
        let clockImgView:UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        clockImgView.image = UIImage(named: "clock")
        bgView.addSubview(clockImgView)
        
        hourHandView = UIView(frame: CGRect(x: 0, y: 0, width: 3, height: 60))
        hourHandView?.backgroundColor = UIColor.black
        hourHandView?.center = CGPoint(x: 75, y: 75)
        hourHandView?.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        bgView.addSubview(hourHandView!)
        
        minuteHandView = UIView(frame: CGRect(x: 0, y: 0, width: 2, height: 60))
        minuteHandView?.backgroundColor = UIColor.black
        minuteHandView?.center = CGPoint(x: 75, y: 75)
        minuteHandView?.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        bgView.addSubview(minuteHandView!)
        
        secondHandView = UIView(frame: CGRect(x: 0, y: 0, width: 1, height: 60))
        secondHandView?.backgroundColor = UIColor.red
        secondHandView?.center = CGPoint(x: 75, y: 75)
        secondHandView?.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        bgView.addSubview(secondHandView!)
        
        let displayLink:CADisplayLink = CADisplayLink(target: self, selector: #selector(self.runClock))
        displayLink.add(to: RunLoop.main, forMode: RunLoopMode.commonModes)
        
    }
    
    func runClock() {
        
        var calendar:Calendar = NSCalendar.current
        calendar.timeZone = NSTimeZone.local
        
        let date:Date = Date()
        
        let second:Int = calendar.component(Calendar.Component.second, from: date)
        let secondAngle:Double = (Double.pi * 2 / 60) * Double(second)
        secondHandView?.transform = CGAffineTransform(rotationAngle: CGFloat(secondAngle))
        
        let minute:Int = calendar.component(Calendar.Component.minute, from: date)
        let minuteAngle:Double = (Double.pi * 2 / 60) * Double(minute)
        minuteHandView?.transform = CGAffineTransform(rotationAngle: CGFloat(minuteAngle))
        
        let hour:Int = calendar.component(Calendar.Component.hour, from: date)
        let hourAngle:Double = (Double.pi * 2 / 12) * Double(hour)
        hourHandView?.transform = CGAffineTransform(rotationAngle: CGFloat(hourAngle))
        
        print("当前时间:\(date)---小时:\(hour)---分钟:\(minute)---秒:\(second)")
        
    }

}

