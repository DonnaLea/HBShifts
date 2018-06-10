//
//  ShiftListViewController.swift
//  Shifts
//
//  Created by Donna McCulloch on 8/6/18.
//  Copyright © 2018 Donna McCulloch. All rights reserved.
//

import UIKit

class ShiftListViewController: UITableViewController {

  var shifts: [Shift] = []

  private struct Key {
    static let shifts = "shifts"
  }

  private struct Strings {
    static let shifts = "Shifts"
  }

  override init(style: UITableViewStyle) {

    if let path = Bundle.main.path(forResource: "shifts", ofType: "json") {

      if let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) {
        print("data")
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(.shiftDateInFormatter)
        do {
          let dictionary = try decoder.decode(Dictionary<String, [Shift]>.self, from: data)
          if let shifts = dictionary[Key.shifts] {
            self.shifts = shifts.sorted { lhs, rhs -> Bool in
              return lhs.endDate > rhs.endDate
            }
          }
        } catch {
          print("error: \(error)")
        }
      }
    }

    super.init(style: style)
    title = Strings.shifts
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed(sender:)))

    tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.reuseIdentifier())

  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  // MARK: - Table view data source

  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return shifts.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.reuseIdentifier(), for: indexPath)

    if cell.detailTextLabel == nil {
      cell = UITableViewCell(style: .subtitle, reuseIdentifier: UITableViewCell.reuseIdentifier())
    }

    // Configure the cell...
    let shift = shifts[indexPath.row]
    let date = DateFormatter.shiftDateOutFormatter.string(from: shift.startDate)
    let startTime = DateFormatter.shiftBeginTimeRangeFormatter.string(from: shift.startDate)
    let endTime = DateFormatter.shiftEndTimeRangeFormatter.string(from: shift.endDate)
    cell.textLabel?.text = "\(date) \(startTime)\(endTime)"
    cell.detailTextLabel?.text = "\(shift.name) (\(shift.role))"
    cell.detailTextLabel?.textColor = shift.color

    return cell
  }

  /*
  // Override to support conditional editing of the table view.
  override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
      // Return false if you do not want the specified item to be editable.
      return true
  }
  */

  /*
  // Override to support editing the table view.
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
          // Delete the row from the data source
          tableView.deleteRows(at: [indexPath], with: .fade)
      } else if editingStyle == .insert {
          // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
      }
  }
  */

  /*
  // Override to support rearranging the table view.
  override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

  }
  */

  /*
  // Override to support conditional rearranging of the table view.
  override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
      // Return false if you do not want the item to be re-orderable.
      return true
  }
  */

  /*
  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      // Get the new view controller using segue.destinationViewController.
      // Pass the selected object to the new view controller.
  }
  */

  // MARK: - Actions

  @objc func addButtonPressed(sender: Any) {
    let createShiftViewController = CreateShiftViewController()
    let navigationController = UINavigationController(rootViewController: createShiftViewController)
    present(navigationController, animated: true, completion: nil)
  }
}
