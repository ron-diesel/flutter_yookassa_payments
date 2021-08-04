package com.example.flutter_yookassa_payments

import android.app.Activity
import android.content.Intent
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.PluginRegistry
import ru.yoomoney.sdk.kassa.payments.Checkout
import ru.yoomoney.sdk.kassa.payments.checkoutParameters.PaymentParameters

const val REQUEST_TOKENIZE_CODE = 100

open class FlutterYookassaPayments: ActivityAware, PluginRegistry.ActivityResultListener {
    private var binding: ActivityPluginBinding? = null
    private var callback: TokenizationResultCallback? = null

    private fun checkBinding(resultCallback: TokenizationResultCallback): Boolean {
        if (binding?.activity?.application == null) {
            resultCallback.failure("Fail to resolve Application on registration")
            return false
        }
        return true
    }

    fun startCheckout(paymentParameters: PaymentParameters, resultCallback: TokenizationResultCallback) {
        if (!checkBinding(resultCallback)) return
        if (callback == null) {
            callback = resultCallback
            binding?.let {
                val intent: Intent = Checkout.createTokenizeIntent(
                    it.activity,
                    paymentParameters
                )
                it.activity.startActivityForResult(intent, REQUEST_TOKENIZE_CODE)
            }
        }
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        this.binding = binding
        binding.addActivityResultListener(this)
    }

    override fun onDetachedFromActivityForConfigChanges() {
        binding?.removeActivityResultListener(this)
        binding = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        this.binding?.removeActivityResultListener(this)
        this.binding = binding
        binding.addActivityResultListener(this)
    }

    override fun onDetachedFromActivity() {
        binding?.removeActivityResultListener(this)
        binding = null
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        if (requestCode != REQUEST_TOKENIZE_CODE) {
            callback = null
            return false
        }
        when (resultCode) {
            Activity.RESULT_OK -> {
                if (data != null && callback != null)
                    callback!!.success(Checkout.createTokenizationResult(data))
            }
            Activity.RESULT_CANCELED ->
                callback?.failure(binding!!.activity.getString(R.string.ym_error_something_went_wrong))

            Checkout.RESULT_ERROR -> {
                if (data != null && callback != null)
                    callback!!.failure(data.getStringExtra(Checkout.EXTRA_ERROR_DESCRIPTION)
                        ?: binding!!.activity.getString(R.string.ym_error_something_went_wrong))
            }
            else -> {
                callback?.failure(binding!!.activity.getString(R.string.ym_error_something_went_wrong))
                callback = null
                return false
            }
        }
        callback = null
        return true
    }

}