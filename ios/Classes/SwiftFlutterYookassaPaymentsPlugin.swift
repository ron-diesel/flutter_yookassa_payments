import Flutter
import UIKit
import YooKassaPayments

public class SwiftFlutterYookassaPaymentsPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "flutter_yookassa_payments", binaryMessenger: registrar.messenger())
        let instance = SwiftFlutterYookassaPaymentsPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if call.method == "checkout" {
            guard let args = call.arguments as? Dictionary<String, Any> else { return }
            guard let argsAmount = args["amount"] as? Dictionary<String, Any> else { return }
            guard let argsTokenizationSettings = args["tokenizationSettings"] as? Dictionary<String, Any> else { return }
            
            let paymentMethodTypes = argsTokenizationSettings["paymentMethodTypes"] as! String
            let showYooKassaLogo = argsTokenizationSettings["showYooKassaLogo"] as! Bool
            
            let value = argsAmount["value"] as! Double
            let currency = argsAmount["currency"] as! String
            
            let clientApplicationKey = args["clientApplicationKey"] as! String
            let shopName = args["shopName"] as! String
            let purchaseDescription = args["purchaseDescription"] as! String
            let savePaymentMethod = args["savePaymentMethod"] as! String
            
            let tokenizationSettings: TokenizationSettings = TokenizationSettings(paymentMethodTypes: paymentMethodTypes.toPaymentMethodTypes(), showYooKassaLogo: showYooKassaLogo)
            let amount: Amount = Amount(value: Decimal(value), currency: currency.toCurrency())
            let tokenizationModuleInputData: TokenizationModuleInputData = TokenizationModuleInputData(
                clientApplicationKey: clientApplicationKey,
                shopName: shopName,
                purchaseDescription: purchaseDescription,
                amount: amount,
                tokenizationSettings: tokenizationSettings,
                isLoggingEnabled: true,
                savePaymentMethod: savePaymentMethod.toSavePaymentMethod())
            
            
            let vc = PaymentViewController()
            UIApplication.shared.delegate?.window??.rootViewController?.present(vc, animated: true)
            
            vc.startCheckout(tokenizationModuleInputData: tokenizationModuleInputData) { message in
                result(message)
            }
        }
    }
    
}


