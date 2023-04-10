//
//  ContentView.swift
//  myMp3TagEditor
//
//  Created by * on 2023. 4. 9..
//

import SwiftUI
import AppKit

struct FileInfo: Identifiable{
    let id = UUID()
    var path: URL
    var info: Info
}


struct TableCell: View {
    let text: String
    
    var body: some View {
        TextField("", text)
            .textFieldStyle(.roundedBorder)
//            .frame(width: 50, height: 50)
//            .border(Color.black)
    }
}


struct ContentView: View {
//    let dirPath = URL(fileURLWithPath: "/Users/users/dwhelper/out/")
//    let dirPath = URL(fileURLWithPath: "/Users/users/backup/prj/mp3tageditor/mp3tageditor")
    let dirPath = URL(fileURLWithPath: "/Users/users/Library/CloudStorage/OneDrive-SNU/문서/2023-2/일상/mp3test")
//    let dirPath = "/Users/users/dwhelper/out/"
//    var fileURLs: [String]
    @State var fileURLs: [URL] = []
    @State var fileInfos: [FileInfo] = []
    @State private var folderPath = ""
    @State var selectedRow: Int = 0
    
    init(){
        do{
            fileURLs = try readDir(at:dirPath)
            print("출력값: \(fileURLs)")
        }catch{
            fileURLs = []
            print(error)
        }
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            
            
            
            List {
                /* , id: \.self */
                ForEach(fileInfos) { fileInfo in
                    HStack{
                        TableCell(text: fileInfo.path.relativePath)
                        TableCell(text: fileInfo.info.title ?? "null")
                    }
                    
//                    ForEach(item.info) { key in
//                        Text
//                    }
//                        .background(selectedRow == index ? Color.blue : Color.clear)
//                        .onTapGesture {
//                            selectedRow = index
//                        }
                }
            }
            
            HStack{
                Button("Select Folder") {
                               let openPanel = NSOpenPanel()
                               openPanel.canChooseDirectories = true
                               openPanel.canChooseFiles = false
                               openPanel.allowsMultipleSelection = false
                               openPanel.prompt = "Select"
                               if openPanel.runModal() == .OK {
                                   print("hello!")
                                   
                                   folderPath = openPanel.url?.path ?? ""
//                                   do{
                                   print("folderPath:\(type(of: folderPath) )")
                                   do{
                                       fileURLs = try readDir(at: URL(fileURLWithPath: folderPath))
                                       
                                       fileInfos = fileURLs.map {FileInfo(path: $0,
                                                                          info:readmp3( mp3Path: $0.relativePath ) )}
                                       
                                       
                                       print("fileURLs 선택됨: \(fileURLs)")
                                   }catch{
                                       print("error 발생: \(error)")
                                   }

                               }
                           }
                           Text("Selected Folder: \(folderPath)")
            }
            
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
