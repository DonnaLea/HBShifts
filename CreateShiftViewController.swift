//
//  CreateShiftViewController.swift
//  Shifts
//
//  Created by Donna McCulloch on 10/6/18.
//  Copyright © 2018 Donna McCulloch. All rights reserved.
//

import UIKit

class CreateShiftViewController: UIViewController {

  private struct Strings {
    static let createAShift = "Create a Shift"
  }

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    title = "Create a Shift"
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    view.backgroundColor = .white
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonPressed(sender:)))
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


  /*
  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
  }
  */

  // MARK: - Actions

  @objc func saveButtonPressed(sender: Any) {
    dismiss(animated: true, completion: nil)
  }
}
