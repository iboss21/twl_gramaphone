--[[
    ████████╗██╗    ██╗██╗          ██████╗ ██████╗  █████╗ ███╗   ███╗ ██████╗ ██████╗ ██╗  ██╗ ██████╗ ███╗   ██╗███████╗
    ╚══██╔══╝██║    ██║██║         ██╔════╝ ██╔══██╗██╔══██╗████╗ ████║██╔═══██╗██╔══██╗██║  ██║██╔═══██╗████╗  ██║██╔════╝
       ██║   ██║ █╗ ██║██║         ██║  ███╗██████╔╝███████║██╔████╔██║██║   ██║██████╔╝███████║██║   ██║██╔██╗ ██║█████╗  
       ██║   ██║███╗██║██║         ██║   ██║██╔══██╗██╔══██║██║╚██╔╝██║██║   ██║██╔═══╝ ██╔══██║██║   ██║██║╚██╗██║██╔══╝  
       ██║   ╚███╔███╔╝███████╗    ╚██████╔╝██║  ██║██║  ██║██║ ╚═╝ ██║╚██████╔╝██║     ██║  ██║╚██████╔╝██║ ╚████║███████╗
       ╚═╝    ╚══╝╚══╝ ╚══════╝     ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝ ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
    
    CURATED 1899-ERA MUSIC PLAYLISTS
    www.wolves.land | Created by iBoss
    All music is period-appropriate for 1899 authenticity
    The Land of Wolves - Authentic Historical Music
    
    This file contains:
    - 8 carefully curated playlists
    - 50+ authentic tracks from the 1890s-1900s era
    - Scott Joplin ragtime, John Philip Sousa marches
    - Traditional folk songs, classical waltzes, hymns
    - Early phonograph recordings
]]

-- Brand protection: TheLandOfWolves | iBoss | www.wolves.land
local PLAYLIST_BRAND = "TheLandOfWolves_iBoss_Authentic1899Music"

Playlists = {
    {
        id = "saloon_ragtime",
        name = "🎹 Saloon Ragtime",
        description = "Scott Joplin classics and lively ragtime piano",
        icon = "🎹",
        tracks = {
            { title = "Maple Leaf Rag", artist = "Scott Joplin", url = "https://www.youtube.com/watch?v=pMAtL7n_-rc", duration = 209 },
            { title = "The Entertainer", artist = "Scott Joplin", url = "https://www.youtube.com/watch?v=fPmruHc4S9Q", duration = 181 },
            { title = "Elite Syncopations", artist = "Scott Joplin", url = "https://www.youtube.com/watch?v=gP6uVQghuRY", duration = 187 },
            { title = "The Ragtime Dance", artist = "Scott Joplin", url = "https://www.youtube.com/watch?v=9_YkeqlzgUw", duration = 165 },
            { title = "Fig Leaf Rag", artist = "Scott Joplin", url = "https://www.youtube.com/watch?v=9_YkeqlzgUw", duration = 178 },
            { title = "Original Rags", artist = "Scott Joplin", url = "https://www.youtube.com/watch?v=XrFvIFZWBqI", duration = 155 },
            { title = "Easy Winners", artist = "Scott Joplin", url = "https://www.youtube.com/watch?v=7WZ0ggHjvHo", duration = 195 },
            { title = "Peacherine Rag", artist = "Scott Joplin", url = "https://www.youtube.com/watch?v=kbpwR6g50DU", duration = 172 }
        }
    },
    {
        id = "popular_ballads",
        name = "🎵 Popular Ballads",
        description = "Sentimental favorites from the 1890s",
        icon = "🎵",
        tracks = {
            { title = "After the Ball", artist = "Charles K. Harris", url = "https://www.youtube.com/watch?v=v9MbMH_KXQU", duration = 198 },
            { title = "Daisy Bell (Bicycle Built for Two)", artist = "Harry Dacre", url = "https://www.youtube.com/watch?v=78MKBHR3NbU", duration = 142 },
            { title = "Ta-Ra-Ra Boom-De-Ay", artist = "Henry J. Sayers", url = "https://www.youtube.com/watch?v=hPKvyhFMd0g", duration = 125 },
            { title = "The Band Played On", artist = "John F. Palmer", url = "https://www.youtube.com/watch?v=T7ihdsjIqhI", duration = 156 },
            { title = "My Wild Irish Rose", artist = "Chauncey Olcott", url = "https://www.youtube.com/watch?v=7ZVBcgJDGVg", duration = 178 },
            { title = "Sweet Rosie O'Grady", artist = "Maude Nugent", url = "https://www.youtube.com/watch?v=1JvSvKiQCus", duration = 134 },
            { title = "The Sidewalks of New York", artist = "Charles Lawlor", url = "https://www.youtube.com/watch?v=gk_pVUmZOgU", duration = 145 },
            { title = "In the Good Old Summer Time", artist = "George Evans", url = "https://www.youtube.com/watch?v=QGuG4Iv7pnw", duration = 167 }
        }
    },
    {
        id = "military_marches",
        name = "🥁 Military Marches",
        description = "John Philip Sousa and patriotic music",
        icon = "🥁",
        tracks = {
            { title = "The Stars and Stripes Forever", artist = "John Philip Sousa", url = "https://www.youtube.com/watch?v=M5bcpjUjLpU", duration = 211 },
            { title = "The Washington Post March", artist = "John Philip Sousa", url = "https://www.youtube.com/watch?v=IcW-Jfuv12I", duration = 145 },
            { title = "Semper Fidelis", artist = "John Philip Sousa", url = "https://www.youtube.com/watch?v=bS5ve8rG-Ik", duration = 156 },
            { title = "The Thunderer", artist = "John Philip Sousa", url = "https://www.youtube.com/watch?v=qqTLjAkKKmE", duration = 189 },
            { title = "The Liberty Bell", artist = "John Philip Sousa", url = "https://www.youtube.com/watch?v=XL01bfOtGdE", duration = 201 },
            { title = "King Cotton", artist = "John Philip Sousa", url = "https://www.youtube.com/watch?v=Sco-ULpT38s", duration = 178 }
        }
    },
    {
        id = "american_folk",
        name = "🤠 American Folk",
        description = "Traditional cowboy songs and frontier music",
        icon = "🤠",
        tracks = {
            { title = "Oh! Susanna", artist = "Stephen Foster", url = "https://www.youtube.com/watch?v=YwSZvHqf9qM", duration = 123 },
            { title = "Camptown Races", artist = "Stephen Foster", url = "https://www.youtube.com/watch?v=1g5fVWFCvPY", duration = 145 },
            { title = "Red River Valley", artist = "Traditional", url = "https://www.youtube.com/watch?v=lXhU9zacjzw", duration = 189 },
            { title = "Home on the Range", artist = "Traditional", url = "https://www.youtube.com/watch?v=_QB7VJL2TNU", duration = 167 },
            { title = "Buffalo Gals", artist = "Traditional", url = "https://www.youtube.com/watch?v=w7JFE8IkhBY", duration = 134 },
            { title = "Shenandoah", artist = "Traditional", url = "https://www.youtube.com/watch?v=h13MQdNu8JI", duration = 198 },
            { title = "Turkey in the Straw", artist = "Traditional", url = "https://www.youtube.com/watch?v=BLR1s5zQf_o", duration = 112 },
            { title = "My Old Kentucky Home", artist = "Stephen Foster", url = "https://www.youtube.com/watch?v=QaHHqH-dSq4", duration = 156 }
        }
    },
    {
        id = "classical_waltzes",
        name = "💃 Classical Waltzes",
        description = "Elegant Strauss waltzes for dancing",
        icon = "💃",
        tracks = {
            { title = "The Blue Danube", artist = "Johann Strauss II", url = "https://www.youtube.com/watch?v=_Gz9um3wV1o", duration = 625 },
            { title = "Emperor Waltz", artist = "Johann Strauss II", url = "https://www.youtube.com/watch?v=vXCKzm3lH7k", duration = 678 },
            { title = "Tales from the Vienna Woods", artist = "Johann Strauss II", url = "https://www.youtube.com/watch?v=w8r4f5zgghw", duration = 734 },
            { title = "Voices of Spring", artist = "Johann Strauss II", url = "https://www.youtube.com/watch?v=NZ5pYF5TFnw", duration = 412 },
            { title = "Artist's Life Waltz", artist = "Johann Strauss II", url = "https://www.youtube.com/watch?v=PVnhT9mzXHM", duration = 589 },
            { title = "Vienna Blood", artist = "Johann Strauss II", url = "https://www.youtube.com/watch?v=VgY6h3VBcyI", duration = 512 }
        }
    },
    {
        id = "hymns_spirituals",
        name = "⛪ Hymns & Spirituals",
        description = "Gospel songs and church music",
        icon = "⛪",
        tracks = {
            { title = "Amazing Grace", artist = "Traditional", url = "https://www.youtube.com/watch?v=CDdvReNKKuk", duration = 234 },
            { title = "Swing Low, Sweet Chariot", artist = "Traditional Spiritual", url = "https://www.youtube.com/watch?v=fWxZZX4bliE", duration = 178 },
            { title = "Nearer, My God, to Thee", artist = "Sarah F. Adams", url = "https://www.youtube.com/watch?v=SJWOZAXbHyE", duration = 201 },
            { title = "Rock of Ages", artist = "Augustus Toplady", url = "https://www.youtube.com/watch?v=4bUBu-x5ptE", duration = 167 },
            { title = "The Old Rugged Cross", artist = "George Bennard", url = "https://www.youtube.com/watch?v=zb-EVP7M5DQ", duration = 189 },
            { title = "Abide with Me", artist = "Henry Francis Lyte", url = "https://www.youtube.com/watch?v=1m8hsNj_taQ", duration = 198 }
        }
    },
    {
        id = "vaudeville_novelty",
        name = "🎭 Vaudeville & Novelty",
        description = "Stage comedy songs and entertainment",
        icon = "🎭",
        tracks = {
            { title = "Bill Bailey, Won't You Please Come Home", artist = "Hughie Cannon", url = "https://www.youtube.com/watch?v=TnT0FdLFN5Y", duration = 145 },
            { title = "A Hot Time in the Old Town Tonight", artist = "Theodore Metz", url = "https://www.youtube.com/watch?v=X0YFCGqKYQ4", duration = 156 },
            { title = "Hello! Ma Baby", artist = "Joseph E. Howard", url = "https://www.youtube.com/watch?v=R1VLQjNF7tI", duration = 134 },
            { title = "I've Been Working on the Railroad", artist = "Traditional", url = "https://www.youtube.com/watch?v=G1MxBzqTZVU", duration = 123 },
            { title = "The Bowery", artist = "Charles H. Hoyt", url = "https://www.youtube.com/watch?v=N0LQZ7U6nfk", duration = 167 },
            { title = "Yankee Doodle Boy", artist = "George M. Cohan", url = "https://www.youtube.com/watch?v=OFDh5r0Wqok", duration = 189 }
        }
    },
    {
        id = "early_recordings",
        name = "📻 Early Phonograph Recordings",
        description = "Authentic 1890s cylinder recordings",
        icon = "📻",
        tracks = {
            { title = "Edison Cylinder Recording - 1890s", artist = "Various Artists", url = "https://www.youtube.com/watch?v=HNEXiSMt2CM", duration = 234 },
            { title = "Early Phonograph - Band Music", artist = "Various Artists", url = "https://www.youtube.com/watch?v=kS6y0z8sLKM", duration = 189 },
            { title = "1890s Gramophone Recording", artist = "Various Artists", url = "https://www.youtube.com/watch?v=T8sxQq1qIiE", duration = 156 },
            { title = "Victorian Era Music Box", artist = "Historical Recording", url = "https://www.youtube.com/watch?v=xkdXI9kVy1M", duration = 178 }
        }
    }
}

return Playlists
