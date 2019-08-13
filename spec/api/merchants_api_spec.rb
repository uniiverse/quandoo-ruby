=begin
#Quandoo API Documentation

#No description provided (generated by Swagger Codegen https://github.com/swagger-api/swagger-codegen)

OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.5

=end

require 'spec_helper'
require 'json'

# Unit tests for Quandoo::MerchantsApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'MerchantsApi' do
  before do
    # run before each test
    @instance = Quandoo::MerchantsApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of MerchantsApi' do
    it 'should create an instance of MerchantsApi' do
      expect(@instance).to be_instance_of(Quandoo::MerchantsApi)
    end
  end

  # unit tests for get_reservations2
  # Get merchant reservations
  # This endpoint allows an agent to get reservations of a merchant. The results will be filtered by agent id.  Reservation IDs in response are agent-specific. The agent needs to be authenticated.  The endpoint will return &#x60;HTTP 404 - Not Found&#x60; if the merchant with the specified id could not be found. It will return &#x60;HTTP 403 - Forbidden&#x60; if the agent is not authenticated or the agent doesn&#39;t have permissions.  ####Request: * **merchantId**: ID of the merchant * **offset**: sets the starting element to be returned. Defaults to 0 when unset or malformed. * **limit**: maximum number of results to be returned. Value must be between 1 and 100. Defaults to 100 when unset, malformed or outside bounds. * **earliest**: earliest date time of time window in UTC. Format: yyyy-MM-dd HH:mm:ss * **latest**: latest date time of time window in UTC. Format: yyyy-MM-dd HH:mm:ss   ####Response: The response will be a _list_ of reservations. Each reservation has the fields explained below: * **id**: The public id of the reservation * **number**: Quandoo internal identifier of the reservation. * **quandooId**: The public id of this reservation on quandoo system. * **status**: The status of the reservation eg. CREATED, CONFIRMED, CUSTOMER CANCELED etc. * **startTime**: The start time of the reservation. Format: &#x60;yyyy-MM-ddTHH:mm:ssZ&#x60; * **endTime**: The end time of the reservation. Format: &#x60;yyyy-MM-ddTHH:mm:ssZ&#x60; * **capacity**: The capacity (people count) of the reservation * **merchantId**: The ID of the merchant at which this reservation was made. * **customerId**: The public ID of the customer to which this reservation belongs * **promoCode**: The promotion code associated with this reservation. Optional. * **extraInfo**: extra information that the customer provided for the reservation. Optional. * **links**: Related links that can be followed based on this response. * **createdAt**: The date the reservation was created. Format: &#x60;yyyy-MM-ddTHH:mm:ssZ&#x60; * **updatedAt**: The date the reservation was last updated. Format: &#x60;yyyy-MM-ddTHH:mm:ssZ&#x60;  Example curl: &#x60;&#x60;&#x60; curl https://{host}/v{X}/merchants/32489/reservations &#x60;&#x60;&#x60;  Example response:  &#x60;&#x60;&#x60; {   \&quot;reservations\&quot;: [     {       \&quot;id\&quot;: \&quot;07f53b36-3f48-11e5-a151-feff819cdc9f\&quot;,       \&quot;number\&quot;: 8734957,       \&quot;quandooId\&quot;: \&quot;07f53b36-3f48-11e5-a151-feff819cdc9f\&quot;,       \&quot;status\&quot;: \&quot;CREATED\&quot;,       \&quot;startTime\&quot;: \&quot;2015-06-22T12:00:00+00:00\&quot;,       \&quot;endTime\&quot;: \&quot;2015-06-22T13:00:00+00:00\&quot;,       \&quot;capacity\&quot;: 4,       \&quot;merchantId\&quot;: 1384,       \&quot;customerId\&quot;: \&quot;ce0706ff-a95d-4229-a220-d21dcd175342\&quot;,       \&quot;promocode\&quot;: \&quot;SOME_CAMPAIGN_CODE\&quot;,       \&quot;extraInfo\&quot;: \&quot;request for baby chair\&quot;,       \&quot;links\&quot;: [         {           \&quot;href\&quot;: \&quot;https://{host}/v{X}/reservations/07f53b36-3f48-11e5-a151-feff819cdc9f\&quot;,           \&quot;method\&quot;: \&quot;GET\&quot;,           \&quot;rel\&quot;: \&quot;self\&quot;         },         {           \&quot;href\&quot;: \&quot;https://{host}/v{X}/reservations/07f53b36-3f48-11e5-a151-feff819cdc9f\&quot;,           \&quot;method\&quot;: \&quot;PATCH\&quot;,           \&quot;rel\&quot;: \&quot;update\&quot;         }       ],       \&quot;createdAt\&quot;: \&quot;2015-06-01T15:21:54Z\&quot;,       \&quot;updatedAt\&quot;: \&quot;2015-06-01T18:45:30Z\&quot;     },     {       \&quot;id\&quot;: \&quot;d8f53b36-3f48-11e5-a151-feff819cdc7a\&quot;,       \&quot;number\&quot;: 8734958,       \&quot;quandooId\&quot;: \&quot;d8f53b36-3f48-11e5-a151-feff819cdc7a\&quot;,       \&quot;status\&quot;: \&quot;CONFIRMED\&quot;,       \&quot;startTime\&quot;: \&quot;2015-06-22T12:00:00+00:00\&quot;,       \&quot;endTime\&quot;: \&quot;2015-06-22T13:00:00+00:00\&quot;,       \&quot;capacity\&quot;: 3,       \&quot;merchantId\&quot;: 1384,       \&quot;customerId\&quot;: \&quot;ce0706ff-a95d-4229-a220-d21dcd175342\&quot;,       \&quot;promocode\&quot;: \&quot;SOME_CAMPAIGN_CODE\&quot;,       \&quot;links\&quot;: [         {           \&quot;href\&quot;: \&quot;https://{host}/v{X}/reservations/d8f53b36-3f48-11e5-a151-feff819cdc7a\&quot;,           \&quot;method\&quot;: \&quot;GET\&quot;,           \&quot;rel\&quot;: \&quot;self\&quot;         },         {           \&quot;href\&quot;: \&quot;https://{host}/v{X}/reservations/d8f53b36-3f48-11e5-a151-feff819cdc7a\&quot;,           \&quot;method\&quot;: \&quot;PATCH\&quot;,           \&quot;rel\&quot;: \&quot;update\&quot;         }       ],       \&quot;createdAt\&quot;: \&quot;2015-06-01T15:21:54Z\&quot;,       \&quot;updatedAt\&quot;: \&quot;2015-06-01T18:45:30Z\&quot;     }   ] } &#x60;&#x60;&#x60; 
  # @param merchant_id Id of the merchant
  # @param [Hash] opts the optional parameters
  # @option opts [Integer] :offset Skip first n reservations
  # @option opts [Integer] :limit limit
  # @option opts [DateTime] :earliest earliest date time of time window in UTC. Format: yyyy-MM-dd HH:mm:ss
  # @option opts [DateTime] :latest latest date time of time window in UTC. Format: yyyy-MM-dd HH:mm:ss
  # @return [ReservationDataList]
  describe 'get_reservations2 test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_reviews1
  # Retrieves customer reviews for a merchant, specified by reviewId
  # This endpoint retrieves customer reviews for a particular merchant with rating, description, locale, date &amp; the customer&#39;s information.This merchant should be specified by their identifier **merchantId**, which is mandatory.  Supports pagination via offset &amp; limit parameters in the request.  &#x60;offset&#x60; allows skipping the first n reviews. &#x60;limit&#x60; makes sure the response contains a maximum of n reviews.  If not supplied, offset will be 0 and limit will be 10  ####Response:  * **customer**: block contains link to customer&#39;s profile image, customer&#39;s first name &amp; first letter of customer&#39;s last name. * **rating**: a value between 1 and 6, where 1 represents the worst rating and 6 represents the best. * **description**: the review description entered by the customer. * **locale**: represents the language settings of the customer, in the format: &lt;language code&gt;_&lt;country code&gt; * **date**: represents the date of the review, with the format: yyyy-MM-dd  Example curl: &#x60;&#x60;&#x60; curl https://{host}/v{X}/merchants/15/reviews?offset&#x3D;10&amp;limit&#x3D;5 &#x60;&#x60;&#x60;  Example response: &#x60;&#x60;&#x60; {    reviews: [      {            customer: {                 firstName: \&quot;Hans\&quot;,                 lastName: \&quot;W\&quot;,                 profileImage: {                     url: \&quot;https://www...\&quot;                 },            },            rating: 1,            description: \&quot;Foo bar\&quot;,                            locale: \&quot;de_DE\&quot;,            date: \&quot;2017-07-21\&quot;      }    ],    offset: 10,    limit: 5,    size: 1 } &#x60;&#x60;&#x60;
  # @param merchant_id 
  # @param [Hash] opts the optional parameters
  # @option opts [Integer] :offset Skip first n reviews
  # @option opts [Integer] :limit Max number of reviews to be retrieved
  # @return [ReviewDtoList]
  describe 'get_reviews1 test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for search
  # Allows to get merchant information by parameters
  # ###Description  This endpoint is used to search merchants by a set of parameters. For each merchant in the result there is information about location, language and tags that describe this merchant&#39;s basic characteristics, there is also a set of images selected by the merchant.  ####Possible query parameters:  * **query**: Filter merchants using text similarity on a number of merchant fields like name, description, categories and tags * **place**: Filter for merchant on a country, city or district whose name matches the parameter. (if the parameter does not match any city or district on the system it is ignored) * **centerPoint**: Filter merchants within the circle defined by center on centerPoint and radius defined by radius parameter (if not informed defaults to 10). Center point has the format LATITUDE,LONGITUDE with both parameters as numbers with . as decimal separator (e.g &#x60;centerPoint&#x3D;52.547928,13.4085728&#x60;) * **radius**: The radius of the circle to filter merchants in **kilometers**. Defaults to 10 and is only used if *centerPoint* is also informed * **bookable**: Boolean value, if informed true means that only merchants that are online bookable will be returned and false means that only merchants that are NOT online bookable will be returned * **tags**: Filter out merchants with the selected tags text. Semicolon separated text value. All or nothing field: if a tag is not found, the query will fail. Cannot be used in conjunction with &#39;tagIds&#39; parameter. * **tagIds**: Filter out merchants with the selected tag ids. Semicolon separated text value. All or nothing field: if a tag is not found, the query will fail. Cannot be used in conjunction with &#39;tags&#39; parameter. * **reviewScoreMax**: Filter out merchants with review score higher than the one informed. * **onlyWithAttributes**: This field only accepts the value **documents** for now. If informed only merchants with documents will be returned. You need to be **authenticated** to use this filter * **capacity**: Number of people. In order to be effective, \&quot;place\&quot;, \&quot;date\&quot; and \&quot;fromTime\&quot; must also be set. * **date**: Date of the desired reservation in merchants&#39; time zone. Format: yyyy-MM-dd. Availability search is only activated if \&quot;place\&quot; is specified. * **fromTime**: Beginning of the desired reservation time frame in merchants&#39; time zone. Format: HH:mm. Consider a 3h buffer for the time (0.5h before the given time and 2.5h after) * **offset**: Number of merchants to skip on the result. Defaults to 0 * **limit**: Maximum number of merchants to return. Defaults to 100 and cannot be more than 100. * **bookable**: This flag indicates whether the merchant is bookable or not.    ####Result fields for Merchant object:  * **id**: Id of the merchant * **name**: Name of the merchant * **phoneNumber**: The phone number of the merchant * **currency**: Currency of the merchant in the ISO 4217 letter format * **locale**: Locale used to communicate with this merchant * **timezone**: Canonical Timezone name * **location**: Location of the merchant, contains both an geo located point and an address if available * **reviewScore**: Review score of the merchant * **tagGroups**: Tags (grouped) about relevant merchant characteristics * **images**: Group of images selected by the merchant * **documents**: Group of documents released by this merchant (e.g seasonal menus ) * **links**: Links for other pages or api operations for this merchant * **openingTimes**: Group of opening times: restaurant opening times for this merchant. Time range beginning may be greater than the end time of the range, when this range goes beyond the day when it was started, e.g. 19:00:00 - 02:00:00 * **ccvEnabled**: If true, credit card information is required when creating a reservation * **chain**: Merchant chain information, if any   ###Authenticated use of the api: * Field &#x60;documents&#x60; is only accessible for authorized callers and will be empty otherwise. * Queries with parameter &#x60;onlyWithAttributes&#x60; are only allowed for authorized callers and will return &#x60;HTTP 403&#x60; for unauthorized requests  #####How? In order to make an authenticated call the caller must send a header name &#x60;X-Quandoo-AuthToken&#x60; with the token obtained from contact with Quandoo.  ###Pagination of the result:  The result contains the fields &#x60;size&#x60; with the number of all merchants that matched the informed parameters, &#x60;offset&#x60; and &#x60;limit&#x60; defining which merchants from the complete list are on this response, and the caller can use query parameters &#x60;offset&#x60; and &#x60;limit&#x60; to get different merchants on the result list  ###Examples:  Example curl: &#x60;&#x60;&#x60; curl -H &#39;X-Quandoo-AuthToken: INSERT_KEY_HERE&#39; &#39;https://{host}/v{X}/merchants?query&#x3D;Zim&amp;place&#x3D;Berlin&amp;amp;centerPoint&#x3D;52.5479288%2C13.4085728&amp;radius&#x3D;10&amp;bookable&#x3D;true&amp;reviewScoreMax&#x3D;200&amp;onlyWithAttributes&#x3D;documents&amp;offset&#x3D;0&amp;limit&#x3D;100&#39; &#x60;&#x60;&#x60;  Example response: &#x60;&#x60;&#x60; {   \&quot;merchants\&quot;: [     {       \&quot;id\&quot;: 215,       \&quot;name\&quot;: \&quot;a-merchant-Zim\&quot;,       \&quot;phoneNumber\&quot;: \&quot;+49153153153\&quot;,       \&quot;currency\&quot;: \&quot;EUR\&quot;,       \&quot;locale\&quot;: \&quot;de_DE\&quot;,       \&quot;timezone\&quot;: \&quot;Europe/Berlin\&quot;,       \&quot;location\&quot;: {         \&quot;coordinates\&quot;: {           \&quot;latitude\&quot;: 55,           \&quot;longitude\&quot;: 12         },         \&quot;address\&quot;: {}       },       \&quot;reviewScore\&quot;: \&quot;5.3\&quot;,       \&quot;tagGroups\&quot;: [         {           \&quot;type\&quot;: \&quot;CUISINE\&quot;,           \&quot;tags\&quot;: [             {               \&quot;id\&quot;: 63,               \&quot;name\&quot;: \&quot;Testküche Hauptkategorie\&quot;             },             {               \&quot;id\&quot;: 66,               \&quot;name\&quot;: \&quot;Test cuisine\&quot;             }           ]         }       ],       \&quot;images\&quot;: [],       \&quot;documents\&quot;: [         {           \&quot;name\&quot;: \&quot;Main Menu\&quot;,           \&quot;url\&quot;: \&quot;https://d2s6u6f7snurg9.cloudfront.net/partner/uploads/MD-document-3ec1dc15-1b69-463f-bdd2-c060b9bf844d.pdf\&quot;,           \&quot;format\&quot;: \&quot;pdf\&quot;,           \&quot;description\&quot;: \&quot;Seasonal Main Menu\&quot;         }       ],       \&quot;links\&quot;: [         {           \&quot;href\&quot;: \&quot;https://{host}/{path}?aid&#x3D;16\&quot;,           \&quot;method\&quot;: \&quot;GET\&quot;,           \&quot;rel\&quot;: \&quot;DETAILS\&quot;         },         {           \&quot;href\&quot;: \&quot;https://{host}/{path}?aid&#x3D;16&amp;countryId&#x3D;NLD\&quot;,           \&quot;method\&quot;: \&quot;GET\&quot;,           \&quot;rel\&quot;: \&quot;WIDGET\&quot;         },         {           \&quot;href\&quot;: \&quot;https://{host}/{path}/details?aid&#x3D;16&amp;countryId&#x3D;NLD\&quot;,           \&quot;method\&quot;: \&quot;GET\&quot;,           \&quot;rel\&quot;: \&quot;WIDGET_DETAILS\&quot;         }       ],       \&quot;bookable\&quot;: true,       \&quot;ccvEnabled\&quot;: true,       \&quot;chain\&quot;: {         \&quot;id\&quot;: 1,         \&quot;name\&quot;: \&quot;Test chain\&quot;       }     },     {       \&quot;id\&quot;: 219,       \&quot;name\&quot;: \&quot;another merchants Zim\&quot;,       \&quot;phoneNumber\&quot;: \&quot;+49154154154\&quot;,       \&quot;currency\&quot;: \&quot;EUR\&quot;,       \&quot;locale\&quot;: \&quot;de_DE\&quot;,       \&quot;timezone\&quot;: \&quot;Europe/Berlin\&quot;,       \&quot;location\&quot;: {         \&quot;coordinates\&quot;: {           \&quot;latitude\&quot;: 52,           \&quot;longitude\&quot;: 13         },         \&quot;address\&quot;: {           \&quot;street\&quot;: \&quot;Wintersteinstr.\&quot;,           \&quot;number\&quot;: \&quot;15\&quot;,           \&quot;zipcode\&quot;: \&quot;10587\&quot;,           \&quot;city\&quot;: \&quot;Berlin\&quot;,           \&quot;country\&quot;: \&quot;DEU\&quot;         }       },       \&quot;reviewScore\&quot;: \&quot;4.7\&quot;,             \&quot;tagGroups\&quot;: [         {           \&quot;type\&quot;: \&quot;CUISINE\&quot;,           \&quot;tags\&quot;: [             {               \&quot;id\&quot;: 79,               \&quot;name\&quot;: \&quot;Testküche Hauptkategorie\&quot;             },             {               \&quot;id\&quot;: 82,               \&quot;name\&quot;: \&quot;Test Japanese\&quot;             }           ]         },         {           \&quot;type\&quot;: \&quot;PRICE\&quot;,           \&quot;tags\&quot;: [             {               \&quot;id\&quot;: 84,               \&quot;name\&quot;: \&quot;Test expensive\&quot;             }           ]         }       ],       \&quot;images\&quot;: [         {           \&quot;url\&quot;: \&quot;https://dci5ez2ey8tr9.cloudfront.net/1482eec7-e585-4821-b096-8a9941e0d2eb/25_sld.jpg\&quot;         }       ],       \&quot;documents\&quot;: [],       \&quot;links\&quot;: [         {           \&quot;href\&quot;: \&quot;https://{host}/{path}?aid&#x3D;16\&quot;,           \&quot;method\&quot;: \&quot;GET\&quot;,           \&quot;rel\&quot;: \&quot;DETAILS\&quot;         },         {           \&quot;href\&quot;: \&quot;https://{host}/{path}?aid&#x3D;16&amp;countryId&#x3D;NLD\&quot;,           \&quot;method\&quot;: \&quot;GET\&quot;,           \&quot;rel\&quot;: \&quot;WIDGET\&quot;         },         {           \&quot;href\&quot;: \&quot;https://{host}/{path}/details?aid&#x3D;16&amp;countryId&#x3D;NLD\&quot;,           \&quot;method\&quot;: \&quot;GET\&quot;,           \&quot;rel\&quot;: \&quot;WIDGET_DETAILS\&quot;         }       ],       \&quot;bookable\&quot;: true,       \&quot;openingTimes\&quot;: {         \&quot;standardOpeningTimes\&quot;: {           \&quot;SATURDAY\&quot;: [             {               \&quot;start\&quot;: \&quot;09:00:00\&quot;,               \&quot;end\&quot;: \&quot;20:00:00\&quot;             }           ],           \&quot;SUNDAY\&quot;: [             {               \&quot;start\&quot;: \&quot;09:00:00\&quot;,               \&quot;end\&quot;: \&quot;18:00:00\&quot;             }           ]         }       },       \&quot;ccvEnabled\&quot;: true,       \&quot;chain\&quot;: {         \&quot;id\&quot;: 1,         \&quot;name\&quot;: \&quot;Test chain\&quot;       }     }   ],   \&quot;size\&quot;: 2,   \&quot;offset\&quot;: 0,   \&quot;limit\&quot;: 100 } &#x60;&#x60;&#x60;
  # @param capacity Number of people. In order to be effective, \&quot;date\&quot; and \&quot;fromTime\&quot; must also be set.
  # @param [Hash] opts the optional parameters
  # @option opts [String] :query Search query for a merchant name
  # @option opts [String] :place Search query for a place (country, city or district) name: the most relevant places, if any, are taken as a filter
  # @option opts [String] :center_point Search with coordinates and radius. \&quot;radius\&quot; argument can be set, otherwise default value of 10 km will be used.&lt;br&gt;Format:&lt;br&gt;53.1222,13.0303&lt;br&gt;where latitude&#x3D;53.1222, longitude&#x3D;13.0303
  # @option opts [Integer] :radius Radius for coordinate-based search
  # @option opts [BOOLEAN] :bookable Filter only bookable merchants
  # @option opts [String] :tags Filter by tags found by text. The value can be either in English or in the specific locale. Semicolon separated. All or nothing behaviour: if one single tag is not found, the whole request fails. Cannot be used in combination with &#39;groupedTagIds&#39; parameter.
  # @option opts [String] :tag_ids Filter by tags found by id. Semicolon separated. All or nothing behaviour: if one single tag id is not found, the whole request fails. Cannot be used in combination with &#39;tags&#39; parameter.
  # @option opts [Integer] :review_score_max Filter by max review score (100 - 600)
  # @option opts [String] :only_with_attributes Search with attributes specified only. Attribute \&quot;documents\&quot; is currently supported
  # @option opts [Date] :date Date of the desired reservation in merchants&#39; time zone. Format: yyyy-MM-dd. Availability search is only activated if \&quot;place\&quot; is specified.
  # @option opts [String] :from_time Beginning of the desired reservation time frame in merchants&#39; time zone. Format: HH:mm. Consider a 3h buffer for the time (0.5h before the given time and 2.5h after)
  # @option opts [Integer] :offset offset
  # @option opts [Integer] :limit limit
  # @option opts [String] :accept_language language
  # @return [MerchantDetailsDtoList]
  describe 'search test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for search2
  # Allows to get a merchant by id
  # This endpoint allows to receive detailed information on a particular merchant in the system. This merchant should be specified by their identifier **merchantId**, which is mandatory. The endpoint can take optional request header **Accept-Language**. This header is used to determine correct locale and has an effect on translation of merchant&#39;s entity fields, that may be omitted.  The expected value of the header **Accept-Language** should contain language and can contain country, e.g. \&quot;de_DE\&quot; or \&quot;de\&quot;. Locale by default is \&quot;en_GB\&quot;.  The endpoint returns status &#x60;HTTP 200&#x60; if the request is successful. The endpoint will return status &#x60;HTTP 404&#x60; if the merchant, specified by identifier, was not found or has no products, allowed for a web search.   Example curl: &#x60;&#x60;&#x60; curl  -H &#39;X-Quandoo-AuthToken: {INSERT_KEY_HERE}&#39; -H &#39;Accept-Language: de_DE&#39; &#39;https://{host}/v{X}/merchants/11&#39; &#x60;&#x60;&#x60;  Example response: &#x60;&#x60;&#x60; {     \&quot;id\&quot;:11,     \&quot;name\&quot;:\&quot;Test merchant\&quot;,     \&quot;phoneNumber\&quot;:\&quot;+27113901837\&quot;,     \&quot;currency\&quot;:\&quot;ZAR\&quot;,     \&quot;locale\&quot;:\&quot;en_ZA\&quot;,     \&quot;timezone\&quot;:\&quot;Africa/Johannesburg\&quot;,     \&quot;location\&quot;:{         \&quot;coordinates\&quot;:{             \&quot;latitude\&quot;:33.9,             \&quot;longitude\&quot;:18.4         },         \&quot;address\&quot;:{             \&quot;street\&quot;:\&quot;Tamerlan street\&quot;,             \&quot;number\&quot;:\&quot;6A\&quot;,             \&quot;zipcode\&quot;:\&quot;10787\&quot;,             \&quot;city\&quot;:\&quot;Cape Town\&quot;,             \&quot;country\&quot;:\&quot;ZAF\&quot;         }     },     \&quot;reviewScore\&quot;: \&quot;5.3\&quot;,     \&quot;tagGroups\&quot;:[         {             \&quot;type\&quot;:\&quot;CUISINE\&quot;,             \&quot;tags\&quot;:[                 {                     \&quot;id\&quot;:25,                     \&quot;name\&quot;:\&quot;Testküche Hauptkategorie\&quot;                 },                 {                     \&quot;id\&quot;:28,                     \&quot;name\&quot;:\&quot;Test cuisine\&quot;                 }             ]         }     ],     \&quot;images\&quot;:[         {             \&quot;url\&quot;:\&quot;https://dci5ez2ey8tr9.cloudfront.net/8e4d1063-9171-40b1-94b7-5e9337591a90/7_sld.jpg\&quot;         }     ],     \&quot;documents\&quot;:[],     \&quot;links\&quot;:[         {             \&quot;href\&quot;:\&quot;https://{host}/{path}?aid&#x3D;16\&quot;,             \&quot;method\&quot;:\&quot;GET\&quot;,             \&quot;rel\&quot;:\&quot;DETAILS\&quot;         },         {             \&quot;href\&quot;:\&quot;https://{host}/{path}?aid&#x3D;16&amp;countryId&#x3D;NLD\&quot;,             \&quot;method\&quot;:\&quot;GET\&quot;,             \&quot;rel\&quot;:\&quot;WIDGET\&quot;         },         {             \&quot;href\&quot;:\&quot;https://{host}/{path}/details?aid&#x3D;16&amp;countryId&#x3D;NLD\&quot;,             \&quot;method\&quot;:\&quot;GET\&quot;,             \&quot;rel\&quot;:\&quot;WIDGET_DETAILS\&quot;         }     ],     \&quot;bookable\&quot;: true,     \&quot;openingTimes\&quot;: {       \&quot;standardOpeningTimes\&quot;: {         \&quot;SATURDAY\&quot;: [           {             \&quot;start\&quot;: \&quot;09:00:00\&quot;,             \&quot;end\&quot;: \&quot;20:00:00\&quot;           }         ],         \&quot;SUNDAY\&quot;: [           {             \&quot;start\&quot;: \&quot;09:00:00\&quot;,             \&quot;end\&quot;: \&quot;18:00:00\&quot;           }         ]       }     },     \&quot;ccvEnabled\&quot;: true,     \&quot;chain\&quot;: {        \&quot;id\&quot;: 1,        \&quot;name\&quot;: \&quot;Test chain\&quot;     } } &#x60;&#x60;&#x60;
  # @param merchant_id merchantId
  # @param [Hash] opts the optional parameters
  # @option opts [String] :accept_language Locale.&lt;br&gt;Format:&lt;br&gt;&amp;lt;language code&amp;gt;[_&amp;lt;country code&amp;gt;]
  # @return [MerchantDetailsDto]
  describe 'search2 test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for search_similar1
  # Allows to get a merchant by id and find similar merchants
  # This endpoint allows to receive detailed information for a particular merchant in the system and for restaurants that are similar to this one. A merchant is similar if all the following conditions are met: 1. Location: the recommended merchants are within 30 km radius from the main merchant 2. The similar merchants are bookable online 3. The similar merchants have the main cuisine in common  This merchant should be specified by their identifier **merchantId**, which is mandatory. The endpoint can take optional request header **Accept-Language**. This header is used to determine correct locale and has an effect on translation of merchant&#39;s entity fields, that may be omitted.  The expected value of the header **Accept-Language** should contain language and can contain country, e.g. \&quot;de_DE\&quot; or \&quot;de\&quot;. Locale by default is \&quot;en_GB\&quot;.  The endpoint returns status &#x60;HTTP 200&#x60; if the request is successful. In a successful requests the specified merchant was found.  If the merchant has no products allowed for a web search, i.e. is not bookable, response data with &#x60;HTTP 200&#x60; is returned, but the field &#x60;merchant&#x60; is not set. Instead, the merchant search message is set.  The endpoint will return status &#x60;HTTP 404&#x60; if the merchant, specified by identifier, was not found.  Example curl: &#x60;&#x60;&#x60; curl  -H &#39;X-Quandoo-AuthToken: {INSERT_KEY_HERE}&#39; -H &#39;Accept-Language: de_DE&#39; &#39;https://{host}/v{X}/merchants/11/similar&#39; &#x60;&#x60;&#x60;  Example responses: &#x60;merchant bookable&#x60; &#x60;&#x60;&#x60; {     \&quot;merchant\&quot;: {         \&quot;id\&quot;:11,         \&quot;name\&quot;:\&quot;Test merchant\&quot;,         \&quot;phoneNumber\&quot;:\&quot;+27113901837\&quot;,         \&quot;currency\&quot;:\&quot;ZAR\&quot;,         \&quot;locale\&quot;:\&quot;en_ZA\&quot;,         \&quot;timezone\&quot;:\&quot;Africa/Johannesburg\&quot;,         \&quot;location\&quot;:{             \&quot;coordinates\&quot;:{                 \&quot;latitude\&quot;:33.9,                 \&quot;longitude\&quot;:18.4             },             \&quot;address\&quot;:{                 \&quot;street\&quot;:\&quot;Tamerlan street\&quot;,                 \&quot;number\&quot;:\&quot;6A\&quot;,                 \&quot;zipcode\&quot;:\&quot;10787\&quot;,                 \&quot;city\&quot;:\&quot;Cape Town\&quot;,                 \&quot;country\&quot;:\&quot;ZAF\&quot;             }         },         \&quot;reviewScore\&quot;: \&quot;5.3\&quot;,         \&quot;tagGroups\&quot;:[             {                 \&quot;type\&quot;:\&quot;CUISINE\&quot;,                 \&quot;tags\&quot;:[                     {                         \&quot;id\&quot;:25,                         \&quot;name\&quot;:\&quot;Testküche Hauptkategorie\&quot;                     },                     {                         \&quot;id\&quot;:28,                         \&quot;name\&quot;:\&quot;Test cuisine\&quot;                     }                 ]             }         ],         \&quot;images\&quot;:[             {                 \&quot;url\&quot;:\&quot;https://dci5ez2ey8tr9.cloudfront.net/8e4d1063-9171-40b1-94b7-5e9337591a90/7_sld.jpg\&quot;             }         ],         \&quot;documents\&quot;:[],         \&quot;links\&quot;:[             {                 \&quot;href\&quot;:\&quot;https://{host}/{path}?aid&#x3D;16\&quot;,                 \&quot;method\&quot;:\&quot;GET\&quot;,                 \&quot;rel\&quot;:\&quot;DETAILS\&quot;             },             {                 \&quot;href\&quot;:\&quot;https://{host}/{path}?aid&#x3D;16&amp;countryId&#x3D;NLD\&quot;,                 \&quot;method\&quot;:\&quot;GET\&quot;,                 \&quot;rel\&quot;:\&quot;WIDGET\&quot;             },             {                 \&quot;href\&quot;:\&quot;https://{host}/{path}/details?aid&#x3D;16&amp;countryId&#x3D;NLD\&quot;,                 \&quot;method\&quot;:\&quot;GET\&quot;,                 \&quot;rel\&quot;:\&quot;WIDGET_DETAILS\&quot;             }         ],         \&quot;bookable\&quot;: true,         \&quot;openingTimes\&quot;: {           \&quot;standardOpeningTimes\&quot;: {             \&quot;SATURDAY\&quot;: [               {                 \&quot;start\&quot;: \&quot;09:00:00\&quot;,                 \&quot;end\&quot;: \&quot;20:00:00\&quot;               }             ],             \&quot;SUNDAY\&quot;: [               {                 \&quot;start\&quot;: \&quot;09:00:00\&quot;,                 \&quot;end\&quot;: \&quot;18:00:00\&quot;               }             ]           }         },         \&quot;ccvEnabled\&quot;: true,         \&quot;chain\&quot;: {            \&quot;id\&quot;: 1,            \&quot;name\&quot;: \&quot;Test chain\&quot;         }     },    \&quot;recommendedMerchants\&quot;: {         \&quot;merchants\&quot;: [             {                 \&quot;id\&quot;:12,                 \&quot;name\&quot;:\&quot;similar merchant\&quot;,                 \&quot;phoneNumber\&quot;:\&quot;+27113901838\&quot;,                 \&quot;currency\&quot;:\&quot;ZAR\&quot;,                 \&quot;locale\&quot;:\&quot;en_ZA\&quot;,                 \&quot;timezone\&quot;:\&quot;Africa/Johannesburg\&quot;,                 \&quot;location\&quot;:{                     \&quot;coordinates\&quot;:{                         \&quot;latitude\&quot;:33.8,                         \&quot;longitude\&quot;:18.4                     },                     \&quot;address\&quot;:{                         \&quot;street\&quot;:\&quot;Tamerlan street\&quot;,                         \&quot;number\&quot;:\&quot;5A\&quot;,                         \&quot;zipcode\&quot;:\&quot;10787\&quot;,                         \&quot;city\&quot;:\&quot;Cape Town\&quot;,                         \&quot;country\&quot;:\&quot;ZAF\&quot;                     }                 },                 \&quot;reviewScore\&quot;: \&quot;5.3\&quot;,                 \&quot;tagGroups\&quot;:[                     {                         \&quot;type\&quot;:\&quot;CUISINE\&quot;,                         \&quot;tags\&quot;:[                             {                                 \&quot;id\&quot;:25,                                 \&quot;name\&quot;:\&quot;Testküche Hauptkategorie\&quot;                             },                             {                                 \&quot;id\&quot;:28,                                 \&quot;name\&quot;:\&quot;Test cuisine\&quot;                             }                         ]                     }                 ],                 \&quot;images\&quot;:[                     {                         \&quot;url\&quot;:\&quot;https://dci5ez2ey8tr9.cloudfront.net/8e4d1063-9171-40b1-94b7-5e9337591a90/7_sld.jpg\&quot;                     }                 ],                 \&quot;documents\&quot;:[],                 \&quot;links\&quot;:[                     {                         \&quot;href\&quot;:\&quot;https://{host}/{path}?aid&#x3D;16\&quot;,                         \&quot;method\&quot;:\&quot;GET\&quot;,                         \&quot;rel\&quot;:\&quot;DETAILS\&quot;                     },                     {                         \&quot;href\&quot;:\&quot;https://{host}/{path}?aid&#x3D;16&amp;countryId&#x3D;NLD\&quot;,                         \&quot;method\&quot;:\&quot;GET\&quot;,                         \&quot;rel\&quot;:\&quot;WIDGET\&quot;                     },                     {                         \&quot;href\&quot;:\&quot;https://{host}/{path}/details?aid&#x3D;16&amp;countryId&#x3D;NLD\&quot;,                         \&quot;method\&quot;:\&quot;GET\&quot;,                         \&quot;rel\&quot;:\&quot;WIDGET_DETAILS\&quot;                     }                 ],                 \&quot;bookable\&quot;: true,                 \&quot;openingTimes\&quot;: {                   \&quot;standardOpeningTimes\&quot;: {                     \&quot;SATURDAY\&quot;: [                       {                         \&quot;start\&quot;: \&quot;09:00:00\&quot;,                         \&quot;end\&quot;: \&quot;20:00:00\&quot;                       }                     ],                     \&quot;SUNDAY\&quot;: [                       {                         \&quot;start\&quot;: \&quot;09:00:00\&quot;,                         \&quot;end\&quot;: \&quot;18:00:00\&quot;                       }                     ]                   }                 },                 \&quot;ccvEnabled\&quot;: true,                 \&quot;chain\&quot;: {                    \&quot;id\&quot;: 1,                    \&quot;name\&quot;: \&quot;Test chain\&quot;                 }             }         ],         \&quot;size\&quot;: 1,         \&quot;offset\&quot;: 0,         \&quot;limit\&quot;: 10     } } &#x60;&#x60;&#x60;  &#x60;merchant not bookable&#x60; &#x60;&#x60;&#x60; {     \&quot;merchantSearchMessage\&quot;: \&quot;MERCHANT_NOT_BOOKABLE\&quot;,     \&quot;recommendedMerchants\&quot;: {         \&quot;limit\&quot;: 10,         \&quot;merchants\&quot;: [...],         \&quot;offset\&quot;: 0,         \&quot;size\&quot;: 0     } } &#x60;&#x60;&#x60;
  # @param merchant_id merchantId
  # @param [Hash] opts the optional parameters
  # @option opts [String] :sort Sort order. Default sorting will be by proximity.
  # @option opts [Integer] :limit Max number of merchant recommendations to return.
  # @option opts [String] :accept_language Locale.&lt;br&gt;Format:&lt;br&gt;&amp;lt;language code&amp;gt;[_&amp;lt;country code&amp;gt;]
  # @return [MerchantWithRecommendationsDto]
  describe 'search_similar1 test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
