# Quandoo::MerchantCustomer

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | Identifier of the customer for the calling agent. (Agent dependent field) | [optional] 
**first_name** | **String** | The first name of the customer. Optional. | [optional] 
**last_name** | **String** | The last name of the customer. | [optional] 
**email_address** | **String** | The email address of the customer. | [optional] 
**phone_number** | **String** | The phone number of the customer. The expected format is E164 e.g. +4930120765890 | 
**locale** | **String** | The locale of the customer. E.g. de_DE | 
**country** | **String** | The 2 letter ISO country of the customer, e.g. DE | 
**subscriptions** | [**Array&lt;MerchantSubscription&gt;**](MerchantSubscription.md) | The requested subscriptions, e.g. QUANDOO, MERCHANT | [optional] 


