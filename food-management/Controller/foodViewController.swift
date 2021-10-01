//
//  ViewController.swift
//  food-management
//
//  Created by 준수김 on 2021/09/25.
//

import UIKit

private let cellID = "foodTableViewCell"

var foodList = FoodList()

class foodViewController: UIViewController {
    
    
    // MARK: - 프로퍼티
    var Total = 0
    // MARK: - UI 객체
    @IBOutlet weak var foodTableView: UITableView!
    @IBOutlet weak var calorieTotal: UINavigationItem!
    
    // MARK: - 생명주기
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        setUpLayout()
        foodTableView.reloadData()
        
    }
    override func viewWillAppear(_ animated: Bool)
    {
        foodTableView.reloadData()
    }
    

    
    // MARK: -  Helper
    private func setUpTableView() {
        foodTableView.delegate = self
        foodTableView.dataSource = self
        foodTableView.register(UINib(nibName: cellID, bundle: nil), forCellReuseIdentifier: cellID)
        }
        private func setUpLayout() {
        }
    
    // MARK: - Delete(CRUD)
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           
           if editingStyle == .delete {
               //삭제 + Title 변경
               var cellData1 = Food(foodImage: "탄수화물", foodname: "현미밥", foodweight: "210g", foodcalorie: "351")
               cellData1 = foodList.itemAt(index: indexPath.row)
               Total -= Int(cellData1.foodcalorie) ?? 0
               foodList.delete(indexRow: indexPath.row)
               foodTableView.deleteRows(at: [indexPath], with: .fade)
               calorieTotal.title = "총 섭취 칼로리는 \(Total)Kcal입니다!"
               
           } else if editingStyle == .insert {
               
           }
       }
}
    
    // MARK: - UITableViewDataSource, UITableViewDelegate
    extension foodViewController: UITableViewDataSource, UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return foodList.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = foodTableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! foodTableViewCell
            var cellData = Food(foodImage: "탄수화물", foodname: "현미밥", foodweight: "210g", foodcalorie: "351")
            cellData = foodList.itemAt(index: indexPath.row)
            
            cell.foodImage.image = UIImage(named: cellData.foodImage) //사진 나타내기!!!
            cell.titleLabel?.text = cellData.foodname
            cell.titleLabel?.sizeToFit() //Label 짤림 해결
            cell.detailLabel?.text = cellData.foodweight
            cell.detailLabel?.sizeToFit()
            cell.calorieLabel?.text = "+\(cellData.foodcalorie)Kcal"
            cell.calorieLabel?.sizeToFit()
            
            
            Total += Int(cellData.foodcalorie) ?? 0
            Calorie.food = Total
            calorieTotal.title = "총 섭취 칼로리는 \(Total)Kcal입니다!"
        
            //테이블 뷰를 리로드하면 칼로리가 추가되는 문제가 있음.
            return cell
        }
    }
    

