//
//  StubInAppPurchase.swift
//  InAppPurchase
//
//  Created by Jin Sasaki on 2017/09/05.
//  Copyright © 2017年 Jin Sasaki. All rights reserved.
//

@testable import InAppPurchase

final class StubInAppPurchase: InAppPurchaseProvidable {
    private let _canMakePayments: Bool
    private let _setShouldAddStorePayementHandler: ((_ shouldAddStorePaymentHandler: ((Product) -> Bool)?, _ handler: InAppPurchase.PurchaseHandler?) -> Void)?
    private let _addTransactionObserverHandler: ((_ fallbackHandler: InAppPurchase.PurchaseHandler?) -> Void)?
    private let _removeTransactionObserverHandler: (() -> Void)?
    private let _fetchProductHandler: ((_ productIdentifiers: Set<String>, _ handler: ((_ result: Result<[Product], InAppPurchase.Error>) -> Void)?) -> Void)?
    private let _restoreHandler: ((_ handler: ((_ result: Result<Void, InAppPurchase.Error>) -> Void)?) -> Void)?
    private let _purchaseHandler: ((_ productIdentifier: String, _ handler: InAppPurchase.PurchaseHandler?) -> Void)?

    init(canMakePayments: Bool = true,
         setShouldAddStorePayementHandler: ((_ shouldAddStorePaymentHandler: ((Product) -> Bool)?, _ handler: InAppPurchase.PurchaseHandler?) -> Void)? = nil,
         addTransactionObserverHandler: ((_ fallbackHandler: InAppPurchase.PurchaseHandler?) -> Void)? = nil,
         removeTransactionObserverHandler: (() -> Void)? = nil,
         fetchProductHandler: ((_ productIdentifiers: Set<String>, _ handler: ((_ result: Result<[Product], InAppPurchase.Error>) -> Void)?) -> Void)? = nil,
         restoreHandler: ((_ handler: ((_ result: Result<Void, InAppPurchase.Error>) -> Void)?) -> Void)? = nil,
         purchaseHandler: ((_ productIdentifier: String, _ handler: InAppPurchase.PurchaseHandler?) -> Void)? = nil) {

        self._canMakePayments = canMakePayments
        self._setShouldAddStorePayementHandler = setShouldAddStorePayementHandler
        self._addTransactionObserverHandler = addTransactionObserverHandler
        self._removeTransactionObserverHandler = removeTransactionObserverHandler
        self._fetchProductHandler = fetchProductHandler
        self._restoreHandler = restoreHandler
        self._purchaseHandler = purchaseHandler
    }

    func canMakePayments() -> Bool {
        return _canMakePayments
    }

    func set(shouldAddStorePaymentHandler: ((Product) -> Bool)?, handler: InAppPurchase.PurchaseHandler?) {
        _setShouldAddStorePayementHandler?(shouldAddStorePaymentHandler, handler)
    }

    func addTransactionObserver(fallbackHandler: InAppPurchase.PurchaseHandler?) {
        _addTransactionObserverHandler?(fallbackHandler)
    }

    func removeTransactionObserver() {
        _removeTransactionObserverHandler?()
    }

    func fetchProduct(productIdentifiers: Set<String>, handler: ((_ result: Result<[Product], InAppPurchase.Error>) -> Void)?) {
        _fetchProductHandler?(productIdentifiers, handler)
    }

    func restore(handler: ((_ result: Result<Void, InAppPurchase.Error>) -> Void)?) {
        _restoreHandler?(handler)
    }

    func purchase(productIdentifier: String, handler: InAppPurchase.PurchaseHandler?) {
        _purchaseHandler?(productIdentifier, handler)
    }
}
