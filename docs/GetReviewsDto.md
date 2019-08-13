# Quandoo::GetReviewsDto

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**reviews** | [**Array&lt;GetReviewDto&gt;**](GetReviewDto.md) | List of returned reviews. | [optional] 
**size** | **Integer** | Number of reviews returned in this object. | [optional] 
**offset** | **Integer** | Offset to apply on the next pagination request. Can be higher than the number of available reviews. | [optional] 
**limit** | **Integer** | Expected number of reviews that could be retrieved in the next pagination request. Can actually be less than the number returned. Its value is 0 when it is sure there are no more reviews available for pagination using the &#39;offset&#39; as starting point. | [optional] 


