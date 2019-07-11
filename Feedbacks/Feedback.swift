//
//  Feedback.swift
//  Feedbacks
//
//  Created by Kirill Budevich on 7/10/19.
//

public struct Feedback<Base> {
    /// Base object to extend.
    public let base: Base

    /// Creates extensions with base object.
    ///
    /// - parameter base: Base object.
    public init(_ base: Base) {
        self.base = base
    }
}

/// A type that has reactive extensions.
public protocol FeedbackCompatible {
    /// Extended type
    associatedtype CompatibleType

    /// Reactive extensions.
    static var fck: Feedback<CompatibleType>.Type { get set }

    /// Reactive extensions.
    var fck: Feedback<CompatibleType> { get set }
}

extension FeedbackCompatible {
    /// Reactive extensions.
    public static var fck: Feedback<Self>.Type {
        get {
            return Feedback<Self>.self
        }
        set {
            // this enables using Reactive to "mutate" base type
        }
    }

    /// Reactive extensions.
    public var fck: Feedback<Self> {
        get {
            return Feedback(self)
        }
        set {
            // this enables using Reactive to "mutate" base object
        }
    }
}

import class UIKit.UIView

/// Extend NSObject with `fck` proxy.
extension UIView: FeedbackCompatible { }

public protocol FeedbackStyle {
    func execute(in view: UIView)
}
