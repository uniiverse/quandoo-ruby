=begin
#Quandoo API Documentation

#No description provided (generated by Swagger Codegen https://github.com/swagger-api/swagger-codegen)

OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.5

=end

require 'uri'

module Quandoo
  class ValidationsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Validate phone number
    # This endpoint validates a phone number.  If optional 2-letter country code `country` is not specified, the `phoneNumber` should be formatted according to E164, which means it is expected to be in the international format with a leading `\"+\"` and no spaces or dashes, e.g. `+4930120765890`. Otherwise it may have leading zero instead of country code, e.g. `030120765890`.  The endpoint will return a status `HTTP 200` which means the `phoneNumber` is successfully validated. The endpoint will return a status `HTTP 400` which means the `phoneNumber` is missing or invalid.  Example curl: ``` curl https://{host}/v{X}/validations/phone-numbers?phoneNumber=030120765890&country=IT ```  Example response: ``` {   \"errorMessage\": \"phoneNumber is invalid: 030120765890, country specified is: IT\",   \"errorType\": \"PHONE_NUMBER_INVALID\" } ``` 
    # @param phone_number Phone number
    # @param [Hash] opts the optional parameters
    # @option opts [String] :country Country code
    # @return [nil]
    def validate_phone_number1(phone_number, opts = {})
      validate_phone_number1_with_http_info(phone_number, opts)
      nil
    end

    # Validate phone number
    # This endpoint validates a phone number.  If optional 2-letter country code &#x60;country&#x60; is not specified, the &#x60;phoneNumber&#x60; should be formatted according to E164, which means it is expected to be in the international format with a leading &#x60;\&quot;+\&quot;&#x60; and no spaces or dashes, e.g. &#x60;+4930120765890&#x60;. Otherwise it may have leading zero instead of country code, e.g. &#x60;030120765890&#x60;.  The endpoint will return a status &#x60;HTTP 200&#x60; which means the &#x60;phoneNumber&#x60; is successfully validated. The endpoint will return a status &#x60;HTTP 400&#x60; which means the &#x60;phoneNumber&#x60; is missing or invalid.  Example curl: &#x60;&#x60;&#x60; curl https://{host}/v{X}/validations/phone-numbers?phoneNumber&#x3D;030120765890&amp;country&#x3D;IT &#x60;&#x60;&#x60;  Example response: &#x60;&#x60;&#x60; {   \&quot;errorMessage\&quot;: \&quot;phoneNumber is invalid: 030120765890, country specified is: IT\&quot;,   \&quot;errorType\&quot;: \&quot;PHONE_NUMBER_INVALID\&quot; } &#x60;&#x60;&#x60; 
    # @param phone_number Phone number
    # @param [Hash] opts the optional parameters
    # @option opts [String] :country Country code
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def validate_phone_number1_with_http_info(phone_number, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ValidationsApi.validate_phone_number1 ...'
      end
      # verify the required parameter 'phone_number' is set
      if @api_client.config.client_side_validation && phone_number.nil?
        fail ArgumentError, "Missing the required parameter 'phone_number' when calling ValidationsApi.validate_phone_number1"
      end
      # resource path
      local_var_path = '/v1/validations/phone-numbers'

      # query parameters
      query_params = {}
      query_params[:'phoneNumber'] = phone_number
      query_params[:'country'] = opts[:'country'] if !opts[:'country'].nil?

      # header parameters
      header_params = {}

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = []
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ValidationsApi#validate_phone_number1\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
