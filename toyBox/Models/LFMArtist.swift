import Foundation

struct LFMImageModel: Codable {
    var url: String
    var size: String

    enum CodingKeys: String, CodingKey {
        case url = "#text"
        case size
    }
}

struct LFMArtistModel: Codable {
    var artist: LFMArtistDetails
}

struct LFMTopArtistsModel: Codable {
    var artists: LFMTopArtistsDetailsModel
}

struct LFMTopArtistsDetailsModel: Codable {
    var artist: [LFMArtistDetails]
    var attr: LFMAttr

    enum CodingKeys: String, CodingKey {
        case artist
        case attr = "@attr"
    }
}

struct LFMAttr: Codable {
    var page: String
}

struct LFMArtistDetails: Codable {
    var name: String
    var mbid: String
    var url: String
    var image: [LFMImageModel]
}

struct LFMArtist: Request {
    typealias ReturnType = LFMArtistModel
    var queryParams: [String : String]? = [:]
    var path: String = ""

    var artistName: String
    var mbid: String

    init(artistName: String) {
        self.artistName = artistName
        mbid = ""

        queryParams = [
            "method": "artist.getinfo",
            "artist": artistName,
            "api_key": Secrets.shared.lfmApiKey,
            "format": "json"
        ]
    }

    init(mbid: String) {
        self.mbid = mbid
        self.artistName = ""

        queryParams = [
            "method": "artist.getinfo",
            "mbid": mbid,
            "api_key": Secrets.shared.lfmApiKey,
            "format": "json"
        ]
    }
}

struct LFMTopArtists: Request {
    typealias ReturnType = LFMTopArtistsModel
    var queryParams: [String : String]? = [:]
    var path: String = ""

    init() {
        queryParams = [
            "method": "chart.gettopartists",
            "api_key": Secrets.shared.lfmApiKey,
            "format": "json"
        ]
    }
}
