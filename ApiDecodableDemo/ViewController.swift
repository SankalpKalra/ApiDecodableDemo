//
//  ViewController.swift
//  ApiDecodableDemo
//
//  Created by Appinventiv on 15/03/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit

struct WebsiteDescription:Decodable{
    let name:String
    let description:String
    let courses: [Course]
}

struct Course:Decodable{
    let id:Int?
    let name:String?
    let link:String?
    let imageUrl:String?

//we dont even need to initialize when we use Decodable Protocol it decode by its Infer type
//    init(json:[String:Any]){
//        id = json["id"] as? Int ?? -1
//        name = json["name"] as? String ?? ""
//        link = json["link"] as? String ?? ""
//        imageUrl = json["imageUrl"] as? String ?? ""
//    }
//
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/courses_missing_fields"
        
        guard let url = URL(string: jsonUrlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let data = data else { return }
            do{
//                let websiteDescription = try JSONDecoder().decode(WebsiteDescription.self, from: data)
//                print(websiteDescription.name)
//                print()
//                print(websiteDescription.description)
//                print()
//                let course = websiteDescription.courses
//                for course in course{
//                    print("Id:",course.id)
//                    print()
//                    print("Name:",course.name)
//                    print()
//                    print("LINK:",course.link)
//                    print()
//                    print("ImageUrl:",course.imageUrl)
//                    print()
//                    print()
//                }
                //using Swift 4 its too easy to parse data
               
                let courses = try JSONDecoder().decode([Course].self, from: data)
                for course in courses{
                    if let course_id=course.id{
                    print(course_id)
                    }
                }
                
                //using swift 2/3/Objc
//                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any] else      { return }
//               let course = Course(json: json)
//                print(course.name!)
            }catch let jsonerr {
                print("JSON Serializing Err:",jsonerr)
            }
        }.resume()
        
    }
}

