//
//  Observable.swift
//  WebService
//
//  Created by Darshan Dangar on 10/08/23.
//

import Foundation

class Observable<T> {

    private var value: T {
        didSet {
            action?(value)
        }
    }

    typealias Action = (T) -> Void

    private var action: Action?

    init(value: T) {
        self.value = value
    }

    func set(_ value: T) {
        self.value = value
    }

    func bind(action: @escaping Action) {
        self.action = action
    }
}

enum Event {
    case idle(_ type: String = "")
    case loading(_ type: String = "")
    case stopLoading(_ type: String = "")
    case apiStatus(_ type: String = "", _ apiMessage: String = "", _ data: Decodable & Encodable)
}
