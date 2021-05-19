//
//  EntityFactory+Launch.swift
//  Core
//
//  Created by Ramon Haro Marques
//

import Foundation

public extension EntityFactory {
    ///Launch 'Crew-1' in 2020
    static let crew1Launch: Launch = Launch(id: "5eb87d4dffd86e000604b38e",
                                            name: "'Crew-1",
                                            details: "SpaceX will launch the first operational mission of its Crew Dragon vehicle as part of NASA's Commercial Crew Transportation Capability Program (CCtCap), carrying 3 NASA astronauts and 1 JAXA astronaut to the International Space Station. This mission will be the second crewed flight to launch from the United States since the end of the Space Shuttle program in 2011.",
                                            flightNumber: 107,
                                            success: true,
                                            launchpad: "5e9e4502f509094188566f88",
                                            fireUTCDate: "2020-11-11T16:17:00.000Z",
                                            fireDateEpoch: 1605111420,
                                            dateUTC: "2020-11-16T00:27:00.000Z",
                                            dateEpoch: 1605486420,
                                            dateLocal: "2020-11-15T19:27:00-05:00",
                                            datePrecision: .hour,
                                            crew: [
                                                "5f7f1543bf32c864a529b23e",
                                                "5f7f158bbf32c864a529b23f",
                                                "5f7f15d5bf32c864a529b240",
                                                "5f7f1614bf32c864a529b241"
                                            ],
                                            ships: [
                                                "5ea6ed2f080df4000697c910",
                                                "5ee68c683c228f36bd5809b5",
                                                "5ea6ed2f080df4000697c90c",
                                                "5ea6ed2e080df4000697c909",
                                                "5ea6ed2f080df4000697c90b"
                                            ],
                                            capsules: [
                                                "5f6f99fddcfdf403df379709"
                                            ],
                                            payloads: [
                                                "5eb0e4d2b6c3bb0006eeb25f"
                                            ],
                                            autoUpdate: true,
                                            launchLibraryID: nil,
                                            tbd: false,
                                            net: false,
                                            window: 0,
                                            rocket: "5e9d0d95eda69973a809d1ec",
                                            links: Launch.Links(presskitURL: nil,
                                                                webcastURL: URL(string: "https://youtu.be/bnChQbxLkkI"),
                                                                youtubeID: "bnChQbxLkkI",
                                                                articleURL: URL(string: "https://spaceflightnow.com/2020/11/16/astronauts-ride-spacex-crew-capsule-in-landmark-launch-for-commercial-spaceflight/"),
                                                                wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/SpaceX_Crew-1"),
                                                                patch: Launch.Links.Patch(smallURL: URL(string: "https://imgur.com/6RnqgLW.png"),
                                                                                          largeURL: URL(string: "https://imgur.com/2XsSLUM.png"))))
    
    
    ///Launch 'GPS III SV05' in 2021
    static let sv05Launch: Launch = Launch(id: "5eb87d4effd86e000604b390",
                                           name: "GPS III SV05",
                                           details: nil,
                                           flightNumber: 131,
                                           success: nil,
                                           launchpad: "5e9e4501f509094ba4566f84",
                                           fireUTCDate: nil,
                                           fireDateEpoch: nil,
                                           dateUTC: "2021-06-17T22:00:00.000Z",
                                           dateEpoch: 1623967200,
                                           dateLocal: "2021-06-17T18:00:00-04:00",
                                           datePrecision: .hour,
                                           crew: [],
                                           ships: [],
                                           capsules: [],
                                           payloads: [
                                            "5eb0e4d2b6c3bb0006eeb261"
                                           ],
                                           autoUpdate: true,
                                           launchLibraryID: nil,
                                           tbd: false,
                                           net: false,
                                           window: 0,
                                           rocket: "5e9d0d95eda69973a809d1ec",
                                           links: Launch.Links(presskitURL: nil,
                                                               webcastURL: nil,
                                                               youtubeID: nil,
                                                               articleURL: nil,
                                                               wikipediaURL: nil,
                                                               patch: Launch.Links.Patch(smallURL: URL(string: "https://imgur.com/6RnqgLW.png"),
                                                                                         largeURL: URL(string: "https://imgur.com/2XsSLUM.png"))))
}
