//
//  CardSelectionViewController.swift
//  CardWorkout
//
//  Created by Kresimir Ivanjko on 23.02.2023..
//

import UIKit

class CardSelectionViewController: UIViewController {

    @IBOutlet var cardImageView: UIImageView!
    
    @IBOutlet var buttons: [UIButton]!
    var cards: [UIImage] = Deck.allValues
    
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startTimer()
        for button in buttons {
            button.layer.cornerRadius = 8
        }
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        timer.invalidate()
    }
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomImage() {
        cardImageView.image = cards.randomElement() ?? UIImage(named: "2C")
    }
    
    @IBAction func stopButtonTapped(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func restarButtonTapped(_ sender: Any) {
        timer.invalidate()
        startTimer()
    }
    
}
