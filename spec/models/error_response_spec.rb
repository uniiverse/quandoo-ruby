=begin
#Quandoo API Documentation

#No description provided (generated by Swagger Codegen https://github.com/swagger-api/swagger-codegen)

OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.5

=end

require 'spec_helper'
require 'json'
require 'date'

# Unit tests for Quandoo::ErrorResponse
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'ErrorResponse' do
  before do
    # run before each test
    @instance = Quandoo::ErrorResponse.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of ErrorResponse' do
    it 'should create an instance of ErrorResponse' do
      expect(@instance).to be_instance_of(Quandoo::ErrorResponse)
    end
  end
  describe 'test attribute "error_type"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
      # validator = Petstore::EnumTest::EnumAttributeValidator.new('String', ["BAD_REQUEST_ERROR", "FORBIDDEN_ERROR", "NOT_FOUND_ERROR", "METHOD_NOT_ALLOWED_ERROR", "NOT_ACCEPTABLE_ERROR", "UNSUPPORTED_MEDIA_TYPE_ERROR", "DISCOUNT_NOT_FOUND_ERROR", "START_TIME_NOT_FOUND_ERROR", "MERCHANT_ID_INVALID", "RESERVATION_CAPACITY_MISSING", "RESERVATION_CAPACITY_INVALID", "RESERVATION_DATE_TIME_MISSING", "RESERVATION_DATE_TIME_INVALID_FORMAT", "RESERVATION_DISCOUNT_INVALID", "RESERVATION_EXTRA_INFO_INVALID", "RESERVATION_DISCOUNT_NOT_AVAILABLE", "RESERVATION_SHOW_POSTCODE", "RESERVATION_DATE_TIME_INVALID_IN_THE_PAST", "RESERVATION_NO_TABLES_AVAILABLE", "RESERVATION_NOT_FOUND", "RESERVATION_IN_NON_EDITABLE_STATUS", "RESERVATION_WITH_SMART_OFFER_EDIT", "RESERVATION_WITH_CCV_EDIT", "RESERVATION_IOVOX_OFFER_EDIT", "RESERVATION_WITH_PREPAID_MENU_EDIT", "RESERVATION_FOR_MERCHANT_WITH_FEEDBACK_TIME", "RESERVATION_PROMO_CODE_PARAM_INVALID", "RESERVATION_PROMO_CODE_NOT_FOUND", "RESERVATION_PROMO_CODE_INVALID_DESTINATION", "RESERVATION_PROMO_CODE_ALREADY_USED", "RESERVATION_PROMO_CODE_INVALID_CAMPAIGN", "RESERVATION_PROMO_CODE_DATE_TIME_IN_PAST_OR_FUTURE", "RESERVATION_PROMO_CODE_INVALID_AGENT", "RESERVATION_PROMO_CODE_INVALID_MERCHANT", "RESERVATION_PROMO_CODE_INVALID_PARTNER_VOUCHER", "RESERVATION_PROMO_CODE_ALREADY_OWNED_BY_CUSTOMER", "RESERVATION_INVITATION_PROMO_CODE_NOT_FIRST_RESERVATION", "DEAL_NOT_FOUND_FOR_MERCHANT_OR_DISABLED", "DEAL_INVALID_POOL_SIZE", "DEAL_INVALID_SCHEDULE", "DEAL_INVALID_CHUNK", "DEAL_UNABLE_TO_REDUCE_POOL", "DEAL_TYPE_MISMATCH", "DEAL_INSUFFICIENT_POOL_SIZE", "DEAL_COUNT_EXCEED_RESERVATION_CAPACITY", "DEAL_INVALID_ORDER", "DEAL_INVALID_RESERVATION_CAPACITY", "CCV_SETTINGS_REQUIRED", "CCV_CARD_REQUIRED", "CCV_SETTINGS_INVALID", "CCV_SETTINGS_OFFLINE", "CCV_CARD_INVALID", "ENQUIRY_INVALID_MIN_COVERS", "CUSTOMER_FIRST_NAME_INVALID", "CUSTOMER_LAST_NAME_MISSING", "CUSTOMER_LAST_NAME_INVALID", "CUSTOMER_EMAIL_MISSING", "CUSTOMER_EMAIL_INVALID", "CUSTOMER_NEWSLETTER_REQUESTED_MISSING", "CUSTOMER_PHONE_NUMBER_MISSING", "CUSTOMER_COUNTRY_INVALID", "CUSTOMER_ID_EXISTS", "CUSTOMER_PHONE_NUMBER_INVALID", "UNEXPECTED_SERVER_ERROR", "PHONE_NUMBER_MISSING", "PHONE_NUMBER_INVALID", "UUID_CONFLICT", "RESERVATION_STATUS_CONFLICT", "INVALID_RESERVATION_GUESTS_QUANTITY", "MENU_MAPPING_FAILED"])
      # validator.allowable_values.each do |value|
      #   expect { @instance.error_type = value }.not_to raise_error
      # end
    end
  end

  describe 'test attribute "error_message"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end