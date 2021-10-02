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
    var weekTableViewDataModel = [Week.init(day: "10/2", Remainder: "잔여 칼로리 살펴보기!"),
                                  Week.init(day: "10/3", Remainder: "잔여 칼로리 살펴보기!"),
                                  Week.init(day: "10/4", Remainder: "잔여 칼로리 살펴보기!"),
                                  Week.init(day: "10/5", Remainder: "잔여 칼로리 살펴보기!"),
                                  Week.init(day: "10/6", Remainder: "잔여 칼로리 살펴보기!"),
                                  Week.init(day: "10/7", Remainder: "잔여 칼로리 살펴보기!"),
                                  Week.init(day: "10/8", Remainder: "잔여 칼로리 살펴보기!")]
    
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
    override func viewDidAppear(_ animated: Bool) {
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
}
    // MARK: - UITableViewDataSource, UITableViewDelegate
extension weekViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weekTableViewDataModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellData = weekTableViewDataModel[indexPath.row]
        let cell = weekTableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! weekTableViewCell
//        cell.selectionStyle = .none //셀 자체
        cell.dayTitle?.text = cellData.day
        cell.dayTitle?.sizeToFit()
        cell.reminderCalorie?.text = cellData.Remainder
        cell.reminderCalorie?.sizeToFit()
        Calorie.totalCalorie = Calorie.food - Calorie.exercise
        reminder.title = "오늘의 잔여 칼로리는 \(Calorie.totalCalorie)Kcal입니다!!!"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellData = weekTableViewDataModel[indexPath.row]
        let vc = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as! weekPlusViewController
        vc.data = cellData
        present(vc, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: false) //선택이 되지만 x
    }
    
    
}
 
