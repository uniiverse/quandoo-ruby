# Quandoo::MerchantCustomerData

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | The id of the customer. | 
**customer_ref** | **String** | Customer reference  | 
**marketing_flags** | [**Array&lt;MarketingSettingDto&gt;**](MarketingSettingDto.md) | Marketing flags for customer. | 
**title** | **String** | Title of the customer. | 
**first_name** | **String** | First name of the customer. | 
**last_name** | **String** | Last name of the customer. | 
**email** | **String** | Email of the customer. | 
**phone_number** | **String** | Fixed line phone number of the customer. | 
**mobile_number** | **String** | Mobile phone number of the customer. | 
**locale** | **String** | Locale of the customer. | 
**links** | [**Array&lt;LinkRelationDto&gt;**](LinkRelationDto.md) | The links related to this entity. | 
**subscriptions** | [**Array&lt;MerchantSubscription&gt;**](MerchantSubscription.md) | The newsletter subscriptions, e.g. QUANDOO, MERCHANT. | 
**statistics** | [**CustomerStatisticsData**](CustomerStatisticsData.md) | Statistics about the customer | 
**updated_at** | **DateTime** | The date and time when the reservation will take place. Format: yyyy-MM-ddTHH:mm:ssZ | 


