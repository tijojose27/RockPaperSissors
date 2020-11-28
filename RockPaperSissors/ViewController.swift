//
//  ViewController.swift
//  RockPaperSissors
//
//  Created by Tijo Jose on 11/26/20.
//

import UIKit

class ViewController: UIViewController {
    
    var playerChoice = ""
    var opponentChoice = ""
    
    let gameChoices = ["rock", "paper", "scissors"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print(gameChoices.randomElement()!)
    }
    
    func randomOpponnentChoice() -> String {
        return gameChoices.randomElement()!
    }
    
    @IBAction func playerChosesRock(){
        
        let resultsViewController : ResultsViewController
        resultsViewController = storyboard?.instantiateViewController(withIdentifier: "ResultsViewController")
            as! ResultsViewController
        
        let result = findResults(playerChoice: "rock")
        
        resultsViewController.resultString = result.0
        resultsViewController.imageString = result.1
        
        present(resultsViewController, animated: true, completion: nil)
        
    }
    
    @IBAction func playerChosesScissors(_ sender: Any){
        self.performSegue(withIdentifier: "clickedScissorsSegue", sender: self)
    }
    
    
    
    
//    @IBAction func playerChosesPaper(_ sender: Any) {
//
//        self.performSegue(withIdentifier: "clickedPaperSegue", sender: self)
//        
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "clickedPaperSegue" {
            let controller = segue.destination as! ResultsViewController
            
            let result = findResults(playerChoice: "paper")
            
            controller.imageString = result.1
            controller.resultString = result.0
            
        }
        
        if segue.identifier == "clickedScissorsSegue" {
            
            let controller = segue.destination as! ResultsViewController
            
            let result = findResults(playerChoice: "scissors")
            
            controller.imageString = result.1
            controller.resultString = result.0
            
        }
    }
    
    func findResults(playerChoice: String) -> ( String, String){
        
        let opponentChoice = randomOpponnentChoice()
        
        var answer: (String, String) = ("", "")
        
        switch playerChoice {
        case "rock":
            if opponentChoice == "scissors" {
                answer =  ("Rock crushes Sissors", "RockCrushesScissors")
            }
            else if(opponentChoice == "paper"){
                answer = ("Rock is covered by Paper", "PaperCoversRock")
            }
            else{
                answer = ("Draw", "")
            }
        
        case "scissors":
            if opponentChoice == "rock" {
                answer = ("Sissor crushed By Rock", "RockCrushesScissors")
            }else if opponentChoice == "paper" {
                answer = ("Sissor cuts Paper", "ScissorsCutPaper")
            }else{
                answer = ("Draw", "")
            }
        case "paper":
            if opponentChoice == "scissors" {
                answer = ("Paper cut by Scissors", "ScissorsCutPaper")
            }else if opponentChoice == "rock" {
                answer = ("Paper covers Rock", "PaperCoversRock")
            }else{
                answer = ("Draw", "")
            }
        default:
            answer = ("", "")
        }
        return answer
    }


}

