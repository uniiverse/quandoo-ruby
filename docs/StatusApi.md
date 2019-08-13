# Quandoo::StatusApi

All URIs are relative to *https://api.quandoo.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_status_by_get1**](StatusApi.md#get_status_by_get1) | **GET** /v1/status | Provides information on the status of the service
[**get_status_by_head1**](StatusApi.md#get_status_by_head1) | **HEAD** /v1/status | Provides information on the status of the service


# **get_status_by_get1**
> get_status_by_get1

Provides information on the status of the service



### Example
```ruby
# load the gem
require 'quandoo'

api_instance = Quandoo::StatusApi.new

begin
  #Provides information on the status of the service
  api_instance.get_status_by_get1
rescue Quandoo::ApiError => e
  puts "Exception when calling StatusApi->get_status_by_get1: #{e}"
end
```

### Parameters
This endpoint does not need any parameter.

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_status_by_head1**
> get_status_by_head1

Provides information on the status of the service



### Example
```ruby
# load the gem
require 'quandoo'

api_instance = Quandoo::StatusApi.new

begin
  #Provides information on the status of the service
  api_instance.get_status_by_head1
rescue Quandoo::ApiError => e
  puts "Exception when calling StatusApi->get_status_by_head1: #{e}"
end
```

### Parameters
This endpoint does not need any parameter.

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



