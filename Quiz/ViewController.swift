//
//  ViewController.swift
//  Quiz
//
//  Created by Michael Henry on 4/28/16.
//  Copyright © 2016 Digital Javelina, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var currentQuestionLabelCenterXConstraint: NSLayoutConstraint!
    @IBOutlet var nextQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabelCenterXConstraint: NSLayoutConstraint!
    @IBOutlet var answerLabel: UILabel!
    
    let questions: [String] = ["What is 2 + 2?", "When will Then be Now?", "What is the average flight speed of a swallow?"]
    let answerArray: [String] = ["4", "Soon", "African or European?"]
    var currentQuestionIndex: Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let question = questions[currentQuestionIndex]
        currentQuestionLabel.text = question
        answerLabel.text = ""
        
        updateOffScreenLabel()
    }
    
    func updateOffScreenLabel() {
        let screenwidth = view.frame.width
        nextQuestionLabelCenterXConstraint.constant = -screenwidth
    }

    @IBAction func handleAskQuestionButton(sender: UIButton) {
        currentQuestionIndex += 1
        // reset currentQuestionIndex back to 0 if at the last item in the array
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        let question: String = questions[currentQuestionIndex]
        nextQuestionLabel.text = question
        
        // call the animation
        animateLabelTransitions()
        
    }
    
    @IBAction func handleAnswerButton(sender: UIButton) {
        // keep questionArray and answerArray in sync
        answerLabel.text = answerArray[currentQuestionIndex]
        }
    
  
    func animateLabelTransitions() {
        // force any outstanding layout changes to occur
        view.layoutIfNeeded()
        
        // animate the alpha and the centerX constraints
        let screenwidth = view.frame.width
        self.nextQuestionLabelCenterXConstraint.constant = 0
        self.currentQuestionLabelCenterXConstraint.constant += screenwidth
        
        UIView.animateWithDuration(0.5, delay: 0, options: [.CurveLinear], animations: {
            self.currentQuestionLabel.alpha = 0
            self.nextQuestionLabel.alpha = 1
            self.view.layoutIfNeeded()    // update views based on new constraints
            }, completion: { _ in
                swap(&self.currentQuestionLabel, &self.nextQuestionLabel)
                swap(&self.currentQuestionLabelCenterXConstraint, &self.nextQuestionLabelCenterXConstraint)
                
                self.updateOffScreenLabel()
        })
    }
    
    // reset the alpha to 0 just before the view appears
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // set the label's initial alpha
        nextQuestionLabel.alpha = 0
    }
    
}

