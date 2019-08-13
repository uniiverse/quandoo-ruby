# Quandoo::ReservationsApi

All URIs are relative to *https://api.quandoo.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_reservation1**](ReservationsApi.md#create_reservation1) | **PUT** /v1/reservations | Create reservations
[**get_reservation1**](ReservationsApi.md#get_reservation1) | **GET** /v1/reservations/{reservationId} | Get reservation by id
[**update_reservation1**](ReservationsApi.md#update_reservation1) | **PATCH** /v1/reservations/{reservationId} | Update reservation by id


# **create_reservation1**
> CreatedReservationData create_reservation1(body)

Create reservations

This endpoint allows to create a reservation for a certain capacity, date and time. It also requires certain customer information. All optional fields can be either omitted or set to null. The endpoint is idempotent, which means sending the same request twice will not create another reservation. For that purpose the client is required to generate an agent-specific unique ID for the reservation.  The endpoint will return status `HTTP 409` should the reservation option specified by the given parameters not be bookable anymore. The endpoint will return status `HTTP 400` should any of the required parameters be missing or formatted incorrectly. See schema for details.   ####Request: The request needs to have 3 objects for reservation, customer and tracking information.  * **reservation**: Information about the reservation.   * **id**: The identifier of the reservation for the calling agent (Agent-dependent field). Optional.   * **merchantId**: The ID of the merchant at which this reservation will be made. **Required**.   * **capacity**: The capacity (people count) of the reservation. **Required**.   * **areaId**: The ID of the area this reservation should be in. Optional.   * **dateTime**: The date and time when the reservation will take place. Format: yyyy-MM-ddTHH:mm:ssZ. **Required**     * Z can be used, example: `2019-03-23T19:15:00Z` meaning UTC     * a time zone offset can be specified, example: `2019-03-23T20:15:00+01:00`   * **orderId**: The id of the order to which this reservation is associated. Optional.   * **extraInfo**: Any extra information that the customer likes to provide. Optional.   * **promoCode**: A promotion code which should be used with this reservation. Optional.   * **creditCardVaultSettingsId**: A credit card vault settings to be used by this reservation. Optional.   * **recurringCardDetailId**:A customer credit card reference to be used if credit card vault should be applied. Optional.   * **deals**: A list of deals which should be used with this reservation. Type can be SPECIAL, OFFER or DISCOUNT. Optional.  * **customer**: Information on the customer making the reservation.   * **id**: Identifier of the customer for the calling agent. Agent dependent field. Optional.   * **firstName**: The first name of the customer. Optional.   * **lastName**: The last name of the customer. Optional.   * **emailAddress**: The email address of the customer. **Required**.   * **phoneNumber**: The phone number of the customer. Without country code, since it will be assumed from the country field. Example: 030120765890. **Required**.   * **locale**: The locale of the customer. E.g. de_DE. **Required**.   * **country**: The 2 letter ISO country of the customer. E.g DE. **Required**   * **subscriptions**: List of requested subscriptions e.g. QUANDOO, MERCHANT. Optional.  * **tracking**: Third party information used to track customer and reservations.   * **agent**: The id of the agent creating this request and partner references if any. **Required**.   * **cookie**: Cookie information to be stored with this reservation. Optional.  ####Response: The response returns information on the created reservation and the customer along with relevant links to follow.  * **reservation**: Information on the created reservation.   * **id**: Agent-specific id set for the reservation.   * **number**: Quandoo internal identifier of the reservation.   * **status**: Status for the created reservation. eg. \"CREATED\"   * **quandooId**: Quandoo public identifier for the reservation.    * **customer**: Information on the customer making the reservation.   * **id**: Agent-specific id set for the customer.  * **links**: Related links that can be followed based on this response.  Example curl: ``` curl -H \"Content-Type: application/json\" -X POST -d ' {     \"reservation\": {         \"id\": \"07f53b36-3f48-11e5-a151-feff819cdc9f\",         \"merchantId\": 15,         \"capacity\": 2,         \"areaId\": 1,         \"dateTime\": \"2015-06-22T12:00:00+00:00\",         \"orderId\": \"a7e9fa78-b167-4c25-921a-8da675b5f03a\",         \"extraInfo\": \"Some text\",         \"promoCode\": \"PROMO123\",         \"deals\": [             {                 \"id\": \"a7db794d-6a0a-43fb-b680-3b30058af7a8\",                 \"count\": 2,                 \"type\": \"OFFER\"             }         ]      },     \"customer\": {         \"id\": \"659b9f4b-cd1a-4dc9-a5c3-8ef6bacbade5\",         \"firstName\": \"Hans\",         \"lastName\": \"Wurst\",         \"emailAddress\": \"hans.wurst@foo.bar\",         \"phoneNumber\": \"017312345678\",         \"locale\": \"de_DE\",         \"country\": \"DE\",         \"subscriptions\": [           {               \"id\": \"QUANDOO\"           },           {               \"id\": \"MERCHANT\"           }       ]     },     \"tracking\": {         \"agent\": {           \"id\": 3         },         \"cookie\": {             \"tracking\": \"ff819cdc9\",             \"referenceId\": \"07f53b36\"         }     } }' https://{host}/v{X}/reservations ```  Example response: ``` {     \"reservation\": {         \"id\": \"07f53b36-3f48-11e5-a151-feff819cdc9f\",         \"number\": 708457891,         \"status\": \"CREATED\",         \"quandooId\": \"07f53b36-3f48-11e5-a151-feff819cdc9f\"     },     \"customer\": {         \"id\": \"01a53b36-3f48-11e5-a151-feff819cdc9f\"     },     \"links\": [         {            \"href\": \"https://{host}/v{X}/merchants/15/reservation-settings\",            \"method\": \"GET\",            \"rel\": \"parent\"         }     ] } ```

### Example
```ruby
# load the gem
require 'quandoo'

api_instance = Quandoo::ReservationsApi.new

body = Quandoo::MerchantReservationData.new # MerchantReservationData | Reservation data


begin
  #Create reservations
  result = api_instance.create_reservation1(body)
  p result
rescue Quandoo::ApiError => e
  puts "Exception when calling ReservationsApi->create_reservation1: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**MerchantReservationData**](MerchantReservationData.md)| Reservation data | 

### Return type

[**CreatedReservationData**](CreatedReservationData.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **get_reservation1**
> ReservationData get_reservation1(reservation_id)

Get reservation by id

This endpoint allows an agent or a user to get a reservation by id. The id is either agent-specific or a public id. The agent/user needs to be authenticated.  The endpoint will return `HTTP 404 - Not Found` if the reservation with the specified id could not be found.  It will return `HTTP 403 - Forbidden` if the agent/user is not authenticated, if the agent/user doesn't have permissions, if the reservation doesn't belong to the authenticated agent or if the user doesn't have permissions to see objects from the merchant owner of the reservation  ####Request: * **reservationId**: Agent-specific or public ID of the requested reservation  ####Response: * **id**: Agent-specific or public ID of the requested reservation * **number**: Quandoo internal identifier of the reservation * **quandooId**: The public id of this reservation on quandoo system. * **status**: The status of the reservation eg. CREATED, CONFIRMED, CUSTOMER CANCELED etc. * **startTime**: The start time of the reservation. Format: `yyyy-MM-ddTHH:mm:ssZ` * **endTime**: The end time of the reservation. Format: `yyyy-MM-ddTHH:mm:ssZ` * **capacity**: The capacity (people count) of the reservation * **merchantId**: The ID of the merchant at which this reservation was made. * **customerId**: The public ID of the customer to which this reservation belongs * **promoCode**: The promotion code associated with this reservation. Optional. * **extraInfo**: extra information that the customer provided for the reservation. Optional. * **links**: Related links that can be followed based on this response. * **createdAt**: The date the reservation was created. Format: `yyyy-MM-ddTHH:mm:ssZ` * **updatedAt**: The date the reservation was last updated. Format: `yyyy-MM-ddTHH:mm:ssZ`  Example curl: ``` curl https://{host}/v{X}/reservations/07f53b36-3f48-11e5-a151-feff819cdc9f ```  Example response: ``` {   \"id\": \"07f53b36-3f48-11e5-a151-feff819cdc9f\",   \"number\": 1092454812,   \"quandooId\": \"07f53b36-3f48-11e5-a151-feff819cdc9f\",   \"status\": \"CREATED\",   \"startTime\": \"2015-06-22T12:00:00+00:00\",   \"endTime\": \"2015-06-22T13:00:00+00:00\",   \"capacity\": 4,   \"merchantId\": 1384,   \"customerId\": \"35fff464-142c-48ac-a0c6-ed72a1615664\",   \"promocode\": \"SOME_CAMPAIGN_CODE\",   \"extraInfo\": \"request for baby chair\",   \"links\": [     {       \"href\": \"https://{host}/v{X}/reservations/07f53b36-3f48-11e5-a151-feff819cdc9f\",       \"method\": \"PATCH\",       \"rel\": \"update\"     }   ],   \"createdAt\": \"2015-06-01T15:21:54Z\",   \"updatedAt\": \"2015-06-01T18:45:30Z\" } ```

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

api_instance = Quandoo::ReservationsApi.new

reservation_id = 'reservation_id_example' # String | Id of the reservation


begin
  #Get reservation by id
  result = api_instance.get_reservation1(reservation_id)
  p result
rescue Quandoo::ApiError => e
  puts "Exception when calling ReservationsApi->get_reservation1: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **reservation_id** | **String**| Id of the reservation | 

### Return type

[**ReservationData**](ReservationData.md)

### Authorization

[API_TOKEN](../README.md#API_TOKEN)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **update_reservation1**
> update_reservation1(reservation_id, body)

Update reservation by id

This endpoint allows an agent to update a reservation by id. The id is agent-specific. The agent needs to be authenticated. ####Request: * **reservationId**: Agent-specific ID of the requested reservation. Taken as a path parameter. * **reservation.status**: New status for the reservation. When is present then all parameters below should be omitted! * **reservation.capacity**: The capacity (people count) of the reservation. * **reservation.areaId**: The ID of the area this reservation should be in. * **reservation.dateTime**: The date and time when the reservation will take place. Format: yyyy-MM-ddTHH:mm:ssZ.  For updating status request body should contain  only reservation.status. Valid status values depend on the current status of reservation and can be `CUSTOMER_CANCELED` or `RECONFIRMED`. * `CUSTOMER_CANCELED` is valid if current status is one of the below:     * CREATED     * CONFIRMED     * AUTOMATIC_CONFIRMED     * NOTIFICATION_REQUESTED     * NOTIFIED     * RECONFIRMED * `RECONFIRMED` is valid if current status is one of the below:     * CONFIRMED     * AUTOMATIC_CONFIRMED     * NOTIFICATION_REQUESTED     * NOTIFIED  If reservation.status field is not present then reservation data will be updated and reservation's status will be reset. Depending on `Automatic confirmation for online reservations` setting, reservation's status will be set to CREATED or AUTOMATIC_CONFIRMED.  ####Response: The endpoint will return `HTTP 200 - OK` if update was successful. It will return `HTTP 404 - Not Found` error if the reservation with the specified id could not be found. It will return `HTTP 403 - Forbidden` error if the agent is not authenticated, if the agent doesn't have permissions or the reservation doesn't belong to the  authenticated agent. It will return `HTTP 409 - Conflict` error if reservation has menu, smart offers, made by IOVOX, has conflict in status, time or other conflicts.  Example curl: ``` curl -H \"Content-Type: application/json\" -X PATCH -d ' {   \"reservation\": {     \"status\": \"CUSTOMER_CANCELED\"   } } ' https://{host}/v{X}/reservations/07f53b36-3f48-11e5-a151-feff819cdc9f ``` 

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

api_instance = Quandoo::ReservationsApi.new

reservation_id = 'reservation_id_example' # String | Id of the reservation

body = Quandoo::UpdateReservationData.new # UpdateReservationData | New reservation status


begin
  #Update reservation by id
  api_instance.update_reservation1(reservation_id, body)
rescue Quandoo::ApiError => e
  puts "Exception when calling ReservationsApi->update_reservation1: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **reservation_id** | **String**| Id of the reservation | 
 **body** | [**UpdateReservationData**](UpdateReservationData.md)| New reservation status | 

### Return type

nil (empty response body)

### Authorization

[API_TOKEN](../README.md#API_TOKEN)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



