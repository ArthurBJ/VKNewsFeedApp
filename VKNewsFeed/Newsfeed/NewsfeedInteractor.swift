//
//  NewsfeedInteractor.swift
//  VKNewsFeed
//
//  Created by Артур Байбиков on 02.09.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NewsfeedBusinessLogic {
  func makeRequest(request: Newsfeed.Model.Request.RequestType)
}

class NewsfeedInteractor: NewsfeedBusinessLogic {
    
    var presenter: NewsfeedPresentationLogic?
    var service: NewsfeedService?
    
    func makeRequest(request: Newsfeed.Model.Request.RequestType) {
        if service == nil {
            service = NewsfeedService()
        }
        switch request {
        case .getNewsFeed:
            service?.getFeed(completion: { [weak self] (revealedPostIds, feed) in
                self?.presenter?.presentData(response: .presentNewsFeed(feed: feed, revealedPostIds: revealedPostIds))
            })
        case .getUser:
            service?.getUser(completion: { [weak self] user in
                self?.presenter?.presentData(response: .presentUserInfo(user: user))
            })
        case .revealPostIds(let postId):
            service?.revealPostIds(forPostId: postId, completion: { [weak self] revealedPostIds, feed in
                self?.presenter?.presentData(response: .presentNewsFeed(feed: feed, revealedPostIds: revealedPostIds))
            })
        case .getNextBatch:
            self.presenter?.presentData(response: .presentFooterLoader)
            service?.getNextBatch(completion: { revealedPostIds, feed in
                self.presenter?.presentData(response: .presentNewsFeed(feed: feed, revealedPostIds: revealedPostIds))
            })
        }
    }
    
    
}
