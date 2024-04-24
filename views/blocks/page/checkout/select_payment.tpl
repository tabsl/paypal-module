[{if $sPaymentID == "oscpaypal_express"}]
    [{include file='modules/osc/paypal/select_payment.tpl'}]
[{elseif $sPaymentID == "oscpaypal_sepa" || $sPaymentID == "oscpaypal_cc_alternative"}]
    [{assign var="config" value=$oViewConf->getPayPalCheckoutConfig()}]
    [{if $config->isActive() && !$oViewConf->isPayPalExpressSessionActive()}]
        [{include file="modules/osc/paypal/sepa_cc_alternative.tpl" sPaymentID=$sPaymentID}]
    [{/if}]
[{elseif $sPaymentID == "oscpaypal_applepay"}]
    [{assign var="config" value=$oViewConf->getPayPalCheckoutConfig()}]
    [{if $config->isActive() && !$oViewConf->isPayPalExpressSessionActive()}]
    [{include file="modules/osc/paypal/apple_pay.tpl" sPaymentID=$sPaymentID}]
    [{/if}]
[{else}]
    [{$smarty.block.parent}]
[{/if}]
