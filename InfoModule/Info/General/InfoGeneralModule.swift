//
//  InfoGeneralModule.swift
//  Info
//
//  Created by Ramon Haro Marques
//

import UIKit
import Data
import Presentation

public class InfoGeneralModule {
    public static func initialise(host: UIViewController?,
                                  companyFetcher: CompanyInfoFetcherInterface,
                                  launchesFetcher: LaunchesFetcherInterface) -> UIViewController {
        
        let view = InfoGeneralViewController()
        let router = InfoGeneralRouter(context: view, host: host)
        let presenter = InfoGeneralPresenter(companyFetcher: companyFetcher, launchesFetcher: launchesFetcher, router: router)
        
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
}
