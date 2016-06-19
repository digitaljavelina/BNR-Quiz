//
//  ViewController.swift
//  Quiz
//
//  Created by Michael Henry on 4/28/16.
//  Copyright © 2016 Digital Javelina, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    let questionArray: [String] = ["What is 2 + 2?", "When will Then be Now?", "What is the average flight speed of a swallow?"]
    let answerArray: [String] = ["4", "Soon", "African or European?"]
    var currentQuestionIndex: Int = -1    // so that when currentQuestionIndex +=1 occurs, the first item called will [0]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // labels are blank to start
        questionLabel.text = ""
        answerLabel.text = ""
    }

    @IBAction func handleAskQuestionButton(sender: UIButton) {
        currentQuestionIndex += 1
        // reset currentQuestionIndex back to 0 if at the last item in the array
        if currentQuestionIndex == questionArray.count {
            currentQuestionIndex = 0
    }
        questionLabel.text = questionArray[currentQuestionIndex]
        
    }
    
    @IBAction func handleAnswerButton(sender: UIButton) {
        // keep questionArray and answerArray in sync
        answerLabel.text = answerArray[currentQuestionIndex]
        }
    
  
    

}

