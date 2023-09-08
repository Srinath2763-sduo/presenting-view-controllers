//
//  ViewController.swift
//  USBankInterview
//
//  Created by Srinath Shah on 8/31/23.
//

import UIKit

class ViewController: UIViewController {
    @MainStoryBoardViewController("ViewController") var currentPresentedVC: UIViewController
    @IBOutlet var pickerView: UIPickerView!
    var selectedStyle: UIModalPresentationStyle = .automatic
    var button = UIButton()
    @objc
    func dismissAnimated() {
        self.dismiss(animated:true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("\(self.view.backgroundColor?.accessibilityName) view will disappear")
    }
    lazy var parentLabel: UILabel = {
        let label = UILabel()
        label.text = "parent of this view controller is \(parent.debugDescription)"
        view.addSubview(label)
         label.frame.size.width = view.frame.size.width - 20
         label.numberOfLines = 0
         label.sizeToFit()
         label.textAlignment = .center
        label.center =
            .init(x: view.center.x, y: view.safeAreaLayoutGuide.layoutFrame.minY + 30)
        return label
    }()
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        
       label.text = "This view controller was presented by \(presentingViewController.debugDescription)"
       view.addSubview(label)
        label.frame.size.width = view.frame.size.width - 20
        label.numberOfLines = 0
        label.sizeToFit()
        label.textAlignment = .center
       label.center =
           .init(x: view.center.x, y: view.safeAreaLayoutGuide.layoutFrame.minY + 70)
        return label
    }()
    
    lazy var dismissButton: UIButton = {
        
        button.setTitle("Dismiss", for: .normal)
        button.isEnabled = true
        button.isUserInteractionEnabled = true
        var tintedConfig = UIButton.Configuration.tinted()
        tintedConfig.baseBackgroundColor = .red
        tintedConfig.baseForegroundColor = .red
        button.configuration = tintedConfig
        self.view.addSubview(button)
        button.center = view.center
        button.sizeToFit()
        button.addTarget(self, action: #selector(dismissAnimated), for: .touchUpInside)
       return button
    }()
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
         
        _ = parentLabel
        _ = infoLabel
        _ = dismissButton
    }
    override func viewDidLoad() {
        super.viewDidLoad()
         
        if modalPresentationStyle.isFullScreenPresentation
        {
            _ = button
           
        }
            navigationItem.rightBarButtonItem = .init(title: "Dismiss", style: .done, target: self, action: #selector(dismissAnimated))
        
    }
    
    
    func setPresentation(style: UIModalPresentationStyle) {
        self.modalPresentationStyle = style
      
    }
    
    func getNextViewController() -> UIViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil)
                    .instantiateViewController(withIdentifier: "green") as! ViewController
        vc.modalPresentationStyle = selectedStyle
        return vc
    }
    
    @IBAction func showDetail(_ sender: UIButton) {
        showDetailViewController(getNextViewController(), sender: nil)
    }
    @IBAction func showVC(_ send: UIButton) {
       show(getNextViewController(), sender: nil)
    }
    @IBAction func present(_ send: UIButton) {
        let vc = getNextViewController()
        currentPresentedVC = vc
        present( vc, animated: true)
    }

}

struct EmployeePayload: Codable {
    let status: String?
    let data: [Employee?]
    let message: String?
}

struct Employee: Codable {
    var id: Int?
    var employeeName: String?
    var employeeSalary: Int?
    var employeeAge: Int?
    var profileImage: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case employeeAge = "employee_age"
        case profileImage = "profile_image"
    }
}


extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        10
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedStyle = UIModalPresentationStyle(rawValue: row - 2)!
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch row {
        case 0:
            return "automatic"
        case 1:
            return "none"
        case 2:
            return "full screen"
        case 3:
            return "page sheet"
        case 4:
            return "for sheetm"
        case 5:
            return "currentContext"
        case 6:
            return "custom"
        case 7:
            return "overFullScreen"
        case 8:
            return "overCurrentContext"
        case 9:
            return "popOver"
            
        default:
            break
        }
        return nil
    }}

extension UIModalPresentationStyle {
    var isFullScreenPresentation: Bool {
        return self == .overFullScreen ||
              self == .fullScreen ||
            self == .currentContext ||
        self == .overCurrentContext
         
    }
}


@propertyWrapper
struct MainStoryBoardViewController {
    var storyboardIdentifier: String
    
    lazy var wrappedValue: UIViewController = {
        return UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: storyboardIdentifier)
    }()
    
    init(_ storyboardIdentifier: String) {
        self.storyboardIdentifier = storyboardIdentifier
     
    }
}
