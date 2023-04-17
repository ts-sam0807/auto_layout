//
//  ViewController.swift
//  AutoLayoutStarter
//
//  Created by Derrick Park on 2019-04-17.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let mainView: UIView = {
    let main = UIView()
    // important when setting contraints programmatically
    main.translatesAutoresizingMaskIntoConstraints = false
    main.backgroundColor = .green
    return main
  }()
  
  let squareButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Square", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(squareTapped), for: .touchUpInside)
    return butt
  }()
  
  let portraitButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Portrait", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(portraitTapped), for: .touchUpInside)
    return butt
  }()
  
  let landScapeButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Landscape", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(landscapeTapped), for: .touchUpInside)
    return butt
  }()
  
  
  
  var widthAnchor: NSLayoutConstraint?
  var heightAnchor: NSLayoutConstraint?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(mainView)
    setupLayout()
    
    let redBox = UIView()
    redBox.backgroundColor = .red
    mainView.addSubview(redBox)
    redBox.translatesAutoresizingMaskIntoConstraints = false
    redBox.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20).isActive = true
    redBox.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20).isActive = true
    redBox.widthAnchor.constraint(equalToConstant: 160).isActive = true
    redBox.heightAnchor.constraint(equalToConstant: 50).isActive = true
  
    let orangeBox1 = CGRect.zero
    let orangeBoxView1 = UIView(frame: orangeBox1)
    orangeBoxView1.backgroundColor = UIColor.orange
    redBox.addSubview(orangeBoxView1)
    orangeBoxView1.translatesAutoresizingMaskIntoConstraints = false
    orangeBoxView1.topAnchor.constraint(equalTo: redBox.topAnchor, constant: 10).isActive = true
    orangeBoxView1.leadingAnchor.constraint(equalTo: redBox.leadingAnchor, constant: 10).isActive = true
    orangeBoxView1.widthAnchor.constraint(equalToConstant: 80).isActive = true
    orangeBoxView1.heightAnchor.constraint(equalToConstant: 30).isActive = true
    
    let orangeBox2 = CGRect.zero
    let orangeBoxView2 = UIView(frame: orangeBox2)
    orangeBoxView2.backgroundColor = UIColor.orange
    redBox.addSubview(orangeBoxView2)
    orangeBoxView2.translatesAutoresizingMaskIntoConstraints = false
    orangeBoxView2.topAnchor.constraint(equalTo: redBox.topAnchor, constant: 10).isActive = true
    orangeBoxView2.leadingAnchor.constraint(equalTo: orangeBoxView1.trailingAnchor, constant: 10).isActive = true
    orangeBoxView2.widthAnchor.constraint(equalToConstant: 50).isActive = true
    orangeBoxView2.heightAnchor.constraint(equalToConstant: 30).isActive = true
    
    
    let purpleBox = CGRect.zero
    let purpleView = UIView(frame: purpleBox)
    purpleView.backgroundColor = UIColor.purple
    mainView.addSubview(purpleView)
    purpleView.translatesAutoresizingMaskIntoConstraints = false
    purpleView.topAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -70).isActive = true
    purpleView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20).isActive = true
    purpleView.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.6).isActive = true
    purpleView.heightAnchor.constraint(equalToConstant: 50).isActive = true


    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.alignment = .center
    stackView.distribution = .equalSpacing
//    stackView.spacing = 100
//    stackView.backgroundColor = .black
    mainView.addSubview(stackView)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
    stackView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
    stackView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
    
    
    let blueBoxEmpty1 = UIView()
    stackView.addArrangedSubview(blueBoxEmpty1)
    
    let blueBox1 = UIView()
    let blueBox2 = UIView()
    let blueBox3 = UIView()
    for blueBox in [blueBox1, blueBox2, blueBox3] {
      blueBox.backgroundColor = .blue
      blueBox.translatesAutoresizingMaskIntoConstraints = false
      blueBox.widthAnchor.constraint(equalToConstant: 100).isActive = true
      blueBox.heightAnchor.constraint(equalToConstant: 100).isActive = true
      stackView.addArrangedSubview(blueBox)
    }
    
    let blueBoxEmpty2 = UIView()
    stackView.addArrangedSubview(blueBoxEmpty2)
    
   
    
  }

  fileprivate func setupLayout() {
    mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    widthAnchor = mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7, constant: 0)
    widthAnchor?.isActive = true
    
    heightAnchor = mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7, constant: 0)
    heightAnchor?.isActive = true
    
    let buttStackView = UIStackView(arrangedSubviews: [
      squareButton, portraitButton, landScapeButton])
    buttStackView.translatesAutoresizingMaskIntoConstraints = false
    buttStackView.axis = .horizontal
    buttStackView.alignment = .center
    buttStackView.distribution = .fillEqually
    
    view.addSubview(buttStackView)
    NSLayoutConstraint.activate([
      buttStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
      buttStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      buttStackView.heightAnchor.constraint(equalToConstant: 50),
      buttStackView.widthAnchor.constraint(equalTo: view.widthAnchor)
      ])
  }

  @objc private func squareTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
  
  @objc private func portraitTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
    
  }
  
  @objc private func landscapeTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
}

