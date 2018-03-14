//
//  QuestionsViewController.swift
//  personalityQuiz
//
//  Created by Yacoub Awimrin on 3/6/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit

var answerChosen: [Answer] = []

class QuestionsViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var rangeStackView: UIStackView!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton4: UIButton!
    @IBOutlet weak var multiLabel1: UILabel!
    @IBOutlet weak var multiLabel2: UILabel!
    @IBOutlet weak var multiLabel3: UILabel!
    @IBOutlet weak var multiLabel4: UILabel!
    @IBOutlet weak var rangeLabel1: UILabel!
    @IBOutlet weak var rangeLabel2: UILabel!
    @IBOutlet weak var multiSwitch1: UISwitch!
    @IBOutlet weak var multiSwitch2: UISwitch!
    @IBOutlet weak var multiSwitch3: UISwitch!
    @IBOutlet weak var multiSwitch4: UISwitch!
    @IBOutlet weak var rangeSlider: UISlider!
    
    var questionIndex = 0
    var questions: [Question] = [
        Question(text: "Which food do you like the most?",
                 type:.single,
                 answers: [
                    Answer(text: "Steak", type: .dog),
                    Answer(text: "Fish", type: .cat),
                    Answer(text: "Carrots", type: .rabbit),
                    Answer(text: "Corn", type: .turtle)
            ]),
        
        Question(text: "Which activities do you enjoy?",
                 type: .multiple,
                 answers: [
                    Answer(text: "Swimming", type: .turtle),
                    Answer(text: "Sleeping", type: .cat),
                    Answer(text: "Cuddling", type: .rabbit),
                    Answer(text: "Eating", type: .dog)
            ]),
        
        Question(text: "How much do you enjoy car rides?",
                 type: .ranged,
                 answers: [
                    Answer(text: "I dislike them", type: .cat),
                    Answer(text: "I get a little nervous", type: .rabbit),
                    Answer(text: "I barely notice them", type: .turtle),
                    Answer(text: "I love them", type: .dog)
            ])
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    }
    func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangeStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        
        let totalProgress = Float(questionIndex)/Float(questions.count)
        
        navigationItem.title = "Question #\(questionIndex + 1)"
        questionLabel.text = currentQuestion.text
        progressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            updateRangedStack(using: currentAnswers)
        }
        
    }
    
    func nextQuestion() {
        questionIndex += 1
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "resultSegue", sender: nil)
        }
    }
    
    func updateSingleStack(using answers: [Answer]) {
        singleStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    }
    
    
    func updateMultipleStack(using answers: [Answer]) {
        multipleStackView.isHidden = false
        multiSwitch1.isOn = false
        multiSwitch2.isOn = false
        multiSwitch3.isOn = false
        multiSwitch4.isOn = false
        multiLabel1.text = answers[0].text
        multiLabel2.text = answers[1].text
        multiLabel3.text = answers[2].text
        multiLabel4.text = answers[3].text
    }
    @IBAction func rangedAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangeSlider.value * Float(currentAnswers.count - 1 )))
        answerChosen.append(currentAnswers[index])
       
        nextQuestion()
    }
    
    
    func updateRangedStack(using answers: [Answer]) {
        rangeStackView.isHidden = false
        rangeSlider.setValue(0.5, animated: false)
        rangeLabel1.text = answers.first?.text
        rangeLabel2.text = answers.last?.text
    }
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        
        switch sender {
        case singleButton1:
        answerChosen.append(currentAnswers[0])
        case singleButton2:
            answerChosen.append(currentAnswers[1])
        case singleButton3:
            answerChosen.append(currentAnswers[2])
        case singleButton4:
            answerChosen.append(currentAnswers[3])
        default :
            break
        }
        
        nextQuestion()
    }
    
    @IBAction func multipleAnswerButtonPressed() {
        let currentaAnswers = questions[questionIndex].answers
        
        if multiSwitch1.isOn {
            answerChosen.append(currentaAnswers[0])
        }
        if multiSwitch2.isOn {
            answerChosen.append(currentaAnswers[1])
        }
        if multiSwitch3.isOn {
            answerChosen.append(currentaAnswers[2])
        }
        if multiSwitch4.isOn {
            answerChosen.append(currentaAnswers[3])
        }
       
        nextQuestion()
        
    }
    
    
    
}
