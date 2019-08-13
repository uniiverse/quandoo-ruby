# Quandoo::GetReservationEnquiryData

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | The agent-dependent unique id of the reservation enquiry | [optional] 
**merchant_id** | **Integer** | The ID of the merchant at which this reservation enquiry was made | [optional] 
**customer_id** | **String** | The ID of the customer to which this reservation enquiry belongs | 
**capacity** | **Integer** | The capacity (people count) of the reservation enquiry | [optional] 
**start_date_time** | **String** | The start date time of the reservation enquiry. Format: yyyy-MM-ddTHH:mm:ssZ | [optional] 
**end_date_time** | **String** | The end date time of the reservation enquiry. Format: yyyy-MM-ddTHH:mm:ssZ | [optional] 
**status** | **String** | The status of the reservation enquiry which can be one of:  NEW, IN_PROGRESS, ACCEPTED or REJECTED | [optional] 


