package com.example.flutter_yookassa_payments


import androidx.annotation.NonNull
import androidx.appcompat.app.AppCompatActivity

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

import ru.yoomoney.sdk.kassa.payments.Checkout
import ru.yoomoney.sdk.kassa.payments.TokenizationResult
import ru.yoomoney.sdk.kassa.payments.checkoutParameters.Amount
import ru.yoomoney.sdk.kassa.payments.checkoutParameters.PaymentMethodType
import ru.yoomoney.sdk.kassa.payments.checkoutParameters.PaymentParameters
import ru.yoomoney.sdk.kassa.payments.checkoutParameters.SavePaymentMethod
import java.math.BigDecimal
import java.util.*

/** FlutterYookassaPaymentsPlugin */
class FlutterYookassaPaymentsPlugin : FlutterPlugin, MethodCallHandler, FlutterYookassaPayments()  {
    private lateinit var channel: MethodChannel

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_yookassa_payments")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        if (call.method == "checkout") {
            val argsAmount = call.argument<Map<String, Any>>("amount")

            val value = argsAmount?.get("value") as Double
            val currency = argsAmount["currency"] as String

            val clientApplicationKey = call.argument<String>("clientApplicationKey")
            val shopId = call.argument<String>("shopId")
            val purchaseDescription = call.argument<String>("purchaseDescription")
            val savePaymentMethod = call.argument<String>("savePaymentMethod")

            val amount = Amount(value.toBigDecimal(), currency.toCurrency())

            val paymentParameters = PaymentParameters(
                clientApplicationKey = clientApplicationKey!!,
                shopId = shopId!!,
                amount = amount,
                title = purchaseDescription!!,
                subtitle = "",
                savePaymentMethod = savePaymentMethod!!.toSavePaymentMethod(),
                paymentMethodTypes = setOf(PaymentMethodType.BANK_CARD)
            )

            startCheckout(
                paymentParameters = paymentParameters,
                resultCallback = fetchTokenizationResultHandler(result)
            )

        } else {
            result.notImplemented()
        }
    }

    private fun fetchTokenizationResultHandler(result: Result): TokenizationResultCallback {
        return object : TokenizationResultCallback {
            override fun success(tokenizationResult: TokenizationResult?) = result.success(
                tokenizationResult?.paymentToken
            )

            override fun failure(error: String) = result.success(
                PaymentResult(success = false, error = error).toMap()
            )
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}

fun String.toCurrency(): Currency {
    return when (this) {
        "rub" -> Currency.getInstance("RUB")
        "eur" -> Currency.getInstance("EUR")
        "usd" -> Currency.getInstance("USD")
        else -> Currency.getInstance(this)
    }
}

fun String.toSavePaymentMethod(): SavePaymentMethod {
    return when (this) {
        "on" -> SavePaymentMethod.ON
        "off" -> SavePaymentMethod.OFF
        else -> SavePaymentMethod.USER_SELECTS
    }
}
