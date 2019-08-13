# Quandoo::MerchantsApi

All URIs are relative to *https://api.quandoo.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_reservations2**](MerchantsApi.md#get_reservations2) | **GET** /v1/merchants/{merchantId}/reservations | Get merchant reservations
[**get_reviews1**](MerchantsApi.md#get_reviews1) | **GET** /v1/merchants/{merchantId}/reviews | Retrieves customer reviews for a merchant, specified by reviewId
[**search**](MerchantsApi.md#search) | **GET** /v1/merchants | Allows to get merchant information by parameters
[**search2**](MerchantsApi.md#search2) | **GET** /v1/merchants/{merchantId} | Allows to get a merchant by id
[**search_similar1**](MerchantsApi.md#search_similar1) | **GET** /v1/merchants/{merchantId}/similar | Allows to get a merchant by id and find similar merchants


# **get_reservations2**
> ReservationDataList get_reservations2(merchant_id, opts)

Get merchant reservations

This endpoint allows an agent to get reservations of a merchant. The results will be filtered by agent id.  Reservation IDs in response are agent-specific. The agent needs to be authenticated.  The endpoint will return `HTTP 404 - Not Found` if the merchant with the specified id could not be found. It will return `HTTP 403 - Forbidden` if the agent is not authenticated or the agent doesn't have permissions.  ####Request: * **merchantId**: ID of the merchant * **offset**: sets the starting element to be returned. Defaults to 0 when unset or malformed. * **limit**: maximum number of results to be returned. Value must be between 1 and 100. Defaults to 100 when unset, malformed or outside bounds. * **earliest**: earliest date time of time window in UTC. Format: yyyy-MM-dd HH:mm:ss * **latest**: latest date time of time window in UTC. Format: yyyy-MM-dd HH:mm:ss   ####Response: The response will be a _list_ of reservations. Each reservation has the fields explained below: * **id**: The public id of the reservation * **number**: Quandoo internal identifier of the reservation. * **quandooId**: The public id of this reservation on quandoo system. * **status**: The status of the reservation eg. CREATED, CONFIRMED, CUSTOMER CANCELED etc. * **startTime**: The start time of the reservation. Format: `yyyy-MM-ddTHH:mm:ssZ` * **endTime**: The end time of the reservation. Format: `yyyy-MM-ddTHH:mm:ssZ` * **capacity**: The capacity (people count) of the reservation * **merchantId**: The ID of the merchant at which this reservation was made. * **customerId**: The public ID of the customer to which this reservation belongs * **promoCode**: The promotion code associated with this reservation. Optional. * **extraInfo**: extra information that the customer provided for the reservation. Optional. * **links**: Related links that can be followed based on this response. * **createdAt**: The date the reservation was created. Format: `yyyy-MM-ddTHH:mm:ssZ` * **updatedAt**: The date the reservation was last updated. Format: `yyyy-MM-ddTHH:mm:ssZ`  Example curl: ``` curl https://{host}/v{X}/merchants/32489/reservations ```  Example response:  ``` {   \"reservations\": [     {       \"id\": \"07f53b36-3f48-11e5-a151-feff819cdc9f\",       \"number\": 8734957,       \"quandooId\": \"07f53b36-3f48-11e5-a151-feff819cdc9f\",       \"status\": \"CREATED\",       \"startTime\": \"2015-06-22T12:00:00+00:00\",       \"endTime\": \"2015-06-22T13:00:00+00:00\",       \"capacity\": 4,       \"merchantId\": 1384,       \"customerId\": \"ce0706ff-a95d-4229-a220-d21dcd175342\",       \"promocode\": \"SOME_CAMPAIGN_CODE\",       \"extraInfo\": \"request for baby chair\",       \"links\": [         {           \"href\": \"https://{host}/v{X}/reservations/07f53b36-3f48-11e5-a151-feff819cdc9f\",           \"method\": \"GET\",           \"rel\": \"self\"         },         {           \"href\": \"https://{host}/v{X}/reservations/07f53b36-3f48-11e5-a151-feff819cdc9f\",           \"method\": \"PATCH\",           \"rel\": \"update\"         }       ],       \"createdAt\": \"2015-06-01T15:21:54Z\",       \"updatedAt\": \"2015-06-01T18:45:30Z\"     },     {       \"id\": \"d8f53b36-3f48-11e5-a151-feff819cdc7a\",       \"number\": 8734958,       \"quandooId\": \"d8f53b36-3f48-11e5-a151-feff819cdc7a\",       \"status\": \"CONFIRMED\",       \"startTime\": \"2015-06-22T12:00:00+00:00\",       \"endTime\": \"2015-06-22T13:00:00+00:00\",       \"capacity\": 3,       \"merchantId\": 1384,       \"customerId\": \"ce0706ff-a95d-4229-a220-d21dcd175342\",       \"promocode\": \"SOME_CAMPAIGN_CODE\",       \"links\": [         {           \"href\": \"https://{host}/v{X}/reservations/d8f53b36-3f48-11e5-a151-feff819cdc7a\",           \"method\": \"GET\",           \"rel\": \"self\"         },         {           \"href\": \"https://{host}/v{X}/reservations/d8f53b36-3f48-11e5-a151-feff819cdc7a\",           \"method\": \"PATCH\",           \"rel\": \"update\"         }       ],       \"createdAt\": \"2015-06-01T15:21:54Z\",       \"updatedAt\": \"2015-06-01T18:45:30Z\"     }   ] } ``` 

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

api_instance = Quandoo::MerchantsApi.new

merchant_id = 56 # Integer | Id of the merchant

opts = { 
  offset: 0, # Integer | Skip first n reservations
  limit: 100, # Integer | limit
  earliest: DateTime.parse('\"2018-01-01 00:00:00\"'), # DateTime | earliest date time of time window in UTC. Format: yyyy-MM-dd HH:mm:ss
  latest: DateTime.parse('\"2018-03-01 00:00:00\"') # DateTime | latest date time of time window in UTC. Format: yyyy-MM-dd HH:mm:ss
}

begin
  #Get merchant reservations
  result = api_instance.get_reservations2(merchant_id, opts)
  p result
rescue Quandoo::ApiError => e
  puts "Exception when calling MerchantsApi->get_reservations2: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **merchant_id** | **Integer**| Id of the merchant | 
 **offset** | **Integer**| Skip first n reservations | [optional] [default to 0]
 **limit** | **Integer**| limit | [optional] [default to 100]
 **earliest** | **DateTime**| earliest date time of time window in UTC. Format: yyyy-MM-dd HH:mm:ss | [optional] 
 **latest** | **DateTime**| latest date time of time window in UTC. Format: yyyy-MM-dd HH:mm:ss | [optional] 

### Return type

[**ReservationDataList**](ReservationDataList.md)

### Authorization

[API_TOKEN](../README.md#API_TOKEN)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **get_reviews1**
> ReviewDtoList get_reviews1(merchant_id, opts)

Retrieves customer reviews for a merchant, specified by reviewId

This endpoint retrieves customer reviews for a particular merchant with rating, description, locale, date & the customer's information.This merchant should be specified by their identifier **merchantId**, which is mandatory.  Supports pagination via offset & limit parameters in the request.  `offset` allows skipping the first n reviews. `limit` makes sure the response contains a maximum of n reviews.  If not supplied, offset will be 0 and limit will be 10  ####Response:  * **customer**: block contains link to customer's profile image, customer's first name & first letter of customer's last name. * **rating**: a value between 1 and 6, where 1 represents the worst rating and 6 represents the best. * **description**: the review description entered by the customer. * **locale**: represents the language settings of the customer, in the format: <language code>_<country code> * **date**: represents the date of the review, with the format: yyyy-MM-dd  Example curl: ``` curl https://{host}/v{X}/merchants/15/reviews?offset=10&limit=5 ```  Example response: ``` {    reviews: [      {            customer: {                 firstName: \"Hans\",                 lastName: \"W\",                 profileImage: {                     url: \"https://www...\"                 },            },            rating: 1,            description: \"Foo bar\",                            locale: \"de_DE\",            date: \"2017-07-21\"      }    ],    offset: 10,    limit: 5,    size: 1 } ```

### Example
```ruby
# load the gem
require 'quandoo'

api_instance = Quandoo::MerchantsApi.new

merchant_id = 56 # Integer | 

opts = { 
  offset: 0, # Integer | Skip first n reviews
  limit: 10 # Integer | Max number of reviews to be retrieved
}

begin
  #Retrieves customer reviews for a merchant, specified by reviewId
  result = api_instance.get_reviews1(merchant_id, opts)
  p result
rescue Quandoo::ApiError => e
  puts "Exception when calling MerchantsApi->get_reviews1: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **merchant_id** | **Integer**|  | 
 **offset** | **Integer**| Skip first n reviews | [optional] [default to 0]
 **limit** | **Integer**| Max number of reviews to be retrieved | [optional] [default to 10]

### Return type

[**ReviewDtoList**](ReviewDtoList.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **search**
> MerchantDetailsDtoList search(capacity, opts)

Allows to get merchant information by parameters

###Description  This endpoint is used to search merchants by a set of parameters. For each merchant in the result there is information about location, language and tags that describe this merchant's basic characteristics, there is also a set of images selected by the merchant.  ####Possible query parameters:  * **query**: Filter merchants using text similarity on a number of merchant fields like name, description, categories and tags * **place**: Filter for merchant on a country, city or district whose name matches the parameter. (if the parameter does not match any city or district on the system it is ignored) * **centerPoint**: Filter merchants within the circle defined by center on centerPoint and radius defined by radius parameter (if not informed defaults to 10). Center point has the format LATITUDE,LONGITUDE with both parameters as numbers with . as decimal separator (e.g `centerPoint=52.547928,13.4085728`) * **radius**: The radius of the circle to filter merchants in **kilometers**. Defaults to 10 and is only used if *centerPoint* is also informed * **bookable**: Boolean value, if informed true means that only merchants that are online bookable will be returned and false means that only merchants that are NOT online bookable will be returned * **tags**: Filter out merchants with the selected tags text. Semicolon separated text value. All or nothing field: if a tag is not found, the query will fail. Cannot be used in conjunction with 'tagIds' parameter. * **tagIds**: Filter out merchants with the selected tag ids. Semicolon separated text value. All or nothing field: if a tag is not found, the query will fail. Cannot be used in conjunction with 'tags' parameter. * **reviewScoreMax**: Filter out merchants with review score higher than the one informed. * **onlyWithAttributes**: This field only accepts the value **documents** for now. If informed only merchants with documents will be returned. You need to be **authenticated** to use this filter * **capacity**: Number of people. In order to be effective, \"place\", \"date\" and \"fromTime\" must also be set. * **date**: Date of the desired reservation in merchants' time zone. Format: yyyy-MM-dd. Availability search is only activated if \"place\" is specified. * **fromTime**: Beginning of the desired reservation time frame in merchants' time zone. Format: HH:mm. Consider a 3h buffer for the time (0.5h before the given time and 2.5h after) * **offset**: Number of merchants to skip on the result. Defaults to 0 * **limit**: Maximum number of merchants to return. Defaults to 100 and cannot be more than 100. * **bookable**: This flag indicates whether the merchant is bookable or not.    ####Result fields for Merchant object:  * **id**: Id of the merchant * **name**: Name of the merchant * **phoneNumber**: The phone number of the merchant * **currency**: Currency of the merchant in the ISO 4217 letter format * **locale**: Locale used to communicate with this merchant * **timezone**: Canonical Timezone name * **location**: Location of the merchant, contains both an geo located point and an address if available * **reviewScore**: Review score of the merchant * **tagGroups**: Tags (grouped) about relevant merchant characteristics * **images**: Group of images selected by the merchant * **documents**: Group of documents released by this merchant (e.g seasonal menus ) * **links**: Links for other pages or api operations for this merchant * **openingTimes**: Group of opening times: restaurant opening times for this merchant. Time range beginning may be greater than the end time of the range, when this range goes beyond the day when it was started, e.g. 19:00:00 - 02:00:00 * **ccvEnabled**: If true, credit card information is required when creating a reservation * **chain**: Merchant chain information, if any   ###Authenticated use of the api: * Field `documents` is only accessible for authorized callers and will be empty otherwise. * Queries with parameter `onlyWithAttributes` are only allowed for authorized callers and will return `HTTP 403` for unauthorized requests  #####How? In order to make an authenticated call the caller must send a header name `X-Quandoo-AuthToken` with the token obtained from contact with Quandoo.  ###Pagination of the result:  The result contains the fields `size` with the number of all merchants that matched the informed parameters, `offset` and `limit` defining which merchants from the complete list are on this response, and the caller can use query parameters `offset` and `limit` to get different merchants on the result list  ###Examples:  Example curl: ``` curl -H 'X-Quandoo-AuthToken: INSERT_KEY_HERE' 'https://{host}/v{X}/merchants?query=Zim&place=Berlin&amp;centerPoint=52.5479288%2C13.4085728&radius=10&bookable=true&reviewScoreMax=200&onlyWithAttributes=documents&offset=0&limit=100' ```  Example response: ``` {   \"merchants\": [     {       \"id\": 215,       \"name\": \"a-merchant-Zim\",       \"phoneNumber\": \"+49153153153\",       \"currency\": \"EUR\",       \"locale\": \"de_DE\",       \"timezone\": \"Europe/Berlin\",       \"location\": {         \"coordinates\": {           \"latitude\": 55,           \"longitude\": 12         },         \"address\": {}       },       \"reviewScore\": \"5.3\",       \"tagGroups\": [         {           \"type\": \"CUISINE\",           \"tags\": [             {               \"id\": 63,               \"name\": \"Testküche Hauptkategorie\"             },             {               \"id\": 66,               \"name\": \"Test cuisine\"             }           ]         }       ],       \"images\": [],       \"documents\": [         {           \"name\": \"Main Menu\",           \"url\": \"https://d2s6u6f7snurg9.cloudfront.net/partner/uploads/MD-document-3ec1dc15-1b69-463f-bdd2-c060b9bf844d.pdf\",           \"format\": \"pdf\",           \"description\": \"Seasonal Main Menu\"         }       ],       \"links\": [         {           \"href\": \"https://{host}/{path}?aid=16\",           \"method\": \"GET\",           \"rel\": \"DETAILS\"         },         {           \"href\": \"https://{host}/{path}?aid=16&countryId=NLD\",           \"method\": \"GET\",           \"rel\": \"WIDGET\"         },         {           \"href\": \"https://{host}/{path}/details?aid=16&countryId=NLD\",           \"method\": \"GET\",           \"rel\": \"WIDGET_DETAILS\"         }       ],       \"bookable\": true,       \"ccvEnabled\": true,       \"chain\": {         \"id\": 1,         \"name\": \"Test chain\"       }     },     {       \"id\": 219,       \"name\": \"another merchants Zim\",       \"phoneNumber\": \"+49154154154\",       \"currency\": \"EUR\",       \"locale\": \"de_DE\",       \"timezone\": \"Europe/Berlin\",       \"location\": {         \"coordinates\": {           \"latitude\": 52,           \"longitude\": 13         },         \"address\": {           \"street\": \"Wintersteinstr.\",           \"number\": \"15\",           \"zipcode\": \"10587\",           \"city\": \"Berlin\",           \"country\": \"DEU\"         }       },       \"reviewScore\": \"4.7\",             \"tagGroups\": [         {           \"type\": \"CUISINE\",           \"tags\": [             {               \"id\": 79,               \"name\": \"Testküche Hauptkategorie\"             },             {               \"id\": 82,               \"name\": \"Test Japanese\"             }           ]         },         {           \"type\": \"PRICE\",           \"tags\": [             {               \"id\": 84,               \"name\": \"Test expensive\"             }           ]         }       ],       \"images\": [         {           \"url\": \"https://dci5ez2ey8tr9.cloudfront.net/1482eec7-e585-4821-b096-8a9941e0d2eb/25_sld.jpg\"         }       ],       \"documents\": [],       \"links\": [         {           \"href\": \"https://{host}/{path}?aid=16\",           \"method\": \"GET\",           \"rel\": \"DETAILS\"         },         {           \"href\": \"https://{host}/{path}?aid=16&countryId=NLD\",           \"method\": \"GET\",           \"rel\": \"WIDGET\"         },         {           \"href\": \"https://{host}/{path}/details?aid=16&countryId=NLD\",           \"method\": \"GET\",           \"rel\": \"WIDGET_DETAILS\"         }       ],       \"bookable\": true,       \"openingTimes\": {         \"standardOpeningTimes\": {           \"SATURDAY\": [             {               \"start\": \"09:00:00\",               \"end\": \"20:00:00\"             }           ],           \"SUNDAY\": [             {               \"start\": \"09:00:00\",               \"end\": \"18:00:00\"             }           ]         }       },       \"ccvEnabled\": true,       \"chain\": {         \"id\": 1,         \"name\": \"Test chain\"       }     }   ],   \"size\": 2,   \"offset\": 0,   \"limit\": 100 } ```

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

api_instance = Quandoo::MerchantsApi.new

capacity = 2 # Integer | Number of people. In order to be effective, \"date\" and \"fromTime\" must also be set.

opts = { 
  query: 'query_example', # String | Search query for a merchant name
  place: 'place_example', # String | Search query for a place (country, city or district) name: the most relevant places, if any, are taken as a filter
  center_point: 'center_point_example', # String | Search with coordinates and radius. \"radius\" argument can be set, otherwise default value of 10 km will be used.<br>Format:<br>53.1222,13.0303<br>where latitude=53.1222, longitude=13.0303
  radius: 10, # Integer | Radius for coordinate-based search
  bookable: true, # BOOLEAN | Filter only bookable merchants
  tags: 'tags_example', # String | Filter by tags found by text. The value can be either in English or in the specific locale. Semicolon separated. All or nothing behaviour: if one single tag is not found, the whole request fails. Cannot be used in combination with 'groupedTagIds' parameter.
  tag_ids: 'tag_ids_example', # String | Filter by tags found by id. Semicolon separated. All or nothing behaviour: if one single tag id is not found, the whole request fails. Cannot be used in combination with 'tags' parameter.
  review_score_max: 56, # Integer | Filter by max review score (100 - 600)
  only_with_attributes: 'only_with_attributes_example', # String | Search with attributes specified only. Attribute \"documents\" is currently supported
  date: Date.parse('\"2019-01-11\"'), # Date | Date of the desired reservation in merchants' time zone. Format: yyyy-MM-dd. Availability search is only activated if \"place\" is specified.
  from_time: '\"20:00\"', # String | Beginning of the desired reservation time frame in merchants' time zone. Format: HH:mm. Consider a 3h buffer for the time (0.5h before the given time and 2.5h after)
  offset: 0, # Integer | offset
  limit: 100, # Integer | limit
  accept_language: 'accept_language_example' # String | language
}

begin
  #Allows to get merchant information by parameters
  result = api_instance.search(capacity, opts)
  p result
rescue Quandoo::ApiError => e
  puts "Exception when calling MerchantsApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **capacity** | **Integer**| Number of people. In order to be effective, \&quot;date\&quot; and \&quot;fromTime\&quot; must also be set. | [default to 2]
 **query** | **String**| Search query for a merchant name | [optional] 
 **place** | **String**| Search query for a place (country, city or district) name: the most relevant places, if any, are taken as a filter | [optional] 
 **center_point** | **String**| Search with coordinates and radius. \&quot;radius\&quot; argument can be set, otherwise default value of 10 km will be used.&lt;br&gt;Format:&lt;br&gt;53.1222,13.0303&lt;br&gt;where latitude&#x3D;53.1222, longitude&#x3D;13.0303 | [optional] 
 **radius** | **Integer**| Radius for coordinate-based search | [optional] [default to 10]
 **bookable** | **BOOLEAN**| Filter only bookable merchants | [optional] 
 **tags** | **String**| Filter by tags found by text. The value can be either in English or in the specific locale. Semicolon separated. All or nothing behaviour: if one single tag is not found, the whole request fails. Cannot be used in combination with &#39;groupedTagIds&#39; parameter. | [optional] 
 **tag_ids** | **String**| Filter by tags found by id. Semicolon separated. All or nothing behaviour: if one single tag id is not found, the whole request fails. Cannot be used in combination with &#39;tags&#39; parameter. | [optional] 
 **review_score_max** | **Integer**| Filter by max review score (100 - 600) | [optional] 
 **only_with_attributes** | **String**| Search with attributes specified only. Attribute \&quot;documents\&quot; is currently supported | [optional] 
 **date** | **Date**| Date of the desired reservation in merchants&#39; time zone. Format: yyyy-MM-dd. Availability search is only activated if \&quot;place\&quot; is specified. | [optional] 
 **from_time** | **String**| Beginning of the desired reservation time frame in merchants&#39; time zone. Format: HH:mm. Consider a 3h buffer for the time (0.5h before the given time and 2.5h after) | [optional] 
 **offset** | **Integer**| offset | [optional] [default to 0]
 **limit** | **Integer**| limit | [optional] [default to 100]
 **accept_language** | **String**| language | [optional] 

### Return type

[**MerchantDetailsDtoList**](MerchantDetailsDtoList.md)

### Authorization

[API_TOKEN](../README.md#API_TOKEN)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **search2**
> MerchantDetailsDto search2(merchant_id, opts)

Allows to get a merchant by id

This endpoint allows to receive detailed information on a particular merchant in the system. This merchant should be specified by their identifier **merchantId**, which is mandatory. The endpoint can take optional request header **Accept-Language**. This header is used to determine correct locale and has an effect on translation of merchant's entity fields, that may be omitted.  The expected value of the header **Accept-Language** should contain language and can contain country, e.g. \"de_DE\" or \"de\". Locale by default is \"en_GB\".  The endpoint returns status `HTTP 200` if the request is successful. The endpoint will return status `HTTP 404` if the merchant, specified by identifier, was not found or has no products, allowed for a web search.   Example curl: ``` curl  -H 'X-Quandoo-AuthToken: {INSERT_KEY_HERE}' -H 'Accept-Language: de_DE' 'https://{host}/v{X}/merchants/11' ```  Example response: ``` {     \"id\":11,     \"name\":\"Test merchant\",     \"phoneNumber\":\"+27113901837\",     \"currency\":\"ZAR\",     \"locale\":\"en_ZA\",     \"timezone\":\"Africa/Johannesburg\",     \"location\":{         \"coordinates\":{             \"latitude\":33.9,             \"longitude\":18.4         },         \"address\":{             \"street\":\"Tamerlan street\",             \"number\":\"6A\",             \"zipcode\":\"10787\",             \"city\":\"Cape Town\",             \"country\":\"ZAF\"         }     },     \"reviewScore\": \"5.3\",     \"tagGroups\":[         {             \"type\":\"CUISINE\",             \"tags\":[                 {                     \"id\":25,                     \"name\":\"Testküche Hauptkategorie\"                 },                 {                     \"id\":28,                     \"name\":\"Test cuisine\"                 }             ]         }     ],     \"images\":[         {             \"url\":\"https://dci5ez2ey8tr9.cloudfront.net/8e4d1063-9171-40b1-94b7-5e9337591a90/7_sld.jpg\"         }     ],     \"documents\":[],     \"links\":[         {             \"href\":\"https://{host}/{path}?aid=16\",             \"method\":\"GET\",             \"rel\":\"DETAILS\"         },         {             \"href\":\"https://{host}/{path}?aid=16&countryId=NLD\",             \"method\":\"GET\",             \"rel\":\"WIDGET\"         },         {             \"href\":\"https://{host}/{path}/details?aid=16&countryId=NLD\",             \"method\":\"GET\",             \"rel\":\"WIDGET_DETAILS\"         }     ],     \"bookable\": true,     \"openingTimes\": {       \"standardOpeningTimes\": {         \"SATURDAY\": [           {             \"start\": \"09:00:00\",             \"end\": \"20:00:00\"           }         ],         \"SUNDAY\": [           {             \"start\": \"09:00:00\",             \"end\": \"18:00:00\"           }         ]       }     },     \"ccvEnabled\": true,     \"chain\": {        \"id\": 1,        \"name\": \"Test chain\"     } } ```

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

api_instance = Quandoo::MerchantsApi.new

merchant_id = 56 # Integer | merchantId

opts = { 
  accept_language: 'en_GB' # String | Locale.<br>Format:<br>&lt;language code&gt;[_&lt;country code&gt;]
}

begin
  #Allows to get a merchant by id
  result = api_instance.search2(merchant_id, opts)
  p result
rescue Quandoo::ApiError => e
  puts "Exception when calling MerchantsApi->search2: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **merchant_id** | **Integer**| merchantId | 
 **accept_language** | **String**| Locale.&lt;br&gt;Format:&lt;br&gt;&amp;lt;language code&amp;gt;[_&amp;lt;country code&amp;gt;] | [optional] [default to en_GB]

### Return type

[**MerchantDetailsDto**](MerchantDetailsDto.md)

### Authorization

[API_TOKEN](../README.md#API_TOKEN)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **search_similar1**
> MerchantWithRecommendationsDto search_similar1(merchant_id, opts)

Allows to get a merchant by id and find similar merchants

This endpoint allows to receive detailed information for a particular merchant in the system and for restaurants that are similar to this one. A merchant is similar if all the following conditions are met: 1. Location: the recommended merchants are within 30 km radius from the main merchant 2. The similar merchants are bookable online 3. The similar merchants have the main cuisine in common  This merchant should be specified by their identifier **merchantId**, which is mandatory. The endpoint can take optional request header **Accept-Language**. This header is used to determine correct locale and has an effect on translation of merchant's entity fields, that may be omitted.  The expected value of the header **Accept-Language** should contain language and can contain country, e.g. \"de_DE\" or \"de\". Locale by default is \"en_GB\".  The endpoint returns status `HTTP 200` if the request is successful. In a successful requests the specified merchant was found.  If the merchant has no products allowed for a web search, i.e. is not bookable, response data with `HTTP 200` is returned, but the field `merchant` is not set. Instead, the merchant search message is set.  The endpoint will return status `HTTP 404` if the merchant, specified by identifier, was not found.  Example curl: ``` curl  -H 'X-Quandoo-AuthToken: {INSERT_KEY_HERE}' -H 'Accept-Language: de_DE' 'https://{host}/v{X}/merchants/11/similar' ```  Example responses: `merchant bookable` ``` {     \"merchant\": {         \"id\":11,         \"name\":\"Test merchant\",         \"phoneNumber\":\"+27113901837\",         \"currency\":\"ZAR\",         \"locale\":\"en_ZA\",         \"timezone\":\"Africa/Johannesburg\",         \"location\":{             \"coordinates\":{                 \"latitude\":33.9,                 \"longitude\":18.4             },             \"address\":{                 \"street\":\"Tamerlan street\",                 \"number\":\"6A\",                 \"zipcode\":\"10787\",                 \"city\":\"Cape Town\",                 \"country\":\"ZAF\"             }         },         \"reviewScore\": \"5.3\",         \"tagGroups\":[             {                 \"type\":\"CUISINE\",                 \"tags\":[                     {                         \"id\":25,                         \"name\":\"Testküche Hauptkategorie\"                     },                     {                         \"id\":28,                         \"name\":\"Test cuisine\"                     }                 ]             }         ],         \"images\":[             {                 \"url\":\"https://dci5ez2ey8tr9.cloudfront.net/8e4d1063-9171-40b1-94b7-5e9337591a90/7_sld.jpg\"             }         ],         \"documents\":[],         \"links\":[             {                 \"href\":\"https://{host}/{path}?aid=16\",                 \"method\":\"GET\",                 \"rel\":\"DETAILS\"             },             {                 \"href\":\"https://{host}/{path}?aid=16&countryId=NLD\",                 \"method\":\"GET\",                 \"rel\":\"WIDGET\"             },             {                 \"href\":\"https://{host}/{path}/details?aid=16&countryId=NLD\",                 \"method\":\"GET\",                 \"rel\":\"WIDGET_DETAILS\"             }         ],         \"bookable\": true,         \"openingTimes\": {           \"standardOpeningTimes\": {             \"SATURDAY\": [               {                 \"start\": \"09:00:00\",                 \"end\": \"20:00:00\"               }             ],             \"SUNDAY\": [               {                 \"start\": \"09:00:00\",                 \"end\": \"18:00:00\"               }             ]           }         },         \"ccvEnabled\": true,         \"chain\": {            \"id\": 1,            \"name\": \"Test chain\"         }     },    \"recommendedMerchants\": {         \"merchants\": [             {                 \"id\":12,                 \"name\":\"similar merchant\",                 \"phoneNumber\":\"+27113901838\",                 \"currency\":\"ZAR\",                 \"locale\":\"en_ZA\",                 \"timezone\":\"Africa/Johannesburg\",                 \"location\":{                     \"coordinates\":{                         \"latitude\":33.8,                         \"longitude\":18.4                     },                     \"address\":{                         \"street\":\"Tamerlan street\",                         \"number\":\"5A\",                         \"zipcode\":\"10787\",                         \"city\":\"Cape Town\",                         \"country\":\"ZAF\"                     }                 },                 \"reviewScore\": \"5.3\",                 \"tagGroups\":[                     {                         \"type\":\"CUISINE\",                         \"tags\":[                             {                                 \"id\":25,                                 \"name\":\"Testküche Hauptkategorie\"                             },                             {                                 \"id\":28,                                 \"name\":\"Test cuisine\"                             }                         ]                     }                 ],                 \"images\":[                     {                         \"url\":\"https://dci5ez2ey8tr9.cloudfront.net/8e4d1063-9171-40b1-94b7-5e9337591a90/7_sld.jpg\"                     }                 ],                 \"documents\":[],                 \"links\":[                     {                         \"href\":\"https://{host}/{path}?aid=16\",                         \"method\":\"GET\",                         \"rel\":\"DETAILS\"                     },                     {                         \"href\":\"https://{host}/{path}?aid=16&countryId=NLD\",                         \"method\":\"GET\",                         \"rel\":\"WIDGET\"                     },                     {                         \"href\":\"https://{host}/{path}/details?aid=16&countryId=NLD\",                         \"method\":\"GET\",                         \"rel\":\"WIDGET_DETAILS\"                     }                 ],                 \"bookable\": true,                 \"openingTimes\": {                   \"standardOpeningTimes\": {                     \"SATURDAY\": [                       {                         \"start\": \"09:00:00\",                         \"end\": \"20:00:00\"                       }                     ],                     \"SUNDAY\": [                       {                         \"start\": \"09:00:00\",                         \"end\": \"18:00:00\"                       }                     ]                   }                 },                 \"ccvEnabled\": true,                 \"chain\": {                    \"id\": 1,                    \"name\": \"Test chain\"                 }             }         ],         \"size\": 1,         \"offset\": 0,         \"limit\": 10     } } ```  `merchant not bookable` ``` {     \"merchantSearchMessage\": \"MERCHANT_NOT_BOOKABLE\",     \"recommendedMerchants\": {         \"limit\": 10,         \"merchants\": [...],         \"offset\": 0,         \"size\": 0     } } ```

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

api_instance = Quandoo::MerchantsApi.new

merchant_id = 56 # Integer | merchantId

opts = { 
  sort: 'CLOSEST', # String | Sort order. Default sorting will be by proximity.
  limit: 10, # Integer | Max number of merchant recommendations to return.
  accept_language: 'en_GB' # String | Locale.<br>Format:<br>&lt;language code&gt;[_&lt;country code&gt;]
}

begin
  #Allows to get a merchant by id and find similar merchants
  result = api_instance.search_similar1(merchant_id, opts)
  p result
rescue Quandoo::ApiError => e
  puts "Exception when calling MerchantsApi->search_similar1: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **merchant_id** | **Integer**| merchantId | 
 **sort** | **String**| Sort order. Default sorting will be by proximity. | [optional] [default to CLOSEST]
 **limit** | **Integer**| Max number of merchant recommendations to return. | [optional] [default to 10]
 **accept_language** | **String**| Locale.&lt;br&gt;Format:&lt;br&gt;&amp;lt;language code&amp;gt;[_&amp;lt;country code&amp;gt;] | [optional] [default to en_GB]

### Return type

[**MerchantWithRecommendationsDto**](MerchantWithRecommendationsDto.md)

### Authorization

[API_TOKEN](../README.md#API_TOKEN)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



