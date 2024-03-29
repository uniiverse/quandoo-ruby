=begin
#Quandoo API Documentation

#No description provided (generated by Swagger Codegen https://github.com/swagger-api/swagger-codegen)

OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.5

=end

require 'date'

module Quandoo
  class ErrorResponse
    attr_accessor :error_type

    attr_accessor :error_message

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'error_type' => :'errorType',
        :'error_message' => :'errorMessage'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'error_type' => :'String',
        :'error_message' => :'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'errorType')
        self.error_type = attributes[:'errorType']
      end

      if attributes.has_key?(:'errorMessage')
        self.error_message = attributes[:'errorMessage']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      error_type_validator = EnumAttributeValidator.new('String', ['BAD_REQUEST_ERROR', 'FORBIDDEN_ERROR', 'NOT_FOUND_ERROR', 'METHOD_NOT_ALLOWED_ERROR', 'NOT_ACCEPTABLE_ERROR', 'UNSUPPORTED_MEDIA_TYPE_ERROR', 'DISCOUNT_NOT_FOUND_ERROR', 'START_TIME_NOT_FOUND_ERROR', 'MERCHANT_ID_INVALID', 'RESERVATION_CAPACITY_MISSING', 'RESERVATION_CAPACITY_INVALID', 'RESERVATION_DATE_TIME_MISSING', 'RESERVATION_DATE_TIME_INVALID_FORMAT', 'RESERVATION_DISCOUNT_INVALID', 'RESERVATION_EXTRA_INFO_INVALID', 'RESERVATION_DISCOUNT_NOT_AVAILABLE', 'RESERVATION_SHOW_POSTCODE', 'RESERVATION_DATE_TIME_INVALID_IN_THE_PAST', 'RESERVATION_NO_TABLES_AVAILABLE', 'RESERVATION_NOT_FOUND', 'RESERVATION_IN_NON_EDITABLE_STATUS', 'RESERVATION_WITH_SMART_OFFER_EDIT', 'RESERVATION_WITH_CCV_EDIT', 'RESERVATION_IOVOX_OFFER_EDIT', 'RESERVATION_WITH_PREPAID_MENU_EDIT', 'RESERVATION_FOR_MERCHANT_WITH_FEEDBACK_TIME', 'RESERVATION_PROMO_CODE_PARAM_INVALID', 'RESERVATION_PROMO_CODE_NOT_FOUND', 'RESERVATION_PROMO_CODE_INVALID_DESTINATION', 'RESERVATION_PROMO_CODE_ALREADY_USED', 'RESERVATION_PROMO_CODE_INVALID_CAMPAIGN', 'RESERVATION_PROMO_CODE_DATE_TIME_IN_PAST_OR_FUTURE', 'RESERVATION_PROMO_CODE_INVALID_AGENT', 'RESERVATION_PROMO_CODE_INVALID_MERCHANT', 'RESERVATION_PROMO_CODE_INVALID_PARTNER_VOUCHER', 'RESERVATION_PROMO_CODE_ALREADY_OWNED_BY_CUSTOMER', 'RESERVATION_INVITATION_PROMO_CODE_NOT_FIRST_RESERVATION', 'DEAL_NOT_FOUND_FOR_MERCHANT_OR_DISABLED', 'DEAL_INVALID_POOL_SIZE', 'DEAL_INVALID_SCHEDULE', 'DEAL_INVALID_CHUNK', 'DEAL_UNABLE_TO_REDUCE_POOL', 'DEAL_TYPE_MISMATCH', 'DEAL_INSUFFICIENT_POOL_SIZE', 'DEAL_COUNT_EXCEED_RESERVATION_CAPACITY', 'DEAL_INVALID_ORDER', 'DEAL_INVALID_RESERVATION_CAPACITY', 'CCV_SETTINGS_REQUIRED', 'CCV_CARD_REQUIRED', 'CCV_SETTINGS_INVALID', 'CCV_SETTINGS_OFFLINE', 'CCV_CARD_INVALID', 'ENQUIRY_INVALID_MIN_COVERS', 'CUSTOMER_FIRST_NAME_INVALID', 'CUSTOMER_LAST_NAME_MISSING', 'CUSTOMER_LAST_NAME_INVALID', 'CUSTOMER_EMAIL_MISSING', 'CUSTOMER_EMAIL_INVALID', 'CUSTOMER_NEWSLETTER_REQUESTED_MISSING', 'CUSTOMER_PHONE_NUMBER_MISSING', 'CUSTOMER_COUNTRY_INVALID', 'CUSTOMER_ID_EXISTS', 'CUSTOMER_PHONE_NUMBER_INVALID', 'UNEXPECTED_SERVER_ERROR', 'PHONE_NUMBER_MISSING', 'PHONE_NUMBER_INVALID', 'UUID_CONFLICT', 'RESERVATION_STATUS_CONFLICT', 'INVALID_RESERVATION_GUESTS_QUANTITY', 'MENU_MAPPING_FAILED'])
      return false unless error_type_validator.valid?(@error_type)
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] error_type Object to be assigned
    def error_type=(error_type)
      validator = EnumAttributeValidator.new('String', ['BAD_REQUEST_ERROR', 'FORBIDDEN_ERROR', 'NOT_FOUND_ERROR', 'METHOD_NOT_ALLOWED_ERROR', 'NOT_ACCEPTABLE_ERROR', 'UNSUPPORTED_MEDIA_TYPE_ERROR', 'DISCOUNT_NOT_FOUND_ERROR', 'START_TIME_NOT_FOUND_ERROR', 'MERCHANT_ID_INVALID', 'RESERVATION_CAPACITY_MISSING', 'RESERVATION_CAPACITY_INVALID', 'RESERVATION_DATE_TIME_MISSING', 'RESERVATION_DATE_TIME_INVALID_FORMAT', 'RESERVATION_DISCOUNT_INVALID', 'RESERVATION_EXTRA_INFO_INVALID', 'RESERVATION_DISCOUNT_NOT_AVAILABLE', 'RESERVATION_SHOW_POSTCODE', 'RESERVATION_DATE_TIME_INVALID_IN_THE_PAST', 'RESERVATION_NO_TABLES_AVAILABLE', 'RESERVATION_NOT_FOUND', 'RESERVATION_IN_NON_EDITABLE_STATUS', 'RESERVATION_WITH_SMART_OFFER_EDIT', 'RESERVATION_WITH_CCV_EDIT', 'RESERVATION_IOVOX_OFFER_EDIT', 'RESERVATION_WITH_PREPAID_MENU_EDIT', 'RESERVATION_FOR_MERCHANT_WITH_FEEDBACK_TIME', 'RESERVATION_PROMO_CODE_PARAM_INVALID', 'RESERVATION_PROMO_CODE_NOT_FOUND', 'RESERVATION_PROMO_CODE_INVALID_DESTINATION', 'RESERVATION_PROMO_CODE_ALREADY_USED', 'RESERVATION_PROMO_CODE_INVALID_CAMPAIGN', 'RESERVATION_PROMO_CODE_DATE_TIME_IN_PAST_OR_FUTURE', 'RESERVATION_PROMO_CODE_INVALID_AGENT', 'RESERVATION_PROMO_CODE_INVALID_MERCHANT', 'RESERVATION_PROMO_CODE_INVALID_PARTNER_VOUCHER', 'RESERVATION_PROMO_CODE_ALREADY_OWNED_BY_CUSTOMER', 'RESERVATION_INVITATION_PROMO_CODE_NOT_FIRST_RESERVATION', 'DEAL_NOT_FOUND_FOR_MERCHANT_OR_DISABLED', 'DEAL_INVALID_POOL_SIZE', 'DEAL_INVALID_SCHEDULE', 'DEAL_INVALID_CHUNK', 'DEAL_UNABLE_TO_REDUCE_POOL', 'DEAL_TYPE_MISMATCH', 'DEAL_INSUFFICIENT_POOL_SIZE', 'DEAL_COUNT_EXCEED_RESERVATION_CAPACITY', 'DEAL_INVALID_ORDER', 'DEAL_INVALID_RESERVATION_CAPACITY', 'CCV_SETTINGS_REQUIRED', 'CCV_CARD_REQUIRED', 'CCV_SETTINGS_INVALID', 'CCV_SETTINGS_OFFLINE', 'CCV_CARD_INVALID', 'ENQUIRY_INVALID_MIN_COVERS', 'CUSTOMER_FIRST_NAME_INVALID', 'CUSTOMER_LAST_NAME_MISSING', 'CUSTOMER_LAST_NAME_INVALID', 'CUSTOMER_EMAIL_MISSING', 'CUSTOMER_EMAIL_INVALID', 'CUSTOMER_NEWSLETTER_REQUESTED_MISSING', 'CUSTOMER_PHONE_NUMBER_MISSING', 'CUSTOMER_COUNTRY_INVALID', 'CUSTOMER_ID_EXISTS', 'CUSTOMER_PHONE_NUMBER_INVALID', 'UNEXPECTED_SERVER_ERROR', 'PHONE_NUMBER_MISSING', 'PHONE_NUMBER_INVALID', 'UUID_CONFLICT', 'RESERVATION_STATUS_CONFLICT', 'INVALID_RESERVATION_GUESTS_QUANTITY', 'MENU_MAPPING_FAILED'])
      unless validator.valid?(error_type)
        fail ArgumentError, 'invalid value for "error_type", must be one of #{validator.allowable_values}.'
      end
      @error_type = error_type
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          error_type == o.error_type &&
          error_message == o.error_message
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [error_type, error_message].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        temp_model = Quandoo.const_get(type).new
        temp_model.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end
  end
end
