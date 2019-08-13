# Quandoo::ReviewsApi

All URIs are relative to *https://api.quandoo.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_review1**](ReviewsApi.md#create_review1) | **PUT** /v1/reviews | Create a review for a reservation
[**get_review1**](ReviewsApi.md#get_review1) | **GET** /v1/reviews/{reviewId} | Get details for a specific review
[**get_reviews2**](ReviewsApi.md#get_reviews2) | **GET** /v1/reviews | Get information from reviews in a list
[**update_review1**](ReviewsApi.md#update_review1) | **PATCH** /v1/reviews | Updated a review


# **create_review1**
> ChangedReviewDto create_review1(body)

Create a review for a reservation

This resource manages the creation of reviews for a particular agent and a reservation. Reviews must have a description, rating and a reservation public identifier. The agent must be the one that created the reservation, otherwise it is forbidden.  ####Request: The request needs to have 3 parameters for review reviewId, description and rating.  * **reservationId**: Public ID of the reservation where to add a review. **Required**. * **description**: Text content of the review to be set. Optional. A review requires a minimum of a rating. * **rating**: Integer value from 1 to 6 with the new rating given. **Required**.   ####Response: The response is a review object containing information about the review.  * **reviewId**: The Id of the created review. * **status**: Status of the created review. Can be 'PENDING', 'PUBLISHED' or 'WITHHELD'. After a successful creation, 'PENDING' is returned. * **links**: A series of links where to get details of the created review;  Example curl: ``` curl -H \"Content-Type: application/json\" -X POST -d ' {     \"reservationId\": \"07f53b36-3f48-11e5-a151-feff819cdc9f\",     \"description\": \"Some description of the review\",     \"rating\": 1 } ```  Example response: ``` {     \"reviewId\": \"01a53b36-3f48-11e5-a151-feff819cdc9f\",     \"status\": \"PENDING\",     \"links\": [{         \"href\": \"http://localhost:39250/v1/reviews/01a53b36-3f48-11e5-a151-feff819cdc9f\",         \"method\": \"GET\",         \"rel\": \"get-review\"     }] } ```

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

api_instance = Quandoo::ReviewsApi.new

body = Quandoo::CreateReviewDto.new # CreateReviewDto | Review for this reservation


begin
  #Create a review for a reservation
  result = api_instance.create_review1(body)
  p result
rescue Quandoo::ApiError => e
  puts "Exception when calling ReviewsApi->create_review1: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**CreateReviewDto**](CreateReviewDto.md)| Review for this reservation | 

### Return type

[**ChangedReviewDto**](ChangedReviewDto.md)

### Authorization

[API_TOKEN](../README.md#API_TOKEN)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_review1**
> GetReviewDto get_review1(review_id)

Get details for a specific review

This resource return details from reviews upon request. The result obtained depends on whether the agent is the owner of the reservation that owns the review or not.  * If the user owns the reservation of the requested review, a detailed review is returned with all the information shown below. * If the user does not own the reservation of the requested review, a simplified review is returned with only the values marked below. * If the user does not own the reservation of the requested review AND the review is in a 'WITHHELD' status, an empty review is returned.   ####Request: The request needs 1 path parameter, the review ID to get details from.  * **reviewId**: ID of the review to get the details from. **Required**.   ####Response: The response is a user review object containing information about the review depending on whether the agent used is the owner of the review or not. The different outcomes are **detailed** if the agent owns the review or **simplified** if not.  * **reviewId**: review UUID. Same as the one used in the request. * **rating**: rating associated to this review. * **description**: description of the review. * **status**: current review status. Possible values are 'PENDING', 'WITHHELD', 'PUBLISHED'. * **merchantId**: merchant id associated to this review. **Only in the detailed view**. * **customerId**: customer id associated to this review. **DEPPRECATED, NOT USED**. * **publicCustomerId**: public customer id associated to this review. **Only in the detailed view**. * **customerFirstName**: review associated customer first name. **Only in the detailed view**. * **customerLastName**: first character of the customer last name. **Only in the detailed view**. * **customerProfileImage**: customer profile image URL. **Only in the detailed view**. * **locale**: locale associated to the review. **Only in the detailed view**.  Example curl: ``` curl https://{host}/v{X}/reviews/07f53b36-3f48-11e5-a151-feff819cdc9f ```  Example response: ``` {     \"reviewId\": \"01a53b36-3f48-11e5-a151-feff819cdc9f\",     \"status\": \"PUBLISHED\",     \"description\": \"Description of the review\",     \"rating\": 3 } ```

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

api_instance = Quandoo::ReviewsApi.new

review_id = 'review_id_example' # String | Review reviewId (UUID) to get details from


begin
  #Get details for a specific review
  result = api_instance.get_review1(review_id)
  p result
rescue Quandoo::ApiError => e
  puts "Exception when calling ReviewsApi->get_review1: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **review_id** | [**String**](.md)| Review reviewId (UUID) to get details from | 

### Return type

[**GetReviewDto**](GetReviewDto.md)

### Authorization

[API_TOKEN](../README.md#API_TOKEN)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_reviews2**
> GetReviewsDto get_reviews2(opts)

Get information from reviews in a list

This resource return a list of reviews. The result obtained depends on the different query parameters provided. It is able to return three different results: * **Reviews associated to an agent:** if neither 'merchantId' nor 'reservationId' query parameters are provided, then the available reviews for the current agent are returned. * **Reviews associated to a merchant:** if the parameter 'merchantId' is provided, all the reviews for the given merchant and agent are provided. The agent is the one associated with the reservations. * **Reviews associated to a reservation:** if the parameter 'reservationId' is provided, all the reviews for the given reservation and agent are provided. The agent is the one associated with the reservation.  **NOTE:** For the second and third cases, the current agent must be the owner of the reservations used to get the reviews. In the specific case of the search by the merchants, the current agent id is the one realated to the reservations associated to the specified merchant's reviews.  ####Request: The request needs 4 optional query parameters. Pagination is controlled by the usage of the 'limit' and 'offset' parameters.  * **limit**: maximum number of results to be returned. Value must be between 1 and 10. Defaults to 10 when unset, malformed or outside bounds. Ignored when 'reservationId' is enabled. * **offset**: sets the starting element to be returned. Defaults to 0 when unset or malformed. Ignored when 'reservationId' is enabled. * **reservationId**: Public ID of the reservation from which to get the reviews. Cannot be used in combination with 'merchantId'. Can be null. Does not consider 'limit' and/or 'offset'. * **merchantId**: ID of the merchant from wich to get the reviews. Cannot be used in combination with 'reservationId'. Can be null.  ####Response: The response is a user review object containing a list of user reviews.  * **size**: the number of reviews retrieved in this request. Can be any positive value between 0 and 10 (the maximum value for limit); * **offset**: echoes the offset value used in the request. Returns 0 in case 'reservationId' is used. * **limit**: echoes the limit value used in the request. Returns 0 in case 'reservationId' is used. * **reviews**: list of reviews retrieved, each review containing the following properties:  * **reviewId**: review UUID. Same as the one used in the request. * **rating**: rating associated to this review. * **description**: description of the review. * **status**: current review status. Possible values are 'PENDING', 'WITHHELD', 'PUBLISHED'. * **merchantId**: merchant id associated to this review. **Only in the detailed view**. * **customerId**: customer id associated to this review. **DEPPRECATED, NOT USED**. * **publicCustomerId**: public customer id associated to this review. **Only in the detailed view**. * **customerFirstName**: review associated customer first name. **Only in the detailed view**. * **customerLastName**: first character of the customer last name. **Only in the detailed view**. * **customerProfileImage**: customer profile image URL. **Only in the detailed view**. * **locale**: locale associated to the review. **Only in the detailed view**.  Example curl: ``` curl https://{host}/v{X}/reviews?merchantId=5124 ```  Example response: ``` {  \"reviews\": [{    \"reviewId\": \"e94c5f9b-e61f-486a-bfa7-48abb1e42f93\",    \"merchantId\": 5124,    \"publicCustomerId\": \"a10fbb9a-df04-407c-9568-2e79bd620b41\",    \"customerFirstName\": \"Perico\",    \"customerLastName\": \"d\",    \"customerProfileImage\": \"http://test.bla\",    \"rating\": 6,    \"description\": \"Description 8\",    \"status\": \"PUBLISHED\",    \"locale\": \"de_DE\"   }, {    \"reviewId\": \"65472403-7968-4ccf-b389-fe7e6e70ee27\",    \"merchantId\": 5124,    \"publicCustomerId\": \"a10fbb9a-df04-407c-9568-2e79bd620b41\",    \"customerFirstName\": \"Perico\",    \"customerLastName\": \"d\",    \"customerProfileImage\": \"http://test.bla\",    \"rating\": 6,    \"description\": \"Description 9\",    \"status\": \"PUBLISHED\",    \"locale\": \"de_DE\"   }  ],  \"size\": 2,  \"offset\": 0,  \"limit\": 10 } ``` 

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

api_instance = Quandoo::ReviewsApi.new

opts = { 
  merchant_id: 56, # Integer | MerchantId to get the reviews from. Cannot be used in combination with 'reservationId'
  reservation_id: 'reservation_id_example', # String | Public reservation id to get the reviews from. Cannot be used in combination with 'merchantId'. When set, 'offset' and 'limit' are ignored. All reviews for a reservation are returned.
  offset: 0, # Integer | Skip first n reviews
  limit: 10 # Integer | Max number to retrieve
}

begin
  #Get information from reviews in a list
  result = api_instance.get_reviews2(opts)
  p result
rescue Quandoo::ApiError => e
  puts "Exception when calling ReviewsApi->get_reviews2: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **merchant_id** | **Integer**| MerchantId to get the reviews from. Cannot be used in combination with &#39;reservationId&#39; | [optional] 
 **reservation_id** | [**String**](.md)| Public reservation id to get the reviews from. Cannot be used in combination with &#39;merchantId&#39;. When set, &#39;offset&#39; and &#39;limit&#39; are ignored. All reviews for a reservation are returned. | [optional] 
 **offset** | **Integer**| Skip first n reviews | [optional] [default to 0]
 **limit** | **Integer**| Max number to retrieve | [optional] [default to 10]

### Return type

[**GetReviewsDto**](GetReviewsDto.md)

### Authorization

[API_TOKEN](../README.md#API_TOKEN)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **update_review1**
> ChangedReviewDto update_review1(body)

Updated a review

This resource manages the update of reviews for a given review ID. Description and rating can be updated on a review. The agent must be the one that owns the reservation associated to the review to modify, otherwise a forbidden response is returned.  **NOTE**: Reviews in state 'PUBLISHED' or 'WITHHELD' cannot be updated. Only those in status 'PENDING' are allowed to be updated.  ####Request: The request needs to have 3 parameters for reservation reviewId (public reviewId), description and rating.  * **reviewId**: Id of the review. **Required**. * **description**: Text content of the review. If not set (null value) it won't be considered for update. * **rating**: Integer value from 1 to 6 with the rating given. If not set (null value) it won't be considered for update.  In case both description and rating are set to null, nothing happens to the review: it is not updated and its state remains.  ####Response: The response is a review object containing information about the review.  * **reviewId**: The Id of the updated review. * **status**: Status of the updated review. Can be 'PENDING', 'PUBLISHED' or 'WITHHELD'. Upon a successful update, the status 'PENDING' is returned. * **links**: A series of links where to get details of the updated review.  Example curl: ``` curl -H \"Content-Type: application/json\" -X POST -d ' {     \"reviewId\": \"01a53b36-3f48-11e5-a151-feff819cdc9f\",     \"description\": \"Some updated description for the review\",     \"rating\": 2 } ```  Example response: ``` {     \"reviewId\": \"01a53b36-3f48-11e5-a151-feff819cdc9f\",     \"status\": \"PENDING\",     \"links\": [{         \"href\": \"http://localhost:39250/v1/reviews/01a53b36-3f48-11e5-a151-feff819cdc9f\",         \"method\": \"GET\",         \"rel\": \"get-review\"     }] } ```

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

api_instance = Quandoo::ReviewsApi.new

body = Quandoo::UpdateReviewDto.new # UpdateReviewDto | Review for this reservation


begin
  #Updated a review
  result = api_instance.update_review1(body)
  p result
rescue Quandoo::ApiError => e
  puts "Exception when calling ReviewsApi->update_review1: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**UpdateReviewDto**](UpdateReviewDto.md)| Review for this reservation | 

### Return type

[**ChangedReviewDto**](ChangedReviewDto.md)

### Authorization

[API_TOKEN](../README.md#API_TOKEN)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



