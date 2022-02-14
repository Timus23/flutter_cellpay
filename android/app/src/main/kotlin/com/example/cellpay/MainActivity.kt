package com.example.cellpay

import com.cellcom.cellpay_sdk.api.Config
import com.cellcom.cellpay_sdk.api.OnCheckOutListener
import com.cellcom.cellpay_sdk.helper.CellpayCheckOut
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity: FlutterActivity() {
    private val channelName = "com.cellpay.sdk";

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelName).setMethodCallHandler {
                call, result ->
                if(call.method.equals("init_cellpay")){
                    initPayment(call.arguments as HashMap<String,Any>, result);
                }
        }
    }

    private fun initPayment(configArgument : HashMap<String,Any>, result : MethodChannel.Result){
        val publicKey: String = configArgument["publicKey"] as String;
        val merchantId: String = configArgument["merchantId"] as String;
        val invoiceNumber: String = configArgument["invoiceNumber"] as String;
        val description: String = configArgument["description"] as String;
        val amount: Long = (configArgument["amount"] as Double).toLong();
        val extra: HashMap<String,String> = configArgument["extra"] as HashMap<String,String>;

        val config = Config(
            publicKey,
            merchantId,
            invoiceNumber,
            description,
            amount,
            extra,
            object : OnCheckOutListener {
                override fun onSuccess(data: HashMap<String?, Any>) {
                    result.success(data);
                }

                override fun onError(action: String, message: String) {
                    val errorMessage : HashMap<String,String> = HashMap<String,String>();
                    errorMessage["message"] = message;
                    result.success(errorMessage);
                }
            })

        val cellpayCheckOut = CellpayCheckOut(this, config)
        cellpayCheckOut.show();
    }
}
