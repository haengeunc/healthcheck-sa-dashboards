
   # Performance Metrics
   
   ## This dashboard breaks out instance performance in line across the main components of query Asyncronous runtime. It provides broad benchmark recommendations where applicable as well as descriptions of the metric and suggestions on how they might be improved.
   
   
   ## This dashboard can be filtered in order to review specific timeframes, specific models, explores, dashboards or users as well as exclude errors, development queries, query and result sources or connection dialects

   ![Dashboard Screenshot](/documentation/images/Google_PSO_-_Performance_Metrics_2024-01-02T0606.png)

# Performance Metric Descriptions

## Indicative Looker Overhead
The amount of time a query spends being processed exclusively within Looker. This captures the percentage or pre & post processing as a total of the overall query run time. 

## Average Async Runtime 
The average amount of time a query takes to complete inclusive of pre query processing. Main query execution, totals execution and post query processing. 

## Main Query Execution time
The amount of time the main query takes to complete within the database. The recommended benchmark is 4.8698 seconds. This figure can be optimised through aggregation of data, the review of SQL queries to remove inefficiencies such as unnecessary sub queries, inclusion of templated filters in derived tables and standard database optimization techniques such as indexing, partitioning. 

## Total Query count
 The number of queries executed within the time period and total number of queries executed directly against the database. Review datagroup policies if the number of cached queries is unexpectedly high. Expected cache/database query ratio can vary depending on your use cases, e.g. if queries are usually run filtered at id level it would be low vs if few filters are used on dashboards with high usage where it should be high. 

## Average Project Init
The amount of time taken to initialise your project, This should be under 0.0 seconds (e.g. 0.09). If higher it may be valuable to consider breaking the project out into smaller components in a Hub and Spoke model

## Model Init: Compute
This is the average time taken to initialise your models from code. The recommended benchmark for this metric is 2.4199. This should only impact a small portion of your queries. If the average time is high then performance may benefit from models being broken out into smaller components. If the number of queries impacted is high, review the frequency of deployments and review potential implementation of deployment windows. 

## Model Initi: Cache
This is the average time taken to validate your model from cache. This should impact a large proportion of your queries and execute faster than init from compute, returning in under a second. If the average time is high then performance may benefit from models being broken out into smaller components.

## Explore Init: Compute
This is the average time taken to initialise your explores from code. The recommended benchmark for this metric is 0.2333 This should only impact a small portion of your queries. If high, review explores for optimisation either through restructure or efficiency of joins, removal of unnecessary dimensions and measures and review of developer deployment frequency as frequent deployments of Lookml code at peak usage invalidates cache. 

## Explore Init: Cache
This is the average time taken to validate explore code from cache. The recommended benchmark for this metric is 0.3513. This metric should cover a larger proportion of queries. If higher, review explores for optimisation either through restructure or efficiency of joins as well as moving custom dimensions and measures to LookML. 

## Prepare Average
The amount of time Looker takes to prepare a SQL query based Lookml defined in your projects. The recommended benchmark for this metric is 0.4389 seconds. If this appears to be excessively high, review Lookml logic, consider persistent derived tables or migrating calculations back to the database. Move custom dimensions and measures into your Lookml model where possible. Also enable new Lookml runtime if not already done so.

## Acquire Connection Time 
The time it takes for Looker to obtain a connection to your database. This includes time to look up the credentials (or key) for the user, create the connection pool if it does not already exist, and initialise the connection for use. The recommended benchmark is 0.2383 seconds. If this is higher or impacts a large number of queries it suggests that Looker is sending more queries than the database is capable of processing concurrently. Review the max connections per node value in your connections to optimise. This metric is also improved when reducing main query execution time. 

## Per User Throttler Average 
Looker has a default per user throttler ensuring that each user can only run 15 queries per node concurrently. This ensures bandwidth is available for all users, if Per User Throttler Average is high and impacts a high number of queries, review schedules with a view to disperse them throughout the time period. Also review Large Dashboards which have over 25 tiles. Review use of merged queries also as this can see dashboards with fewer than 25 tiles generate a larger volume of queries and see slow load times. If necessary create explores which make merged queries redundant. This is also improved by optimising main query execution time. 

## Average Query Queue Time 
The amount of time a query is queued & waiting for a free worker within Looker after initialisation. Review connections per node settings to ensure they are the maximum allowed value and review large dashboards within the instance to identify any over Lookers recommendation of 25 tiles per dashboard which are being heavily used. Restructure dashboards to reduce the number of queries generated. This metric is also improved when optimising main query execution by increasing traffic flow.

## Totals Query Execution 
Looker executes totals queries separately to main query execution. Totals should not be applied to all queries. If query totals are running against a large volume of queries and adding significantly to run time, review that all totals are necessary for dashboards with high throughput. 

## Row Totals Query Execution 
Looker executes row totals queries separately to main query execution. Row totals should not be applied to all queries. If query totals are running against a large volume of queries and adding significantly to run time, review that totals are necessary for dashboards with high throughput. 

## Grand Totals Query Execution 
Looker executes grand totals queries separately to main query execution. Grand Totals (The sum of subtotals) should not be applied to all queries. If query totals are running against a large volume of queries and adding significantly to run time, review that all totals necessary for dashboards with high throughput. 

## Post Processing Stream to cache time 
This is the amount of time taken to format and stream results to the user browser cache and should be present in most queries. The recommended benchmark is 0.2234s. If higher, review the number of custom dimensions and measures & table calculations, use of pivots, use of merged queries and row limits within high throughput dashboards. Identify if custom dimensions and measures can be moved back into your Lookml model, if pivots are optimised to include only necessary information. Can merged queries be removed via creation of new explores and that row limits are in line with requirements. For example if using a single value visualisation. Ensure that you are not querying with a limit to 5000 rows.
