# quandoo

Quandoo - the Ruby gem for the Quandoo API Documentation

No description provided (generated by Swagger Codegen https://github.com/swagger-api/swagger-codegen)

This SDK is automatically generated by the [Swagger Codegen](https://github.com/swagger-api/swagger-codegen) project:

- API version: 1.0.0
- Package version: 1.0.0
- Build package: io.swagger.codegen.languages.RubyClientCodegen

## Installation

### Build a gem

To build the Ruby code into a gem:

```shell
gem build quandoo.gemspec
```

Then either install the gem locally:

```shell
gem install ./quandoo-1.0.0.gem
```
(for development, run `gem install --dev ./quandoo-1.0.0.gem` to install the development dependencies)

or publish the gem to a gem hosting service, e.g. [RubyGems](https://rubygems.org/).

Finally add this to the Gemfile:

    gem 'quandoo', '~> 1.0.0'

### Install from Git

If the Ruby gem is hosted at a git repository: https://github.com/GIT_USER_ID/GIT_REPO_ID, then add the following in the Gemfile:

    gem 'quandoo', :git => 'https://github.com/GIT_USER_ID/GIT_REPO_ID.git'

### Include the Ruby code directly

Include the Ruby code directly using `-I` as follows:

```shell
ruby -Ilib script.rb
```

## Getting Started

Please follow the [installation](#installation) procedure and then run the following code:
```ruby
# Load the gem
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

## Documentation for API Endpoints

All URIs are relative to *https://api.quandoo.com*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*Quandoo::AvailabilitiesApi* | [**availability_days1**](docs/AvailabilitiesApi.md#availability_days1) | **GET** /v1/merchants/{merchantId}/availabilities | Get merchant availability days
*Quandoo::AvailabilitiesApi* | [**availability_options1**](docs/AvailabilitiesApi.md#availability_options1) | **GET** /v1/merchants/{merchantId}/availabilities/{date}/times | Get merchant availability time slots
*Quandoo::CustomersApi* | [**get_customer1**](docs/CustomersApi.md#get_customer1) | **GET** /v1/customers/{customerId} | Get customer Data
*Quandoo::CustomersApi* | [**get_customers_of_merchant1**](docs/CustomersApi.md#get_customers_of_merchant1) | **GET** /v1/merchants/{merchantId}/customers | Get a list of Customers of a merchant
*Quandoo::CustomersApi* | [**get_reservations1**](docs/CustomersApi.md#get_reservations1) | **GET** /v1/customers/{customerId}/reservations | Get customer reservations
*Quandoo::MenusApi* | [**add_preordered_items1**](docs/MenusApi.md#add_preordered_items1) | **PATCH** /v1/reservations/{reservationId}/preorders | Add/remove menu items to/from a reservation's preorders
*Quandoo::MenusApi* | [**find_menus_for_reservation1**](docs/MenusApi.md#find_menus_for_reservation1) | **GET** /v1/reservations/{reservationId}/menus | Get all available menus for a reservation
*Quandoo::MenusApi* | [**get_menu_for_reservation1**](docs/MenusApi.md#get_menu_for_reservation1) | **GET** /v1/reservations/{reservationId}/menus/{menuId} | Get information about an available reservation menu
*Quandoo::MenusApi* | [**get_preordered_items1**](docs/MenusApi.md#get_preordered_items1) | **GET** /v1/reservations/{reservationId}/preorders | Get preorders of a reservation
*Quandoo::MenusApi* | [**save_preordered_items1**](docs/MenusApi.md#save_preordered_items1) | **PUT** /v1/reservations/{reservationId}/preorders | Preorder menu items for a reservation
*Quandoo::MerchantsApi* | [**get_reservations2**](docs/MerchantsApi.md#get_reservations2) | **GET** /v1/merchants/{merchantId}/reservations | Get merchant reservations
*Quandoo::MerchantsApi* | [**get_reviews1**](docs/MerchantsApi.md#get_reviews1) | **GET** /v1/merchants/{merchantId}/reviews | Retrieves customer reviews for a merchant, specified by reviewId
*Quandoo::MerchantsApi* | [**search**](docs/MerchantsApi.md#search) | **GET** /v1/merchants | Allows to get merchant information by parameters
*Quandoo::MerchantsApi* | [**search2**](docs/MerchantsApi.md#search2) | **GET** /v1/merchants/{merchantId} | Allows to get a merchant by id
*Quandoo::MerchantsApi* | [**search_similar1**](docs/MerchantsApi.md#search_similar1) | **GET** /v1/merchants/{merchantId}/similar | Allows to get a merchant by id and find similar merchants
*Quandoo::ReservationEnquiriesApi* | [**create_reservation_enquiry1**](docs/ReservationEnquiriesApi.md#create_reservation_enquiry1) | **PUT** /v1/reservation-enquiries | Create reservation enquiries
*Quandoo::ReservationEnquiriesApi* | [**get_messages_for_reservation_enquiry1**](docs/ReservationEnquiriesApi.md#get_messages_for_reservation_enquiry1) | **GET** /v1/reservation-enquiries/{reservationEnquiryId}/messages | Get all messages of a reservation enquiry
*Quandoo::ReservationEnquiriesApi* | [**get_reservation_enquiry1**](docs/ReservationEnquiriesApi.md#get_reservation_enquiry1) | **GET** /v1/reservation-enquiries/{reservationEnquiryId} | Get reservation enquiry by id
*Quandoo::ReservationEnquiriesApi* | [**update_reservation_enquiry1**](docs/ReservationEnquiriesApi.md#update_reservation_enquiry1) | **PATCH** /v1/reservation-enquiries/{reservationEnquiryId} | Update status of reservation enquiry by id
*Quandoo::ReservationSettingsApi* | [**reservation_settings1**](docs/ReservationSettingsApi.md#reservation_settings1) | **GET** /v1/merchants/{merchantId}/reservation-settings | Get merchant reservation settings
*Quandoo::ReservationsApi* | [**create_reservation1**](docs/ReservationsApi.md#create_reservation1) | **PUT** /v1/reservations | Create reservations
*Quandoo::ReservationsApi* | [**get_reservation1**](docs/ReservationsApi.md#get_reservation1) | **GET** /v1/reservations/{reservationId} | Get reservation by id
*Quandoo::ReservationsApi* | [**update_reservation1**](docs/ReservationsApi.md#update_reservation1) | **PATCH** /v1/reservations/{reservationId} | Update reservation by id
*Quandoo::ReviewsApi* | [**create_review1**](docs/ReviewsApi.md#create_review1) | **PUT** /v1/reviews | Create a review for a reservation
*Quandoo::ReviewsApi* | [**get_review1**](docs/ReviewsApi.md#get_review1) | **GET** /v1/reviews/{reviewId} | Get details for a specific review
*Quandoo::ReviewsApi* | [**get_reviews2**](docs/ReviewsApi.md#get_reviews2) | **GET** /v1/reviews | Get information from reviews in a list
*Quandoo::ReviewsApi* | [**update_review1**](docs/ReviewsApi.md#update_review1) | **PATCH** /v1/reviews | Updated a review
*Quandoo::StatusApi* | [**get_status_by_get1**](docs/StatusApi.md#get_status_by_get1) | **GET** /v1/status | Provides information on the status of the service
*Quandoo::StatusApi* | [**get_status_by_head1**](docs/StatusApi.md#get_status_by_head1) | **HEAD** /v1/status | Provides information on the status of the service
*Quandoo::ValidationsApi* | [**validate_phone_number1**](docs/ValidationsApi.md#validate_phone_number1) | **GET** /v1/validations/phone-numbers | Validate phone number


## Documentation for Models

 - [Quandoo::AgentTracking](docs/AgentTracking.md)
 - [Quandoo::AreaDto](docs/AreaDto.md)
 - [Quandoo::ChainDto](docs/ChainDto.md)
 - [Quandoo::ChangedReviewDto](docs/ChangedReviewDto.md)
 - [Quandoo::CoordinatesDto](docs/CoordinatesDto.md)
 - [Quandoo::CreateReviewDto](docs/CreateReviewDto.md)
 - [Quandoo::CreatedMasterCustomer](docs/CreatedMasterCustomer.md)
 - [Quandoo::CreatedReservation](docs/CreatedReservation.md)
 - [Quandoo::CreatedReservationData](docs/CreatedReservationData.md)
 - [Quandoo::CreatedReservationEnquiry](docs/CreatedReservationEnquiry.md)
 - [Quandoo::CreatedReservationEnquiryData](docs/CreatedReservationEnquiryData.md)
 - [Quandoo::CustomerDataList](docs/CustomerDataList.md)
 - [Quandoo::CustomerDto](docs/CustomerDto.md)
 - [Quandoo::CustomerResponse](docs/CustomerResponse.md)
 - [Quandoo::CustomerReviewData](docs/CustomerReviewData.md)
 - [Quandoo::CustomerStatisticsData](docs/CustomerStatisticsData.md)
 - [Quandoo::DealData](docs/DealData.md)
 - [Quandoo::DocumentDto](docs/DocumentDto.md)
 - [Quandoo::ErrorResponse](docs/ErrorResponse.md)
 - [Quandoo::GetReservationEnquiryData](docs/GetReservationEnquiryData.md)
 - [Quandoo::GetReviewDto](docs/GetReviewDto.md)
 - [Quandoo::GetReviewsDto](docs/GetReviewsDto.md)
 - [Quandoo::ImageDto](docs/ImageDto.md)
 - [Quandoo::LinkRelationDto](docs/LinkRelationDto.md)
 - [Quandoo::LocationDto](docs/LocationDto.md)
 - [Quandoo::MarketingSettingDto](docs/MarketingSettingDto.md)
 - [Quandoo::MerchantAddressDto](docs/MerchantAddressDto.md)
 - [Quandoo::MerchantAvailabilityDaysDto](docs/MerchantAvailabilityDaysDto.md)
 - [Quandoo::MerchantAvailabilityDto](docs/MerchantAvailabilityDto.md)
 - [Quandoo::MerchantAvailabilityDtoList](docs/MerchantAvailabilityDtoList.md)
 - [Quandoo::MerchantCustomer](docs/MerchantCustomer.md)
 - [Quandoo::MerchantCustomerData](docs/MerchantCustomerData.md)
 - [Quandoo::MerchantDetailsDto](docs/MerchantDetailsDto.md)
 - [Quandoo::MerchantDetailsDtoList](docs/MerchantDetailsDtoList.md)
 - [Quandoo::MerchantMenuCategoryDto](docs/MerchantMenuCategoryDto.md)
 - [Quandoo::MerchantMenuDto](docs/MerchantMenuDto.md)
 - [Quandoo::MerchantMenuItemDto](docs/MerchantMenuItemDto.md)
 - [Quandoo::MerchantMenusDto](docs/MerchantMenusDto.md)
 - [Quandoo::MerchantReservation](docs/MerchantReservation.md)
 - [Quandoo::MerchantReservationData](docs/MerchantReservationData.md)
 - [Quandoo::MerchantReservationEnquiry](docs/MerchantReservationEnquiry.md)
 - [Quandoo::MerchantReservationEnquiryData](docs/MerchantReservationEnquiryData.md)
 - [Quandoo::MerchantReservationSettingsDto](docs/MerchantReservationSettingsDto.md)
 - [Quandoo::MerchantSubscription](docs/MerchantSubscription.md)
 - [Quandoo::MerchantVaultSettingsDto](docs/MerchantVaultSettingsDto.md)
 - [Quandoo::MerchantWithRecommendationsDto](docs/MerchantWithRecommendationsDto.md)
 - [Quandoo::OpeningTimesDto](docs/OpeningTimesDto.md)
 - [Quandoo::ReservationData](docs/ReservationData.md)
 - [Quandoo::ReservationDataList](docs/ReservationDataList.md)
 - [Quandoo::ReservationDetails](docs/ReservationDetails.md)
 - [Quandoo::ReservationEnquiryMessageData](docs/ReservationEnquiryMessageData.md)
 - [Quandoo::ReservationEnquiryMessageList](docs/ReservationEnquiryMessageList.md)
 - [Quandoo::ReservationMenuData](docs/ReservationMenuData.md)
 - [Quandoo::ReservationMenuItemData](docs/ReservationMenuItemData.md)
 - [Quandoo::RestCookie](docs/RestCookie.md)
 - [Quandoo::ReviewDto](docs/ReviewDto.md)
 - [Quandoo::ReviewDtoList](docs/ReviewDtoList.md)
 - [Quandoo::StandardOpeningTimesDto](docs/StandardOpeningTimesDto.md)
 - [Quandoo::TagGroupDto](docs/TagGroupDto.md)
 - [Quandoo::Tracking](docs/Tracking.md)
 - [Quandoo::TranslatedTagDto](docs/TranslatedTagDto.md)
 - [Quandoo::UpdateReservationData](docs/UpdateReservationData.md)
 - [Quandoo::UpdateReservationEnquiryData](docs/UpdateReservationEnquiryData.md)
 - [Quandoo::UpdateReviewDto](docs/UpdateReviewDto.md)


## Documentation for Authorization


### API_TOKEN

- **Type**: API key
- **API key parameter name**: X-Quandoo-AuthToken
- **Location**: HTTP header

### CUSTOMER_SESSION

- **Type**: API key
- **API key parameter name**: X-Quandoo-User-Session
- **Location**: HTTP header

