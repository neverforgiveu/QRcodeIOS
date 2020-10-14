//
//  ViewController.swift
//  QRcodeIOS
//
//  Created by Cooli on 2020/10/13.
//  Copyright © 2020 Cooli. All rights reserved.
//

import UIKit
import CoreImage

class ViewController: UIViewController {

    
    @IBOutlet weak var editText : UITextField?
    @IBOutlet weak var imgQRCode: UIImageView!

    @IBOutlet weak var btnAction:
           UIButton!

    var qrcodeImage: CIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    
    
    func Create(string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)

        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            filter.setValue("H", forKey: "inputCorrectionLevel")
            let transform = CGAffineTransform(scaleX: 3, y: 3)

            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }

        return nil
    }

  
    
    
   
     
    @IBAction func generateQRcode(_ sender: Any) {
        
        if imgQRCode.image == nil{
            
            let test = "https://www.google.com/?client=safari&channel=mac_bm"
        
            imgQRCode.image = Create(string: test)
            
            editText?.resignFirstResponder()  //隱藏鍵盤
            btnAction.setTitle("清除", for: [])
            
            gotoWeb(url: test)
            
            
           /* if editText?.text == ""{
                       return
                }*/
               /* let url = editText?.text
                let data = url?.data(using: String.Encoding.ascii)
                let filter = CIFilter(name: "CIQRCodeGenerator")
            
                let test = "https://www.google.com/?client=safari&channel=mac_bm"
            
                //gotoWeb(url: test)  //點選產生QRcode後直接導向網頁
           
                
                filter?.setValue(data, forKey: "inputMessage")
                filter?.setValue("Q", forKey: "inputCorrectionLevel")
                
                 qrcodeImage = filter?.outputImage
                 
                 imgQRCode.image = UIImage(ciImage: qrcodeImage) //將輸出的 CIImage 轉換成 UIImage 物件
                  //fixQR()
                   editText?.resignFirstResponder()  //隱藏鍵盤
                   btnAction.setTitle("清除", for: [])*/
                    
        }else{
            imgQRCode.image = nil
            //qrcodeImage = nil
            btnAction.setTitle("generate", for: [])
            editText?.text = ""
        }
       
    }
    
   /* func fixQR() {
        let scaleX = imgQRCode.frame.size.width / qrcodeImage.extent.size.width   //使圖片縮放比例相同
        let scaleY = imgQRCode.frame.size.height / qrcodeImage.extent.size.height

        let transformedImage = qrcodeImage.transformed(by: CGAffineTransform(scaleX: scaleX, y: scaleY))

        imgQRCode.image = UIImage(ciImage: transformedImage)

  
    }*/
    
   
    
    func gotoWeb(url : String?){   //網址導向
        if(url == ""){
            return
        }else{
            let web = URL(string: url!)
            UIApplication.shared.open((web)!, options: [:], completionHandler: nil)
        }
    }
    
    
 
        
       
            
        
        
        
    }




