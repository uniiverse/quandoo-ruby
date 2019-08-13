# Quandoo::MenusApi

All URIs are relative to *https://api.quandoo.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**add_preordered_items1**](MenusApi.md#add_preordered_items1) | **PATCH** /v1/reservations/{reservationId}/preorders | Add/remove menu items to/from a reservation&#39;s preorders
[**find_menus_for_reservation1**](MenusApi.md#find_menus_for_reservation1) | **GET** /v1/reservations/{reservationId}/menus | Get all available menus for a reservation
[**get_menu_for_reservation1**](MenusApi.md#get_menu_for_reservation1) | **GET** /v1/reservations/{reservationId}/menus/{menuId} | Get information about an available reservation menu
[**get_preordered_items1**](MenusApi.md#get_preordered_items1) | **GET** /v1/reservations/{reservationId}/preorders | Get preorders of a reservation
[**save_preordered_items1**](MenusApi.md#save_preordered_items1) | **PUT** /v1/reservations/{reservationId}/preorders | Preorder menu items for a reservation


# **add_preordered_items1**
> ReservationMenuData add_preordered_items1(reservation_id, body)

Add/remove menu items to/from a reservation's preorders

This endpoint will add/remove menu items to/from preorders of a reservation.   If an item already exists, the quantitiy specified for the item will be added to the existing quantity.  For example, if an item has a quantity of 2, and a PATCH request specifies the same item with a quantity of 1, the result will be a quantity of 3 for that item.  This can be also used to remove items, by specifying a negative quantity. For example, if an item has a quantity of 2, and a PATCH request specifies the same item with a quantity of -1, the result will be a quantity of 1.  No item can have a negative quantity in the end, which means a PATCH request with a quantity of -5 for an item that currently has a quantity of 2, will result in that item to be simply deleted from the preorder, instead of having a final quantity of -3.  If an item does not exist in the current preorders, it will be added, provided it has a positive quantity.   The reservation ID in the request is the public ID of the reservation and **not** agent-specific.  This endpoint requires user to be logged in.  The endpoint will return `HTTP 404 - Not Found` if the reservation with the specified id could not be found. It will return `HTTP 403 - Forbidden` if the user is not authenticated or the reservation doesn't belong to the customer associated with the user.  ####Request: * **reservationId**: Public ID of the reservation. Path parameter.  Request body has the same structure as Get Preorder response, except not having the `href` field. * **items**: List of menu items to be edited. Each menu item will have the fields explained below.   * **menuId**: The Id of the menu that this item belongs to. **Required**.   * **itemId**: The Id of the menu item. **Required**.   * **quantity**: Change in quantity to be applied to the existing item's quantity. See above for explanation. **Required**.   * **guestPublicId**: The ID of the guest for whom this item is being preordered. Optional. Format: UUID.  ####Response: * **items**: The response will be a _list_ of successfully preordered menu items. Each menu item has the fields explained below:   * **menuId**: The Id of the menu that this item belongs to   * **itemId**: The Id of the menu item   * **quantity**: Quantity of this menu item selected for the reservation   * **guestPublicId**: The ID of the guest for whom this item has been preordered, if any.   * **href**: Link that can be followed to get information about the menu and its available items  Example curl: ``` curl -H \"Content Type: application/json\" -X PATCH -d ' {   \"items\": [     {       \"menuId\": 1846,       \"itemId\": 1477,       \"quantity\": 1,       \"guestPublicId\": \"a8a66a11-446a-443b-8834-591742825ad4\"     },     {       \"menuId\": 1846,       \"itemId\": 1478,       \"quantity\": -1     }   ] } ' https://{host}/v{X}/reservations/ce0706ff-a95d-4229-a220-d21dcd175342/preorders ```  Example response:  ``` {   \"items\": [     {       \"menuId\": 1846,       \"itemId\": 1477,       \"quantity\": 2,       \"guestPublicId\": \"a8a66a11-446a-443b-8834-591742825ad4\",       \"href\": \"https://{host}/v{X}/reservations/ce0706ff-a95d-4229-a220-d21dcd175342/menus/1846\"     },     {       \"menuId\": 1846,       \"itemId\": 1478,       \"quantity\": 1,       \"guestPublicId\": \"f871d6d7-e92e-4672-b24a-edb76963073b\",       \"href\": \"https://{host}/v{X}/reservations/ce0706ff-a95d-4229-a220-d21dcd175342/menus/1846\"     }   ] } ``` 

### Example
```ruby
# load the gem
require 'quandoo'
# setup authorization
Quandoo.configure do |config|
  # Configure API key authorization: CUSTOMER_SESSION
  config.api_key['X-Quandoo-User-Session'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Quandoo-User-Session'] = 'Bearer'
end

api_instance = Quandoo::MenusApi.new

reservation_id = 'reservation_id_example' # String | Public Id of the reservation

body = Quandoo::ReservationMenuData.new # ReservationMenuData | Menu items to add


begin
  #Add/remove menu items to/from a reservation's preorders
  result = api_instance.add_preordered_items1(reservation_id, body)
  p result
rescue Quandoo::ApiError => e
  puts "Exception when calling MenusApi->add_preordered_items1: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **reservation_id** | **String**| Public Id of the reservation | 
 **body** | [**ReservationMenuData**](ReservationMenuData.md)| Menu items to add | 

### Return type

[**ReservationMenuData**](ReservationMenuData.md)

### Authorization

[CUSTOMER_SESSION](../README.md#CUSTOMER_SESSION)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined



# **find_menus_for_reservation1**
> MerchantMenusDto find_menus_for_reservation1(reservation_id, opts)

Get all available menus for a reservation

This endpoint will return the available menus for a reservation.  The reservation ID in the request is the public ID of the reservation and **not** agent-specific.  This endpoint requires user to be logged in.  The endpoint will return `HTTP 404 - Not Found` if the reservation with the specified id could not be found. It will return `HTTP 403 - Forbidden` if the user is not authenticated or the reservation doesn't belong to the customer associated with the user.  ####Request: * **reservationId**: Public Id of the reservation * **locale**: Locale for translated info. Default: _en_  ####Response: The response will be a _list_ of available menus. Each menu has the fields explained below: * **id**: The unique id of the menu * **name**: The name or title of the menu * **description**: Menu description * **price**: Total price for the menu * **sortOrder**: The order in which this menu should be displayed * **categories**: Categories of the menu   * **id**: The Id of the menu category   * **name**: Name or title of the menu category   * **items**: Items inside the menu category     * **id**: Id of the menu item     * **name**: Name of menu item     * **description**: Menu item description     * **price**: Item price  Example curl: ``` curl https://{host}/v{X}/reservations/ce0706ff-a95d-4229-a220-d21dcd175342/menus?locale=en ```  Example response:  ``` {   \"menus\": [     {       \"id\": 1836,       \"name\": \"special menu 1\",       \"price\": \"100.00\",       \"sortOrder\": 0,       \"categories\": [         {           \"id\": 1109,           \"name\": \"starters\",           \"items\": [             {               \"id\": 1469,               \"name\": \"fries\",               \"price\": \"20.00\"             }           ]         },         {           \"id\": 1110,           \"name\": \"fish\",           \"items\": [             {               \"id\": 1470,               \"name\": \"salmon\",               \"price\": \"60.00\"             }           ]         },         {           \"id\": 1111,           \"name\": \"dessert\",           \"items\": [             {               \"id\": 1471,               \"name\": \"sundae\",               \"price\": \"20.00\"             }           ]         }       ]     }   ] } ``` 

### Example
```ruby
# load the gem
require 'quandoo'
# setup authorization
Quandoo.configure do |config|
  # Configure API key authorization: CUSTOMER_SESSION
  config.api_key['X-Quandoo-User-Session'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Quandoo-User-Session'] = 'Bearer'
end

api_instance = Quandoo::MenusApi.new

reservation_id = 'reservation_id_example' # String | Public Id of the reservation

opts = { 
  locale: 'en' # String | Locale for translated info
}

begin
  #Get all available menus for a reservation
  result = api_instance.find_menus_for_reservation1(reservation_id, opts)
  p result
rescue Quandoo::ApiError => e
  puts "Exception when calling MenusApi->find_menus_for_reservation1: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **reservation_id** | **String**| Public Id of the reservation | 
 **locale** | **String**| Locale for translated info | [optional] [default to en]

### Return type

[**MerchantMenusDto**](MerchantMenusDto.md)

### Authorization

[CUSTOMER_SESSION](../README.md#CUSTOMER_SESSION)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **get_menu_for_reservation1**
> MerchantMenuDto get_menu_for_reservation1(reservation_id, menu_id, opts)

Get information about an available reservation menu

This endpoint will return details for a single available menu.  The reservation ID in the request is the public ID of the reservation and **not** agent-specific.  This endpoint requires user to be logged in.  The endpoint will return `HTTP 404 - Not Found` if the reservation or menu with the specified id could not be found. It will return `HTTP 403 - Forbidden` if the user is not authenticated or the reservation doesn't belong to the customer associated with the user.  ####Request: * **reservationId**: Public id of the reservation * **menuId**: Id of the menu * **locale**: Locale for translated info. Default: _en_  ####Response: The response will be a menu with each field as explained below: * **id**: The unique id of the menu * **name**: The name or title of the menu * **description**: Menu description * **price**: Total price for the menu * **sortOrder**: The order in which this menu should be displayed * **categories**: Categories of the menu   * **id**: The id of the menu category   * **name**: Name or title of the menu category   * **items**: Items inside the menu category     * **id**: Id of the menu item     * **name**: Name of menu item     * **description**: Menu item description     * **price**: Item price  Example curl: ``` curl https://{host}/v{X}/reservations/ce0706ff-a95d-4229-a220-d21dcd175342/menus/1836?locale=en ```  Example response:  ``` {   \"id\": 1836,   \"name\": \"special menu 1\",   \"price\": \"100.00\",   \"sortOrder\": 0,   \"categories\": [     {       \"id\": 1109,       \"name\": \"starters\",       \"items\": [         {           \"id\": 1469,           \"name\": \"fries\",           \"price\": \"20.00\"         }       ]     },     {       \"id\": 1110,       \"name\": \"fish\",       \"items\": [         {           \"id\": 1470,           \"name\": \"salmon\",           \"price\": \"60.00\"         }       ]     },     {       \"id\": 1111,       \"name\": \"dessert\",       \"items\": [         {           \"id\": 1471,           \"name\": \"sundae\",           \"price\": \"20.00\"         }       ]     }   ] } ``` 

### Example
```ruby
# load the gem
require 'quandoo'
# setup authorization
Quandoo.configure do |config|
  # Configure API key authorization: CUSTOMER_SESSION
  config.api_key['X-Quandoo-User-Session'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Quandoo-User-Session'] = 'Bearer'
end

api_instance = Quandoo::MenusApi.new

reservation_id = 'reservation_id_example' # String | Public Id of the reservation

menu_id = 56 # Integer | Id of the menu

opts = { 
  locale: 'en' # String | Locale for translated info
}

begin
  #Get information about an available reservation menu
  result = api_instance.get_menu_for_reservation1(reservation_id, menu_id, opts)
  p result
rescue Quandoo::ApiError => e
  puts "Exception when calling MenusApi->get_menu_for_reservation1: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **reservation_id** | **String**| Public Id of the reservation | 
 **menu_id** | **Integer**| Id of the menu | 
 **locale** | **String**| Locale for translated info | [optional] [default to en]

### Return type

[**MerchantMenuDto**](MerchantMenuDto.md)

### Authorization

[CUSTOMER_SESSION](../README.md#CUSTOMER_SESSION)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **get_preordered_items1**
> ReservationMenuData get_preordered_items1(reservation_id)

Get preorders of a reservation

This endpoint will return the preordered menu items of a reservation.   The reservation ID in the request is the public ID of the reservation and **not** agent-specific.  This endpoint requires user to be logged in.  The endpoint will return `HTTP 404 - Not Found` if the reservation with the specified id could not be found. It will return `HTTP 403 - Forbidden` if the user is not authenticated or the reservation doesn't belong to the customer associated with the user.  ####Request: * **reservationId**: Public ID of the reservation  ####Response: The response will be a _list_ of menu items. Each menu item has the fields explained below: * **menuId**: The Id of the menu that this item belongs to * **itemId**: The Id of the menu item * **quantity**: Quantity of this menu item selected for the reservation * **guestPublicId**: The ID of the guest for whom this item has been preordered, if any. * **href**: Link that can be followed to get information about the menu and its available items  Example curl: ``` curl https://{host}/v{X}/reservations/ce0706ff-a95d-4229-a220-d21dcd175342/preorders ```  Example response:  ``` {   \"items\": [     {       \"menuId\": 1846,       \"itemId\": 1477,       \"quantity\": 1,       \"guestPublicId\": \"a8a66a11-446a-443b-8834-591742825ad4\",       \"href\": \"https://{host}/v{X}/reservations/ce0706ff-a95d-4229-a220-d21dcd175342/menus/1846\"     },     {       \"menuId\": 1846,       \"itemId\": 1478,       \"quantity\": 2,       \"guestPublicId\": \"a8a66a11-446a-443b-8834-591742825ad4\",       \"href\": \"https://{host}/v{X}/reservations/ce0706ff-a95d-4229-a220-d21dcd175342/menus/1846\"     }   ] } ``` 

### Example
```ruby
# load the gem
require 'quandoo'
# setup authorization
Quandoo.configure do |config|
  # Configure API key authorization: CUSTOMER_SESSION
  config.api_key['X-Quandoo-User-Session'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Quandoo-User-Session'] = 'Bearer'
end

api_instance = Quandoo::MenusApi.new

reservation_id = 'reservation_id_example' # String | Public Id of the reservation


begin
  #Get preorders of a reservation
  result = api_instance.get_preordered_items1(reservation_id)
  p result
rescue Quandoo::ApiError => e
  puts "Exception when calling MenusApi->get_preordered_items1: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **reservation_id** | **String**| Public Id of the reservation | 

### Return type

[**ReservationMenuData**](ReservationMenuData.md)

### Authorization

[CUSTOMER_SESSION](../README.md#CUSTOMER_SESSION)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **save_preordered_items1**
> ReservationMenuData save_preordered_items1(reservation_id, body)

Preorder menu items for a reservation

This endpoint will preorder menu items for a reservation.   The reservation ID in the request is the public ID of the reservation and **not** agent-specific.  This endpoint requires user to be logged in.  The endpoint will return `HTTP 404 - Not Found` if the reservation with the specified id could not be found. It will return `HTTP 403 - Forbidden` if the user is not authenticated or the reservation doesn't belong to the customer associated with the user.  ####Request: * **reservationId**: Public ID of the reservation. Path parameter.  Request body has the same structure as Get Preorder response, except not having the `href` field. * **items**: List of menu items to be preordered. Each menu item will have the fields explained below.   * **menuId**: The Id of the menu that this item belongs to. **Required**.   * **itemId**: The Id of the menu item. **Required**.   * **quantity**: Number of specified items to be preordered. **Required**.   * **guestPublicId**: The ID of the guest for whom this item is being preordered. Optional. Format: UUID.  ####Response: * **items**: The response will be a _list_ of successfully preordered menu items. Each menu item has the fields explained below:   * **menuId**: The Id of the menu that this item belongs to   * **itemId**: The Id of the menu item   * **quantity**: Quantity of this menu item selected for the reservation   * **guestPublicId**: The ID of the guest for whom this item has been preordered, if any.   * **href**: Link that can be followed to get information about the menu and its available items  Example curl: ``` curl -H \"Content Type: application/json\" -X PUT -d ' {   \"items\": [     {       \"menuId\": 1846,       \"itemId\": 1477,       \"quantity\": 1,       \"guestPublicId\": \"a8a66a11-446a-443b-8834-591742825ad4\"     },     {       \"menuId\": 1846,       \"itemId\": 1478,       \"quantity\": 2     }   ] } ' https://{host}/v{X}/reservations/ce0706ff-a95d-4229-a220-d21dcd175342/preorders ```  Example response:  ``` {   \"items\": [     {       \"menuId\": 1846,       \"itemId\": 1477,       \"quantity\": 1,       \"guestPublicId\": \"a8a66a11-446a-443b-8834-591742825ad4\",       \"href\": \"https://{host}/v{X}/reservations/ce0706ff-a95d-4229-a220-d21dcd175342/menus/1846\"     },     {       \"menuId\": 1846,       \"itemId\": 1478,       \"quantity\": 2,       \"href\": \"https://{host}/v{X}/reservations/ce0706ff-a95d-4229-a220-d21dcd175342/menus/1846\"     }   ] } ``` 

### Example
```ruby
# load the gem
require 'quandoo'
# setup authorization
Quandoo.configure do |config|
  # Configure API key authorization: CUSTOMER_SESSION
  config.api_key['X-Quandoo-User-Session'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Quandoo-User-Session'] = 'Bearer'
end

api_instance = Quandoo::MenusApi.new

reservation_id = 'reservation_id_example' # String | Public Id of the reservation

body = Quandoo::ReservationMenuData.new # ReservationMenuData | Menu items for this reservation


begin
  #Preorder menu items for a reservation
  result = api_instance.save_preordered_items1(reservation_id, body)
  p result
rescue Quandoo::ApiError => e
  puts "Exception when calling MenusApi->save_preordered_items1: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **reservation_id** | **String**| Public Id of the reservation | 
 **body** | [**ReservationMenuData**](ReservationMenuData.md)| Menu items for this reservation | 

### Return type

[**ReservationMenuData**](ReservationMenuData.md)

### Authorization

[CUSTOMER_SESSION](../README.md#CUSTOMER_SESSION)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined



