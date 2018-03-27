//
//  ViewController.swift
//  iOS Experiment 10 - StopWatch
//
//  Created by mac on 3/26/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButtonOutlet: UIButton!
    @IBOutlet weak var stopButtonOutlet: UIButton!
    
    @IBAction func startTimer(_ sender: Any) {
        if (isPlaying) {return}
        else{
            startButtonOutlet.isEnabled = false
            stopButtonOutlet.isEnabled = true
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: UpdateTimer(), userInfo: nil, repeats: true)
        }
    }
    @IBAction func stopTimer(_ sender: Any) {
        startButtonOutlet.isEnabled = true
        stopButtonOutlet.isEnabled = false
        timer.invalidate()
        isPlaying = false
    }
    @IBAction func resetTimer(_ sender: Any) {
        startButtonOutlet.isEnabled = true
        stopButtonOutlet.isEnabled = false
        timer.invalidate()
        isPlaying = false
        counter = 0.0
        timeLabel.text = String(counter)
    }
    var counter: FloatLiteralType = 0.0
    var timer = Timer()
    var isPlaying = false
    
    func UpdateTimer(){
        counter = counter + 0.1
        timeLabel.text = String(format: "%.1f", counter)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timeLabel.text = String(counter)
        stopButtonOutlet.isEnabled = false
        counter = 0.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

