//FILEHEADER

import Foundation
import ID3TagEditor


func writemp3(
    id3TagEditor: ID3TagEditor,
    info: Info,
    mp3InPath: String,
    mp3OutPath: String
) -> String?{
        print("hello")
    
    do{
        let id3Tag = ID32v4TagBuilder()
        
        if let title = info.title {id3Tag.title(frame: ID3FrameWithStringContent(content: title))}
        if let album = info.album {id3Tag.album(frame: ID3FrameWithStringContent(content: album))}
        if let albumArtist = info.albumArtist {id3Tag.albumArtist(frame: ID3FrameWithStringContent(content: albumArtist))}
        if let artist = info.artist {id3Tag.artist(frame: ID3FrameWithStringContent(content: artist))}
        if let genre = info.genre {id3Tag.genre(frame: ID3FrameGenre(genre: nil, description: genre))}
        if let track = info.track {id3Tag.trackPosition(frame: ID3FramePartOfTotal(part: track, total: nil))}
        if let year = info.year {
            id3Tag.recordingDateTime(frame: ID3FrameRecordingDateTime(recordingDateTime: RecordingDateTime(
                    date: RecordingDate(day: nil, month: nil, year:year ),
                    time: nil
                )))
        }
        
        let baseURL = URL(fileURLWithPath: mp3OutPath)
        let filename = "\(info.artist ?? "N/A") - \(info.title ?? "null").mp3"
        let outPath = baseURL.appendingPathComponent(filename)
        print("outPath=\"\(outPath.relativePath)\"")

        
        try id3TagEditor.write(
            tag: id3Tag.build(),
            to: mp3InPath,
            andSaveTo: outPath.relativePath
        )
        
        return outPath.relativePath
        
    }catch{
        print(error)
    }
    return nil
//    let newMp3: Data = try id3TagEditor.write(tag: id3Tag, mp3: <valid mp3 file passed as Data>)
}
