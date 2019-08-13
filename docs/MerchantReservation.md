# Quandoo::MerchantReservation

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | The identifier of the reservation for the calling agent (Agent-dependent field) | [optional] 
**merchant_id** | **Integer** | The ID of the merchant at which this reservation will be made. | 
**capacity** | **Integer** | The capacity (people count) of the reservation. | 
**area_id** | **Integer** | The id of the area this reservation should be in. Optional. | [optional] 
**date_time** | **DateTime** | The date and time when the reservation will take place. Format: yyyy-MM-ddTHH:mm:ssZ | 
**order_id** | **String** | The id of the order to which this reservation is associated. Optional. | [optional] 
**extra_info** | **String** | Any extra information that the customer likes to provide. Optional. | [optional] 
**promo_code** | **String** | A promotion code which should be used with this reservation. Optional. | [optional] 
**credit_card_vault_settings_id** | **String** | A credit card vault settings to be used by this reservation. Optional. | [optional] 
**recurring_card_detail_id** | **String** | A customer credit card reference to be used if credit card vault should be applied. Optional. | [optional] 
**deals** | [**Array&lt;DealData&gt;**](DealData.md) | A list of deals data which should be used with this reservation. Optional. | [optional] 


