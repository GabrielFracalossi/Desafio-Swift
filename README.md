# Desafio-Swift
Desafio de estudos em swift que simula o funcionamento de uma jukebox

Music Struct
This struct represents a music track with various attributes, including an id, name, artist, duration, and an optional note.

Artist Struct
This struct represents a music artist with an id and name.

Jukebox Struct
This struct represents a jukebox, which contains a list of availableSongs, a queue of songs to be played, and a pricePerSong. The availableSongs property is a list of Music objects, and the queue property is a list of Music objects that have been chosen to be played. The pricePerSong property is a Double that represents the cost of playing a single song.

The Jukebox struct has several methods, including:

    chooseSong(byId:user:): This method allows a user to choose a song by its id to be played. The id is an Int that uniquely identifies the song.
    chooseSong(byName:user:): This method allows a user to choose a song by its name to be played.
    getSong(byId:): This method returns a Music object with a given id.
    getSong(byName:): This method returns a Music object with a given name.
    getSongs(byArtistId:): This method returns a list of Music objects by a given artistId.
    getSongs(byArtistName:): This method returns a list of Music objects by a given artistName.
    removeSongFromQueue(_:): This method removes a given Music object from the queue without refunding the user.
    listMostTocadas(): This method returns a list of the most played Music objects from the queue.
    getQueue(): This method returns the queue of Music objects.
    chargeUser(_:price:): This method charges a user a given price for playing a song.

User Struct
This struct represents a User with an id, name, money, and an optional age.

Overall, the Jukebox struct provides methods for managing a list of Music objects, allowing users to choose songs to be played, and charging users for playing those songs. The Music and Artist structs provide information about the songs and artists available in the jukebox.
