//
//  weekViewController.swift
//  food-management
//
//  Created by 준수김 on 2021/09/30.
//

import UIKit

private let cellID = "weekTableViewCell"

class weekViewController: UIViewController {
    
    
    
    // MARK: - 프로퍼티
    var weekTableViewDataModel = [Week.init(day: "9/26", Remainder: "293"),
                                  Week.init(day: "9/27", Remainder: "0"),
                                  Week.init(day: "9/28", Remainder: "123"),
                                  Week.init(day: "9/29", Remainder: "343"),
                                  Week.init(day: "9/30", Remainder: "111"),
                                  Week.init(day: "10/1", Remainder: "972"),
                                  Week.init(day: "10/2", Remainder: "0")]
    var total = 111
    // MARK: - UI 객체
    
    @IBOutlet weak var weekTableView: UITableView!
    @IBOutlet weak var reminder: UINavigationItem!
    
    // MARK: - 생명주기
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        setUpLayout()
        weekTableView.reloadData()
    }
    // MARK: - Helper
    private func setUpTableView() {
        weekTableView.dataSource = self
        weekTableView.delegate = self
        weekTableView.register(UINib(nibName: cellID, bundle: nil), forCellReuseIdentifier: cellID)
    }
    private func setUpLayout() {
    }
    // MARK: - Delete(CRUD)
    
    
    
}
    // MARK: - UITableViewDataSource, UITableViewDelegate
extension weekViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weekTableViewDataModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellData = weekTableViewDataModel[indexPath.row]
        let cell = weekTableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! weekTableViewCell
        cell.dayTitle?.text = cellData.day
        cell.dayTitle?.sizeToFit()
        cell.reminderCalorie?.text = "잔여 칼로리 - \(cellData.Remainder)Kcal"
        cell.reminderCalorie?.sizeToFit()
        total = Calorie.food - Calorie.exercise
        
        reminder.title = "오늘의 잔여 칼로리는 \(total)Kcal입니다!"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellData = weekTableViewDataModel[indexPath.row]
        let vc = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as! weekPlusViewController
        vc.data = cellData
        present(vc, animated: true, completion: nil)
    }
    
    
}
