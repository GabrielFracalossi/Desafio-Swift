import Foundation

// Music struct with id, name, artist, duration and optional note
struct Music {
    let id: Int
    let name: String
    let artist: Artist
    let duration: TimeInterval
    let note: String?
}

// Artist struct with id and name
struct Artist {
    let id: Int
    let name: String
}

// Jukebox struct with list of available songs, queue of songs to be played and price per song
struct Jukebox {
    private(set) var availableSongs: [Music]
    private(set) var queue: [Music] = []
    let pricePerSong: Double

    init(songs: [Music], pricePerSong: Double) {
        self.availableSongs = songs
        self.pricePerSong = pricePerSong
    }

    // Choose song by id and user
    mutating func chooseSong(byId id: Int, user: User) {
        if let songIndex = availableSongs.firstIndex(where: { $0.id == id }) {
            let song = availableSongs.remove(at: songIndex)
            queue.append(song)
            chargeUser(user, price: pricePerSong)
        } else {
            print("Song with id \(id) not found.")
        }
    }

    // Choose song by name and user
    mutating func chooseSong(byName name: String, user: User) {
        if let songIndex = availableSongs.firstIndex(where: { $0.name == name }) {
            let song = availableSongs.remove(at: songIndex)
            queue.append(song)
            chargeUser(user, price: pricePerSong)
        } else {
            print("Song named \(name) not found.")
        }
    }

    // Get song by id
    func getSong(byId id: Int) -> Music? {
        return availableSongs.first(where: { $0.id == id })
    }

    // Get song by name
    func getSong(byName name: String) -> Music? {
        return availableSongs.first(where: { $0.name == name })
    }

    // Get all songs by artist id
    func getSongs(byArtistId id: Int) -> [Music] {
        return availableSongs.filter { $0.artist.id == id }
    }

    // Get all songs by artist name
    func getSongs(byArtistName name: String) -> [Music] {
        return availableSongs.filter { $0.artist.name == name }
    }

    // Remove song from queue without refund
    mutating func removeSongFromQueue(_ song: Music) {
        if let songIndex = queue.firstIndex(where: { $0.id == song.id }) {
            queue.remove(at: songIndex)
        }
    }

    // List most played songs
    func listMostTocadas() -> [Music] {
        // Implement a better algorithm to get most played songs
        return queue.sorted { $0.timesPlayed > $1.timesPlayed }
    }

    // Get queue
    func getQueue() -> [Music] {
        return queue
    }

    // Charge user
    private mutating func chargeUser(_ user: User, price: Double) {
        if user.money >= price {
            user.money -= price
        } else {
            print("User does not have enough money.")
        }
    }
}

// User struct with id, name, money, and optional age
struct User {
    let id: Int
    let name: String
    var money: Double
    let age: Int?
}
