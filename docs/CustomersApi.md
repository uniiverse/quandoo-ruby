# Quandoo::CustomersApi

All URIs are relative to *https://api.quandoo.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_customer1**](CustomersApi.md#get_customer1) | **GET** /v1/customers/{customerId} | Get customer Data
[**get_customers_of_merchant1**](CustomersApi.md#get_customers_of_merchant1) | **GET** /v1/merchants/{merchantId}/customers | Get a list of Customers of a merchant
[**get_reservations1**](CustomersApi.md#get_reservations1) | **GET** /v1/customers/{customerId}/reservations | Get customer reservations


# **get_customer1**
> CustomerResponse get_customer1(customer_id)

Get customer Data

This endpoint allows an agent to get customer information by id.   Customer id both in the request and response are agent-specific. The agent needs to be authenticated.  The endpoint will return `HTTP 404 - Not Found` if the customer with the specified id could not be found. It will return `HTTP 403 - Forbidden` if the agent is not authenticated or the agent doesn't have permissions.  ####Request: * **customerId**: Agent-specific ID of the customer  ####Response: The response contains the following data of the customer as explained below: * **id**: The agent-dependent identifier of the customer  * **email**: The given email of this customer. _Optional_ * **firstName**: First name of the customer. _Optional_ * **lastName**: Last name of the customer. _Optional_ * **gender**: The given gender of the customer (one of MALE, FEMALE, OTHER or UNDEFINED). _Optional_ * **phoneNumber**: The ID of the merchant at which this reservation was made * **mobileNumber**: The ID of the customer to which this reservation belongs * **country**: 2-letter ISO country code of the customer, e.g. DE * **links**: Related links that can be followed based on this response * **subscriptions**: The newsletter subscriptions, e.g. QUANDOO, MERCHANT  Example curl: ``` curl https://{host}/v{X}/customers/9ffb3466-3562-42cc-add1-92a46a2f0902 ```  Example response:  ``` {   \"id\": \"9ffb3466-3562-42cc-add1-92a46a2f0902\",   \"firstName\": \"Gaius\",   \"lastName\": \"Octavius\",   \"gender\": \"male\",   \"email\": \"c2f22117-6148-45b8-ae79-41eda25eae67augustus@spqr.com\",   \"phoneNumber\": \"+4917312345678\",   \"country\": \"DE\",     \"links\": [     {       \"href\": \"http://localhost:39250/v1/customers/9ffb3466-3562-42cc-add1-92a46a2f0902/reservations\",       \"method\": \"GET\",       \"rel\": \"get-customer-reservations\"     }   ],   \"subscriptions\": [     {       \"id\": \"QUANDOO\"     }   ] } ``` 

### Example
```ruby
# load the gem
require 'quandoo'
# setup authorization
Quandoo.configure do |config|
  # Configure API key authorization: API_TOKEN
  config.api_key['X-Quandoo-AuthToken'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Quandoo-AuthToken'] = 'Bearer'
end

api_instance = Quandoo::CustomersApi.new

customer_id = 'customer_id_example' # String | Id of the customer


begin
  #Get customer Data
  result = api_instance.get_customer1(customer_id)
  p result
rescue Quandoo::ApiError => e
  puts "Exception when calling CustomersApi->get_customer1: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **customer_id** | **String**| Id of the customer | 

### Return type

[**CustomerResponse**](CustomerResponse.md)

### Authorization

[API_TOKEN](../README.md#API_TOKEN)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **get_customers_of_merchant1**
> CustomerDataList get_customers_of_merchant1(merchant_id, opts)

Get a list of Customers of a merchant

This endpoint allows a third party to get a list of customers of a merchant. The list is filtered, showing only the customers that the third party system has access. Customer id is agent-specific if the customer was created by the agent. The agent needs to be authenticated.  The endpoint will return `HTTP 404 - Not Found` if the merchant with the specified id could not be found. It will return `HTTP 403 - Forbidden` if the agent is not authenticated or the agent doesn't have permissions.  ####Request: * **merchantId**: Identifier of the merchant * **offset**: sets the starting element to be returned. Defaults to 0 when unset or malformed. * **limit**: maximum number of results to be returned. Value must be between 1 and 100. Defaults to 100 when unset, malformed or outside bounds. * **modifiedSince**: earliest date time of time window in UTC. Format: yyyy-MM-dd HH:mm:ss * **modifiedUntil**: latest date time of time window in UTC. Format: yyyy-MM-dd HH:mm:ss  ####Response: The response contains the following data of the customer as explained below: * **id**: The agent-dependent identifier of the customer  * **title**: The title of the customer. _Optional_ * **firstName**: First name of the customer. _Optional_ * **lastName**: Last name of the customer. _Optional_ * **email**: The given email of this customer. _Optional_ * **gender**: The given gender of the customer (one of MALE, FEMALE, OTHER or UNDEFINED). _Optional_ * **phoneNumber**: The phone number of the customer. _Optional_ * **mobileNumber**: The mobile phone number of the customer. _Optional_ * **locale**: The locale of the customer. * **links**: Related links that can be followed based on this response * **subscriptions**: The newsletter subscriptions, e.g. QUANDOO, MERCHANT * **statistics**: The customer statistics: number of successful, cancelled and no-show reservations * **createdAt**: The date the customer was created. Format: yyyy-MM-ddTHH:mm:ssZ * **updatedAt**: The date the customer was last updated. Format: yyyy-MM-ddTHH:mm:ssZ  Example curl: ``` curl https://{host}/v{X}/merchants/1234/customers ```  Example response:  ``` {   \"result\": [     {       \"id\": \"9ffb3466-3562-42cc-add1-92a46a2f0902\",       \"customerRef\": \"9ffb3466-3562-42cc-add1-92a46a2f0902\",       \"marketingFlags\": [         {           \"marketingSettingType\": \"NEWSLETTERS\",           \"marketingSettingStatus\": \"INACTIVE\"         },         {           \"marketingSettingType\": \"PROMO_CODES\",           \"marketingSettingStatus\": \"ACTIVE\"         }       ],       \"title\": \"Mr.\",       \"firstName\": \"John\",       \"lastName\": \"Doe\",       \"email\": \"test@quandoo.de\",       \"phoneNumber\": \"+493012345678\",       \"mobileNumber\": \"+17712345678\",       \"locale\": \"de_DE\",       \"links\": [         {           \"href\": \"http://localhost:39250/v1/customers/9ffb3466-3562-42cc-add1-92a46a2f0902/reservations\",           \"method\": \"GET\",           \"rel\": \"get-customer-reservations\"         }       ],       \"subscriptions\": [         {           \"id\": \"QUANDOO\"         }       ],       \"statistics\": {         \"reservationSuccessfulCount\": 8,         \"reservationCancelledCount\": 5,         \"reservationNoShowCount\": 2       },       \"createdAt\": \"2018-11-22T18:42:16Z\",       \"updatedAt\": \"2018-11-30T18:16:02Z\"     }   ],   \"offset\": 0,   \"limit\": 100 } ``` 

### Example
```ruby
# load the gem
require 'quandoo'
# setup authorization
Quandoo.configure do |config|
  # Configure API key authorization: API_TOKEN
  config.api_key['X-Quandoo-AuthToken'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Quandoo-AuthToken'] = 'Bearer'
end

api_instance = Quandoo::CustomersApi.new

merchant_id = 56 # Integer | Id of the merchant

opts = { 
  offset: 0, # Integer | offset
  limit: 100, # Integer | limit
  modified_since: DateTime.parse('\"2018-01-01 00:00:00\"'), # DateTime | modifiedSince. Format: yyyy-MM-dd HH:mm:ss
  modified_until: DateTime.parse('\"2018-03-01 00:00:00\"') # DateTime | modifiedUntil. Format: yyyy-MM-dd HH:mm:ss
}

begin
  #Get a list of Customers of a merchant
  result = api_instance.get_customers_of_merchant1(merchant_id, opts)
  p result
rescue Quandoo::ApiError => e
  puts "Exception when calling CustomersApi->get_customers_of_merchant1: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **merchant_id** | **Integer**| Id of the merchant | 
 **offset** | **Integer**| offset | [optional] [default to 0]
 **limit** | **Integer**| limit | [optional] [default to 100]
 **modified_since** | **DateTime**| modifiedSince. Format: yyyy-MM-dd HH:mm:ss | [optional] 
 **modified_until** | **DateTime**| modifiedUntil. Format: yyyy-MM-dd HH:mm:ss | [optional] 

### Return type

[**CustomerDataList**](CustomerDataList.md)

### Authorization

[API_TOKEN](../README.md#API_TOKEN)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **get_reservations1**
> ReservationDataList get_reservations1(customer_id)

Get customer reservations

This endpoint allows an agent to get reservations of a customer. The results will be filtered by agent id.  Customer id in the request and reservation IDs in response are agent-specific. The agent needs to be authenticated.  The endpoint will return `HTTP 404 - Not Found` if the customer with the specified id could not be found. It will return `HTTP 403 - Forbidden` if the agent is not authenticated or the agent doesn't have permissions.  ####Request: * **customerId**: Agent-specific ID of the customer  ####Response: The response will be a _list_ of reservations. Each reservation has the fields explained below: * **id**: The agent-dependent unique id of the reservation * **number**: Quandoo internal identifier of the reservation. * **quandooId**: The public id of this reservation on quandoo system. * **status**: The status of the reservation eg. CREATED, CONFIRMED, CUSTOMER CANCELED etc. * **startTime**: The start time of the reservation. Format: `yyyy-MM-ddTHH:mm:ssZ` * **endTime**: The end time of the reservation. Format: `yyyy-MM-ddTHH:mm:ssZ` * **capacity**: The capacity (people count) of the reservation * **merchantId**: The ID of the merchant at which this reservation was made. * **customerId**: The public ID of the customer to which this reservation belongs * **promoCode**: The promotion code associated with this reservation. Optional. * **extraInfo**: extra information that the customer provided for the reservation. Optional. * **links**: Related links that can be followed based on this response. * **createdAt**: The date the reservation was created. Format: `yyyy-MM-ddTHH:mm:ssZ` * **updatedAt**: The date the reservation was last updated. Format: `yyyy-MM-ddTHH:mm:ssZ`  Example curl: ``` curl https://{host}/v{X}/customers/ce0706ff-a95d-4229-a220-d21dcd175342/reservations ```  Example response:  ``` {   \"reservations\": [     {       \"id\": \"07f53b36-3f48-11e5-a151-feff819cdc9f\",       \"number\": 8734957,       \"quandooId\": \"07f53b36-3f48-11e5-a151-feff819cdc9f\",       \"status\": \"CREATED\",       \"startTime\": \"2015-06-22T12:00:00+00:00\",       \"endTime\": \"2015-06-22T13:00:00+00:00\",       \"capacity\": 4,       \"merchantId\": 1384,       \"customerId\": \"ce0706ff-a95d-4229-a220-d21dcd175342\",       \"promocode\": \"SOME_CAMPAIGN_CODE\",       \"extraInfo\": \"request for baby chair\",       \"links\": [         {           \"href\": \"https://{host}/v{X}/reservations/07f53b36-3f48-11e5-a151-feff819cdc9f\",           \"method\": \"GET\",           \"rel\": \"self\"         },         {           \"href\": \"https://{host}/v{X}/reservations/07f53b36-3f48-11e5-a151-feff819cdc9f\",           \"method\": \"PATCH\",           \"rel\": \"update\"         }       ],       \"createdAt\": \"2015-06-01T15:21:54Z\",       \"updatedAt\": \"2015-06-01T18:45:30Z\"     },     {       \"id\": \"d8f53b36-3f48-11e5-a151-feff819cdc7a\",       \"number\": 8734958,       \"quandooId\": \"d8f53b36-3f48-11e5-a151-feff819cdc7a\",       \"status\": \"CONFIRMED\",       \"startTime\": \"2015-06-22T12:00:00+00:00\",       \"endTime\": \"2015-06-22T13:00:00+00:00\",       \"capacity\": 3,       \"merchantId\": 1384,       \"customerId\": \"ce0706ff-a95d-4229-a220-d21dcd175342\",       \"promocode\": \"SOME_CAMPAIGN_CODE\",       \"links\": [         {           \"href\": \"https://{host}/v{X}/reservations/d8f53b36-3f48-11e5-a151-feff819cdc7a\",           \"method\": \"GET\",           \"rel\": \"self\"         },         {           \"href\": \"https://{host}/v{X}/reservations/d8f53b36-3f48-11e5-a151-feff819cdc7a\",           \"method\": \"PATCH\",           \"rel\": \"update\"         }       ],       \"createdAt\": \"2015-06-01T15:21:54Z\",       \"updatedAt\": \"2015-06-01T18:45:30Z\"     }   ] } ``` 

### Example
```ruby
# load the gem
require 'quandoo'
# setup authorization
Quandoo.configure do |config|
  # Configure API key authorization: API_TOKEN
  config.api_key['X-Quandoo-AuthToken'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Quandoo-AuthToken'] = 'Bearer'
end

api_instance = Quandoo::CustomersApi.new

customer_id = 'customer_id_example' # String | Id of the customer


begin
  #Get customer reservations
  result = api_instance.get_reservations1(customer_id)
  p result
rescue Quandoo::ApiError => e
  puts "Exception when calling CustomersApi->get_reservations1: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **customer_id** | **String**| Id of the customer | 

### Return type

[**ReservationDataList**](ReservationDataList.md)

### Authorization

[API_TOKEN](../README.md#API_TOKEN)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



