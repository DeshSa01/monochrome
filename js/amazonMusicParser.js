// Amazon Music Playlist Parser Implementation

class AmazonMusicParser {
    constructor(playlistData) {
        this.playlistData = playlistData;
    }

    parse() {
        const parsedSongs = this.playlistData.map(song => {
            return {
                title: song.title,
                artist: song.artist,
                album: song.album,
                duration: song.duration
            };
        });
        return parsedSongs;
    }
}

// Example usage:
const playlistData = [
    { title: 'Song 1', artist: 'Artist 1', album: 'Album 1', duration: '3:45' },
    { title: 'Song 2', artist: 'Artist 2', album: 'Album 2', duration: '4:12' }
];
const parser = new AmazonMusicParser(playlistData);
console.log(parser.parse());