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

# Unit tests for Quandoo::ReservationEnquiryMessageData
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'ReservationEnquiryMessageData' do
  before do
    # run before each test
    @instance = Quandoo::ReservationEnquiryMessageData.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of ReservationEnquiryMessageData' do
    it 'should create an instance of ReservationEnquiryMessageData' do
      expect(@instance).to be_instance_of(Quandoo::ReservationEnquiryMessageData)
    end
  end
  describe 'test attribute "sender_type"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
      # validator = Petstore::EnumTest::EnumAttributeValidator.new('String', ["MERCHANT", "CUSTOMER"])
      # validator.allowable_values.each do |value|
      #   expect { @instance.sender_type = value }.not_to raise_error
      # end
    end
  end

  describe 'test attribute "message"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "creation_date"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end