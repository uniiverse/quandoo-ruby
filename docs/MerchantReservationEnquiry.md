# Quandoo::MerchantReservationEnquiry

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | The unique identifier of the reservation enquiry for the calling agent (Agent dependent field) or NULL if the agent identifier should be created. Optional. | 
**merchant_id** | **Integer** | The ID of the merchant at which this reservation will be made. | 
**capacity** | **Integer** | The capacity (people count) of the reservation enquiry. | 
**start_date_time** | **String** | The start date and time of the potential reservation. Format: yyyy-MM-ddTHH:mm:ssZ | 
**end_date_time** | **String** | The end date and time of the potential reservation. Format: yyyy-MM-ddTHH:mm:ssZ | 
**message** | **String** | A message from the customer. | 


