//
//  ViewController.swift
//  DeviceRotaion
//
//  Created by KaiChieh on 2018/2/5.
//  Copyright © 2018年 KaiChieh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var deviceWidth: CGFloat = 0.0
    var deviceHeight: CGFloat = 0.0
    var deviceScreen: CGSize = CGSize()

    @IBOutlet weak var imageSingle: UIImageView!

    @IBAction func doAction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2, animations: {
            //1st
            self.imageSingle.frame.origin.x += self.deviceWidth - self.imageSingle.frame.size.width
            self.imageSingle.alpha = 0.5
        }) { (isFinished) in
            UIView.animate(withDuration: 0.3, animations: {
                //2nd
                self.imageSingle.frame.origin.y += self.deviceHeight - self.imageSingle.frame.size.height
            }, completion: { (isFinished) in
                UIView.animate(withDuration: 0.2, animations: {
                    //3rd
                    self.imageSingle.frame.origin.x = 0
                }, completion: { (isFinished) in
                    UIView.animate(withDuration: 0.3, animations: {
                        //4th
                        self.imageSingle.frame.origin.y = 0
                        self.imageSingle.alpha = 1.0
                    })
                })
            })
        }
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //trait collection
        switch self.traitCollection.userInterfaceIdiom {
        case .phone:
            print("this is a phone trait")
        case .pad:
            print("this is an ipad trait")
        default:
            print("this is a unspecified trait")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)

        switch newCollection.horizontalSizeClass {
        case .compact:
            print("will transition horizontalSizeClass compact")
        case .regular:
            print("will transition horizontalSizeClass regular")
        case .unspecified:
            print("will transition horizontalSizeClass unspecified")
        }

        switch newCollection.verticalSizeClass {
        case .compact:
            print("will transition verticalSizeClass compact")
        case .regular:
            print("will transition verticalSizeClass regular")
        case .unspecified:
            print("will transition verticalSizeClass unspecified")
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let picImageView: UIImageView!

        deviceHeight = UIScreen.main.bounds.size.height
        deviceWidth = UIScreen.main.bounds.size.width
        deviceScreen = UIScreen.main.bounds.size
        print("viewDidLayoutSubviews .width = \(deviceScreen.width), .height= \(deviceScreen.height)")

        switch UIDevice.current.orientation {
        case .landscapeLeft, .landscapeRight:
            imageSingle.image = UIImage(named: "landscape")

            picImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: deviceWidth, height: deviceHeight))
            picImageView.image = UIImage(named: "picLandscape")
            picImageView.contentMode = .scaleAspectFill
            picImageView.clipsToBounds = true
            self.view.addSubview(picImageView)
            self.view.sendSubview(toBack: picImageView)
        case .portrait, .portraitUpsideDown:
            imageSingle.image = UIImage(named: "portrait")

            picImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: deviceWidth, height: deviceHeight))
            picImageView.image = UIImage(named: "picPortrait")
            picImageView.contentMode = .scaleAspectFill
            picImageView.clipsToBounds = true
            self.view.addSubview(picImageView)
            self.view.sendSubview(toBack: picImageView)
        default:
            print("others")
        }
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        print("width = \(size.width), height= \(size.height)")

//        imageSingle.image = UIImage(named: "portrait")

//        switch UIDevice.current.orientation {
//        case .faceDown:
//            print("faceDown")
//        case .faceUp:
//            print("faceUp")
//        case .landscapeLeft, .landscapeRight:
//            imageSingle.image = UIImage(named: "landscape")
//            print("landscapeLeft")
//        case .portrait, .portraitUpsideDown:
//            print("portrait")
//            imageSingle.image = UIImage(named: "portrait")
//        default:
//            print("others")
//        }
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .all // override var .allButUpsideDown (read only)
    }
}

