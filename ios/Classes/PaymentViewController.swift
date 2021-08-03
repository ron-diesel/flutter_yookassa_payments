//
//  PaymentViewController.swift
//  flutter_yookassa_payments
//
//  Created by Maksim Khizhniakov on 03.08.2021.
//

import UIKit
import YooKassaPayments
import Flutter
// MARK: - Typealiases
typealias TokenCompletionHandler = (String) -> Void


class PaymentViewController: UIViewController {
    // MARK: - Properties
    private var tokenCompletionHandler: TokenCompletionHandler?
            
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Public methods
    func startCheckout(tokenizationModuleInputData: TokenizationModuleInputData, tokenCompletionHandler: @escaping TokenCompletionHandler) {
        self.tokenCompletionHandler = tokenCompletionHandler
        let inputData: TokenizationFlow = .tokenization(tokenizationModuleInputData)
        
        let viewController = TokenizationAssembly.makeModule(inputData: inputData, moduleOutput: self)
        
        self.present(viewController, animated: true)
    }
}

extension PaymentViewController: TokenizationModuleOutput {
    public func didSuccessfullyPassedCardSec(on module: TokenizationModuleInput) {
        print("didSuccessfullyPassedCardSec")
    }
    
    public func tokenizationModule(
        _ module: TokenizationModuleInput,
        didTokenize token: Tokens,
        paymentMethodType: PaymentMethodType
    ) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            self.tokenCompletionHandler?(token.paymentToken)
            self.dismiss(animated: true)
            self.dismiss(animated: true)
        }
        // Отправьте токен в вашу систему
    }
    
    public func didFinish(
        on module: TokenizationModuleInput,
        with error: YooKassaPaymentsError?
    ) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.dismiss(animated: true)
        }
    }
    
    public func didSuccessfullyConfirmation(
        paymentMethodType: PaymentMethodType
    ) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            // Создать экран успеха после прохождения подтверждения (3DS или Sberpay)
            self.dismiss(animated: true)
            // Показать экран успеха
        }
    }
}
