# Quandoo::ReservationData

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | The agent-dependent unique id of the reservation. | 
**number** | **Integer** | The id of the reservation on quandoo system. | 
**quandoo_id** | **String** | The public id of this reservation on quandoo system. | 
**status** | **String** | The status of the reservation. | 
**updated_at** | **DateTime** | The date and time when the reservation will take place. Format: yyyy-MM-ddTHH:mm:ssZ | 
**capacity** | **Integer** | The capacity of the reservation. | 
**merchant_id** | **Integer** | The id of the merchant. | 
**customer_id** | **String** | The id of the customer. | 
**promocode** | **String** | The promotion code used in this reservation. Optional. | [optional] 
**extra_info** | **String** | Extra information that the customer provided for the reservation. Optional. | [optional] 
**links** | [**Array&lt;LinkRelationDto&gt;**](LinkRelationDto.md) | The links related to this entity. | 


