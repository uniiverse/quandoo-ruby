# Quandoo::ReservationSettingsApi

All URIs are relative to *https://api.quandoo.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**reservation_settings1**](ReservationSettingsApi.md#reservation_settings1) | **GET** /v1/merchants/{merchantId}/reservation-settings | Get merchant reservation settings


# **reservation_settings1**
> MerchantReservationSettingsDto reservation_settings1(merchant_id)

Get merchant reservation settings

This endpoint provides all data that is required to initiate the reservation flow and is not part of the search endpoint.  Example curl: ``` curl https://{host}/v{X}/merchants/15/reservation-settings ```  Example response:  ``` {   \"areaIds\": [     {       \"id\": 2,       \"name\": \"Garden\",       \"priority\": 10     }   ],   \"areaSelectionRequired\": true,   \"capacities\": [     1,     2,     3,     4,     5,     6   ],   \"links\": [     {       \"href\": \"https://{host}/v{X}/merchants/15\",       \"method\": \"GET\",       \"rel\": \"parent\"     },     {       \"href\": \"https://{host}/v{X}/merchants/15/availabilities\",       \"method\": \"GET\",       \"rel\": \"availability_days\"     },     {       \"href\": \"https://{host}/v{X}/merchants/15/availabilities/2017-01-01/times\",       \"method\": \"GET\",       \"rel\": \"availability\"     }   ],   \"merchantNewsletterSelectionRequired\": true,   \"minimumCapacityForEnquiries\": 10,   \"onlineReservationInterval\": 60,   \"reservationEnquiryEnabled\": true,   \"specialTerms\": \"This is any custom string for special terms\",   \"automaticConfirmation\": true,   \"ccvEnabled\": true } ``` 

### Example
```ruby
# load the gem
require 'quandoo'

api_instance = Quandoo::ReservationSettingsApi.new

merchant_id = 56 # Integer | Id of the merchant


begin
  #Get merchant reservation settings
  result = api_instance.reservation_settings1(merchant_id)
  p result
rescue Quandoo::ApiError => e
  puts "Exception when calling ReservationSettingsApi->reservation_settings1: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **merchant_id** | **Integer**| Id of the merchant | 

### Return type

[**MerchantReservationSettingsDto**](MerchantReservationSettingsDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



