//FILEHEADER

import Foundation

func readDir(at url: URL, pathExtension:String = "mp3") throws -> [URL] {
    do{
        let fileManager = FileManager.default
//        let files = try fileManager.contentsOfDirectory(atPath: path)
        let files = try fileManager.contentsOfDirectory(at: url, includingPropertiesForKeys: nil)
//        return files
        return files.filter { !$0.hasDirectoryPath }.filter{$0.pathExtension == pathExtension}
//        return files.filter(<#T##isIncluded: (URL) throws -> Bool##(URL) throws -> Bool#>)
//        return  files.filter( (URL) in
//                             url.pathExtension == pathExtension )
    }catch{
        print(error);
        return []
    }
    
}
