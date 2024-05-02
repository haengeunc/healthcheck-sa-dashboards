---
- dashboard: google_cloud__query_outliers
  title: Google Cloud - Query Outliers
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  preferred_slug: M7pGq4cLpci8XiFOTXVw5l
  elements:
  - title: Async Processing time
    name: Async Processing time
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.async_processing, query.link]
    sorts: [query_metrics.async_processing desc]
    limit: 1
    column_limit: 50
    query_timezone: Europe/London
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Async Query Time
    show_view_names: false
    defaults_version: 1
    listen:
      Created Date: history.created_date
      Explore: query.view
      Dashboard: dashboard.title
      Source: history.issuer_source
      Dev/Prod Mode: history.workspace_id
      User: user.name
      Connection Name: history.connection_name
      Result Source: history.result_source
      Prepare: query_metrics.prepare
      Dialect: history.dialect
    row: 7
    col: 0
    width: 3
    height: 4
  - title: Queue Time
    name: Queue Time
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.queued, query.link]
    sorts: [query_metrics.queued desc]
    limit: 1
    column_limit: 50
    query_timezone: Europe/London
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Queue Time
    show_view_names: false
    defaults_version: 1
    listen:
      Created Date: history.created_date
      Explore: query.view
      Dashboard: dashboard.title
      Source: history.issuer_source
      Dev/Prod Mode: history.workspace_id
      User: user.name
      Connection Name: history.connection_name
      Result Source: history.result_source
      Prepare: query_metrics.prepare
      Dialect: history.dialect
    row: 7
    col: 3
    width: 3
    height: 4
  - title: Acquire Connection
    name: Acquire Connection
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.acquire_connection, query.link]
    sorts: [query_metrics.acquire_connection desc]
    limit: 1
    column_limit: 50
    query_timezone: Europe/London
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Acquire Connection
    comparison_label: "'"
    show_view_names: false
    defaults_version: 1
    listen:
      Created Date: history.created_date
      Explore: query.view
      Dashboard: dashboard.title
      Source: history.issuer_source
      Dev/Prod Mode: history.workspace_id
      User: user.name
      Connection Name: history.connection_name
      Result Source: history.result_source
      Prepare: query_metrics.prepare
      Dialect: history.dialect
    row: 7
    col: 8
    width: 3
    height: 4
  - title: Connection Held
    name: Connection Held
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.connection_held, query.link]
    sorts: [query_metrics.connection_held desc]
    limit: 1
    column_limit: 50
    query_timezone: Europe/London
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Connection Held
    comparison_label: "'"
    show_view_names: false
    defaults_version: 1
    listen:
      Created Date: history.created_date
      Explore: query.view
      Dashboard: dashboard.title
      Source: history.issuer_source
      Dev/Prod Mode: history.workspace_id
      User: user.name
      Connection Name: history.connection_name
      Result Source: history.result_source
      Prepare: query_metrics.prepare
      Dialect: history.dialect
    row: 7
    col: 11
    width: 3
    height: 4
  - title: Per-User Throttler
    name: Per-User Throttler
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.per_user_throttler, query.link]
    sorts: [query_metrics.per_user_throttler desc]
    limit: 1
    column_limit: 50
    query_timezone: Europe/London
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Per User Throttler
    comparison_label: "'"
    show_view_names: false
    defaults_version: 1
    listen:
      Created Date: history.created_date
      Explore: query.view
      Dashboard: dashboard.title
      Source: history.issuer_source
      Dev/Prod Mode: history.workspace_id
      User: user.name
      Connection Name: history.connection_name
      Result Source: history.result_source
      Prepare: query_metrics.prepare
      Dialect: history.dialect
    row: 7
    col: 14
    width: 3
    height: 4
  - title: Explore Init - Computed
    name: Explore Init - Computed
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.explore_init, query.link]
    sorts: [query_metrics.explore_init desc]
    limit: 1
    column_limit: 50
    query_timezone: Europe/London
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: 'Explore Init: Computed'
    comparison_label: "'"
    show_view_names: false
    defaults_version: 1
    listen:
      Created Date: history.created_date
      Explore: query.view
      Dashboard: dashboard.title
      Source: history.issuer_source
      Dev/Prod Mode: history.workspace_id
      User: user.name
      Connection Name: history.connection_name
      Result Source: history.result_source
      Prepare: query_metrics.prepare
      Dialect: history.dialect
    row: 11
    col: 18
    width: 3
    height: 4
  - title: New Tile
    name: New Tile
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.marshalled_cache_load, query.link]
    sorts: [query_metrics.marshalled_cache_load desc]
    limit: 1
    column_limit: 50
    query_timezone: Europe/London
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: 'Explore Init: From Cache'
    comparison_label: "'"
    show_view_names: false
    defaults_version: 1
    listen:
      Created Date: history.created_date
      Explore: query.view
      Dashboard: dashboard.title
      Source: history.issuer_source
      Dev/Prod Mode: history.workspace_id
      User: user.name
      Connection Name: history.connection_name
      Result Source: history.result_source
      Prepare: query_metrics.prepare
      Dialect: history.dialect
    row: 11
    col: 21
    width: 3
    height: 4
  - title: 'Model Init: Computed'
    name: 'Model Init: Computed'
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.model_init_computed, query.link]
    sorts: [query_metrics.model_init_computed desc]
    limit: 1
    column_limit: 50
    query_timezone: Europe/London
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: 'Model Init: Computed'
    comparison_label: "'"
    show_view_names: false
    defaults_version: 1
    listen:
      Created Date: history.created_date
      Explore: query.view
      Dashboard: dashboard.title
      Source: history.issuer_source
      Dev/Prod Mode: history.workspace_id
      User: user.name
      Connection Name: history.connection_name
      Result Source: history.result_source
      Prepare: query_metrics.prepare
      Dialect: history.dialect
    row: 7
    col: 18
    width: 3
    height: 4
  - title: 'Model Init: From Cache'
    name: 'Model Init: From Cache'
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.model_init_cache, query.link]
    sorts: [query_metrics.model_init_cache desc]
    limit: 1
    column_limit: 50
    query_timezone: Europe/London
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: 'Model Init: From Cache'
    comparison_label: "'"
    show_view_names: false
    defaults_version: 1
    listen:
      Created Date: history.created_date
      Explore: query.view
      Dashboard: dashboard.title
      Source: history.issuer_source
      Dev/Prod Mode: history.workspace_id
      User: user.name
      Connection Name: history.connection_name
      Result Source: history.result_source
      Prepare: query_metrics.prepare
      Dialect: history.dialect
    row: 7
    col: 21
    width: 3
    height: 4
  - title: Prepare
    name: Prepare
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.prepare, query.link]
    sorts: [query_metrics.prepare desc]
    limit: 1
    column_limit: 50
    query_timezone: Europe/London
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Prepare
    comparison_label: "'"
    show_view_names: false
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: 'Prepare is the amount of time spent creating a sql query following
      LookML validation. '
    listen:
      Created Date: history.created_date
      Explore: query.view
      Dashboard: dashboard.title
      Source: history.issuer_source
      Dev/Prod Mode: history.workspace_id
      User: user.name
      Connection Name: history.connection_name
      Result Source: history.result_source
      Dialect: history.dialect
    row: 15
    col: 19
    width: 4
    height: 3
  - title: Cache Load
    name: Cache Load
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.cache_load, query.link]
    sorts: [query_metrics.cache_load desc]
    limit: 1
    column_limit: 50
    query_timezone: Europe/London
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Cache Load
    comparison_label: "'"
    show_view_names: false
    defaults_version: 1
    listen:
      Created Date: history.created_date
      Explore: query.view
      Dashboard: dashboard.title
      Source: history.issuer_source
      Dev/Prod Mode: history.workspace_id
      User: user.name
      Connection Name: history.connection_name
      Result Source: history.result_source
      Prepare: query_metrics.prepare
      Dialect: history.dialect
    row: 13
    col: 0
    width: 3
    height: 4
  - title: Execute Main Query
    name: Execute Main Query
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.execute_main_query, query.link]
    sorts: [query_metrics.execute_main_query desc]
    limit: 1
    column_limit: 50
    query_timezone: Europe/London
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Execute Main Query
    comparison_label: "'"
    show_view_names: false
    defaults_version: 1
    listen:
      Created Date: history.created_date
      Explore: query.view
      Dashboard: dashboard.title
      Source: history.issuer_source
      Dev/Prod Mode: history.workspace_id
      User: user.name
      Connection Name: history.connection_name
      Result Source: history.result_source
      Prepare: query_metrics.prepare
      Dialect: history.dialect
    row: 13
    col: 3
    width: 3
    height: 4
  - title: Load Main Query In Memory
    name: Load Main Query In Memory
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.load_main_query_in_memory, query.link]
    sorts: [query_metrics.load_main_query_in_memory desc]
    limit: 1
    column_limit: 50
    query_timezone: Europe/London
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Load Main Query
    comparison_label: "'"
    show_view_names: false
    defaults_version: 1
    listen:
      Created Date: history.created_date
      Explore: query.view
      Dashboard: dashboard.title
      Source: history.issuer_source
      Dev/Prod Mode: history.workspace_id
      User: user.name
      Connection Name: history.connection_name
      Result Source: history.result_source
      Prepare: query_metrics.prepare
      Dialect: history.dialect
    row: 17
    col: 3
    width: 3
    height: 4
  - title: Load Process and Stream Main Query
    name: Load Process and Stream Main Query
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.load_process_and_stream_main_query, query.link]
    sorts: [query_metrics.load_process_and_stream_main_query desc]
    limit: 1
    column_limit: 50
    query_timezone: Europe/London
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Process and Stream
    comparison_label: "'"
    show_view_names: false
    defaults_version: 1
    listen:
      Created Date: history.created_date
      Explore: query.view
      Dashboard: dashboard.title
      Source: history.issuer_source
      Dev/Prod Mode: history.workspace_id
      User: user.name
      Connection Name: history.connection_name
      Result Source: history.result_source
      Prepare: query_metrics.prepare
      Dialect: history.dialect
    row: 17
    col: 0
    width: 3
    height: 4
  - title: Execute Grand Totals Query
    name: Execute Grand Totals Query
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.execute_grand_totals_query, query.link]
    sorts: [query_metrics.execute_grand_totals_query desc]
    limit: 1
    column_limit: 50
    query_timezone: Europe/London
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Execute Grand Totals Query
    comparison_label: "'"
    show_view_names: false
    defaults_version: 1
    listen:
      Created Date: history.created_date
      Explore: query.view
      Dashboard: dashboard.title
      Source: history.issuer_source
      Dev/Prod Mode: history.workspace_id
      User: user.name
      Connection Name: history.connection_name
      Result Source: history.result_source
      Prepare: query_metrics.prepare
      Dialect: history.dialect
    row: 13
    col: 8
    width: 3
    height: 4
  - title: Execute Row Totals Query
    name: Execute Row Totals Query
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.execute_row_totals_query, query.link]
    sorts: [query_metrics.execute_row_totals_query desc]
    limit: 1
    column_limit: 50
    query_timezone: Europe/London
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Execute Row Totals Query
    comparison_label: "'"
    show_view_names: false
    defaults_version: 1
    listen:
      Created Date: history.created_date
      Explore: query.view
      Dashboard: dashboard.title
      Source: history.issuer_source
      Dev/Prod Mode: history.workspace_id
      User: user.name
      Connection Name: history.connection_name
      Result Source: history.result_source
      Prepare: query_metrics.prepare
      Dialect: history.dialect
    row: 13
    col: 11
    width: 3
    height: 4
  - title: Execute Totals Query
    name: Execute Totals Query
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.execute_totals_query, query.link]
    sorts: [query_metrics.execute_totals_query desc]
    limit: 1
    column_limit: 50
    query_timezone: Europe/London
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Execute Totals Query
    comparison_label: "'"
    show_view_names: false
    defaults_version: 1
    listen:
      Created Date: history.created_date
      Explore: query.view
      Dashboard: dashboard.title
      Source: history.issuer_source
      Dev/Prod Mode: history.workspace_id
      User: user.name
      Connection Name: history.connection_name
      Result Source: history.result_source
      Prepare: query_metrics.prepare
      Dialect: history.dialect
    row: 13
    col: 14
    width: 3
    height: 4
  - title: Load Grand Totals Query In Memory
    name: Load Grand Totals Query In Memory
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.load_grand_totals_query_in_memory, query.link]
    sorts: [query_metrics.load_grand_totals_query_in_memory desc]
    limit: 1
    column_limit: 50
    query_timezone: Europe/London
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Load Grand Totals
    comparison_label: "'"
    show_view_names: false
    defaults_version: 1
    listen:
      Created Date: history.created_date
      Explore: query.view
      Dashboard: dashboard.title
      Source: history.issuer_source
      Dev/Prod Mode: history.workspace_id
      User: user.name
      Connection Name: history.connection_name
      Result Source: history.result_source
      Prepare: query_metrics.prepare
      Dialect: history.dialect
    row: 17
    col: 8
    width: 3
    height: 4
  - title: Load Row Totals Query In Memory
    name: Load Row Totals Query In Memory
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.load_row_totals_query_in_memory, query.link]
    sorts: [query_metrics.load_row_totals_query_in_memory desc]
    limit: 1
    column_limit: 50
    query_timezone: Europe/London
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Load Row Totals Query In Memory
    comparison_label: "'"
    show_view_names: false
    defaults_version: 1
    listen:
      Created Date: history.created_date
      Explore: query.view
      Dashboard: dashboard.title
      Source: history.issuer_source
      Dev/Prod Mode: history.workspace_id
      User: user.name
      Connection Name: history.connection_name
      Result Source: history.result_source
      Prepare: query_metrics.prepare
      Dialect: history.dialect
    row: 17
    col: 11
    width: 3
    height: 4
  - title: Load Totals Query In Memory
    name: Load Totals Query In Memory
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.load_totals_query_in_memory, query.link]
    sorts: [query_metrics.load_totals_query_in_memory desc]
    limit: 1
    column_limit: 50
    query_timezone: Europe/London
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Load Totals Query In Memory
    comparison_label: "'"
    show_view_names: false
    defaults_version: 1
    listen:
      Created Date: history.created_date
      Explore: query.view
      Dashboard: dashboard.title
      Source: history.issuer_source
      Dev/Prod Mode: history.workspace_id
      User: user.name
      Connection Name: history.connection_name
      Result Source: history.result_source
      Prepare: query_metrics.prepare
      Dialect: history.dialect
    row: 17
    col: 14
    width: 3
    height: 4
  - title: PDTs
    name: PDTs
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.pdt, query.link]
    sorts: [query_metrics.pdt desc]
    limit: 1
    column_limit: 50
    query_timezone: Europe/London
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: PDTs
    comparison_label: "'"
    show_view_names: false
    defaults_version: 1
    listen:
      Created Date: history.created_date
      Explore: query.view
      Dashboard: dashboard.title
      Source: history.issuer_source
      Dev/Prod Mode: history.workspace_id
      User: user.name
      Connection Name: history.connection_name
      Result Source: history.result_source
      Prepare: query_metrics.prepare
      Dialect: history.dialect
    row: 21
    col: 11
    width: 3
    height: 2
  - title: Postprocessing
    name: Postprocessing
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.post_processing, query.link]
    sorts: [query_metrics.post_processing desc]
    limit: 1
    column_limit: 50
    query_timezone: Europe/London
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Postprocessing
    comparison_label: "'"
    show_view_names: false
    defaults_version: 1
    listen:
      Created Date: history.created_date
      Explore: query.view
      Dashboard: dashboard.title
      Source: history.issuer_source
      Dev/Prod Mode: history.workspace_id
      User: user.name
      Connection Name: history.connection_name
      Result Source: history.result_source
      Prepare: query_metrics.prepare
      Dialect: history.dialect
    row: 25
    col: 0
    width: 3
    height: 4
  - title: Stream to Cache
    name: Stream to Cache
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.stream_to_cache, query.link]
    sorts: [query_metrics.stream_to_cache desc]
    limit: 1
    column_limit: 50
    query_timezone: Europe/London
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Stream to Cache
    comparison_label: "'"
    show_view_names: false
    defaults_version: 1
    listen:
      Created Date: history.created_date
      Explore: query.view
      Dashboard: dashboard.title
      Source: history.issuer_source
      Dev/Prod Mode: history.workspace_id
      User: user.name
      Connection Name: history.connection_name
      Result Source: history.result_source
      Prepare: query_metrics.prepare
      Dialect: history.dialect
    row: 25
    col: 3
    width: 3
    height: 4
  - title: Bottom 20 Performing Queries
    name: Bottom 20 Performing Queries
    model: system__activity
    explore: query_metrics
    type: looker_bar
    fields: [query_metrics.async_processing_average, query.id]
    sorts: [query_metrics.async_processing_average desc]
    limit: 20
    column_limit: 50
    query_timezone: Europe/London
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
    x_axis_zoom: true
    y_axis_zoom: true
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Stream to Cache
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: "'"
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields:
    listen:
      Created Date: history.created_date
      Explore: query.view
      Dashboard: dashboard.title
      Source: history.issuer_source
      Dev/Prod Mode: history.workspace_id
      User: user.name
      Connection Name: history.connection_name
      Result Source: history.result_source
      Prepare: query_metrics.prepare
      Dialect: history.dialect
    row: 32
    col: 0
    width: 8
    height: 16
  - title: Explores by Average Async Runtime
    name: Explores by Average Async Runtime
    model: system__activity
    explore: query_metrics
    type: looker_bar
    fields: [query_metrics.async_processing_average, query.view]
    sorts: [query_metrics.async_processing_average desc]
    limit: 20
    column_limit: 50
    query_timezone: Europe/London
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
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Stream to Cache
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: "'"
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields: []
    listen:
      Created Date: history.created_date
      Explore: query.view
      Dashboard: dashboard.title
      Source: history.issuer_source
      Dev/Prod Mode: history.workspace_id
      User: user.name
      Connection Name: history.connection_name
      Result Source: history.result_source
      Prepare: query_metrics.prepare
      Dialect: history.dialect
    row: 48
    col: 8
    width: 8
    height: 16
  - title: Models by Async Runtime
    name: Models by Async Runtime
    model: system__activity
    explore: query_metrics
    type: looker_bar
    fields: [query_metrics.async_processing_average, query.model]
    sorts: [query_metrics.async_processing_average desc]
    limit: 20
    column_limit: 50
    query_timezone: Europe/London
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
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Stream to Cache
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: "'"
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields: []
    listen:
      Created Date: history.created_date
      Explore: query.view
      Dashboard: dashboard.title
      Source: history.issuer_source
      Dev/Prod Mode: history.workspace_id
      User: user.name
      Connection Name: history.connection_name
      Result Source: history.result_source
      Prepare: query_metrics.prepare
      Dialect: history.dialect
    row: 48
    col: 0
    width: 8
    height: 16
  - title: Dashboards by Async Runtime
    name: Dashboards by Async Runtime
    model: system__activity
    explore: query_metrics
    type: looker_bar
    fields: [query_metrics.async_processing_average, dashboard.title]
    sorts: [query_metrics.async_processing_average desc]
    limit: 20
    column_limit: 50
    query_timezone: Europe/London
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
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Stream to Cache
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: "'"
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields: []
    listen:
      Created Date: history.created_date
      Explore: query.view
      Dashboard: dashboard.title
      Source: history.issuer_source
      Dev/Prod Mode: history.workspace_id
      User: user.name
      Connection Name: history.connection_name
      Result Source: history.result_source
      Prepare: query_metrics.prepare
      Dialect: history.dialect
    row: 48
    col: 16
    width: 8
    height: 16
  - title: Async Runtime by User
    name: Async Runtime by User
    model: system__activity
    explore: query_metrics
    type: looker_bar
    fields: [query_metrics.async_processing_average, user.name]
    sorts: [query_metrics.async_processing_average desc]
    limit: 20
    column_limit: 50
    query_timezone: Europe/London
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
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Stream to Cache
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: "'"
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields: []
    hidden_pivots: {}
    listen:
      Created Date: history.created_date
      Explore: query.view
      Dashboard: dashboard.title
      Source: history.issuer_source
      Dev/Prod Mode: history.workspace_id
      User: user.name
      Connection Name: history.connection_name
      Result Source: history.result_source
      Prepare: query_metrics.prepare
      Dialect: history.dialect
    row: 64
    col: 0
    width: 8
    height: 13
  - title: Warnings
    name: Warnings
    model: system__activity
    explore: query_metrics
    type: looker_single_record
    fields: [query_metrics.combo_warning, query_metrics.combo_recommendations, query_metrics.acquire_connection_recommendation,
      query_metrics.acquire_connection_warning, query_metrics.execute_main_query_recommendation,
      query_metrics.execute_main_query_warning, query_metrics.explore_init_recommendation,
      query_metrics.explore_init_warning, query_metrics.marshalled_cache_load_recommendation,
      query_metrics.marshalled_cache_load_warning, query_metrics.model_init_computed_recommendation,
      query_metrics.model_init_computed_warning, query_metrics.postprocessing_or_stream_to_cache_recommendation,
      query_metrics.postprocessing_warning, query_metrics.prepare_recommendation,
      query_metrics.prepare_warning, query_metrics.stream_to_cache_warning, query_metrics.sorted_warnings]
    sorts: [query_metrics.combo_warning desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    defaults_version: 1
    hidden_pivots: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      Created Date: history.created_date
      Explore: query.view
      Dashboard: dashboard.title
      Source: history.issuer_source
      Dev/Prod Mode: history.workspace_id
      User: user.name
      Connection Name: history.connection_name
      Result Source: history.result_source
      Prepare: query_metrics.prepare
      Dialect: history.dialect
    row: 64
    col: 8
    width: 16
    height: 13
  - name: ''
    type: text
    title_text: ''
    subtitle_text: 'Timings: Asynchronous Worker'
    body_text: ''
    row: 5
    col: 0
    width: 4
    height: 2
  - name: Query Metric Max Runtimes
    type: text
    title_text: Query Metric Max Runtimes
    subtitle_text: 'The worse performing query based on each individual execution
      stage. '
    body_text: "<center>This dashboard is for use in identifying specific design patterns\
      \ which will impact performance as well as identfying outlier issues which increase\
      \ average runtimes and user perception. It should be used as part of Model,\
      \ Explore & Dashboard optimisation. Each tile represents the worst query for\
      \ that metric and has a link to that worst query below the value. </center>"
    row: 2
    col: 0
    width: 24
    height: 3
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: ''
    row: 5
    col: 6
    width: 2
    height: 6
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: 'Timings: Initialization'
    body_text: ''
    row: 5
    col: 17
    width: 6
    height: 2
  - name: " (4)"
    type: text
    title_text: ''
    subtitle_text: 'Timings: Connection Handling'
    body_text: ''
    row: 5
    col: 8
    width: 9
    height: 2
  - name: " (5)"
    type: text
    title_text: ''
    subtitle_text: 'Timings: Main Query'
    body_text: ''
    row: 11
    col: 0
    width: 6
    height: 2
  - name: " (6)"
    type: text
    title_text: ''
    subtitle_text: 'Timings: Post Query'
    body_text: ''
    row: 24
    col: 0
    width: 6
    height: 1
  - name: " (7)"
    type: text
    title_text: ''
    subtitle_text: 'Timings: Misc. Ancillary Queries'
    body_text: ''
    row: 11
    col: 6
    width: 12
    height: 2
  - name: Async Runtime Breakdown
    type: text
    title_text: Async Runtime Breakdown
    subtitle_text: ''
    body_text: ''
    row: 29
    col: 0
    width: 24
    height: 3
  - title: Bottom 20 Performing Queries By Database Query Execution Time
    name: Bottom 20 Performing Queries By Database Query Execution Time
    model: system__activity
    explore: query_metrics
    type: looker_bar
    fields: [query_metrics.execute_main_query_average, query.id]
    sorts: [query_metrics.execute_main_query_average desc]
    limit: 20
    column_limit: 50
    query_timezone: Europe/London
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
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Stream to Cache
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: "'"
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields:
    listen:
      Created Date: history.created_date
      Explore: query.view
      Dashboard: dashboard.title
      Source: history.issuer_source
      Dev/Prod Mode: history.workspace_id
      User: user.name
      Connection Name: history.connection_name
      Result Source: history.result_source
      Prepare: query_metrics.prepare
      Dialect: history.dialect
    row: 32
    col: 8
    width: 8
    height: 16
  - title: Bottom 20 Performing Queries By Looker Processing
    name: Bottom 20 Performing Queries By Looker Processing
    model: system__activity
    explore: query_metrics
    type: looker_bar
    fields: [query.id, average_of_looker_processing]
    sorts: [average_of_looker_processing desc]
    limit: 20
    column_limit: 50
    dynamic_fields:
    - category: dimension
      expression: "${query_metrics.async_processing}-${query_metrics.execute_main_query}"
      label: Looker Overhead Runtime
      value_format:
      value_format_name:
      dimension: looker_overhead_runtime
      _kind_hint: dimension
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of Looker Processing
      based_on: looker_overhead_runtime
      _kind_hint: measure
      measure: average_of_looker_processing
      type: average
      _type_hint: number
    query_timezone: Europe/London
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
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Stream to Cache
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: "'"
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields:
    hidden_pivots: {}
    listen:
      Created Date: history.created_date
      Explore: query.view
      Dashboard: dashboard.title
      Source: history.issuer_source
      Dev/Prod Mode: history.workspace_id
      User: user.name
      Connection Name: history.connection_name
      Result Source: history.result_source
      Prepare: query_metrics.prepare
      Dialect: history.dialect
    row: 32
    col: 16
    width: 8
    height: 16
  - name: " (8)"
    type: text
    title_text: ''
    subtitle_text: Query Counts
    body_text: ''
    row: 24
    col: 6
    width: 18
    height: 1
  - name: " (9)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: ''
    row: 23
    col: 0
    width: 24
    height: 1
  - title: Total Query Count
    name: Total Query Count
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [history.query_run_count_drill, history.cache_result_query_count, history.database_result_query_count]
    limit: 1
    column_limit: 50
    query_timezone: Europe/London
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Total Query Count
    comparison_label: "'"
    show_view_names: false
    defaults_version: 1
    listen:
      Created Date: history.created_date
      Explore: query.view
      Dashboard: dashboard.title
      Source: history.issuer_source
      Dev/Prod Mode: history.workspace_id
      User: user.name
      Connection Name: history.connection_name
      Result Source: history.result_source
      Prepare: query_metrics.prepare
      Dialect: history.dialect
    row: 25
    col: 8
    width: 3
    height: 4
  - title: Total Query Count (Copy 2)
    name: Total Query Count (Copy 2)
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [history.query_run_count_drill, history.cache_result_query_count, history.database_result_query_count]
    limit: 1
    column_limit: 50
    query_timezone: Europe/London
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Database Query Count
    comparison_label: "'"
    show_view_names: false
    defaults_version: 1
    hidden_fields: [history.query_run_count_drill, history.cache_result_query_count]
    listen:
      Created Date: history.created_date
      Explore: query.view
      Dashboard: dashboard.title
      Source: history.issuer_source
      Dev/Prod Mode: history.workspace_id
      User: user.name
      Connection Name: history.connection_name
      Result Source: history.result_source
      Prepare: query_metrics.prepare
      Dialect: history.dialect
    row: 25
    col: 14
    width: 3
    height: 4
  - title: Total Query Count (Copy)
    name: Total Query Count (Copy)
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [history.query_run_count_drill, history.cache_result_query_count, history.database_result_query_count]
    limit: 1
    column_limit: 50
    query_timezone: Europe/London
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Cache Query Count
    comparison_label: "'"
    show_view_names: false
    defaults_version: 1
    hidden_fields: [history.query_run_count_drill]
    listen:
      Created Date: history.created_date
      Explore: query.view
      Dashboard: dashboard.title
      Source: history.issuer_source
      Dev/Prod Mode: history.workspace_id
      User: user.name
      Connection Name: history.connection_name
      Result Source: history.result_source
      Prepare: query_metrics.prepare
      Dialect: history.dialect
    row: 25
    col: 11
    width: 3
    height: 4
  - name: " (10)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <nav style="font-size: 18px; padding: 5px 10px 0 10px; height: 60px">
        <a style="padding: 5px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/healthcheck::google_pso__performance_metrics">Performance Metrics</a>
      <a style="padding: 5px; border-top: solid 1px #4285F4; border-left: solid 1px #4285F4; border-right: solid 1px #4285F4; border-radius: 5px 5px 0 0; float: left; line-height: 40px; font-weight: bold;" href="/dashboards/healthcheck::google_cloud__query_outliers">
      Outliers</a>
        <a style="padding: 5px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/healthcheck::google_pso__history_query_analysis">History</a>
        <a style="padding: 5px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/healthcheck::google_pso__content_delivery">Schedules</a>
        <a style="padding: 5px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/healthcheck::google_pso__merged_queries">Merged Queries</a>
        <a style="padding: 5px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/healthcheck::google_pso__large_dashboards__query_count">Large Dashboards</a>
        <a style="padding: 5px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/healthcheck::google_pso__dashboard_optimisation_">Dashboard Optimisation</a>
      </nav>
    row: 0
    col: 0
    width: 24
    height: 2
  filters:
  - name: Created Date
    title: Created Date
    type: field_filter
    default_value: 7 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: system__activity
    explore: query_metrics
    listens_to_filters: []
    field: history.created_date
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
    listens_to_filters: []
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
    listens_to_filters: []
    field: query.view
  - name: Dashboard
    title: Dashboard
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: system__activity
    explore: query_metrics
    listens_to_filters: []
    field: dashboard.title
  - name: Source
    title: Source
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: system__activity
    explore: query_metrics
    listens_to_filters: []
    field: history.issuer_source
  - name: Dev/Prod Mode
    title: Dev/Prod Mode
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
  - name: User
    title: User
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: system__activity
    explore: query_metrics
    listens_to_filters: []
    field: user.name
  - name: Connection Name
    title: Connection Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: system__activity
    explore: query_metrics
    listens_to_filters: []
    field: history.connection_name
  - name: Result Source
    title: Result Source
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: system__activity
    explore: query_metrics
    listens_to_filters: []
    field: history.result_source
  - name: Prepare
    title: Prepare
    type: field_filter
    default_value: "[0,300]"
    allow_multiple_values: true
    required: false
    ui_config:
      type: range_slider
      display: inline
      options:
        min: 0
        max: 300
    model: system__activity
    explore: query_metrics
    listens_to_filters: []
    field: query_metrics.prepare
  - name: Dialect
    title: Dialect
    type: field_filter
    default_value:
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: system__activity
    explore: query_metrics
    listens_to_filters: []
    field: history.dialect
