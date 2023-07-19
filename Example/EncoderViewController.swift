//
//  EncoderViewController.swift
//  Japx_Example
//
//  Created by Vlaho Poluta on 24/01/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import Japx

class EncoderViewController: UIViewController, Resultable {

    @IBOutlet var textView: UITextView!
    
    @IBAction func encodePressed() {
//        guard let data = textView.text.data(using: .utf8) else { return }
        
        do {
            let json = try JapxEncoder().encode(User.newInstance())
            pushResultViewController(with: PrettyPrint.prettyPrintJson(data: json))
        } catch {
            alert(error: error)
        }
    }
}

struct User : Encodable {
    let id: String?
    let type: String = "users"
    let method: String?
    // Attributes
    let name: String?
    //  Defining relationships
    let children: [User]?
    let father: Parent?
    let mother: Parent?
    
    static func newInstance() -> User {
        let children = [
            User(id: "ajhdjkdans", method: SidePosting.create, name: "Hadi", children: nil, father: nil, mother: nil),
            User(id: "1", method: SidePosting.update, name: "Atef", children: nil, father: nil, mother: nil),
            User(id: "2", method: SidePosting.destroy, name: "Mohamed", children: nil, father: nil, mother: nil)
        ]
        
        return User(
            id: "3",
            method: nil,
            name: "Michael",
            children: children,
            father: Parent(id: "kasguydsa", method: SidePosting.create, name: "Ibrahim"),
            mother: Parent(id: "3", method: SidePosting.update, name: "Hanan")
        )
    }
}

struct Parent : Encodable {
    let id: String?
    let type: String = "parents"
    let method: String?
    // Attributes
    let name: String?
}
