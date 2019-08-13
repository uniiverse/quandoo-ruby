# Quandoo::MerchantDetailsDto

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** | The id of the merchant. | 
**name** | **String** | The name of the merchant. | 
**phone_number** | **String** | The phone number of the merchant. | 
**currency** | **String** | The currency of the merchant. | [optional] 
**locale** | **String** | The locale of the merchant. | [optional] 
**timezone** | **String** | The timezone of the merchant. | 
**location** | [**LocationDto**](LocationDto.md) | The location of the merchant. | 
**review_score** | **String** | The review score of the merchant. | 
**tag_groups** | [**Array&lt;TagGroupDto&gt;**](TagGroupDto.md) | The tag groups this merchant belongs to. | [optional] 
**images** | [**Array&lt;ImageDto&gt;**](ImageDto.md) | The images this merchant has. | [optional] 
**documents** | [**Array&lt;DocumentDto&gt;**](DocumentDto.md) | The documents this merchant has. | [optional] 
**links** | [**Array&lt;LinkRelationDto&gt;**](LinkRelationDto.md) | The links related to this entity. | 
**bookable** | **BOOLEAN** | The flag indicates whether the merchant is bookable or not. | 
**opening_times** | [**OpeningTimesDto**](OpeningTimesDto.md) | All opening times of the merchant. | 
**ccv_enabled** | **BOOLEAN** | If true, credit card information is required when creating a reservation. | 
**chain** | [**ChainDto**](ChainDto.md) | The chain of the merchant. | [optional] 
**ivr_redirect_number** | **String** | The IVR forwarding phone number. | [optional] 


