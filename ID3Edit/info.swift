//FILEHEADER

import Foundation
import ID3TagEditor

struct Info :CustomStringConvertible,Hashable{
    var title: String?
    var artist: String?
    var album:String?
    var albumArtist: String?
    var genre: String?
    var track: Int?
    var year: Int?
    
    var description: String {
        return "title: \(title), artist: \(artist), album:\(album), genre:\(genre), trackPosition:\(track), year:\(year)"
       }
}

/*
 title(frame: ID3FrameWithStringContent(content: "title V3"))
 .album(frame: ID3FrameWithStringContent(content: "album V3"))
 .albumArtist(frame: ID3FrameWithStringContent(content: "album artist V3"))
 .artist(frame: ID3FrameWithStringContent(content: "artist V3"))
 .genre(frame: ID3FrameGenre(genre: nil, description: "Metalcore"))
 .trackPosition(frame: ID3FramePartOfTotal(part: 2, total: nil))
//          .recordingYear(frame: ID3FrameWithIntegerContent(value: 2019))
 .recordingDateTime(frame: ID3FrameRecordingDateTime(recordingDateTime: RecordingDateTime(
     date: RecordingDate(day: nil, month: nil, year:2019 ),
     time: nil
 )))
 .build()
 */
