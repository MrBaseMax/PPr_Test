//
//  ViewController.swift
//  PPr_Test
//
//  Created by Макс on 23.08.2021.
//

import UIKit

class ViewController: UIViewController {
	
	//MARK: - атрибуты
	@IBOutlet weak var collectionView: UICollectionView! //основная вьюха
	@IBOutlet weak var modeValue: UISegmentedControl! //переключатель режима
	
	var generator: NumbersGenerator? //инстанция генератор чисел
	var fetching = false //идет процесс генерации
	
	
	
	//MARK: - методы
	override func viewDidLoad() {
		super.viewDidLoad()
		//регистрируем себя делегатом и источником данных
		collectionView.dataSource = self
		collectionView.delegate = self
		
		//подпишем метод перерисовки данных на событие изменения ориентации
		NotificationCenter.default.addObserver(self, selector: #selector(ViewController.orientationDidChange), name: UIDevice.orientationDidChangeNotification, object: nil)
		
		
		do {
			try tableInit() //инициализация
		} catch {
			print(error)
		}
	}
	
	
	
	@objc func orientationDidChange() { //перерисовка данных после изменения ориентации
		collectionView.reloadData()
	}
	
	
	
	//инициализация
	func tableInit( ) throws {
		
		switch modeValue.selectedSegmentIndex {
			case 0:
				generator = PrimeNumbersGenerator()
			case 1:
				generator = FibonacciNumbersGenerator()
			default: throw fatalError("Непонятный режим")
		}
		
		
		generator!.appendNextNumbers(K.initialBatchSize)
		
		collectionView.reloadData()
		collectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .top, animated: false) //актуально при переключении режима
	}
	
	
	
	//переключение режима Простые числа <=> Числа Фибоначчи
	@IBAction func modeChanged(_ sender: UISegmentedControl) {
		do {
			try tableInit() //инициализация
		} catch {
			print(error)
		}
	}
	
	
	
	//скролл
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		let offsetY = scrollView.contentOffset.y //смещение верхнего края экрана
		let contentHeight = scrollView.contentSize.height //общая высота контента
		let frameHeight = scrollView.frame.height //высота рамки экрана
		
		//если смещение пытается сдвинуть экран за границу контента, запрашиваем новый контент
		if offsetY > contentHeight - frameHeight - K.cellHeight * CGFloat(K.leftCellsToStartFetching) {
			if fetching == false {
				fetching = true
				
				//асинхронная генерация новой пачки чисел в отдельном фоновом потоке
				DispatchQueue.global(qos: .background).async {
					self.generator!.appendNextNumbers(K.batchSize)
					
					DispatchQueue.main.sync {
						self.collectionView.reloadData()
						self.fetching = false
					}
				}
			}
		}
	}
}



//MARK: - Заполнение данными
extension ViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		return generator!.getNumbersCount()
	}
	
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.cellID, for: indexPath) as! CollectionViewCell
		
		//числа Double, которые не выходят за диапазон Int, для красоты будем выводить без разделителя
		let number = generator!.getNumber(by: indexPath.item)
		if number < Double( Int.max ) {
			cell.label.text = String(Int( number ))
		} else {
			cell.label.text = String( number )
		}
		
		
		//шахматный порядок обеспечивается четностью суммы номера строки и номера столбца
		if ( indexPath.item / Int(K.columnsCount) //номер строки
				+ indexPath.item % Int(K.columnsCount) //номер столбца
		) % 2 == 0 {
			cell.backgroundColor = K.cellBgColor.even
		} else {
			cell.backgroundColor = K.cellBgColor.odd
		}
		
		
		return cell
	}
}



//MARK: - Верстка
extension ViewController: UICollectionViewDelegateFlowLayout{
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}
	
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}
	
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: collectionView.bounds.width/CGFloat(K.columnsCount), height: K.cellHeight)
	}
}
