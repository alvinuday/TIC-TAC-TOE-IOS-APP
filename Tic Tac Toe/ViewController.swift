//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Uday Kumar on 22/11/20.
//

import UIKit

class ViewController: UIViewController {
    
    var activeplayer = 1 //cross
    var gamestate = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var gameisactive = true
    
    let winningcombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
   
    @IBAction func action(_ sender: AnyObject)
    {
        if (gamestate[sender.tag-1]==0 && gameisactive == true)
        {
            gamestate[sender.tag-1]=activeplayer
            if (activeplayer==1)
            {
                sender.setImage(UIImage(named: "Cross.png" ),for: UIControl.State())
                activeplayer = 2
            }
            else
            {
                sender.setImage(UIImage(named: "Nought.png" ),for: UIControl.State())
                activeplayer = 1
            }
        for combination in winningcombinations
        {
            if (gamestate[combination[0]] != 0 && gamestate[combination[0]] == gamestate[combination[1]] && gamestate[combination[1]] == gamestate[combination[2]])
            {
                gameisactive = false
                
                if gamestate[combination[0]]==1
                {
                    //cross has won
                    label.text = "CROSS has won"
                }
                else
                {
                    //Nought has won
                    label.text = "NOUGHT has won"
                }
                label.isHidden = false
                playAgainButton.isHidden = false
            }
        }
            gameisactive = false
            
            for i in gamestate
            {
                if i==0
                {
                    gameisactive = true
                    break;
                }
            }
            if gameisactive == false
            {
                label.text = "IT's A DRAW"
                label.isHidden = false
                playAgainButton.isHidden = false
            }
        
        }
        
        
        
    }
   
       
    
    
    
    @IBOutlet weak var label: UILabel!
   
    @IBAction func playAgain(_ sender: UIButton) {
        
        gamestate = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameisactive = true
        activeplayer = 1
        label.isHidden = true
        playAgainButton.isHidden = true
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil , for: UIControl.State())
        }
    }
    
    
    @IBOutlet weak var playAgainButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


