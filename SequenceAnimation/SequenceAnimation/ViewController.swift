//
//  ViewController.swift
//  Demo
//
//  Created by Kiran Sarvaiya on 27/01/17.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var HomeView: UIView!
    @IBOutlet var Views: [UIView]!
    var Frame: [CGRect] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    @IBAction func Swipe(_ sender: Any) {
        Frame.removeAll()
        for i in Views
        {
            Frame.append(i.frame)
        }
        
        
        UIView.animate(withDuration: 1, animations:{
            
            for i in 0...self.Views.count - 1
            {
                self.Views[i].alpha = 0.4
                if (i + 1) != self.Views.endIndex
                {
                    self.Views[i].frame = self.Frame[i + 1]
                    
                }
                else
                {
                    
                    self.Views[i].frame = self.Frame[0]
                }
                self.Views[i].alpha = 1.0
            }
            
        })

        
        self.Views.insert(self.Views[0], at: self.Views.endIndex )
        self.Views.remove(at: 0)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension Array {
    func shiftRight( amount: Int = 1) -> [Element] {
        var amount = amount
        assert(-count...count ~= amount, "Shift amount out of bounds")
        if amount < 0 { amount += count }  // this needs to be >= 0
        return Array(self[amount ..< count] + self[0 ..< amount])
    }
    
    mutating func shiftRightInPlace(amount: Int = 1) {
        self = shiftRight(amount: amount)
    }
}
