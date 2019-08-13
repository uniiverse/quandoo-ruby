# Quandoo::AvailabilitiesApi

All URIs are relative to *https://api.quandoo.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**availability_days1**](AvailabilitiesApi.md#availability_days1) | **GET** /v1/merchants/{merchantId}/availabilities | Get merchant availability days
[**availability_options1**](AvailabilitiesApi.md#availability_options1) | **GET** /v1/merchants/{merchantId}/availabilities/{date}/times | Get merchant availability time slots


# **availability_days1**
> MerchantAvailabilityDaysDto availability_days1(merchant_id, agent_id, opts)

Get merchant availability days

This endpoint returns days which a customer can select for his reservation. The response is based on when the merchant is known to be open. It is not guaranteed that they have available times for reservation. The days are returned starting from the first available day up to the merchant-defined limit, but never more than 365 days.  ####Request parameters: * **merchantId**: Id of the merchant. Path parameter. * **agentId**: Id of the agent making the request * **capacity**: Specifies the number of people in reservation. Availability days will be returned based on this capacity.  ####Response: The response returns availability days that could be selected for reservation.  * **days**: List of availability days that could be reserved. Format: yyyy-MM-dd  * **links**: Related links that can be followed based on this response.  ####Example curl: ``` curl https://{host}/v{X}/merchants/15/availabilities?agentId=3&capacity=4 ```   ####Example response: ``` {   \"days\": [     \"2017-01-01\",     \"2017-01-02\",     \"2017-01-03\",      ...   ],   \"links\": [     {       \"href\": \"https://{host}/v{X}/merchants/15\",       \"method\": \"GET\",       \"rel\": \"parent\"     },     {       \"href\": \"https://{host}/v{X}/merchants/15/reservation-settings\",       \"method\": \"GET\",       \"rel\": \"settings\"     },     {       \"href\": \"https://{host}/v{X}/merchants/15/availabilities/2017-01-01/times\",       \"method\": \"GET\",       \"rel\": \"availabilities\"     }   ] } ```

### Example
```ruby
# load the gem
require 'quandoo'

api_instance = Quandoo::AvailabilitiesApi.new

merchant_id = 56 # Integer | Id of the merchant

agent_id = 56 # Integer | Id of the agent

opts = { 
  capacity: 56 # Integer | Number of people
}

begin
  #Get merchant availability days
  result = api_instance.availability_days1(merchant_id, agent_id, opts)
  p result
rescue Quandoo::ApiError => e
  puts "Exception when calling AvailabilitiesApi->availability_days1: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **merchant_id** | **Integer**| Id of the merchant | 
 **agent_id** | **Integer**| Id of the agent | 
 **capacity** | **Integer**| Number of people | [optional] 

### Return type

[**MerchantAvailabilityDaysDto**](MerchantAvailabilityDaysDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **availability_options1**
> MerchantAvailabilityDtoList availability_options1(merchant_id, agent_id, capacity, date, opts)

Get merchant availability time slots

This endpoint returns availability time slots which can be reserved for a given capacity.  ####Request parameters: * **merchantId**: Id of the merchant. Path parameter. * **date**: Specifies date of the desired reservation. Format: `yyyy-MM-dd`. Path parameter. * **fromTime**: Beginning of the desired reservation time frame. Format: `HH:mm`. Optional. * **toTime**: End of the desired reservation time frame. Format: `HH:mm`. Optional. * **agentId**: Id of the agent making the request * **capacity**: Specifies the number of people in reservation. Availabilities will be returned based on this capacity. If not provided, the default value is 2. * **areaId**: Restricts availabilities to a certain area. Optional. * **dealId/dealType**: Filter availabilities for a certain deal. Optional. If used, both must be provided.     * **dealType** specifies type of the deal. Can be `OFFER`, `DISCOUNT` or `SPECIAL`.     * **dealId** specifies the ID of the deal.      ####Response: The response returns availability time slots that could be reserved, along with the areas it is associated with and contains information on how much should be paid if the reservation is cancelled by a client.   * **timeSlots**: List of available time slots.   * **areaIds**: List of areas for which this time slot can be reserved.   * **dateTime**: Date and time of the available slot. Format: `yyyy-MM-dd'T'HH:mm:ssZ`   * **occupancy**: Occupancy of the available time slot. This is an integer between `0` and `100`.   * **vaultSettingId**: ID of the vault setting, if there is any. See: `vaultSettings` * **vaultSettings**: Credit card vault settings representing the fees to be paid in case of cancellation.   * **id**: ID of the setting as shown in `timeSlots`.   * **fee**: Fee to be paid in case of cancellation. Currency is defined by merchant. See reservation-settings.   * **feeType**: Type of fee to be paid. Can be `PER_PERSON` or `PER_RESERVATION`.   * **feePercentageForTime**: Fee percentage depending of the time of cancellation. Format: `\"{hoursStart}-{hoursEnd}\": {percentage}` , where hours are the number of hours before the visit. * **links**: Related links that can be followed based on this response.  ####Example curl: ``` curl https://{host}/v{X}/merchants/15/availabilities/2017-11-09/times?capacity=2&areaId=24&agentId=3&dealId=ce0706ff-a95d-4229-a220-d21dcd175342&dealType=OFFER&fromTime=10:45&toTime=12:45 ```   ####Example response: ``` {      \"timeSlots\": [          {              \"areaIds\": [33532, 33533],              \"dateTime\": \"2017-09-27T10:45:00+01:00\",              \"occupancy\": 0,              \"vaultSettingId\": \"284d701f-f79a-4efa-9859-fd09851dfdce\"         },          ...      ],      \"vaultSettings\": [           {              \"id\": \"284d701f-f79a-4efa-9859-fd09851dfdce\",               \"fee\": \"10.00\",               \"feeType\": \"PER_PERSON\",               \"feePercentageForTime\":                  {                    \"0-12\":100,                    \"12-24\":50,                    \"24-48\":20                  }           }       ],      \"links\": [       {         \"href\": \"https://{host}/v{X}/merchants/15\",         \"method\": \"GET\",         \"rel\": \"parent\"       },       {         \"href\": \"https://{host}/v{X}/merchants/15/reservation-settings\",         \"method\": \"GET\",         \"rel\": \"reservation-settings\"       },       {         \"href\": \"https://{host}/v{X}/merchants/reservations\",         \"method\": \"PUT\",         \"rel\": \"create-reservation\"       }     ] }  ```

### Example
```ruby
# load the gem
require 'quandoo'

api_instance = Quandoo::AvailabilitiesApi.new

merchant_id = 56 # Integer | Id of the merchant

agent_id = 56 # Integer | Id of the agent

capacity = 2 # Integer | Number of people

date = Date.parse('\"2018-01-25\"') # Date | Date of the desired reservation. Format: yyyy-MM-dd

opts = { 
  from_time: '\"10:45\"', # String | Beginning of the desired reservation time frame. Format: HH:mm
  to_time: '\"12:45\"', # String | End of the desired reservation time frame. Format: HH:mm
  area_id: 56, # Integer | Id of the area
  deal_id: 'deal_id_example', # String | Id of the deal
  deal_type: 'deal_type_example' # String | type of the deal - SPECIAL, DISCOUNT or OFFER
}

begin
  #Get merchant availability time slots
  result = api_instance.availability_options1(merchant_id, agent_id, capacity, date, opts)
  p result
rescue Quandoo::ApiError => e
  puts "Exception when calling AvailabilitiesApi->availability_options1: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **merchant_id** | **Integer**| Id of the merchant | 
 **agent_id** | **Integer**| Id of the agent | 
 **capacity** | **Integer**| Number of people | [default to 2]
 **date** | **Date**| Date of the desired reservation. Format: yyyy-MM-dd | 
 **from_time** | **String**| Beginning of the desired reservation time frame. Format: HH:mm | [optional] 
 **to_time** | **String**| End of the desired reservation time frame. Format: HH:mm | [optional] 
 **area_id** | **Integer**| Id of the area | [optional] 
 **deal_id** | [**String**](.md)| Id of the deal | [optional] 
 **deal_type** | **String**| type of the deal - SPECIAL, DISCOUNT or OFFER | [optional] 

### Return type

[**MerchantAvailabilityDtoList**](MerchantAvailabilityDtoList.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



