//
//  exerciseViewController.swift
//  food-management
//
//  Created by 준수김 on 2021/09/28.
//

import UIKit

private let cellID = "exerciseTableViewCell"

var exerciseList = ExerciseList()

class exerciseViewController: UIViewController {
    
    
    
    // MARK: - 프로퍼티
//    var exerciseTableViewDataModel: Array = [Exercise.init(exerciseImage: "걷기", exercisename: "걷기", exerciseHour: "02시간 05분", exercisecalorie: "619"),
//                                             Exercise.init(exerciseImage: "자전거", exercisename: "자전거타기", exerciseHour: "01시간40분", exercisecalorie: "300"),
//                                             Exercise.init(exerciseImage: "복싱", exercisename: "복싱하기", exerciseHour: "40분", exercisecalorie: "270"),
//                                             Exercise.init(exerciseImage: "배드민턴", exercisename: "배드민턴치기", exerciseHour: "02시간15분", exercisecalorie: "170"),
//                                             Exercise.init(exerciseImage: "탁구", exercisename: "탁구하기", exerciseHour: "01시간 50분", exercisecalorie: "243")]
    
    var Total = 0
    // MARK: - 객체
    
    
    @IBOutlet weak var exerciseTableView: UITableView!
    @IBOutlet weak var minusCalorieTotal: UINavigationItem!
    
    // MARK: - 생명주기
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()
        setUTableView()
        exerciseTableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool)
    {
        exerciseTableView.reloadData()
    }
    
    // MARK: - Helper
    private func setUTableView() {
        exerciseTableView.delegate = self
        exerciseTableView.dataSource = self
        exerciseTableView.register(UINib(nibName: cellID, bundle: nil), forCellReuseIdentifier: cellID)
    }
    private func setUpLayout() {
        
    }
    
    // MARK: - Delete
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
               
               if editingStyle == .delete {
                   var cellData1 = Exercise(exerciseImage: "걷기", exercisename: "걷기", exerciseHour: "02시간 05분", exercisecalorie: "619")
                   cellData1 = exerciseList.itemAt(index: indexPath.row)
                   Total -= Int(cellData1.exercisecalorie) ?? 0
                   exerciseList.delete(indexRow: indexPath.row)
                   exerciseTableView.deleteRows(at: [indexPath], with: .fade)
                   minusCalorieTotal.title = "총 소모 칼로리는 \(Total)Kcal입니다!"
               } else if editingStyle == .insert {
                   
               }
           }
   
}
// MARK: - UITableViewDataSource, UITableViewDelegate
    extension exerciseViewController: UITableViewDataSource, UITableViewDelegate {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return exerciseList.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            var cellData = Exercise(exerciseImage: "걷기", exercisename: "걷기", exerciseHour: "02시간 05분", exercisecalorie: "619")
            cellData = exerciseList.itemAt(index: indexPath.row)
            let cell = exerciseTableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! exerciseTableViewCell
            cell.exerciseImage.image = UIImage(named: cellData.exerciseImage) //사진 나타내기!!!
            cell.titleLabel1?.text = cellData.exercisename
            cell.titleLabel1?.sizeToFit() //Label 짤림 해결
            cell.detailLabel1?.text = cellData.exerciseHour
            cell.detailLabel1?.sizeToFit()
            cell.calorieLabel1?.text = "-\(cellData.exercisecalorie)Kcal"
            cell.calorieLabel1?.sizeToFit()
            Total += Int(cellData.exercisecalorie) ?? 0
            Calorie.exercise = Total
            minusCalorieTotal.title = "총 소모 칼로리는 \(Total)Kcal입니다!"
            //테이블 뷰를 리로드하면 칼로리가 추가되는 문제가 있음.
            return cell
        }
    }
