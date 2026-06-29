---
- dashboard: google_pso__performance_metrics
  title: Google PSO - Performance Metrics
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  load_configuration: wait
  description: ''
  filters_location_top: false
  preferred_slug: xoOJEz25fifqhGaa3DKk9K
  elements:
  - title: Average Async Runtime
    name: Average Async Runtime
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.async_processing_average]
    filters:
      is_async_runtime_value_populated: 'Yes'
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_async_runtime_value_populated
      args:
      - query_metrics.async_processing
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 30
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Average Async Runtime
    conditional_formatting: [{type: greater than, value: 9.999, background_color: "#FFFFFF",
        font_color: "#F7930D",
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: greater
          than, value: 14.9999, background_color: "#FFFFFF", font_color: "#F54C3E",

        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: The average amount of time a query takes to complete inclusive of pre
      query processing. Main query execution, totals execution and post query processing.
    listen:
      Workspace ID: history.workspace_id
      Source: history.source
      Date: history.created_date
      Model: query.model
      Explore: query.view
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Result Source (Cache/DB): history.result_source
      Dashboard Name: dashboard.title
      Connection Name: history.connection_name
      Runtime Tiers in Seconds: history.runtime_tiers
      Row Limit: query.limit
      User: user.name
      Status: history.status
    row: 4
    col: 5
    width: 5
    height: 4
  - title: Average Query Queue Time
    name: Average Query Queue Time
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.queued_average, history.query_run_count_drill]
    filters:
      query_metrics.queued: ">0"
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_async_runtime_value_populated
      args:
      - query_metrics.async_processing
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 86
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Average Query Queue Time
    comparison_label: Queued queries
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: The amount of time a query is queued & waiting for a free worker within
      Looker after initialisation. Review connections per node settings to ensure
      they are the maximum allowed value and review large dashboards within the instance
      to identify any over Lookers recommendation of 25 tiles per dashboard which
      are being heavily used. Restructure dashboards to reduce the number of queries
      generated. This metric is also improved when optimising main query execution
      by increasing traffic flow.
    listen:
      Workspace ID: history.workspace_id
      Source: history.source
      Date: history.created_date
      Model: query.model
      Explore: query.view
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Result Source (Cache/DB): history.result_source
      Dashboard Name: dashboard.title
      Connection Name: history.connection_name
      Runtime Tiers in Seconds: history.runtime_tiers
      Row Limit: query.limit
      User: user.name
      Status: history.status
    row: 14
    col: 8
    width: 4
    height: 4
  - title: Acquire Connection Average
    name: Acquire Connection Average
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.acquire_connection_average, history.query_run_count_drill]
    filters:
      query_metrics.acquire_connection: ">0"
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_async_runtime_value_populated
      args:
      - query_metrics.async_processing
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 144
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Acquire Connection Time
    comparison_label: Acquire Connection Queries
    conditional_formatting: [{type: greater than, value: 0.2383, background_color: "#FFFFFF",
        font_color: "#F7930D",
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: The time it takes for Looker to obtain a connection to your database.
      This includes time to look up the credentials (or key) for the user, create
      the connection pool if it does not already exist, and initialise the connection
      for use. The recommended benchmark is 0.2383 seconds. If this is higher or impacts
      a large number of queries it suggests that Looker is sending more queries than
      the database is capable of processing concurrently. Review the max connections
      per node value in your connections to optimise. This metric is also improved
      when reducing main query execution time.
    listen:
      Workspace ID: history.workspace_id
      Source: history.source
      Date: history.created_date
      Model: query.model
      Explore: query.view
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Result Source (Cache/DB): history.result_source
      Dashboard Name: dashboard.title
      Connection Name: history.connection_name
      Runtime Tiers in Seconds: history.runtime_tiers
      Row Limit: query.limit
      User: user.name
      Status: history.status
    row: 14
    col: 0
    width: 4
    height: 4
  - title: New Tile
    name: New Tile
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.per_user_throttler_average, was_per_user_throttling_applied_yesno,
      history.query_run_count_drill]
    filters:
      is_async_runtime_value_populated: 'Yes'
      was_per_user_throttling_applied_yesno: 'Yes'
    sorts: [query_metrics.per_user_throttler_average desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_async_runtime_value_populated
      args:
      - query_metrics.async_processing
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 205
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      description: ''
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: was_per_user_throttling_applied_yesno
      args:
      - query_metrics.per_user_throttler
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 221
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Per User Throttler Average
    comparison_label: Queries with Per User Throttling
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Looker has a default per user/per node throttler ensuring that each
      user can only run 15 queries per node concurrently. This ensures bandwidth is
      available for all users, if Per User Throttler Average is high and impacts a
      high number of queries, review schedules with a view to disperse them throughout
      the time period. Also review Large Dashboards which have over 25 tiles. Review
      use of merged queries also as this can see dashboards with fewer than 25 tiles
      generate a larger volume of queries and see slow load times. If necessary create
      explores which make merged queries redundant. This is also improved by optimising
      main query execution time.
    listen:
      Workspace ID: history.workspace_id
      Source: history.source
      Date: history.created_date
      Model: query.model
      Explore: query.view
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Result Source (Cache/DB): history.result_source
      Dashboard Name: dashboard.title
      Connection Name: history.connection_name
      Runtime Tiers in Seconds: history.runtime_tiers
      Row Limit: query.limit
      User: user.name
      Status: history.status
    row: 14
    col: 4
    width: 4
    height: 4
  - title: Query Run Count
    name: Query Run Count
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [history.query_run_count_drill, history.database_result_query_count]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_async_runtime_value_populated
      args:
      - query_metrics.async_processing
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 279
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      description: ''
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: was_per_user_throttling_applied_yesno
      args:
      - query_metrics.per_user_throttler
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 295
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - category: table_calculation
      expression: 1-(${history.database_result_query_count}/${history.query_run_count_drill})
      label: Cache Percent
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: cache_percent
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Total Query Count
    comparison_label: Queries From Database
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: The number of queries executed within the time period and total number
      of queries executed directly against the database. Review datagroup policies
      if the number of cached queries is unexpectedly high. Expected cache/database
      query ratio can vary depending on your use cases, e.g. if queries are usually
      run filtered at id level it would be low vs if few filters are used on dashboards
      with high usage where it should be high.
    hidden_fields: [cache_percent]
    listen:
      Workspace ID: history.workspace_id
      Source: history.source
      Date: history.created_date
      Model: query.model
      Explore: query.view
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Dashboard Name: dashboard.title
      Connection Name: history.connection_name
      Runtime Tiers in Seconds: history.runtime_tiers
      Row Limit: query.limit
      User: user.name
      Status: history.status
    row: 4
    col: 15
    width: 5
    height: 4
  - title: Explore Init
    name: Explore Init
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.explore_init_average, history.query_run_count_drill]
    filters:
      query_metrics.explore_init: ">0"
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_async_runtime_value_populated
      args:
      - query_metrics.async_processing
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 353
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      description: ''
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: was_per_user_throttling_applied_yesno
      args:
      - query_metrics.per_user_throttler
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 369
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: 'Explore Init: Compute'
    comparison_label: Explore Init Queries
    conditional_formatting: [{type: greater than, value: 0.2333, background_color: "#FFFFFF",
        font_color: "#F7930D",
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: This is the average time taken to initialise your explores from code.
      The recommended benchmark for this metric is 0.2333 This should only impact
      a small portion of your queries. If high, review explores for optimisation either
      through restructure or efficiency of joins, removal of unnecessary dimensions
      and measures and review of developer deployment frequency as frequent deployments
      of Lookml code at peak usage invalidates cache.
    listen:
      Workspace ID: history.workspace_id
      Source: history.source
      Date: history.created_date
      Model: query.model
      Explore: query.view
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Result Source (Cache/DB): history.result_source
      Dashboard Name: dashboard.title
      Connection Name: history.connection_name
      Runtime Tiers in Seconds: history.runtime_tiers
      Row Limit: query.limit
      User: user.name
      Status: history.status
    row: 9
    col: 12
    width: 4
    height: 4
  - title: Model Init
    name: Model Init
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.model_init_computed_average, history.query_run_count_drill]
    filters:
      query_metrics.model_init_computed: ">0"
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_async_runtime_value_populated
      args:
      - query_metrics.async_processing
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 427
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      description: ''
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: was_per_user_throttling_applied_yesno
      args:
      - query_metrics.per_user_throttler
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 443
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: 'Model Init: Compute'
    comparison_label: Model Init Queries
    conditional_formatting: [{type: greater than, value: 2.4399, background_color: "#FFFFFF",
        font_color: "#F7930D",
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: This is the average time taken to initialise your models from code.
      The recommended benchmark for this metric is 2.4199. This should only impact
      a small portion of your queries. If the average time is high then performance
      may benefit from models being broken out into smaller components. If the number
      of queries impacted is high, review the frequency of deployments and review
      potential implementation of deployment windows.
    listen:
      Workspace ID: history.workspace_id
      Source: history.source
      Date: history.created_date
      Model: query.model
      Explore: query.view
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Result Source (Cache/DB): history.result_source
      Dashboard Name: dashboard.title
      Connection Name: history.connection_name
      Runtime Tiers in Seconds: history.runtime_tiers
      Row Limit: query.limit
      User: user.name
      Status: history.status
    row: 9
    col: 4
    width: 4
    height: 4
  - title: Prepare Average
    name: Prepare Average
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.prepare_average, history.query_run_count_drill]
    filters:
      query_metrics.prepare: ">0"
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_async_runtime_value_populated
      args:
      - query_metrics.async_processing
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 501
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      description: ''
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: was_per_user_throttling_applied_yesno
      args:
      - query_metrics.per_user_throttler
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 517
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Prepare Average
    comparison_label: Prepare Queries
    conditional_formatting: [{type: greater than, value: 0.4389, background_color: "#FFFFFF",
        font_color: "#F7930D",
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: The amount of time Looker takes to prepare a SQL query based Lookml
      defined in your projects. The recommended benchmark for this metric is 0.4389
      seconds. If this appears to be excessively high, review Lookml logic, consider
      persistent derived tables or migrating calculations back to the database. Move
      custom dimensions and measures into your Lookml model where possible. Also enable
      new Lookml runtime if not already done so.
    listen:
      Workspace ID: history.workspace_id
      Source: history.source
      Date: history.created_date
      Model: query.model
      Explore: query.view
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Result Source (Cache/DB): history.result_source
      Dashboard Name: dashboard.title
      Connection Name: history.connection_name
      Runtime Tiers in Seconds: history.runtime_tiers
      Row Limit: query.limit
      User: user.name
      Status: history.status
    row: 9
    col: 20
    width: 4
    height: 4
  - title: Main Query Execution
    name: Main Query Execution
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.execute_main_query_average]
    filters:
      query_metrics.execute_main_query: ">0"
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_async_runtime_value_populated
      args:
      - query_metrics.async_processing
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 575
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      description: ''
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: was_per_user_throttling_applied_yesno
      args:
      - query_metrics.per_user_throttler
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 591
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Main Query Execution Time
    comparison_label: 'Model Init: From Cache'
    conditional_formatting: [{type: greater than, value: 4.9999, background_color: "#FFFFFF",
        font_color: "#F7930D",
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: greater
          than, value: !!null '', background_color: "#FFFFFF", font_color: "#F54C3E",

        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: The amount of time the main query takes to complete within the database.
      The recommended benchmark is 4.8698 seconds. This figure can be optimised through
      aggregation of data, the review of SQL queries to remove inefficiencies such
      as unnecessary sub queries, inclusion of templated filters in derived tables
      and standard database optimization techniques such as indexing, partitioning.
    listen:
      Workspace ID: history.workspace_id
      Source: history.source
      Date: history.created_date
      Model: query.model
      Explore: query.view
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Result Source (Cache/DB): history.result_source
      Dashboard Name: dashboard.title
      Connection Name: history.connection_name
      Runtime Tiers in Seconds: history.runtime_tiers
      Row Limit: query.limit
      User: user.name
      Status: history.status
    row: 4
    col: 10
    width: 5
    height: 4
  - title: Stream To Cache Time
    name: Stream To Cache Time
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.stream_to_cache_average, history.query_run_count_drill]
    filters:
      query_metrics.stream_to_cache: ">0"
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_async_runtime_value_populated
      args:
      - query_metrics.async_processing
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 649
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      description: ''
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: was_per_user_throttling_applied_yesno
      args:
      - query_metrics.per_user_throttler
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 665
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Post Processing - Stream to Cache Time
    comparison_label: Stream To Cache Queries
    conditional_formatting: [{type: greater than, value: 0.2234, background_color: "#FFFFFF",
        font_color: "#F7930D",
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: This is the amount of time taken to format and stream results to the
      user browser cache and should be present in most queries. The recommended benchmark
      is 0.2234s. If higher, review the number of custom dimensions and measures &
      table calculations, use of pivots, use of merged queries and row limits within
      high throughput dashboards. Identify if custom dimensions and measures can be
      moved back into your Lookml model, if pivots are optimised to include only necessary
      information. Can merged queries be removed via creation of new explores and
      that row limits are in line with requirements. For example if using a single
      value visualisation. Ensure that you are not querying with a limit to 5000 rows.
    listen:
      Workspace ID: history.workspace_id
      Source: history.source
      Date: history.created_date
      Model: query.model
      Explore: query.view
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Result Source (Cache/DB): history.result_source
      Dashboard Name: dashboard.title
      Connection Name: history.connection_name
      Runtime Tiers in Seconds: history.runtime_tiers
      Row Limit: query.limit
      User: user.name
      Status: history.status
    row: 23
    col: 0
    width: 12
    height: 4
  - title: Was Per User Throttler Applied
    name: Was Per User Throttler Applied
    model: system__activity
    explore: query_metrics
    type: looker_pie
    fields: [query_metrics.count, was_per_user_throttling_applied_yesno]
    filters:
      is_async_runtime_value_populated: 'Yes'
    sorts: [query_metrics.count desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_async_runtime_value_populated
      args:
      - query_metrics.async_processing
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 724
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      description: ''
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: was_per_user_throttling_applied_yesno
      args:
      - query_metrics.per_user_throttler
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 740
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    value_labels: legend
    label_type: labPer
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Stream to Cache Time
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: 'Model Init: From Cache'
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: 'The number of queries to which Per user throttling was applied. '
    listen:
      Workspace ID: history.workspace_id
      Source: history.source
      Date: history.created_date
      Model: query.model
      Explore: query.view
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Result Source (Cache/DB): history.result_source
      Dashboard Name: dashboard.title
      Connection Name: history.connection_name
      Runtime Tiers in Seconds: history.runtime_tiers
      Row Limit: query.limit
      User: user.name
      Status: history.status
    row: 51
    col: 0
    width: 8
    height: 13
  - title: Project Init
    name: Project Init
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [average_of_project_init, history.query_run_count_drill]
    filters:
      project_init: ">0"
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_async_runtime_value_populated
      args:
      - query_metrics.async_processing
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 800
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      description: ''
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: was_per_user_throttling_applied_yesno
      args:
      - query_metrics.per_user_throttler
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 816
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: "${query_metrics.project_init}"
      label: project init
      value_format:
      value_format_name:
      dimension: project_init
      _kind_hint: dimension
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of project init
      value_format:
      value_format_name: decimal_2
      based_on: project_init
      _kind_hint: measure
      measure: average_of_project_init
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Average Project Init
    comparison_label: Project Init Queries
    conditional_formatting: [{type: greater than, value: 0.1, background_color: "#FFFFFF",
        font_color: "#F7930D",
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    hidden_pivots: {}
    value_labels: legend
    label_type: labPer
    note_state: collapsed
    note_display: hover
    note_text: The amount of time taken to initialise your project, This should be
      under 0.0 seconds (e.g. 0.09). If higher it may be valuable to consider breaking
      the project out into smaller components in a Hub and Spoke model
    listen:
      Workspace ID: history.workspace_id
      Source: history.source
      Date: history.created_date
      Model: query.model
      Explore: query.view
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Result Source (Cache/DB): history.result_source
      Dashboard Name: dashboard.title
      Connection Name: history.connection_name
      Runtime Tiers in Seconds: history.runtime_tiers
      Row Limit: query.limit
      User: user.name
      Status: history.status
    row: 9
    col: 0
    width: 4
    height: 4
  - title: Looker Overhead
    name: Looker Overhead
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [average_of_execute_main_query, average_of_async_processing, average_of_acquire_connection]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_async_runtime_value_populated
      args:
      - query_metrics.async_processing
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 1043
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      description: ''
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: was_per_user_throttling_applied_yesno
      args:
      - query_metrics.per_user_throttler
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 1059
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: "${query_metrics.project_init}"
      label: project init
      value_format:
      value_format_name:
      dimension: project_init
      _kind_hint: dimension
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of project init
      value_format:
      value_format_name: decimal_2
      based_on: project_init
      _kind_hint: measure
      measure: average_of_project_init
      type: average
      _type_hint: number
    - category: dimension
      expression: "${query_metrics.async_processing}-${query_metrics.execute_main_query}"
      label: Looker Processing Time
      value_format:
      value_format_name:
      dimension: looker_processing_time
      _kind_hint: dimension
      _type_hint: number
    - category: dimension
      expression: "${looker_processing_time}/${query_metrics.async_processing}"
      label: Looker Overhead
      value_format:
      value_format_name:
      dimension: looker_overhead
      _kind_hint: dimension
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of Looker Overhead
      value_format:
      value_format_name: percent_2
      based_on: looker_overhead
      _kind_hint: measure
      measure: average_of_looker_overhead
      type: average
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of Looker Processing Time
      based_on: looker_processing_time
      _kind_hint: measure
      measure: average_of_looker_processing_time
      type: average
      _type_hint: number
      filters:
        is_async_runtime_value_populated: 'Yes'
    - category: table_calculation
      expression: "${query_metrics.execute_main_query_average}/${query_metrics.async_processing_average}"
      label: Looker Overhead
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: looker_overhead_1
      _type_hint: number
      is_disabled: true
    - category: dimension
      description: ''
      label: Main Query Metric is populated
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: main_query_metric_is_populated
      args:
      - query_metrics.execute_main_query
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 1138
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - category: measure
      expression: ''
      label: Average of Execute Main Query
      based_on: query_metrics.execute_main_query
      _kind_hint: measure
      measure: average_of_execute_main_query
      type: average
      _type_hint: number
      filters:
        main_query_metric_is_populated: 'Yes'
    - category: measure
      expression: ''
      label: Average of Async Processing
      based_on: query_metrics.async_processing
      _kind_hint: measure
      measure: average_of_async_processing
      type: average
      _type_hint: number
      filters:
        is_async_runtime_value_populated: 'Yes'
    - category: table_calculation
      expression: "(((${average_of_execute_main_query}+${average_of_acquire_connection})/${average_of_async_processing})-1)*(-1)"
      label: Looker Overhead
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: looker_overhead_2
      _type_hint: number
    - category: table_calculation
      expression: "${average_of_async_processing}-(${average_of_execute_main_query}+${average_of_acquire_connection})"
      label: Overhead Time
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: overhead_time
      _type_hint: number
    - measure: average_of_acquire_connection
      based_on: query_metrics.acquire_connection
      expression: ''
      label: Average of Acquire Connection
      type: average
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Indicative Looker Overhead
    comparison_label: Overhead Time
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    hidden_pivots: {}
    value_labels: legend
    label_type: labPer
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    truncate_column_names: false
    hidden_fields: [average_of_execute_main_query, average_of_async_processing, average_of_acquire_connection]
    note_state: collapsed
    note_display: hover
    note_text: "The amount of time a query spends being processed exclusively within\
      \ Looker. This captures the percentage or pre & post processing as a total of\
      \ the overall query run time. \nFormula: Async Runtime - (Main query execution\
      \ + Acquire Connection time) "
    listen:
      Workspace ID: history.workspace_id
      Source: history.source
      Date: history.created_date
      Model: query.model
      Explore: query.view
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Result Source (Cache/DB): history.result_source
      Dashboard Name: dashboard.title
      Connection Name: history.connection_name
      Runtime Tiers in Seconds: history.runtime_tiers
      Row Limit: query.limit
      User: user.name
      Status: history.status
    row: 4
    col: 0
    width: 5
    height: 4
  - title: Processing By Model
    name: Processing By Model
    model: system__activity
    explore: query_metrics
    type: looker_bar
    fields: [query.model, history.query_run_count_drill, average_of_async_processing]
    filters:
      query.model: "-NULL"
    sorts: [history.query_run_count_drill desc]
    limit: 15
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_async_runtime_value_populated
      args:
      - query_metrics.async_processing
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 1277
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      description: ''
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: was_per_user_throttling_applied_yesno
      args:
      - query_metrics.per_user_throttler
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 1293
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: "${query_metrics.project_init}"
      label: project init
      value_format:
      value_format_name:
      dimension: project_init
      _kind_hint: dimension
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of project init
      value_format:
      value_format_name: decimal_2
      based_on: project_init
      _kind_hint: measure
      measure: average_of_project_init
      type: average
      _type_hint: number
    - category: dimension
      expression: "${query_metrics.async_processing}-${query_metrics.execute_main_query}"
      label: Looker Processing Time
      value_format:
      value_format_name:
      dimension: looker_processing_time
      _kind_hint: dimension
      _type_hint: number
    - category: dimension
      expression: "${looker_processing_time}/${query_metrics.async_processing}"
      label: Looker Overhead
      value_format:
      value_format_name:
      dimension: looker_overhead
      _kind_hint: dimension
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of Looker Overhead
      value_format:
      value_format_name: percent_2
      based_on: looker_overhead
      _kind_hint: measure
      measure: average_of_looker_overhead
      type: average
      _type_hint: number
    - measure: average_of_looker_processing_time
      based_on: looker_processing_time
      expression: ''
      label: Average of Looker Processing Time
      type: average
      _kind_hint: measure
      _type_hint: number
    - category: table_calculation
      expression: if((${average_of_async_processing}-${average_of_execute_main_query})/${average_of_async_processing}
        >0,(${average_of_async_processing}-${average_of_execute_main_query})/${average_of_async_processing},0)
      label: Looker Overhead
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: looker_overhead_1
      _type_hint: number
      is_disabled: true
    - category: measure
      expression: ''
      label: Average of Async Processing
      based_on: query_metrics.async_processing
      _kind_hint: measure
      measure: average_of_async_processing
      type: average
      _type_hint: number
      filters:
        query_metrics.async_processing: not null
    - category: measure
      expression: ''
      label: Average of Execute Main Query
      based_on: query_metrics.execute_main_query
      _kind_hint: measure
      measure: average_of_execute_main_query
      type: average
      _type_hint: number
      filters:
        query_metrics.execute_main_query: not null
    - category: measure
      label: Filtered history.query_run_count_drill
      based_on: history.query_run_count_drill
      _kind_hint: measure
      measure: filtered_historyquery_run_count_drill
      type: count_distinct
      _type_hint: number
      filters: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: history.query_run_count_drill,
            id: history.query_run_count_drill, name: Query Run Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: '', orientation: bottom, series: [{axisId: looker_overhead_1,
            id: looker_overhead_1, name: Looker Overhead}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Indicative Looker Overhead
    comparison_label: 'Model Init: From Cache'
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    hidden_pivots: {}
    value_labels: legend
    label_type: labPer
    show_null_points: true
    interpolation: linear
    truncate_column_names: false
    hidden_fields:
    listen:
      Workspace ID: history.workspace_id
      Source: history.source
      Date: history.created_date
      Explore: query.view
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Result Source (Cache/DB): history.result_source
      Dashboard Name: dashboard.title
      Connection Name: history.connection_name
      Runtime Tiers in Seconds: history.runtime_tiers
      Row Limit: query.limit
      User: user.name
      Status: history.status
    row: 67
    col: 12
    width: 12
    height: 11
  - title: Processing By Dashboard
    name: Processing By Dashboard
    model: system__activity
    explore: query_metrics
    type: looker_bar
    fields: [history.query_run_count_drill, dashboard.title, average_of_async_processing]
    filters:
      dashboard.title: "-NULL"
    sorts: [history.query_run_count_drill desc]
    limit: 15
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_async_runtime_value_populated
      args:
      - query_metrics.async_processing
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 1488
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      description: ''
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: was_per_user_throttling_applied_yesno
      args:
      - query_metrics.per_user_throttler
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 1504
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: "${query_metrics.project_init}"
      label: project init
      value_format:
      value_format_name:
      dimension: project_init
      _kind_hint: dimension
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of project init
      value_format:
      value_format_name: decimal_2
      based_on: project_init
      _kind_hint: measure
      measure: average_of_project_init
      type: average
      _type_hint: number
    - category: dimension
      expression: "${query_metrics.async_processing}-${query_metrics.execute_main_query}"
      label: Looker Processing Time
      value_format:
      value_format_name:
      dimension: looker_processing_time
      _kind_hint: dimension
      _type_hint: number
    - category: dimension
      expression: "${looker_processing_time}/${query_metrics.async_processing}"
      label: Looker Overhead
      value_format:
      value_format_name:
      dimension: looker_overhead
      _kind_hint: dimension
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of Looker Overhead
      value_format:
      value_format_name: percent_2
      based_on: looker_overhead
      _kind_hint: measure
      measure: average_of_looker_overhead
      type: average
      _type_hint: number
    - measure: average_of_looker_processing_time
      based_on: looker_processing_time
      expression: ''
      label: Average of Looker Processing Time
      type: average
      _kind_hint: measure
      _type_hint: number
    - category: table_calculation
      expression: if((${average_of_async_processing}-${average_of_execute_main_query})/${average_of_async_processing}
        >0,(${average_of_async_processing}-${average_of_execute_main_query})/${average_of_async_processing},0)
      label: Looker Overhead
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: looker_overhead_1
      _type_hint: number
      is_disabled: true
    - category: measure
      expression: ''
      label: Average of Async Processing
      based_on: query_metrics.async_processing
      _kind_hint: measure
      measure: average_of_async_processing
      type: average
      _type_hint: number
      filters:
        query_metrics.async_processing: not null
    - category: measure
      expression: ''
      label: Average of Execute Main Query
      based_on: query_metrics.execute_main_query
      _kind_hint: measure
      measure: average_of_execute_main_query
      type: average
      _type_hint: number
      filters:
        query_metrics.execute_main_query: not null
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: history.query_run_count_drill,
            id: history.query_run_count_drill, name: Query Run Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: '', orientation: bottom, series: [{axisId: looker_overhead_1,
            id: looker_overhead_1, name: Looker Overhead}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Indicative Looker Overhead
    comparison_label: 'Model Init: From Cache'
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    hidden_pivots: {}
    value_labels: legend
    label_type: labPer
    show_null_points: true
    interpolation: linear
    truncate_column_names: false
    hidden_fields:
    listen:
      Workspace ID: history.workspace_id
      Source: history.source
      Date: history.created_date
      Model: query.model
      Explore: query.view
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Result Source (Cache/DB): history.result_source
      Connection Name: history.connection_name
      Runtime Tiers in Seconds: history.runtime_tiers
      Row Limit: query.limit
      User: user.name
      Status: history.status
    row: 78
    col: 12
    width: 12
    height: 11
  - title: Processing By Explore
    name: Processing By Explore
    model: system__activity
    explore: query_metrics
    type: looker_bar
    fields: [query.view, history.query_run_count_drill, average_of_execute_main_query]
    filters:
      query.view: "-NULL"
    sorts: [history.query_run_count_drill desc]
    limit: 15
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: if((${average_of_async_processing}-${average_of_execute_main_query})/${average_of_async_processing}
        >0,(${average_of_async_processing}-${average_of_execute_main_query})/${average_of_async_processing},0)
      label: Looker Overhead
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: looker_overhead_1
      _type_hint: number
      is_disabled: true
    - category: dimension
      description: ''
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_async_runtime_value_populated
      args:
      - query_metrics.async_processing
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 1700
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      description: ''
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: was_per_user_throttling_applied_yesno
      args:
      - query_metrics.per_user_throttler
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 1716
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: "${query_metrics.project_init}"
      label: project init
      value_format:
      value_format_name:
      dimension: project_init
      _kind_hint: dimension
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of project init
      value_format:
      value_format_name: decimal_2
      based_on: project_init
      _kind_hint: measure
      measure: average_of_project_init
      type: average
      _type_hint: number
    - category: dimension
      expression: "${query_metrics.async_processing}-${query_metrics.execute_main_query}"
      label: Looker Processing Time
      value_format:
      value_format_name:
      dimension: looker_processing_time
      _kind_hint: dimension
      _type_hint: number
    - category: dimension
      expression: "${looker_processing_time}/${query_metrics.async_processing}"
      label: Looker Overhead
      value_format:
      value_format_name:
      dimension: looker_overhead
      _kind_hint: dimension
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of Looker Overhead
      value_format:
      value_format_name: percent_2
      based_on: looker_overhead
      _kind_hint: measure
      measure: average_of_looker_overhead
      type: average
      _type_hint: number
    - measure: average_of_looker_processing_time
      based_on: looker_processing_time
      expression: ''
      label: Average of Looker Processing Time
      type: average
      _kind_hint: measure
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of Async Processing
      based_on: query_metrics.async_processing
      _kind_hint: measure
      measure: average_of_async_processing
      type: average
      _type_hint: number
      filters:
        query_metrics.async_processing: not null
    - category: measure
      expression: ''
      label: Average of Execute Main Query
      based_on: query_metrics.execute_main_query
      _kind_hint: measure
      measure: average_of_execute_main_query
      type: average
      _type_hint: number
      filters:
        query_metrics.execute_main_query: not null
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: history.query_run_count_drill,
            id: history.query_run_count_drill, name: Query Run Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: '', orientation: bottom, series: [{axisId: looker_overhead_1,
            id: looker_overhead_1, name: Looker Overhead}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Indicative Looker Overhead
    comparison_label: 'Model Init: From Cache'
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    hidden_pivots: {}
    value_labels: legend
    label_type: labPer
    show_null_points: true
    interpolation: linear
    truncate_column_names: false
    hidden_fields:
    listen:
      Workspace ID: history.workspace_id
      Source: history.source
      Date: history.created_date
      Model: query.model
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Result Source (Cache/DB): history.result_source
      Dashboard Name: dashboard.title
      Connection Name: history.connection_name
      Runtime Tiers in Seconds: history.runtime_tiers
      Row Limit: query.limit
      User: user.name
      Status: history.status
    row: 78
    col: 0
    width: 12
    height: 11
  - title: Processing By User
    name: Processing By User
    model: system__activity
    explore: query_metrics
    type: looker_bar
    fields: [history.query_run_count_drill, user.name, average_of_async_processing]
    filters:
      user.name: "-NULL"
    sorts: [history.query_run_count_drill desc]
    limit: 15
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_async_runtime_value_populated
      args:
      - query_metrics.async_processing
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 1945
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      description: ''
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: was_per_user_throttling_applied_yesno
      args:
      - query_metrics.per_user_throttler
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 1961
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: "${query_metrics.project_init}"
      label: project init
      value_format:
      value_format_name:
      dimension: project_init
      _kind_hint: dimension
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of project init
      value_format:
      value_format_name: decimal_2
      based_on: project_init
      _kind_hint: measure
      measure: average_of_project_init
      type: average
      _type_hint: number
    - category: dimension
      expression: "${query_metrics.async_processing}-${query_metrics.execute_main_query}"
      label: Looker Processing Time
      value_format:
      value_format_name:
      dimension: looker_processing_time
      _kind_hint: dimension
      _type_hint: number
    - category: dimension
      expression: "${looker_processing_time}/${query_metrics.async_processing}"
      label: Looker Overhead
      value_format:
      value_format_name:
      dimension: looker_overhead
      _kind_hint: dimension
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of Looker Overhead
      value_format:
      value_format_name: percent_2
      based_on: looker_overhead
      _kind_hint: measure
      measure: average_of_looker_overhead
      type: average
      _type_hint: number
    - measure: average_of_looker_processing_time
      based_on: looker_processing_time
      expression: ''
      label: Average of Looker Processing Time
      type: average
      _kind_hint: measure
      _type_hint: number
    - category: table_calculation
      expression: if((${average_of_async_processing}-${average_of_execute_main_query})/${average_of_async_processing}
        >0,(${average_of_async_processing}-${average_of_execute_main_query})/${average_of_async_processing},0)
      label: Looker Overhead
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: looker_overhead_1
      _type_hint: number
      is_disabled: true
    - category: measure
      expression: ''
      label: Average of Execute Main Query
      based_on: query_metrics.execute_main_query
      _kind_hint: measure
      measure: average_of_execute_main_query
      type: average
      _type_hint: number
      filters:
        query_metrics.execute_main_query: not null
    - category: measure
      expression: ''
      label: Average of Async Processing
      based_on: query_metrics.async_processing
      _kind_hint: measure
      measure: average_of_async_processing
      type: average
      _type_hint: number
      filters:
        query_metrics.async_processing: not null
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: history.query_run_count_drill,
            id: history.query_run_count_drill, name: Query Run Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: '', orientation: bottom, series: [{axisId: looker_overhead_1,
            id: looker_overhead_1, name: Looker Overhead}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Indicative Looker Overhead
    comparison_label: 'Model Init: From Cache'
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    hidden_pivots: {}
    value_labels: legend
    label_type: labPer
    show_null_points: true
    interpolation: linear
    truncate_column_names: false
    hidden_fields:
    listen:
      Workspace ID: history.workspace_id
      Source: history.source
      Date: history.created_date
      Model: query.model
      Explore: query.view
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Result Source (Cache/DB): history.result_source
      Dashboard Name: dashboard.title
      Connection Name: history.connection_name
      Runtime Tiers in Seconds: history.runtime_tiers
      Row Limit: query.limit
      Status: history.status
    row: 89
    col: 0
    width: 12
    height: 11
  - title: Model Init (Copy)
    name: Model Init (Copy)
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.model_init_cache_average, history.query_run_count_drill]
    filters:
      query_metrics.model_init_cache: ">0"
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_async_runtime_value_populated
      args:
      - query_metrics.async_processing
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 2147
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      description: ''
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: was_per_user_throttling_applied_yesno
      args:
      - query_metrics.per_user_throttler
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 2163
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: 'Model Init: Cache'
    comparison_label: Model Init Queries
    conditional_formatting: [{type: greater than, value: 1, background_color: "#FFFFFF",
        font_color: "#F7930D",
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: This is the average time taken to validate your model from cache. This
      should impact a large proportion of your queries and execute faster than init
      from compute, returning in under a second. If the average time is high then
      performance may benefit from models being broken out into smaller components.
    listen:
      Workspace ID: history.workspace_id
      Source: history.source
      Date: history.created_date
      Model: query.model
      Explore: query.view
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Result Source (Cache/DB): history.result_source
      Dashboard Name: dashboard.title
      Connection Name: history.connection_name
      Runtime Tiers in Seconds: history.runtime_tiers
      Row Limit: query.limit
      User: user.name
      Status: history.status
    row: 9
    col: 8
    width: 4
    height: 4
  - title: Explore Init (Copy)
    name: Explore Init (Copy)
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.marshalled_cache_load_average, history.query_run_count_drill]
    filters:
      query_metrics.marshalled_cache_load: ">0"
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_async_runtime_value_populated
      args:
      - query_metrics.async_processing
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 2221
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      description: ''
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: was_per_user_throttling_applied_yesno
      args:
      - query_metrics.per_user_throttler
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 2237
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: 'Explore Init: Cache'
    comparison_label: Explore Init Queries
    conditional_formatting: [{type: greater than, value: 0.3513, background_color: "#FFFFFF",
        font_color: "#F7930D",
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: This is the average time taken to validate explore code from cache.
      The recommended benchmark for this metric is 0.3513. This metric should cover
      a larger proportion of queries. If higher, review explores for optimisation
      either through restructure or efficiency of joins as well as moving custom dimensions
      and measures to LookML.
    listen:
      Workspace ID: history.workspace_id
      Source: history.source
      Date: history.created_date
      Model: query.model
      Explore: query.view
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Result Source (Cache/DB): history.result_source
      Dashboard Name: dashboard.title
      Connection Name: history.connection_name
      Runtime Tiers in Seconds: history.runtime_tiers
      Row Limit: query.limit
      User: user.name
      Status: history.status
    row: 9
    col: 16
    width: 4
    height: 4
  - title: Async Runtime & Query Count per Weekday
    name: Async Runtime & Query Count per Weekday
    model: system__activity
    explore: query_metrics
    type: looker_line
    fields: [average_of_execute_main_query, average_of_async_processing, history.query_run_count_drill,
      history.created_date]
    filters:
      history.created_day_of_week: "-Saturday,-Sunday"
    sorts: [history.created_date desc]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_async_runtime_value_populated
      args:
      - query_metrics.async_processing
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 2297
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      description: ''
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: was_per_user_throttling_applied_yesno
      args:
      - query_metrics.per_user_throttler
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 2313
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: "${query_metrics.project_init}"
      label: project init
      value_format:
      value_format_name:
      dimension: project_init
      _kind_hint: dimension
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of project init
      value_format:
      value_format_name: decimal_2
      based_on: project_init
      _kind_hint: measure
      measure: average_of_project_init
      type: average
      _type_hint: number
    - category: dimension
      expression: "${query_metrics.async_processing}-${query_metrics.execute_main_query}"
      label: Looker Processing Time
      value_format:
      value_format_name:
      dimension: looker_processing_time
      _kind_hint: dimension
      _type_hint: number
    - category: dimension
      expression: "${looker_processing_time}/${query_metrics.async_processing}"
      label: Looker Overhead
      value_format:
      value_format_name:
      dimension: looker_overhead
      _kind_hint: dimension
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of Looker Overhead
      value_format:
      value_format_name: percent_2
      based_on: looker_overhead
      _kind_hint: measure
      measure: average_of_looker_overhead
      type: average
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of Looker Processing Time
      based_on: looker_processing_time
      _kind_hint: measure
      measure: average_of_looker_processing_time
      type: average
      _type_hint: number
      filters:
        is_async_runtime_value_populated: 'Yes'
    - category: table_calculation
      expression: "${query_metrics.execute_main_query_average}/${query_metrics.async_processing_average}"
      label: Looker Overhead
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: looker_overhead_1
      _type_hint: number
      is_disabled: true
    - category: dimension
      description: ''
      label: Main Query Metric is populated
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: main_query_metric_is_populated
      args:
      - query_metrics.execute_main_query
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 2392
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - category: measure
      expression: ''
      label: Average of Execute Main Query
      based_on: query_metrics.execute_main_query
      _kind_hint: measure
      measure: average_of_execute_main_query
      type: average
      _type_hint: number
      filters:
        main_query_metric_is_populated: 'Yes'
    - category: measure
      expression: ''
      label: Average of Async Processing
      based_on: query_metrics.async_processing
      _kind_hint: measure
      measure: average_of_async_processing
      type: average
      _type_hint: number
      filters:
        is_async_runtime_value_populated: 'Yes'
    - category: table_calculation
      expression: "((${average_of_execute_main_query}/${average_of_async_processing})-1)*(-1)"
      label: Looker Overhead
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: looker_overhead_2
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${average_of_async_processing}-${average_of_execute_main_query}"
      label: Overhead Time
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: overhead_time
      _type_hint: number
      is_disabled: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: history.query_run_count_drill,
            id: history.query_run_count_drill, name: Query Run Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: '', orientation: right, series: [{axisId: average_of_async_processing,
            id: average_of_async_processing, name: Average of Async Processing}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Indicative Looker Overhead
    comparison_label: Overhead Time
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    hidden_pivots: {}
    value_labels: legend
    label_type: labPer
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    truncate_column_names: false
    hidden_fields: [average_of_execute_main_query]
    listen:
      Workspace ID: history.workspace_id
      Source: history.source
      Date: history.created_date
      Model: query.model
      Explore: query.view
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Result Source (Cache/DB): history.result_source
      Dashboard Name: dashboard.title
      Connection Name: history.connection_name
      Runtime Tiers in Seconds: history.runtime_tiers
      Row Limit: query.limit
      User: user.name
      Status: history.status
    row: 30
    col: 0
    width: 24
    height: 9
  - title: Grand Total Queries
    name: Grand Total Queries
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [average_of_execute_grand_totals_query, history.query_run_count_drill]
    filters:
      query_metrics.execute_grand_totals_query: ">0"
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_async_runtime_value_populated
      args:
      - query_metrics.async_processing
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 2608
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      description: ''
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: was_per_user_throttling_applied_yesno
      args:
      - query_metrics.per_user_throttler
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 2624
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - measure: average_of_execute_row_totals_query
      based_on: query_metrics.execute_row_totals_query
      expression: ''
      label: Average of Execute Row Totals Query
      type: average
      _kind_hint: measure
      _type_hint: number
    - measure: average_of_execute_grand_totals_query
      based_on: query_metrics.execute_grand_totals_query
      expression: ''
      label: Average of Execute Grand Totals Query
      type: average
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Grand Totals Query Execution
    comparison_label: Queries
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Looker executes grand totals queries separately to main query execution.
      Grand Totals (The sum of subtotals) should not be applied to all queries. If
      query totals are running against a large volume of queries and adding significantly
      to run time, review that all totals necessary for dashboards with high throughput.
    listen:
      Workspace ID: history.workspace_id
      Source: history.source
      Date: history.created_date
      Model: query.model
      Explore: query.view
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Result Source (Cache/DB): history.result_source
      Dashboard Name: dashboard.title
      Connection Name: history.connection_name
      Runtime Tiers in Seconds: history.runtime_tiers
      Row Limit: query.limit
      User: user.name
      Status: history.status
    row: 14
    col: 20
    width: 4
    height: 4
  - name: Initialisation Phase
    type: text
    title_text: Initialisation Phase
    body_text: ''
    row: 8
    col: 0
    width: 24
    height: 1
  - title: Totals Queries
    name: Totals Queries
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [average_of_execute_totals_query, history.query_run_count_drill]
    filters:
      query_metrics.execute_totals_query: ">0"
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_async_runtime_value_populated
      args:
      - query_metrics.async_processing
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 2704
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      description: ''
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: was_per_user_throttling_applied_yesno
      args:
      - query_metrics.per_user_throttler
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 2720
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - measure: average_of_execute_totals_query
      based_on: query_metrics.execute_totals_query
      expression: ''
      label: Average of Execute Totals Query
      type: average
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Totals Query Execution
    comparison_label: Queries
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Looker executes totals queries separately to main query execution.
      Totals should not be applied to all queries. If query totals are running against
      a large volume of queries and adding significantly to run time, review that
      all totals are necessary for dashboards with high throughput
    listen:
      Workspace ID: history.workspace_id
      Source: history.source
      Date: history.created_date
      Model: query.model
      Explore: query.view
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Result Source (Cache/DB): history.result_source
      Dashboard Name: dashboard.title
      Connection Name: history.connection_name
      Runtime Tiers in Seconds: history.runtime_tiers
      Row Limit: query.limit
      User: user.name
      Status: history.status
    row: 14
    col: 12
    width: 4
    height: 4
  - name: Query Execution Phase
    type: text
    title_text: Query Execution Phase
    body_text: ''
    row: 13
    col: 0
    width: 24
    height: 1
  - title: Row Total Queries
    name: Row Total Queries
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [average_of_execute_row_totals_query, history.query_run_count_drill]
    filters:
      query_metrics.execute_row_totals_query: ">0"
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_async_runtime_value_populated
      args:
      - query_metrics.async_processing
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 2793
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      description: ''
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: was_per_user_throttling_applied_yesno
      args:
      - query_metrics.per_user_throttler
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 2809
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - measure: average_of_execute_row_totals_query
      based_on: query_metrics.execute_row_totals_query
      expression: ''
      label: Average of Execute Row Totals Query
      type: average
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Row Totals Query Execution
    comparison_label: Queries
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Looker executes row totals queries separately to main query execution.
      Row totals should not be applied to all queries. If query totals are running
      against a large volume of queries and adding significantly to run time, review
      that totals are necessary for dashboards with high throughput.
    listen:
      Workspace ID: history.workspace_id
      Source: history.source
      Date: history.created_date
      Model: query.model
      Explore: query.view
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Result Source (Cache/DB): history.result_source
      Dashboard Name: dashboard.title
      Connection Name: history.connection_name
      Runtime Tiers in Seconds: history.runtime_tiers
      Row Limit: query.limit
      User: user.name
      Status: history.status
    row: 14
    col: 16
    width: 4
    height: 4
  - name: Query Overview
    type: text
    title_text: Query Overview
    subtitle_text: ''
    body_text: ''
    row: 48
    col: 0
    width: 24
    height: 3
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <nav style="font-size: 18px; padding: 5px 10px 0 10px; height: 60px">
      <a style="padding: 5px; border-top: solid 1px #4285F4; border-left: solid 1px #4285F4; border-right: solid 1px #4285F4; border-radius: 5px 5px 0 0; float: left; line-height: 40px; font-weight: bold;" href="/dashboards/healthcheck::google_pso__performance_metrics?">
      Performance Metrics</a>
        <a style="padding: 5px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/healthcheck::google_cloud__query_outliers?">Outliers</a>
        <a style="padding: 5px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/healthcheck::google_pso__history_query_analysis?">History</a>
        <a style="padding: 5px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/healthcheck::google_pso__content_delivery?">Schedules</a>
        <a style="padding: 5px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/healthcheck::google_pso__merged_queries?">Merged Queries</a>
        <a style="padding: 5px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/healthcheck::google_pso__large_dashboards__query_count?">Large Dashboards</a>
        <a style="padding: 5px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/healthcheck::google_pso__dashboard_optimisation_?">Dashboard Optimisation</a>
      </nav>
    row: 0
    col: 0
    width: 24
    height: 2
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: Source Drilldown
    body_text: ''
    row: 64
    col: 0
    width: 24
    height: 3
  - title: Query Metrics Per Day
    name: Query Metrics Per Day
    model: system__activity
    explore: query_metrics
    type: looker_area
    fields: [history.created_date, query_metrics.acquire_connection_average, query_metrics.per_user_throttler_average,
      query_metrics.prepare_average, query_metrics.model_init_cache_average, query_metrics.model_init_computed_average,
      query_metrics.marshalled_cache_load_average, query_metrics.explore_init_average,
      query_metrics.execute_main_query_average, query_metrics.postprocessing_average,
      query_metrics.stream_to_cache_average, query_metrics.cache_load_average, query_metrics.load_main_query_in_memory_average,
      query_metrics.load_process_and_stream_main_query_average, query_metrics.queued_average]
    filters:
      history.created_day_of_week: "-Saturday,-Sunday"
    sorts: [history.created_date desc]
    limit: 5000
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Seconds, orientation: left, series: [{axisId: query_metrics.acquire_connection_average,
            id: query_metrics.acquire_connection_average, name: Acquire Connection
              Average}, {axisId: query_metrics.connection_held_average, id: query_metrics.connection_held_average,
            name: Connection Held Average}, {axisId: query_metrics.per_user_throttler_average,
            id: query_metrics.per_user_throttler_average, name: Per User Throttler
              Average}, {axisId: query_metrics.prepare_average, id: query_metrics.prepare_average,
            name: Prepare Average}, {axisId: query_metrics.model_init_cache_average,
            id: query_metrics.model_init_cache_average, name: 'Model Init: From Cache
              Average'}, {axisId: query_metrics.model_init_computed_average, id: query_metrics.model_init_computed_average,
            name: 'Model Init: Computed Average'}, {axisId: query_metrics.marshalled_cache_load_average,
            id: query_metrics.marshalled_cache_load_average, name: 'Explore Init:
              From Cache Average'}, {axisId: query_metrics.explore_init_average, id: query_metrics.explore_init_average,
            name: 'Explore Init: Computed Average'}, {axisId: query_metrics.execute_main_query_average,
            id: query_metrics.execute_main_query_average, name: Execute Main Query
              Average}, {axisId: query_metrics.postprocessing_average, id: query_metrics.postprocessing_average,
            name: Postprocessing Average}, {axisId: query_metrics.stream_to_cache_average,
            id: query_metrics.stream_to_cache_average, name: Stream to Cache Average}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Indicative Looker Overhead
    comparison_label: Overhead Time
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    hidden_pivots: {}
    value_labels: legend
    label_type: labPer
    ordering: none
    show_null_labels: false
    truncate_column_names: false
    hidden_fields: []
    listen:
      Workspace ID: history.workspace_id
      Source: history.source
      Date: history.created_date
      Model: query.model
      Explore: query.view
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Result Source (Cache/DB): history.result_source
      Dashboard Name: dashboard.title
      Connection Name: history.connection_name
      Runtime Tiers in Seconds: history.runtime_tiers
      Row Limit: query.limit
      User: user.name
      Status: history.status
    row: 39
    col: 0
    width: 24
    height: 9
  - title: Processing By Connection
    name: Processing By Connection
    model: system__activity
    explore: query_metrics
    type: looker_bar
    fields: [history.query_run_count_drill, average_of_async_processing, history.connection_name]
    filters:
      history.connection_name: "-NULL"
    sorts: [history.query_run_count_drill desc]
    limit: 15
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_async_runtime_value_populated
      args:
      - query_metrics.async_processing
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 1945
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      description: ''
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: was_per_user_throttling_applied_yesno
      args:
      - query_metrics.per_user_throttler
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 1961
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: "${query_metrics.project_init}"
      label: project init
      value_format:
      value_format_name:
      dimension: project_init
      _kind_hint: dimension
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of project init
      value_format:
      value_format_name: decimal_2
      based_on: project_init
      _kind_hint: measure
      measure: average_of_project_init
      type: average
      _type_hint: number
    - category: dimension
      expression: "${query_metrics.async_processing}-${query_metrics.execute_main_query}"
      label: Looker Processing Time
      value_format:
      value_format_name:
      dimension: looker_processing_time
      _kind_hint: dimension
      _type_hint: number
    - category: dimension
      expression: "${looker_processing_time}/${query_metrics.async_processing}"
      label: Looker Overhead
      value_format:
      value_format_name:
      dimension: looker_overhead
      _kind_hint: dimension
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of Looker Overhead
      value_format:
      value_format_name: percent_2
      based_on: looker_overhead
      _kind_hint: measure
      measure: average_of_looker_overhead
      type: average
      _type_hint: number
    - measure: average_of_looker_processing_time
      based_on: looker_processing_time
      expression: ''
      label: Average of Looker Processing Time
      type: average
      _kind_hint: measure
      _type_hint: number
    - category: table_calculation
      expression: if((${average_of_async_processing}-${average_of_execute_main_query})/${average_of_async_processing}
        >0,(${average_of_async_processing}-${average_of_execute_main_query})/${average_of_async_processing},0)
      label: Looker Overhead
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: looker_overhead_1
      _type_hint: number
      is_disabled: true
    - category: measure
      expression: ''
      label: Average of Execute Main Query
      based_on: query_metrics.execute_main_query
      _kind_hint: measure
      measure: average_of_execute_main_query
      type: average
      _type_hint: number
      filters:
        query_metrics.execute_main_query: not null
    - category: measure
      expression: ''
      label: Average of Async Processing
      based_on: query_metrics.async_processing
      _kind_hint: measure
      measure: average_of_async_processing
      type: average
      _type_hint: number
      filters:
        query_metrics.async_processing: not null
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: history.query_run_count_drill,
            id: history.query_run_count_drill, name: Query Run Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: '', orientation: bottom, series: [{axisId: looker_overhead_1,
            id: looker_overhead_1, name: Looker Overhead}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Indicative Looker Overhead
    comparison_label: 'Model Init: From Cache'
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    hidden_pivots: {}
    value_labels: legend
    label_type: labPer
    show_null_points: true
    interpolation: linear
    truncate_column_names: false
    hidden_fields:
    listen:
      Date: history.created_date
      Model: query.model
      Explore: query.view
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Result Source (Cache/DB): history.result_source
      Dashboard Name: dashboard.title
      Runtime Tiers in Seconds: history.runtime_tiers
      Row Limit: query.limit
      User: user.name
      Status: history.status
    row: 67
    col: 0
    width: 12
    height: 11
  - title: Processing By Errors
    name: Processing By Errors
    model: system__activity
    explore: query_metrics
    type: looker_bar
    fields: [history.query_run_count_drill, average_of_async_processing, history.message]
    filters:
      history.message: "-NULL"
      history.status: error
    sorts: [history.query_run_count_drill desc]
    limit: 15
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_async_runtime_value_populated
      args:
      - query_metrics.async_processing
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 1945
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      description: ''
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: was_per_user_throttling_applied_yesno
      args:
      - query_metrics.per_user_throttler
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 1961
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: "${query_metrics.project_init}"
      label: project init
      value_format:
      value_format_name:
      dimension: project_init
      _kind_hint: dimension
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of project init
      value_format:
      value_format_name: decimal_2
      based_on: project_init
      _kind_hint: measure
      measure: average_of_project_init
      type: average
      _type_hint: number
    - category: dimension
      expression: "${query_metrics.async_processing}-${query_metrics.execute_main_query}"
      label: Looker Processing Time
      value_format:
      value_format_name:
      dimension: looker_processing_time
      _kind_hint: dimension
      _type_hint: number
    - category: dimension
      expression: "${looker_processing_time}/${query_metrics.async_processing}"
      label: Looker Overhead
      value_format:
      value_format_name:
      dimension: looker_overhead
      _kind_hint: dimension
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of Looker Overhead
      value_format:
      value_format_name: percent_2
      based_on: looker_overhead
      _kind_hint: measure
      measure: average_of_looker_overhead
      type: average
      _type_hint: number
    - measure: average_of_looker_processing_time
      based_on: looker_processing_time
      expression: ''
      label: Average of Looker Processing Time
      type: average
      _kind_hint: measure
      _type_hint: number
    - category: table_calculation
      expression: if((${average_of_async_processing}-${average_of_execute_main_query})/${average_of_async_processing}
        >0,(${average_of_async_processing}-${average_of_execute_main_query})/${average_of_async_processing},0)
      label: Looker Overhead
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: looker_overhead_1
      _type_hint: number
      is_disabled: true
    - category: measure
      expression: ''
      label: Average of Execute Main Query
      based_on: query_metrics.execute_main_query
      _kind_hint: measure
      measure: average_of_execute_main_query
      type: average
      _type_hint: number
      filters:
        query_metrics.execute_main_query: not null
    - category: measure
      expression: ''
      label: Average of Async Processing
      based_on: query_metrics.async_processing
      _kind_hint: measure
      measure: average_of_async_processing
      type: average
      _type_hint: number
      filters:
        query_metrics.async_processing: not null
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: history.query_run_count_drill,
            id: history.query_run_count_drill, name: Query Run Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: '', orientation: bottom, series: [{axisId: looker_overhead_1,
            id: looker_overhead_1, name: Looker Overhead}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Indicative Looker Overhead
    comparison_label: 'Model Init: From Cache'
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    hidden_pivots: {}
    value_labels: legend
    label_type: labPer
    show_null_points: true
    interpolation: linear
    truncate_column_names: false
    hidden_fields:
    listen:
      Date: history.created_date
      Model: query.model
      Explore: query.view
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Result Source (Cache/DB): history.result_source
      Dashboard Name: dashboard.title
      Connection Name: history.connection_name
      Runtime Tiers in Seconds: history.runtime_tiers
      Row Limit: query.limit
      User: user.name
    row: 89
    col: 12
    width: 12
    height: 11
  - title: Cache Percentage
    name: Cache Percentage
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [history.query_run_count_drill, history.database_result_query_count]
    filters:
      history.result_source: ''
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_async_runtime_value_populated
      args:
      - query_metrics.async_processing
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 279
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      description: ''
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: was_per_user_throttling_applied_yesno
      args:
      - query_metrics.per_user_throttler
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 295
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - category: table_calculation
      expression: 1-(${history.database_result_query_count}/${history.query_run_count_drill})
      label: Cache Percent
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: cache_percent
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Cache Percentage
    comparison_label: Queries From Database
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: The percentage of queries taken from cache. This is the total number
      of where results were not sourced from the database and instead queried directly
      from previous results in Looker.
    hidden_fields: [history.query_run_count_drill, history.database_result_query_count]
    listen:
      Workspace ID: history.workspace_id
      Source: history.source
      Date: history.created_date
      Model: query.model
      Explore: query.view
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Dashboard Name: dashboard.title
      Connection Name: history.connection_name
      Runtime Tiers in Seconds: history.runtime_tiers
      Row Limit: query.limit
      User: user.name
      Status: history.status
    row: 4
    col: 20
    width: 4
    height: 4
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: Timeseries
    body_text: ''
    row: 27
    col: 0
    width: 24
    height: 3
  - title: Load Process and Stream Main Query
    name: Load Process and Stream Main Query
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [average_of_load_process_and_stream_main_query, history.query_run_count_drill]
    filters:
      query_metrics.load_process_and_stream_main_query: ">0"
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_async_runtime_value_populated
      args:
      - query_metrics.async_processing
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 144
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - _kind_hint: measure
      _type_hint: number
      based_on: query_metrics.load_grand_totals_query_in_memory
      expression: ''
      label: Average of Load Grand Totals Query In Memory
      measure: average_of_load_grand_totals_query_in_memory
      type: average
    - _kind_hint: measure
      _type_hint: number
      based_on: query_metrics.load_row_totals_query_in_memory
      expression: ''
      label: Average of Load Row Totals Query In Memory
      measure: average_of_load_row_totals_query_in_memory
      type: average
    - _kind_hint: measure
      _type_hint: number
      based_on: query_metrics.load_process_and_stream_main_query
      expression: ''
      label: Average of Load Process and Stream Main Query
      measure: average_of_load_process_and_stream_main_query
      type: average
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Load Process and Stream Main Query
    comparison_label: Load Process & Stream Main Query Count
    conditional_formatting: [{type: greater than, value: 0.2383, background_color: "#FFFFFF",
        font_color: "#F7930D",
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: This metric only applies to streamed queries. It tracks the time it
      takes in seconds to load the main query from the database, process it in Looker
      and stream it to the browser.
    listen:
      Workspace ID: history.workspace_id
      Source: history.source
      Date: history.created_date
      Model: query.model
      Explore: query.view
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Result Source (Cache/DB): history.result_source
      Dashboard Name: dashboard.title
      Connection Name: history.connection_name
      Runtime Tiers in Seconds: history.runtime_tiers
      Row Limit: query.limit
      User: user.name
      Status: history.status
    row: 18
    col: 0
    width: 4
    height: 4
  - title: Acquire Connection Average (Copy)
    name: Acquire Connection Average (Copy)
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.load_main_query_in_memory_average, history.query_run_count_drill]
    filters:
      query_metrics.load_main_query_in_memory: ">0"
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_async_runtime_value_populated
      args:
      - query_metrics.async_processing
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 144
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Load Main Query in Memory
    comparison_label: Load Main Query Queries
    conditional_formatting: [{type: greater than, value: 0.2383, background_color: "#FFFFFF",
        font_color: "#F7930D",
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: This metric only applies to non-streamed queries. It tracks the time
      it takes in seconds to load the main query results in memory from the source
      database.
    listen:
      Workspace ID: history.workspace_id
      Source: history.source
      Date: history.created_date
      Model: query.model
      Explore: query.view
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Result Source (Cache/DB): history.result_source
      Dashboard Name: dashboard.title
      Connection Name: history.connection_name
      Runtime Tiers in Seconds: history.runtime_tiers
      Row Limit: query.limit
      User: user.name
      Status: history.status
    row: 18
    col: 4
    width: 4
    height: 4
  - title: Load Grand Totals in Query in Memory
    name: Load Grand Totals in Query in Memory
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [average_of_load_grand_totals_query_in_memory, history.query_run_count_drill]
    filters:
      query_metrics.load_grand_totals_query_in_memory: ">0"
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_async_runtime_value_populated
      args:
      - query_metrics.async_processing
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 144
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - _kind_hint: measure
      _type_hint: number
      based_on: query_metrics.load_grand_totals_query_in_memory
      expression: ''
      label: Average of Load Grand Totals Query In Memory
      measure: average_of_load_grand_totals_query_in_memory
      type: average
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Load Grand Totals In Memory Queries
    comparison_label: Load Grand Totals Queries
    conditional_formatting: [{type: greater than, value: 0.2383, background_color: "#FFFFFF",
        font_color: "#F7930D",
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: This metric only applies to non-streamed queries and those with totals
      and row totals enabled. It tracks the time it takes in seconds to load the grand
      total query result in memory from the source database.
    listen:
      Workspace ID: history.workspace_id
      Source: history.source
      Date: history.created_date
      Model: query.model
      Explore: query.view
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Result Source (Cache/DB): history.result_source
      Dashboard Name: dashboard.title
      Connection Name: history.connection_name
      Runtime Tiers in Seconds: history.runtime_tiers
      Row Limit: query.limit
      User: user.name
      Status: history.status
    row: 18
    col: 16
    width: 4
    height: 4
  - name: Post-Query Execution Phase
    type: text
    title_text: Post-Query Execution Phase
    subtitle_text: ''
    body_text: ''
    row: 22
    col: 0
    width: 24
    height: 1
  - title: Load Total Query in Memory
    name: Load Total Query in Memory
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [average_of_load_totals_query_in_memory, history.query_run_count_drill]
    filters:
      query_metrics.load_totals_query_in_memory: ">0"
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_async_runtime_value_populated
      args:
      - query_metrics.async_processing
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 144
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - _kind_hint: measure
      _type_hint: number
      based_on: query_metrics.load_totals_query_in_memory
      expression: ''
      label: Average of Load Totals Query In Memory
      measure: average_of_load_totals_query_in_memory
      type: average
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Load Total Query in Memory
    comparison_label: Load Totals Queries
    conditional_formatting: [{type: greater than, value: 0.2383, background_color: "#FFFFFF",
        font_color: "#F7930D",
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: This metric only applies to non-streamed queries and those with totals
      enabled. It tracks the time it takes in seconds to load the total query results
      in memory from the source database.
    listen:
      Workspace ID: history.workspace_id
      Source: history.source
      Date: history.created_date
      Model: query.model
      Explore: query.view
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Result Source (Cache/DB): history.result_source
      Dashboard Name: dashboard.title
      Connection Name: history.connection_name
      Runtime Tiers in Seconds: history.runtime_tiers
      Row Limit: query.limit
      User: user.name
      Status: history.status
    row: 18
    col: 8
    width: 4
    height: 4
  - title: Load Grand Totals in Query in Memory (Copy)
    name: Load Grand Totals in Query in Memory (Copy)
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [average_of_load_row_totals_query_in_memory, history.query_run_count_drill]
    filters:
      query_metrics.load_row_totals_query_in_memory: ">0"
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_async_runtime_value_populated
      args:
      - query_metrics.async_processing
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 144
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - _kind_hint: measure
      _type_hint: number
      based_on: query_metrics.load_grand_totals_query_in_memory
      expression: ''
      label: Average of Load Grand Totals Query In Memory
      measure: average_of_load_grand_totals_query_in_memory
      type: average
    - _kind_hint: measure
      _type_hint: number
      based_on: query_metrics.load_row_totals_query_in_memory
      expression: ''
      label: Average of Load Row Totals Query In Memory
      measure: average_of_load_row_totals_query_in_memory
      type: average
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Load Row Totals Query in Memory
    comparison_label: Load Row Totals Queries
    conditional_formatting: [{type: greater than, value: 0.2383, background_color: "#FFFFFF",
        font_color: "#F7930D",
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: This metric only applies to non-streamed queries and those with row
      totals enabled. It tracks the time it takes in seconds to load the row total
      query results in memory from the source database.
    listen:
      Workspace ID: history.workspace_id
      Source: history.source
      Date: history.created_date
      Model: query.model
      Explore: query.view
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Result Source (Cache/DB): history.result_source
      Dashboard Name: dashboard.title
      Connection Name: history.connection_name
      Runtime Tiers in Seconds: history.runtime_tiers
      Row Limit: query.limit
      User: user.name
      Status: history.status
    row: 18
    col: 12
    width: 4
    height: 4
  - title: Load Grand Totals in Query in Memory (Copy 2)
    name: Load Grand Totals in Query in Memory (Copy 2)
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.cache_load_average, history.query_run_count_drill]
    filters:
      query_metrics.cache_load: ">0"
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_async_runtime_value_populated
      args:
      - query_metrics.async_processing
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 144
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - _kind_hint: measure
      _type_hint: number
      based_on: query_metrics.load_grand_totals_query_in_memory
      expression: ''
      label: Average of Load Grand Totals Query In Memory
      measure: average_of_load_grand_totals_query_in_memory
      type: average
    - _kind_hint: measure
      _type_hint: number
      based_on: query_metrics.load_row_totals_query_in_memory
      expression: ''
      label: Average of Load Row Totals Query In Memory
      measure: average_of_load_row_totals_query_in_memory
      type: average
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Cache Load
    comparison_label: Cache Load Queries
    conditional_formatting: [{type: greater than, value: 0.2383, background_color: "#FFFFFF",
        font_color: "#F7930D",
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: 'This metric only applies to cached queries. It tracks the time it
      takes to pull raw results from the result set cache. '
    listen:
      Workspace ID: history.workspace_id
      Source: history.source
      Date: history.created_date
      Model: query.model
      Explore: query.view
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Result Source (Cache/DB): history.result_source
      Dashboard Name: dashboard.title
      Connection Name: history.connection_name
      Runtime Tiers in Seconds: history.runtime_tiers
      Row Limit: query.limit
      User: user.name
      Status: history.status
    row: 18
    col: 20
    width: 4
    height: 4
  - title: Stream To Cache Time (Copy)
    name: Stream To Cache Time (Copy)
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.postprocessing_average, history.query_run_count_drill]
    filters:
      query_metrics.post_processing: ">0"
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_async_runtime_value_populated
      args:
      - query_metrics.async_processing
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 649
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      description: ''
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: was_per_user_throttling_applied_yesno
      args:
      - query_metrics.per_user_throttler
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 665
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Post Processing Time
    comparison_label: Post Processing Queries
    conditional_formatting: [{type: greater than, value: 0.2234, background_color: "#FFFFFF",
        font_color: "#F7930D",
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: This is the amount of time taken to format and stream results to the
      user browser cache and should be present in most queries. The recommended benchmark
      is 0.2234s. If higher, review the number of custom dimensions and measures &
      table calculations, use of pivots, use of merged queries and row limits within
      high throughput dashboards. Identify if custom dimensions and measures can be
      moved back into your Lookml model, if pivots are optimised to include only necessary
      information. Can merged queries be removed via creation of new explores and
      that row limits are in line with requirements. For example if using a single
      value visualisation. Ensure that you are not querying with a limit to 5000 rows.
    listen:
      Workspace ID: history.workspace_id
      Source: history.source
      Date: history.created_date
      Model: query.model
      Explore: query.view
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Result Source (Cache/DB): history.result_source
      Dashboard Name: dashboard.title
      Connection Name: history.connection_name
      Runtime Tiers in Seconds: history.runtime_tiers
      Row Limit: query.limit
      User: user.name
      Status: history.status
    row: 23
    col: 12
    width: 12
    height: 4
  - name: High Level Performance Metrics
    type: text
    title_text: High Level Performance Metrics
    subtitle_text: ''
    body_text: ''
    row: 2
    col: 0
    width: 24
    height: 2
  - title: Query By Source
    name: Query By Source
    model: system__activity
    explore: query_metrics
    type: looker_pie
    fields: [query_metrics.count, history.source]
    filters:
      is_async_runtime_value_populated: 'Yes'
    sorts: [query_metrics.count desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_async_runtime_value_populated
      args:
      - query_metrics.async_processing
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 724
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      description: ''
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: was_per_user_throttling_applied_yesno
      args:
      - query_metrics.per_user_throttler
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 740
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    value_labels: legend
    label_type: labPer
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Stream to Cache Time
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: 'Model Init: From Cache'
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: 'The number of queries to which Per user throttling was applied. '
    listen:
      Workspace ID: history.workspace_id
      Source: history.source
      Date: history.created_date
      Model: query.model
      Explore: query.view
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Result Source (Cache/DB): history.result_source
      Dashboard Name: dashboard.title
      Connection Name: history.connection_name
      Runtime Tiers in Seconds: history.runtime_tiers
      Row Limit: query.limit
      User: user.name
      Status: history.status
    row: 51
    col: 8
    width: 8
    height: 13
  - title: Query By Status
    name: Query By Status
    model: system__activity
    explore: query_metrics
    type: looker_pie
    fields: [query_metrics.count, history.status]
    filters:
      is_async_runtime_value_populated: 'Yes'
    sorts: [query_metrics.count desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_async_runtime_value_populated
      args:
      - query_metrics.async_processing
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 724
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      description: ''
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: was_per_user_throttling_applied_yesno
      args:
      - query_metrics.per_user_throttler
      - - label: 'Yes'
          filter: ">0"
          __FILE: google-pso-healthcheck/dashboards/google_pso__performance_metrics.dashboard.lookml
          __LINE_NUM: 740
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    value_labels: legend
    label_type: labPer
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Stream to Cache Time
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: 'Model Init: From Cache'
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: 'The number of queries to which Per user throttling was applied. '
    listen:
      Workspace ID: history.workspace_id
      Source: history.source
      Date: history.created_date
      Model: query.model
      Explore: query.view
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Result Source (Cache/DB): history.result_source
      Dashboard Name: dashboard.title
      Connection Name: history.connection_name
      Runtime Tiers in Seconds: history.runtime_tiers
      Row Limit: query.limit
      User: user.name
    row: 51
    col: 16
    width: 8
    height: 13
  filters:
  - name: Date
    title: Date
    type: field_filter
    default_value: 30 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: system__activity
    explore: query_metrics
    listens_to_filters: []
    field: history.created_date
  - name: Connection Name
    title: Connection Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: system__activity
    explore: history
    listens_to_filters: []
    field: history.connection_name
  - name: Model
    title: Model
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: system__activity
    explore: query_metrics
    listens_to_filters: [Dashboard Name, Explore, User]
    field: query.model
  - name: Explore
    title: Explore
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: system__activity
    explore: query_metrics
    listens_to_filters: [Dashboard Name, Model, User]
    field: query.view
  - name: Dashboard Name
    title: Dashboard Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: system__activity
    explore: query_metrics
    listens_to_filters: [Model, Explore, User]
    field: dashboard.title
  - name: Status
    title: Status
    type: field_filter
    default_value: complete
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: system__activity
    explore: query_metrics
    listens_to_filters: []
    field: history.status
  - name: Workspace ID
    title: Workspace ID
    type: field_filter
    default_value: production
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: system__activity
    explore: query_metrics
    listens_to_filters: []
    field: history.workspace_id
  - name: Source
    title: Source
    type: field_filter
    default_value: -"scheduled_task",-suggest
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: system__activity
    explore: query_metrics
    listens_to_filters: []
    field: history.source
  - name: User
    title: User
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: system__activity
    explore: query_metrics
    listens_to_filters: [Dashboard Name, Model, Explore]
    field: user.name
  - name: Result Source (Cache/DB)
    title: Result Source (Cache/DB)
    type: field_filter
    default_value: query
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: system__activity
    explore: query_metrics
    listens_to_filters: []
    field: history.result_source
  - name: Dialect
    title: Dialect
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: system__activity
    explore: history
    listens_to_filters: []
    field: history.dialect
  - name: Query Created Hour of Day
    title: Query Created Hour of Day
    type: field_filter
    default_value: "[0,23]"
    allow_multiple_values: true
    required: false
    ui_config:
      type: range_slider
      display: inline
      options:
        min: 0
        max: 23
    model: system__activity
    explore: history
    listens_to_filters: []
    field: history.created_hour_of_day
  - name: Runtime Tiers in Seconds
    title: Runtime Tiers in Seconds
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: system__activity
    explore: history
    listens_to_filters: []
    field: history.runtime_tiers
  - name: Row Limit
    title: Row Limit
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: system__activity
    explore: query_metrics
    listens_to_filters: []
    field: query.limit
