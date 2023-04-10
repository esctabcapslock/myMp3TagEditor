//
//  main.swift
//  mp3tageditor
//
//  Created by zffridption on 2023. 4. 9..
//

import Foundation
import ID3TagEditor

let iD3TagEditor = ID3TagEditor()

// url: ID3TagEditor
func test(){
    
    print("Hello, World 1234")
    let iD3TagEditor = ID3TagEditor()

    let exampleMp3Path = "/Users/users/backup/prj/mp3tageditor/mp3tageditor/ex.葵.mp3"
    let exampleMp3OutDir = "/Users/users/backup/prj/mp3tageditor/mp3tageditor/"

    var readInfo = readmp3(
//        iD3TagEditor:iD3TagEditor,
        mp3Path: exampleMp3Path
    )
    print("readInfo: \(readInfo)")

    readInfo.title = "葵"

    let savePath = writemp3(
        id3TagEditor: iD3TagEditor,
        info: readInfo,
        mp3InPath: exampleMp3Path,
        mp3OutPath: exampleMp3OutDir
    )

    print("출력 확인, savePath:\(savePath!)")
    let newreadInfo = readmp3(
//        iD3TagEditor:iD3TagEditor,
        mp3Path: savePath!
    )
    print("readInfo: \(newreadInfo)")

}


