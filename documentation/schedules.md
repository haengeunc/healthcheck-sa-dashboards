# Schedules
This dashboard is useful in monitoring schedules within your instance which can impact instance performance at peak schedule periods. This dashboard provides filters in order to reduce the schedule sent period, to remove schedules which were only ran once as well as a status filter to filter to success or failure. 

![Content Delivery Screenshot](/documentation/images/ContentDelivery.png)

## Schedule Admin
This tile provides a hstory of Schedules within your instance. The schedule ID, Who owns the schedule, its frequency send type, status and completed times and how long it took to complete in seconds. Finally it provides a link to the Look or dashboard itself.  

## Content Delivery
This tile breaks out the distribution of schedules each day of the week. Review if this is heavily skewed to one day of the week.

## Schedules by Hour of Day
This tile breaks out the distribution of schedules each hour of the day. Review if this is heavily skewed to any period. 

## Mean Rate of Success and Failure
This will give us an overall percentage of failures within the instance. This may include some errors which are anticipated such as schedules for deactiviated users. Failure rates are also broken out by day of the week in the Success/Failure Ratio by Day of Week tile.
in order to identify peak periods

## Error Trends
This tile shows a list of errors in cronological order in order to identify if there are any trends which should be addressed at a higher level. For example are schedules for deactivated users not being migrated or a specific dashboard containing broken content.

## Inactive users with Schedules
When a user is deactivated within Looker they lose permissions to execute schedules. The schedules themselves are not deleted however and will execute and generate errors until migrated to a new owner or deactivated. This tile provides a list of schedules which are owned by inactive users and need to be addressed. 

## Failure Status
This tile provides a count of failures per status message. This can assist with prioritisation however it should be noted that some status messages contain ID values which prevent aggregation so the list should be carefully reviewed. 

## Schedules to Delete
This tile provides a concise list of schedules which are failing due to issues such as User Permissions or broken content. 

## Schedules with Connection Timeout  
This tile provides a list of schedules which have failed due to connection timeout.
Schedules may fail due to connection timeout if there are issues with the connection itself, if there are issues with the LookML in the underlying model is designed leading to long runnig queries of if there are connectivity issues. These failures can consume memory if left unchecked and can also be symptomatic of a broader problem in the underlying model.  

## Weekly Schedule Heatmap
In this tile we are able to see schedules broken out by day of the week and hour of the day. They are tracked based on the number of schedules which were run and the average time taken to complete in seconds. This helps in identifying clusters which may be cause slowness within an instance. Where there is a heavy cluster within the instance it may be preferable to leverage the Looker API in order to spread schedules out across that hour so as to prevent a backlog of queries and potential time out failures
