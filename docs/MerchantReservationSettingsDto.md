# Quandoo::MerchantReservationSettingsDto

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**area_ids** | [**Array&lt;AreaDto&gt;**](AreaDto.md) | List of all the areas defined for the merchant. Each area will contain: | [optional] 
**capacities** | **Array&lt;Integer&gt;** | Number of guests allowed in a reservation | [optional] 
**merchant_newsletter_selection_required** | **BOOLEAN** | If true, a separate checkbox is displayed in the checkout for newsletter received from the restaurant | [optional] 
**area_selection_required** | **BOOLEAN** | If true, we display available areas in a dropdown when a guest is making an online reservation | [optional] 
**reservation_enquiry_enabled** | **BOOLEAN** | If true, the restaurants allows enquiries | [optional] 
**minimum_capacity_for_enquiries** | **Integer** | Minimum number of guests for an enquiry | [optional] 
**online_reservation_interval** | **Integer** | Time slots displayed for making a reservation | [optional] 
**special_terms** | **String** | If true, special terms and conditions of the restaurant need to be confirmed upon making an online reservation | [optional] 
**links** | [**Array&lt;LinkRelationDto&gt;**](LinkRelationDto.md) | Related links that can be followed based on this response | [optional] 
**automatic_confirmation** | **BOOLEAN** | If true, the customer will receive an automatic email confirmation after he makes a reservation | [optional] 
**ccv_enabled** | **BOOLEAN** | If true, credit card information is required when creating a reservation | [optional] 


