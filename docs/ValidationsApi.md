# Quandoo::ValidationsApi

All URIs are relative to *https://api.quandoo.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**validate_phone_number1**](ValidationsApi.md#validate_phone_number1) | **GET** /v1/validations/phone-numbers | Validate phone number


# **validate_phone_number1**
> validate_phone_number1(phone_number, opts)

Validate phone number

This endpoint validates a phone number.  If optional 2-letter country code `country` is not specified, the `phoneNumber` should be formatted according to E164, which means it is expected to be in the international format with a leading `\"+\"` and no spaces or dashes, e.g. `+4930120765890`. Otherwise it may have leading zero instead of country code, e.g. `030120765890`.  The endpoint will return a status `HTTP 200` which means the `phoneNumber` is successfully validated. The endpoint will return a status `HTTP 400` which means the `phoneNumber` is missing or invalid.  Example curl: ``` curl https://{host}/v{X}/validations/phone-numbers?phoneNumber=030120765890&country=IT ```  Example response: ``` {   \"errorMessage\": \"phoneNumber is invalid: 030120765890, country specified is: IT\",   \"errorType\": \"PHONE_NUMBER_INVALID\" } ``` 

### Example
```ruby
# load the gem
require 'quandoo'

api_instance = Quandoo::ValidationsApi.new

phone_number = 'phone_number_example' # String | Phone number

opts = { 
  country: 'country_example' # String | Country code
}

begin
  #Validate phone number
  api_instance.validate_phone_number1(phone_number, opts)
rescue Quandoo::ApiError => e
  puts "Exception when calling ValidationsApi->validate_phone_number1: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **phone_number** | **String**| Phone number | 
 **country** | **String**| Country code | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



