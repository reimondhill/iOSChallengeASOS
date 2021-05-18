//
//  LaunchesFetcherInterface.swift
//  Data
//
//  Created by Ramon Haro Marques
//

import Foundation
import Core

protocol LaunchesFetcherInterface {
    /* OBSERVATION: For V3 limit and offset are working but not for V4. Since the website says that V3 is deprecated, I am using V4 and waiting for new updates*/
    /// Fetches all the launches
    /// - Parameters:
    ///   - completion: Callback called when the process finishes
    func getLaunch(completion: @escaping (Result<[Launch], Error>)->Void)
}
