# Quandoo::GetReviewDto

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**review_id** | **String** | UUID identifying the review. | 
**merchant_id** | **Integer** | Merchant Id associated to this review. Only in detailed view. | [optional] 
**customer** | [**CustomerReviewData**](CustomerReviewData.md) | Data about the customer that made this review. Only in detailed view. | [optional] 
**status** | **String** | Current review status. Possible values are &#39;AVAILABLE_TO_REVIEW&#39;,&#39;CREATED&#39;, &#39;DENIED&#39;, &#39;PUBLISHED&#39;. | [optional] 
**locale** | **String** | Locale of the created review. Only in detailed view. | [optional] 
**rating** | **Integer** | Rating associated to this review. Possible values: 1 to 6. | 
**description** | **String** | Description associated to this review. | [optional] 


