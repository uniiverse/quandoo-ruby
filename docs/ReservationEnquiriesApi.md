# Quandoo::ReservationEnquiriesApi

All URIs are relative to *https://api.quandoo.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_reservation_enquiry1**](ReservationEnquiriesApi.md#create_reservation_enquiry1) | **PUT** /v1/reservation-enquiries | Create reservation enquiries
[**get_messages_for_reservation_enquiry1**](ReservationEnquiriesApi.md#get_messages_for_reservation_enquiry1) | **GET** /v1/reservation-enquiries/{reservationEnquiryId}/messages | Get all messages of a reservation enquiry
[**get_reservation_enquiry1**](ReservationEnquiriesApi.md#get_reservation_enquiry1) | **GET** /v1/reservation-enquiries/{reservationEnquiryId} | Get reservation enquiry by id
[**update_reservation_enquiry1**](ReservationEnquiriesApi.md#update_reservation_enquiry1) | **PATCH** /v1/reservation-enquiries/{reservationEnquiryId} | Update status of reservation enquiry by id


# **create_reservation_enquiry1**
> CreatedReservationEnquiryData create_reservation_enquiry1(body)

Create reservation enquiries

This endpoint allows to create a reservation enquiry for a certain capacity, start and end time. It also requires certain customer information. All optional fields can be either omitted or set to null. The endpoint is idempotent, which means sending the same request twice will not create another reservation enquiry. For that purpose the client is required to generate an agent-specific unique ID for each request.  The endpoint will return status `HTTP 400` should any of the required parameters be missing or formatted incorrectly. See schema for details.   ####Request: The request needs to have 3 objects: reservation enquiry, customer and tracking information.  * **reservationEnquiry**: Information about the merchant and the enquiry.   * **id**: The unique identifier of the reservation enquiry for the calling agent (Agent dependent field) or NULL if the agent identifier should be created. Optional.   * **merchantId**: The ID of the merchant at which this enquiry will be made. **Required**.   * **capacity**: The capacity (people count) of the reservation enquiry. **Required**.   * **startDateTime**: The start date and time when the customer wants to make a reservation. Format: yyyy-MM-ddTHH:mm:ssZ. **Required**.   * **endDateTime**: The expected date and time for the reservation to end accordingly to the customer. Format: yyyy-MM-ddTHH:mm:ssZ. **Required**.   * **message**: A free-text message to the merchant. Max of 5000 characters. **Required**.  * **customer**: Information on the customer making the reservation.   * **id**: Identifier of the customer for the calling agent. Agent dependent field. Optional.   * **firstName**: The first name of the customer. Optional.   * **lastName**: The last name of the customer. Optional.   * **emailAddress**: The email address of the customer. **Required**.   * **phoneNumber**: The phone number of the customer. Without country code, since it will be assumed from the country field. Example: 030120765890. **Required**.   * **locale**: The locale of the customer. E.g. de_DE. **Required**.   * **country**: The 2 letter ISO country of the customer. E.g DE. **Required**   * **subscriptions**: List of requested subscriptions e.g. QUANDOO, MERCHANT. Optional.  * **tracking**: Third party information used to track customer and reservation enquiry.   * **agent**: The id of the agent creating this reservation enquiry. **Required**.   * **cookie**: Cookie information to be stored with this reservation. Optional.  ####Response: The response returns information on the created reservation enquiry and the customer along with relevant links to follow.  * **reservationEnquiry**: Information on the created reservation enquiry.   * **id**: Agent-specific id set for the reservation enquiry.  * **customer**: Information on the customer.   * **id**: Agent-specific id set for the customer.  * **links**: Related links that can be followed based on this response.  Example curl: ``` curl -H \"Content-Type: application/json\" -X POST -d ' {   \"reservationEnquiry\": {     \"id\": \"07f53b36-3f48-11e5-a151-feff819cdc9f\",     \"merchantId\": 15,     \"capacity\": 10,     \"startDateTime\": \"2015-06-22T12:00:00+00:00\",     \"endDateTime\": \"2015-06-22T17:00:00+00:00\",     \"message\": \"Customer specific message\"   },   \"customer\": {         \"id\": \"659b9f4b-cd1a-4dc9-a5c3-8ef6bacbade5\",         \"firstName\": \"Hans\",         \"lastName\": \"Wurst\",         \"emailAddress\": \"hans.wurst@foo.bar\",         \"phoneNumber\": \"017312345678\",         \"locale\": \"de_DE\",         \"country\": \"DE\",         \"subscriptions\": [           {               \"id\": \"QUANDOO\"           },           {               \"id\": \"MERCHANT\"           }       ]     },     \"tracking\": {         \"agent\": {           \"id\": 3         },         \"cookie\": {             \"tracking\": \"ff819cdc9\",             \"referenceId\": \"07f53b36\"         }     } }' https://{host}/v{X}/reservation-enquiries ```  Example response: ``` {   \"reservationEnquiry\": {     \"id\": \"07f53b36-3f48-11e5-a151-feff819cdc9f\"   },   \"customer\": {     \"id\": \"2cc29cba-1e1f-4af6-8184-386e19c891ec\"   },   \"links\": [     {       \"href\": \"https://{host}/v{X}/merchants/15\",       \"method\": \"GET\",       \"rel\": \"get-merchant\"     },     {       \"href\": \"https://{host}/v{X}/merchants/15/reservation-settings\",       \"method\": \"GET\",       \"rel\": \"reservation-settings\"     },     {       \"href\": \"https://{host}/v{X}/merchants/15/availabilities\",       \"method\": \"GET\",       \"rel\": \"availability_days\"     },     {       \"href\": \"https://{host}/v{X}/merchants/15/availabilities/2015-06-22/times\",       \"method\": \"GET\",       \"rel\": \"availability\"     }   ] } ```

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

api_instance = Quandoo::ReservationEnquiriesApi.new

body = Quandoo::MerchantReservationEnquiryData.new # MerchantReservationEnquiryData | Reservation enquiry data


begin
  #Create reservation enquiries
  result = api_instance.create_reservation_enquiry1(body)
  p result
rescue Quandoo::ApiError => e
  puts "Exception when calling ReservationEnquiriesApi->create_reservation_enquiry1: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**MerchantReservationEnquiryData**](MerchantReservationEnquiryData.md)| Reservation enquiry data | 

### Return type

[**CreatedReservationEnquiryData**](CreatedReservationEnquiryData.md)

### Authorization

[API_TOKEN](../README.md#API_TOKEN)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_messages_for_reservation_enquiry1**
> ReservationEnquiryMessageList get_messages_for_reservation_enquiry1(reservation_enquiry_id)

Get all messages of a reservation enquiry

This endpoint allows an agent to get all messages of a reservation enquiry. The id of the reservation enquiry is agent-specific. The agent needs to be authenticated.  The endpoint will return `HTTP 404 - Not Found` if the reservation enquiry with the specified id could not be found.  It will return `HTTP 403 - Forbidden` if the agent is not authenticated, if the agent doesn't have permissions or the reservation enquiry doesn't belong to the authenticated agent.  ####Request: * **reservationEnquiryId**: Agent-specific ID of the requested reservation enquiry  ####Response: The response will contain a _list_ of messages. Each one containing the following fields: * **senderType**: If this message was sent by the customer or by the merchant  * **creationDate**: The date time that this message was created. Format: yyyy-MM-ddTHH:mm:ssZ * **message**: The text of the message itself.  Example curl: ``` curl https://{host}/v{X}/reservation-enquiries/07f53b36-3f48-11e5-a151-feff819cdc9f/messages ```  Example response: ``` {   \"messages\": [     {       \"senderType\": \"CUSTOMER\",       \"message\": \"Customer specific message\",       \"creationDate\": \"2018-05-04T09:26:53Z\"     }   ] } ```

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

api_instance = Quandoo::ReservationEnquiriesApi.new

reservation_enquiry_id = 'reservation_enquiry_id_example' # String | Id of the reservation enquiry


begin
  #Get all messages of a reservation enquiry
  result = api_instance.get_messages_for_reservation_enquiry1(reservation_enquiry_id)
  p result
rescue Quandoo::ApiError => e
  puts "Exception when calling ReservationEnquiriesApi->get_messages_for_reservation_enquiry1: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **reservation_enquiry_id** | **String**| Id of the reservation enquiry | 

### Return type

[**ReservationEnquiryMessageList**](ReservationEnquiryMessageList.md)

### Authorization

[API_TOKEN](../README.md#API_TOKEN)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **get_reservation_enquiry1**
> GetReservationEnquiryData get_reservation_enquiry1(reservation_enquiry_id)

Get reservation enquiry by id

This endpoint allows an agent to get an reservation enquiry by id. The id is agent-specific. The agent needs to be authenticated.  The endpoint will return `HTTP 404 - Not Found` if the reservation enquiry with the specified id could not be found.  It will return `HTTP 403 - Forbidden` if the agent is not authenticated, if the agent doesn't have permissions or the reservation enquiry doesn't belong to the authenticated agent.  ####Request: * **reservationEnquiryId**: Agent-specific ID of the requested reservation enquiry  ####Response: * **id**: The agent-dependent unique id of the reservation enquiry * **merchantId**: The ID of the merchant at which this reservation enquiry was made * **customerId**: The ID of the customer to which this reservation enquiry belongs * **capacity**: The capacity (people count) of the reservation enquiry * **startDateTime**: The start date time of the reservation enquiry. Format: yyyy-MM-ddTHH:mm:ssZ * **endDateTime**: The end date time of the reservation enquiry. Format: yyyy-MM-ddTHH:mm:ssZ * **status**: The status of the reservation enquiry which can be one of:  NEW, IN_PROGRESS, ACCEPTED or REJECTED  Example curl: ``` curl https://{host}/v{X}/reservation-enquiries/07f53b36-3f48-11e5-a151-feff819cdc9f ```  Example response: ``` {   \"id\": \"07f53b36-3f48-11e5-a151-feff819cdc9f\",   \"merchantId\": 1384,   \"customerId\": \"35fff464-142c-48ac-a0c6-ed72a1615664\",   \"capacity\": 4,   \"startTime\": \"2015-06-22T12:00:00+00:00\",   \"endTime\": \"2015-06-22T13:00:00+00:00\",   \"status\": \"NEW\" } ```

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

api_instance = Quandoo::ReservationEnquiriesApi.new

reservation_enquiry_id = 'reservation_enquiry_id_example' # String | Id of the reservation enquiry


begin
  #Get reservation enquiry by id
  result = api_instance.get_reservation_enquiry1(reservation_enquiry_id)
  p result
rescue Quandoo::ApiError => e
  puts "Exception when calling ReservationEnquiriesApi->get_reservation_enquiry1: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **reservation_enquiry_id** | **String**| Id of the reservation enquiry | 

### Return type

[**GetReservationEnquiryData**](GetReservationEnquiryData.md)

### Authorization

[API_TOKEN](../README.md#API_TOKEN)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **update_reservation_enquiry1**
> update_reservation_enquiry1(reservation_enquiry_id, body)

Update status of reservation enquiry by id

This endpoint allows to update the status of a reservation enquiry with the given ID. The allowed status transitions are as following:  * NEW --> IN_PROGRESS --> {ACCEPTED/REJECTED} * ACCEPTED <--> REJECTED  The endpoint will return `HTTP 404 - Not Found` if the reservation enquiry with the specified id could not be found.  The endpoint will return `HTTP 400 - Bad Request` if the specified status is wrong.  The endpoint will return `HTTP 409 - Conflict` if the status change is invalid.  The endpoint will return `HTTP 403 - Forbidden` if the agent is not authenticated, if the agent doesn't have permissions or the reservation enquiry  doesn't belong to the authenticated agent.  ####Request: * **reservationEnquiryId**: Agent-specific ID of the requested reservation enquiry * **reservationEnquiryData**: The new enquiry status 

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

api_instance = Quandoo::ReservationEnquiriesApi.new

reservation_enquiry_id = 'reservation_enquiry_id_example' # String | Id of the reservation enquiry

body = Quandoo::UpdateReservationEnquiryData.new # UpdateReservationEnquiryData | New reservation enquiry status


begin
  #Update status of reservation enquiry by id
  api_instance.update_reservation_enquiry1(reservation_enquiry_id, body)
rescue Quandoo::ApiError => e
  puts "Exception when calling ReservationEnquiriesApi->update_reservation_enquiry1: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **reservation_enquiry_id** | **String**| Id of the reservation enquiry | 
 **body** | [**UpdateReservationEnquiryData**](UpdateReservationEnquiryData.md)| New reservation enquiry status | 

### Return type

nil (empty response body)

### Authorization

[API_TOKEN](../README.md#API_TOKEN)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



