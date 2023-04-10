//FILEHEADER

import Foundation
import ID3TagEditor

//iD3TagEditor
 
func readmp3(
//    iD3TagEditor: ID3TagEditor,
    mp3Path: String
) -> Info{
    do {
        if let id3Tag = try iD3TagEditor.read(from: mp3Path) {
            let tagContentReader = ID3TagContentReader(id3Tag: id3Tag)
//            print("recordingYear:\t \(tagContentReader.recordingYear())")
            
            
//            print("recordinyear:\t \(tagContentReader.recordingYear())")
//            print("recordingDateTime:\t \(tagContentReader.recordingDateTime())")
//            print("genre:\t \(tagContentReader.genre())")
//            print("albumArtist:\t \(tagContentReader.albumArtist() ?? "")")
//            print("album:\t \(tagContentReader.album() ?? "")")
//            print("artist:\t \(tagContentReader.artist() ?? "")")
//            print("title:\t \(tagContentReader.title() ?? "")")
//            print("trackPosition:\t \(tagContentReader.trackPosition()) ")
            // ...read other stuff...
            
            
            return Info(
                title: tagContentReader.title(),
                artist: tagContentReader.artist(),
                album:tagContentReader.album(),
                albumArtist: tagContentReader.albumArtist(),
                genre: tagContentReader.genre()?.description,
                track: tagContentReader.trackPosition()?.position,
                year: tagContentReader.recordingDateTime()?.year
            )
            
            
        }
    } catch  {
        print("Hello, World 123456")
        print(error)
    }
    return Info()
}
