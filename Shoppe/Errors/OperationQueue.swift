//
//  OperationQueue.swift
//  Shoppe
//
//  Created by Ylyas Abdywahytow on 3/5/25.
//

import UIKit

protocol OperationQueueBehavioral {
    static func mainAsyncIfNeeded(execute work: @escaping () -> Void)
}

extension OperationQueue: OperationQueueBehavioral {
    static func mainAsyncIfNeeded(execute work: @escaping () -> Void) {
        if Thread.isMainThread {
            work()
        } else {
            main.addOperation(work)
        }
    }
}
