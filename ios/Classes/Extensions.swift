//
//  Extensions.swift
//  flutter_yookassa_payments
//
//  Created by Maksim Khizhniakov on 03.08.2021.
//

import Foundation
import YooKassaPayments

extension String {
    func toCurrency() -> Currency {
        switch self {
        case "rub":
            return Currency.rub
        case "usd":
            return Currency.usd
        case "eur":
            return Currency.eur
        default:
            return Currency.custom(self)
        }
    }
    
    func toSavePaymentMethod() -> SavePaymentMethod {
        switch self {
        case "on":
            return SavePaymentMethod.on
        case "off":
            return SavePaymentMethod.off
        default:
            return SavePaymentMethod.userSelects
        }
    }
    
    func toPaymentMethodTypes() -> PaymentMethodTypes {
        switch self {
        case "all":
            return PaymentMethodTypes.all
        case "bankCard":
            return PaymentMethodTypes.bankCard
        case "applePay":
            return PaymentMethodTypes.applePay
        case "sberbank":
            return PaymentMethodTypes.sberbank
        case "yooMoney":
            return PaymentMethodTypes.yooMoney
        default:
            return PaymentMethodTypes.all
        }
    }
}
