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

# Unit tests for Quandoo::MerchantWithRecommendationsDto
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'MerchantWithRecommendationsDto' do
  before do
    # run before each test
    @instance = Quandoo::MerchantWithRecommendationsDto.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of MerchantWithRecommendationsDto' do
    it 'should create an instance of MerchantWithRecommendationsDto' do
      expect(@instance).to be_instance_of(Quandoo::MerchantWithRecommendationsDto)
    end
  end
  describe 'test attribute "merchant"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "merchant_search_message"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
      # validator = Petstore::EnumTest::EnumAttributeValidator.new('String', ["MERCHANT_NOT_BOOKABLE"])
      # validator.allowable_values.each do |value|
      #   expect { @instance.merchant_search_message = value }.not_to raise_error
      # end
    end
  end

  describe 'test attribute "recommended_merchants"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
