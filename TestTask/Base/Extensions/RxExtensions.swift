//
//  RxExtensions.swift
//  TestTask
//
//  Created by Polina on 8/18/19.
//  Copyright © 2019 Polina. All rights reserved.
//

import RxSwift

protocol OptionalType {
    associatedtype Wrapped

    var optional: Wrapped? { get }
}

extension Optional: OptionalType {
    var optional: Wrapped? { return self }
}

extension Observable where Element: OptionalType {
    func ignoreNil() -> Observable<Element.Wrapped> {
        return flatMap { value in
            value.optional.map { Observable<Element.Wrapped>.just($0) } ?? Observable<Element.Wrapped>.empty()
        }
    }
}

extension Observable {
    func voidValues() -> Observable<Void> {
        return map { _ in () }
    }

    func withPrevious(startWith first: E) -> Observable<(E, E)> {
        return scan((first, first)) { ($0.1, $1) }.skip(1)
    }

    func observeForUI() -> Observable<E> {
        return observeOn(MainScheduler.instance)
    }

}

extension Observable where Element == [Bool] {
    func areAllTrue() -> Observable<Bool> {
        return map { values -> Bool in
            values.reduce(true) { x, y in
                return x && y
            }
        }
    }
}
