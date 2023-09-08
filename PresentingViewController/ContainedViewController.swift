//
//  ContainedViewController.swift
//  USBankInterview
//
//  Created by Srinath Shah on 9/1/23.
//

import UIKit

class ContainedViewController: UIViewController {

    @IBOutlet var defineContextSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        definesPresentationContext = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func toggleDefinesContext(_ sender: UISwitch) {
        self.definesPresentationContext = sender.isOn
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("\(view.backgroundColor) will disappear")
    }
    override func viewWillAppear(_ animated: Bool) {
        print("\(view.backgroundColor) will appear")
    }
    @IBAction func showDetail(_ sender: UIButton) {
        showDetailViewController(getNextViewController(), sender: nil)
    }
    @IBAction func showVC(_ send: UIButton) {
       show(getNextViewController(), sender: nil)
    }
    @IBAction func present(_ send: UIButton) {
        var selectedStyle : UIModalPresentationStyle = .currentContext
        if let parent = parent as? ViewController {
            selectedStyle = parent.selectedStyle
        }
        
        let vc = getNextViewController()
        vc.modalPresentationStyle = selectedStyle
        present( vc,    animated: true)
    }
    
    @IBAction func presentAlert() {
        coordinator.handle(.error, for: self)
    }

    func getNextViewController() -> UIViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil)
                    .instantiateViewController(withIdentifier: "green") as! ViewController
        vc.modalPresentationStyle = .formSheet
        return vc
    }
    var coordinator: Coordinator = .init()
}

class Coordinator: NSObject {
    enum Event {
        case error
    }
    
    func handle(_ event: Event, for vc: UIViewController)  {
        switch event {
        case .error:
            let alert = UIAlertController(title: "Title", message: "message", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default){ act in
                vc.dismiss(animated: true)
            })
            
            //IMPORTANT -
            //I used this to adapt alert controllers modalPresentationStyle to .currentContext but the app crashes with
            // "The presentation controller of an alert controller presenting as an alert must not have its delegate modified.
            // alert.presentationController?.delegate = self
        
            vc.definesPresentationContext = true
            vc.present(alert, animated: true)
        }
    }
    func adaptivePresentationStyle( for controller: UIPresentationController,
        traitCollection: UITraitCollection
    ) -> UIModalPresentationStyle{
        .currentContext
    }
}

extension Coordinator: UISheetPresentationControllerDelegate {}
