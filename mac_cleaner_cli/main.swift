//
//  main.swift
//  mac_cleaner_cli
//
//  Created by Alexander Abnosov on 24.05.2024.
//

import Foundation


func deletable(file_path: String) -> Bool? {
    return fm.isDeletableFile(atPath: file_path)
}

func delete_file(file_path: String) -> Any? {
    if deletable(file_path: file_path) == true {
        print("Removing file " + file_path)
        try! fm.removeItem(atPath: file_path)
    } else {
        print("Unable to delete " + file_path)
    }
    return nil
}



let fm = FileManager.default

let base_dir: String = "/Users/alexander/Library/Caches"
let home_dir_files = try! fm.contentsOfDirectory(atPath: base_dir)


print("Clean Caches directory? (y/n)")
var user_input = readLine()
if user_input != nil {
    let lower_input = user_input?.lowercased()
    if lower_input == "y" {
        for file in home_dir_files {
            let filepath = base_dir + "/" + file
            let _ = delete_file(file_path: filepath)
        }
    }
    else {
        print("Bye...")
    }
}
