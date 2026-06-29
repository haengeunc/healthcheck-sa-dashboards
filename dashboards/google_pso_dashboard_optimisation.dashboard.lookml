---
- dashboard: google_pso__dashboard_optimisation_
  title: 'Google PSO - Dashboard Optimisation '
  layout: newspaper
  preferred_viewer: dashboards-next
  load_configuration: wait
  description: ''
  filters_location_top: false
  preferred_slug: aTCcyoLQqTX8YRx82dzFO0
  elements:
  - title: Stream to Cache
    name: Stream to Cache
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
          __FILE: google-pso-healthcheck/dashboards/google_pso_dashboard_optimisation.dashboard.lookml
          __LINE_NUM: 29
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
          __FILE: google-pso-healthcheck/dashboards/google_pso_dashboard_optimisation.dashboard.lookml
          __LINE_NUM: 45
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
    single_value_title: Stream to Cache Time
    comparison_label: Stream To Cache Queries
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: "Once your query has finished in the database. This is the time it\
      \ takes in seconds to process and stream results to the render cache. This can\
      \ be reduced by reducing the number of pivots & number of Table Calculations\
      \ in the dashboard \n\n"
    listen:
      Created Date: history.created_date
      Model: query.model
      Dev/Prod Mode: history.workspace_id
      Source: history.source
      User Name: user.name
      Explore: query.view
      Query Status: history.status
      Dashboard ID: dashboard.id
    row: 19
    col: 10
    width: 4
    height: 4
  - title: Total Query Tiles
    name: Total Query Tiles
    model: system__activity
    explore: dashboard
    type: single_value
    fields: [dashboard_element.total_query_tiles, dashboard_element.count_text]
    filters:
      dashboard.moved_to_trash: 'No'
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Total Query Tiles
    comparison_label: Number of Text Tiles
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: 'The number of query tiles on the dashboard. '
    listen:
      Model: query.model
      User Name: user.name
      Explore: query.view
      Dashboard ID: dashboard.id
    row: 8
    col: 4
    width: 3
    height: 4
  - title: Last Updated by
    name: Last Updated by
    model: system__activity
    explore: dashboard
    type: single_value
    fields: [user.name, updated_by.name]
    filters:
      dashboard.moved_to_trash: 'No'
    sorts: [updated_by.name]
    limit: 1
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Creator
    comparison_label: Last Updated
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
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Who created this dashboard. If they aren’t available who is the last
      person to update it?
    listen:
      Model: query.model
      User Name: user.name
      Explore: query.view
      Dashboard ID: dashboard.id
    row: 4
    col: 3
    width: 3
    height: 4
  - title: Full Dashboard Completed Runtime
    name: Full Dashboard Completed Runtime
    model: system__activity
    explore: dashboard_performance
    type: single_value
    fields: [dashboard_history_stats.avg_runtime]
    limit: 500
    column_limit: 50
    query_timezone: Europe/London
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Full Dashboard Completed Ave Runtime
    value_format: '0.00'
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
    listen:
      Created Date: history.created_date
      Dev/Prod Mode: history.workspace_id
      Source: history.source
      User Name: user.name
      Query Status: history.status
      Dashboard ID: dashboard.id
    row: 19
    col: 1
    width: 5
    height: 4
  - title: Most Recent Query Date
    name: Most Recent Query Date
    model: system__activity
    explore: dashboard_performance
    type: single_value
    fields: [history.most_recent_query_date]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Last Queried
    show_view_names: false
    defaults_version: 1
    listen:
      Created Date: history.created_date
      Dev/Prod Mode: history.workspace_id
      Source: history.source
      User Name: user.name
      Query Status: history.status
      Dashboard ID: dashboard.id
    row: 15
    col: 1
    width: 4
    height: 4
  - title: Has Date Filters
    name: Has Date Filters
    model: system__activity
    explore: history
    type: single_value
    fields: [history.query_run_count, has_date_filter]
    sorts: [history.query_run_count desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Has Date Filter
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: has_date_filter
      args:
      - query.filters
      - - label: 'Yes'
          filter: "%Date%"
          __FILE: google-pso-healthcheck/dashboards/google_pso_dashboard_optimisation.dashboard.lookml
          __LINE_NUM: 276
        - label: 'Yes'
          filter: "%202%"
          __FILE: google-pso-healthcheck/dashboards/google_pso_dashboard_optimisation.dashboard.lookml
          __LINE_NUM: 280
        - label: 'Yes'
          filter: "%201%"
          __FILE: google-pso-healthcheck/dashboards/google_pso_dashboard_optimisation.dashboard.lookml
          __LINE_NUM: 284
        - label: 'Yes'
          filter: "%date%"
          __FILE: google-pso-healthcheck/dashboards/google_pso_dashboard_optimisation.dashboard.lookml
          __LINE_NUM: 288
        - label: 'Yes'
          filter: "%month%"
          __FILE: google-pso-healthcheck/dashboards/google_pso_dashboard_optimisation.dashboard.lookml
          __LINE_NUM: 292
        - label: 'Yes'
          filter: "%day%"
          __FILE: google-pso-healthcheck/dashboards/google_pso_dashboard_optimisation.dashboard.lookml
          __LINE_NUM: 296
        - label: 'Yes'
          filter: "%hour%"
          __FILE: google-pso-healthcheck/dashboards/google_pso_dashboard_optimisation.dashboard.lookml
          __LINE_NUM: 300
        - label: 'Yes'
          filter: "%week%"
          __FILE: google-pso-healthcheck/dashboards/google_pso_dashboard_optimisation.dashboard.lookml
          __LINE_NUM: 304
        - label: 'Yes'
          filter: "%time%"
          __FILE: google-pso-healthcheck/dashboards/google_pso_dashboard_optimisation.dashboard.lookml
          __LINE_NUM: 308
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Queries with Date Filter
    comparison_label: Queries without Date Filter
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
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [has_date_filter]
    listen:
      Created Date: history.created_date
      Model: query.model
      Dev/Prod Mode: history.workspace_id
      Source: history.source
      User Name: user.name
      Explore: query.view
      Query Status: history.status
      Dashboard ID: dashboard.id
    row: 15
    col: 9
    width: 3
    height: 4
  - title: Dashboard Link
    name: Dashboard Link
    model: system__activity
    explore: history
    type: single_value
    fields: [dashboard.link]
    filters:
      dashboard.link: "-NULL"
    sorts: [dashboard.link]
    limit: 1
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Link
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: "This link will bring you directly to the dashboard. \n"
    listen:
      Created Date: history.created_date
      Model: query.model
      Dev/Prod Mode: history.workspace_id
      Source: history.source
      User Name: user.name
      Explore: query.view
      Query Status: history.status
      Dashboard ID: dashboard.id
    row: 4
    col: 1
    width: 2
    height: 4
  - title: Dashboard Has Filters
    name: Dashboard Has Filters
    model: system__activity
    explore: dashboard_performance
    type: single_value
    fields: [dashboard_has_filters]
    filters:
      dashboard_run_session_filter_usage.filter_json: "-NULL"
    sorts: [dashboard_has_filters]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      expression: if(is_null(${dashboard_run_session_filter_usage.filter_json}),"No","Yes")
      label: Dashboard has Filters
      value_format:
      value_format_name:
      dimension: dashboard_has_filters
      _kind_hint: dimension
      _type_hint: string
    query_timezone: Europe/London
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Has Filters
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
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: 'The more data that is returned in an individual element, the more
      memory resources will be consumed. Dashboard elements that are returned with
      many thousands of data points will use more memory. Ensuring that a filter is
      present ensures that dashboards return data promptly. If the dashboard does
      not have any filters, Consider aggregation if no filters are required and the
      level of usage merits. '
    listen:
      Created Date: history.created_date
      Dev/Prod Mode: history.workspace_id
      Source: history.source
      User Name: user.name
      Query Status: history.status
      Dashboard ID: dashboard.id
    row: 4
    col: 6
    width: 2
    height: 4
  - title: Error Queries
    name: Error Queries
    model: system__activity
    explore: history
    type: single_value
    fields: [history.query_run_count, history.status]
    filters:
      history.status: error
    sorts: [history.status]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Error Queries
    comparison_label: Killed Queries
    defaults_version: 1
    hidden_fields: [history.status]
    note_state: collapsed
    note_display: hover
    note_text: 'The number of Errors generated by the dashboard. Review if there is
      a required filter and dashboard is set to run on load as an initial check and
      query about depreciated schedules if notable '
    listen:
      Created Date: history.created_date
      Model: query.model
      Dev/Prod Mode: history.workspace_id
      Source: history.source
      User Name: user.name
      Explore: query.view
      Dashboard ID: dashboard.id
    row: 15
    col: 19
    width: 5
    height: 4
  - title: Run on Load Enabled
    name: Run on Load Enabled
    model: system__activity
    explore: dashboard
    type: single_value
    fields: [dashboard.run_on_load]
    fill_fields: [dashboard.run_on_load]
    filters:
      dashboard.moved_to_trash: 'No'
    sorts: [dashboard.run_on_load desc]
    limit: 500
    column_limit: 50
    query_timezone: Europe/London
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Run on Load Enabled
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
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: 'If the use case for a dashboard anticipates that the user must update
      filters in order to gain useful insights, turn off run on load feature as this
      prevents sending unnecessary queries to the database. '
    listen:
      Model: query.model
      User Name: user.name
      Explore: query.view
      Dashboard ID: dashboard.id
    row: 4
    col: 8
    width: 3
    height: 4
  - title: Dashboard Run Count
    name: Dashboard Run Count
    model: system__activity
    explore: history
    type: single_value
    fields: [history.dashboard_run_count]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Dashboard Run Count
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: 'The number of times the dashboard has run. '
    listen:
      Created Date: history.created_date
      Model: query.model
      Dev/Prod Mode: history.workspace_id
      Source: history.source
      User Name: user.name
      Explore: query.view
      Query Status: history.status
      Dashboard ID: dashboard.id
    row: 15
    col: 12
    width: 3
    height: 4
  - title: Total Queries
    name: Total Queries
    model: system__activity
    explore: history
    type: single_value
    fields: [history.query_run_count, history.database_result_query_count]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      label: Filtered history.average_runtime
      based_on: history.average_runtime
      _kind_hint: measure
      measure: filtered_historyaverage_runtime
      type: count_distinct
      _type_hint: number
      filters:
        history.result_source: query
    - measure: median_of_runtime_in_seconds
      based_on: history.runtime
      expression: ''
      label: Median of Runtime in Seconds
      type: median
      _kind_hint: measure
      _type_hint: number
    - category: table_calculation
      expression: "${history.database_result_query_count}/${history.query_run_count}"
      label: Cache Ratio
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: cache_ratio
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
    single_value_title: Total Queries
    comparison_label: Queries from Database
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
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [history.database_result_query_count]
    listen:
      Created Date: history.created_date
      Model: query.model
      Dev/Prod Mode: history.workspace_id
      Source: history.source
      User Name: user.name
      Explore: query.view
      Query Status: history.status
      Dashboard ID: dashboard.id
    row: 15
    col: 5
    width: 4
    height: 4
  - title: Explores Used
    name: Explores Used
    model: system__activity
    explore: history
    type: single_value
    fields: [query.count_of_explores, list_of_explore]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: list_of_explore
      based_on: query.view
      expression: ''
      label: List of Explore
      type: list
      _kind_hint: measure
      _type_hint: list
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Number of Explores Used
    show_view_names: false
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: 'Looker Dashboards can source tiles from any number of dashboards.
      Each explore sources its data from one base table and joins other tables as
      necessary. Identify if you can source the same information on a tile from and
      explore which queries less data. E.g. get user detail from a user explore rather
      than transaction. '
    listen:
      Created Date: history.created_date
      Model: query.model
      Dev/Prod Mode: history.workspace_id
      Source: history.source
      User Name: user.name
      Explore: query.view
      Query Status: history.status
      Dashboard ID: dashboard.id
    row: 8
    col: 1
    width: 3
    height: 4
  - title: Max Row Limit From Dashboard
    name: Max Row Limit From Dashboard
    model: system__activity
    explore: history
    type: single_value
    fields: [max_of_row_limit]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: max_of_row_limit
      based_on: query.limit
      expression: ''
      label: Max of Row Limit
      type: max
      _kind_hint: measure
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
    single_value_title: Max Row Limit on Dashboard
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: The maximum number of rows any tile queries. if any are set to 5,000
      or any number beyond 500 review as more data streamed to cache means greater
      memory requirements and Longer runtime
    listen:
      Created Date: history.created_date
      Model: query.model
      Dev/Prod Mode: history.workspace_id
      Source: history.source
      User Name: user.name
      Explore: query.view
      Query Status: history.status
      Dashboard ID: dashboard.id
    row: 15
    col: 15
    width: 4
    height: 4
  - title: Auto Refresh Enabled
    name: Auto Refresh Enabled
    model: system__activity
    explore: history
    type: single_value
    fields: [is_auto_refresh_enabled, dashboard.refresh_interval_ordered, is_auto_refresh_enabled_copy]
    sorts: [is_auto_refresh_enabled desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Is Auto Refresh Enabled
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_auto_refresh_enabled
      args:
      - dashboard.refresh_interval_ordered
      - - label: 'No'
          filter: 'null'
          __FILE: google-pso-healthcheck/dashboards/google_pso_dashboard_optimisation.dashboard.lookml
          __LINE_NUM: 826
      - 'Yes'
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      description: ''
      label: Is Auto Refresh Enabled Copy
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_auto_refresh_enabled_copy
      args:
      - dashboard.refresh_interval_ordered
      - - label: '1'
          filter: 'null'
          __FILE: google-pso-healthcheck/dashboards/google_pso_dashboard_optimisation.dashboard.lookml
          __LINE_NUM: 842
      - '2'
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
    single_value_title: Auto Refresh Enabled
    comparison_label: Refresh Interval
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
    defaults_version: 1
    hidden_fields: [is_auto_refresh_enabled_copy]
    note_state: collapsed
    note_display: hover
    note_text: 'Auto Refresh is a feature which executes all queries on the dashboard
      at a regular interval and bypasses Looker Cache. This can have a significant
      impact on overall Looker performance by occupying query slots and creating a
      queue of queries. Auto Refresh should only be enabled for dashboards which are
      shown on public displays or trading desks.  '
    listen:
      Created Date: history.created_date
      Model: query.model
      Dev/Prod Mode: history.workspace_id
      Source: history.source
      User Name: user.name
      Explore: query.view
      Query Status: history.status
      Dashboard ID: dashboard.id
    row: 8
    col: 10
    width: 3
    height: 4
  - title: Has Custom Fields
    name: Has Custom Fields
    model: system__activity
    explore: history
    type: single_value
    fields: [has_custom_fields, has_custom_fields_sort, history.query_run_count]
    filters:
      history.query_run_count: ">1"
    sorts: [has_custom_fields_sort]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Has Custom Fields
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: has_custom_fields
      args:
      - query.dynamic_fields
      - - label: 'No'
          filter: "[]"
          __FILE: google-pso-healthcheck/dashboards/google_pso_dashboard_optimisation.dashboard.lookml
          __LINE_NUM: 930
        - label: 'No'
          filter: 'NULL'
          __FILE: google-pso-healthcheck/dashboards/google_pso_dashboard_optimisation.dashboard.lookml
          __LINE_NUM: 934
      - 'Yes'
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      description: ''
      label: Has Custom Fields sort
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: has_custom_fields_sort
      args:
      - query.dynamic_fields
      - - label: '2'
          filter: "[]"
          __FILE: google-pso-healthcheck/dashboards/google_pso_dashboard_optimisation.dashboard.lookml
          __LINE_NUM: 950
        - label: '2'
          filter: 'NULL'
          __FILE: google-pso-healthcheck/dashboards/google_pso_dashboard_optimisation.dashboard.lookml
          __LINE_NUM: 954
      - '1'
      _kind_hint: dimension
      _type_hint: string
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Has Custom Fields
    comparison_label: Custom Field Queries from Database
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
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [has_custom_fields_sort, history.query_run_count]
    note_state: collapsed
    note_display: hover
    note_text: 'The more post-query processing features used, the more memory is consumed.
      If you are using custom fields across multiple Looks and dashboards, consider
      hard-coding them into your LookML model wherever possible. Doing so will reduce
      the prepare time below as well as Stream to cache. '
    listen:
      Created Date: history.created_date
      Model: query.model
      Dev/Prod Mode: history.workspace_id
      Source: history.source
      User Name: user.name
      Explore: query.view
      Query Status: history.status
      Dashboard ID: dashboard.id
    row: 4
    col: 16
    width: 3
    height: 4
  - name: Dashboard Summary
    type: text
    title_text: Dashboard Summary
    subtitle_text: See also <a href="/dashboards/system__activity::dashboard_performance?Dashboard+ID=">Dashboard
      Diagnostics</a> Dashboard
    body_text: ''
    row: 2
    col: 0
    width: 24
    height: 2
  - title: Has Date Filters
    name: Has Date Filters (2)
    model: system__activity
    explore: history
    type: single_value
    fields: [history.query_run_count, has_date_filter, has_date_filter_copy]
    sorts: [has_date_filter_copy]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Has Date Filter
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: has_date_filter
      args:
      - query.filters
      - - label: 'Yes'
          filter: "%Date%"
          __FILE: google-pso-healthcheck/dashboards/google_pso_dashboard_optimisation.dashboard.lookml
          __LINE_NUM: 1048
        - label: 'Yes'
          filter: "%202%"
          __FILE: google-pso-healthcheck/dashboards/google_pso_dashboard_optimisation.dashboard.lookml
          __LINE_NUM: 1052
        - label: 'Yes'
          filter: "%201%"
          __FILE: google-pso-healthcheck/dashboards/google_pso_dashboard_optimisation.dashboard.lookml
          __LINE_NUM: 1056
        - label: 'Yes'
          filter: "%date%"
          __FILE: google-pso-healthcheck/dashboards/google_pso_dashboard_optimisation.dashboard.lookml
          __LINE_NUM: 1060
        - label: 'Yes'
          filter: "%month%"
          __FILE: google-pso-healthcheck/dashboards/google_pso_dashboard_optimisation.dashboard.lookml
          __LINE_NUM: 1064
        - label: 'Yes'
          filter: "%day%"
          __FILE: google-pso-healthcheck/dashboards/google_pso_dashboard_optimisation.dashboard.lookml
          __LINE_NUM: 1068
        - label: 'Yes'
          filter: "%hour%"
          __FILE: google-pso-healthcheck/dashboards/google_pso_dashboard_optimisation.dashboard.lookml
          __LINE_NUM: 1072
        - label: 'Yes'
          filter: "%week%"
          __FILE: google-pso-healthcheck/dashboards/google_pso_dashboard_optimisation.dashboard.lookml
          __LINE_NUM: 1076
        - label: 'Yes'
          filter: "%time%"
          __FILE: google-pso-healthcheck/dashboards/google_pso_dashboard_optimisation.dashboard.lookml
          __LINE_NUM: 1080
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      description: ''
      label: Has Date Filter Copy
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: has_date_filter_copy
      args:
      - query.filters
      - - label: '1'
          filter: "%Date%"
          __FILE: google-pso-healthcheck/dashboards/google_pso_dashboard_optimisation.dashboard.lookml
          __LINE_NUM: 1096
        - label: '1'
          filter: "%202%"
          __FILE: google-pso-healthcheck/dashboards/google_pso_dashboard_optimisation.dashboard.lookml
          __LINE_NUM: 1100
        - label: '1'
          filter: "%201%"
          __FILE: google-pso-healthcheck/dashboards/google_pso_dashboard_optimisation.dashboard.lookml
          __LINE_NUM: 1104
        - label: '1'
          filter: "%date%"
          __FILE: google-pso-healthcheck/dashboards/google_pso_dashboard_optimisation.dashboard.lookml
          __LINE_NUM: 1108
        - label: '1'
          filter: "%month%"
          __FILE: google-pso-healthcheck/dashboards/google_pso_dashboard_optimisation.dashboard.lookml
          __LINE_NUM: 1112
        - label: '1'
          filter: "%day%"
          __FILE: google-pso-healthcheck/dashboards/google_pso_dashboard_optimisation.dashboard.lookml
          __LINE_NUM: 1116
        - label: '1'
          filter: "%hour%"
          __FILE: google-pso-healthcheck/dashboards/google_pso_dashboard_optimisation.dashboard.lookml
          __LINE_NUM: 1120
        - label: '1'
          filter: "%week%"
          __FILE: google-pso-healthcheck/dashboards/google_pso_dashboard_optimisation.dashboard.lookml
          __LINE_NUM: 1124
        - label: '1'
          filter: "%time%"
          __FILE: google-pso-healthcheck/dashboards/google_pso_dashboard_optimisation.dashboard.lookml
          __LINE_NUM: 1128
      - '2'
      _kind_hint: dimension
      _type_hint: string
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Dashboard has a date filter
    comparison_label: Queries without Date Filter
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
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [has_date_filter_copy, history.query_run_count]
    note_state: collapsed
    note_display: hover
    note_text: 'The more data that is returned in an individual element, the more
      memory resources will be consumed. Dashboard elements that are returned with
      many thousands of data points will use more memory. Ensuring that a date filter
      is present ensures that dashboards return data promptly. '
    listen:
      Created Date: history.created_date
      Model: query.model
      Dev/Prod Mode: history.workspace_id
      Source: history.source
      User Name: user.name
      Explore: query.view
      Query Status: history.status
      Dashboard ID: dashboard.id
    row: 8
    col: 7
    width: 3
    height: 4
  - name: ''
    type: text
    title_text: ''
    subtitle_text: Dashboard Metrics
    body_text: ''
    row: 12
    col: 0
    width: 24
    height: 3
  - title: Has Merged Queries
    name: Has Merged Queries
    model: system__activity
    explore: dashboard
    type: single_value
    fields: [has_merged_query]
    filters:
      dashboard.moved_to_trash: 'No'
    sorts: [has_merged_query desc]
    limit: 1
    column_limit: 50
    dynamic_fields:
    - category: dimension
      expression: if(is_null(${merge_query_source_query.merge_query_id}),"No","Yes")
      label: Has Merged Query
      value_format:
      value_format_name:
      dimension: has_merged_query
      _kind_hint: dimension
      _type_hint: string
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Has Merged Queries
    comparison_label: Number of Merged Query Tiles
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields:
    note_state: collapsed
    note_display: hover
    note_text: 'Merged queries add overhead to Looker runtime by both adding additional
      queries to the dashboard as well as increasing post query processing. Consider
      creating explores which make merged queries redundant where possible. '
    listen:
      Model: query.model
      User Name: user.name
      Explore: query.view
      Dashboard ID: dashboard.id
    row: 4
    col: 13
    width: 3
    height: 4
  - title: Avg Tile Database Execution Time
    name: Avg Tile Database Execution Time
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.execute_main_query_average, query_metrics.count]
    filters:
      query_metrics.execute_main_query: NOT NULL
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
          __FILE: google-pso-healthcheck/dashboards/google_pso_dashboard_optimisation.dashboard.lookml
          __LINE_NUM: 1272
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
          __FILE: google-pso-healthcheck/dashboards/google_pso_dashboard_optimisation.dashboard.lookml
          __LINE_NUM: 1288
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
    single_value_title: Avg Tile Database Execution Time
    comparison_label: Database Queries
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: The time on average it takes for Looker to process your query in the
      database
    listen:
      Created Date: history.created_date
      Model: query.model
      Dev/Prod Mode: history.workspace_id
      Source: history.source
      User Name: user.name
      Explore: query.view
      Query Status: history.status
      Dashboard ID: dashboard.id
    row: 19
    col: 6
    width: 4
    height: 4
  - title: Has Pivots
    name: Has Pivots
    model: system__activity
    explore: dashboard
    type: single_value
    fields: [has_pivoted_columns, has_pivoted_columns_sort]
    filters:
      dashboard.moved_to_trash: 'No'
      dashboard_element.type: data,vis
    sorts: [has_pivoted_columns_sort]
    limit: 1
    column_limit: 50
    dynamic_fields:
    - measure: count_of_id
      based_on: dashboard_element.id
      expression: ''
      label: Count of ID
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
    - category: dimension
      expression: if(is_null(${query.pivots}),"No","Yes")
      label: has pivoted columns
      value_format:
      value_format_name:
      dimension: has_pivoted_columns
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: if(is_null(${query.pivots}),"2","1")
      label: has pivoted columns Sort
      value_format:
      value_format_name:
      dimension: has_pivoted_columns_sort
      _kind_hint: dimension
      _type_hint: string
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Has Pivots
    comparison_label: Number of Text Tiles
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: The more dimensions that are pivoted in a Look or dashboard tile, the
      more memory is consumed when the dashboard is loaded. This is because more data
      is used as more data is returned. If the dimension you are pivoting has high
      cardinality (many unique values), there will be a column for each value. Filter
      at the dashboard or Look level to allow the user to select the dimension values
      that they are most interested in comparing, as opposed to showing everything
      at once.
    listen:
      Model: query.model
      User Name: user.name
      Explore: query.view
      Dashboard ID: dashboard.id
    row: 8
    col: 19
    width: 3
    height: 4
  - title: No of Merged Query tiles
    name: No of Merged Query tiles
    model: system__activity
    explore: dashboard
    type: single_value
    fields: [dashboard_element.total_query_tiles]
    filters:
      dashboard.moved_to_trash: 'No'
      has_merged_query: 'Yes'
    limit: 1
    column_limit: 50
    dynamic_fields:
    - category: dimension
      expression: if(is_null(${merge_query_source_query.merge_query_id}),"No","Yes")
      label: Has Merged Query
      value_format:
      value_format_name:
      dimension: has_merged_query
      _kind_hint: dimension
      _type_hint: string
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Merged Query Tiles
    comparison_label: Number of Merged Query Tiles
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields:
    note_state: collapsed
    note_display: hover
    note_text: The number of tiles on the dashboard which have merged queries
    listen:
      Model: query.model
      User Name: user.name
      Explore: query.view
      Dashboard ID: dashboard.id
    row: 8
    col: 13
    width: 3
    height: 4
  - title: Tiles with Pivots
    name: Tiles with Pivots
    model: system__activity
    explore: dashboard
    type: single_value
    fields: [count_of_id]
    filters:
      dashboard.moved_to_trash: 'No'
      dashboard_element.type: vis,data
      query.formatted_pivots: "-NULL"
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: count_of_id
      based_on: dashboard_element.id
      expression: ''
      label: Count of ID
      type: count_distinct
      _kind_hint: measure
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
    single_value_title: Tiles with Pivots
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: 'The number of tiles with pivots on the dashboard. '
    listen:
      Model: query.model
      User Name: user.name
      Explore: query.view
      Dashboard ID: dashboard.id
    row: 4
    col: 19
    width: 3
    height: 4
  - title: Tiles with Custom Fields
    name: Tiles with Custom Fields
    model: system__activity
    explore: dashboard
    type: single_value
    fields: [count_of_id]
    filters:
      dashboard.moved_to_trash: 'No'
      dashboard_element.type: vis,data
      query.dynamic_fields: -[],-"%5B%5D",-NULL
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: count_of_id
      based_on: dashboard_element.id
      expression: ''
      label: Count of ID
      type: count_distinct
      _kind_hint: measure
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
    single_value_title: Custom Fields Tiles
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: 'The number of tiles on the dashboard which are leveraging custom fields. '
    listen:
      Model: query.model
      User Name: user.name
      Explore: query.view
      Dashboard ID: dashboard.id
    row: 8
    col: 16
    width: 3
    height: 4
  - title: Cache init
    name: Cache init
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.marshalled_cache_load_average, query_metrics.model_init_cache_average]
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
          __FILE: google-pso-healthcheck/dashboards/google_pso_dashboard_optimisation.dashboard.lookml
          __LINE_NUM: 1542
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
          __FILE: google-pso-healthcheck/dashboards/google_pso_dashboard_optimisation.dashboard.lookml
          __LINE_NUM: 1558
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - category: table_calculation
      expression: "${query_metrics.marshalled_cache_load_average}+${query_metrics.model_init_cache_average}"
      label: Init from Cache
      value_format:
      value_format_name: decimal_3
      _kind_hint: measure
      table_calculation: init_from_cache
      _type_hint: number
    filter_expression: if(is_null(${query_metrics.model_init_cache}),if(is_null(${query_metrics.explore_init_mode}),"No","Yes"),"Yes")="Yes"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Initialisation Cache
    comparison_label: Database Queries
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [query_metrics.marshalled_cache_load_average, query_metrics.model_init_cache_average]
    note_state: collapsed
    note_display: hover
    note_text: 'Time it takes in seconds to pull initialization from cache. This should
      be present on the majority of your queries. '
    listen:
      Created Date: history.created_date
      Model: query.model
      Dev/Prod Mode: history.workspace_id
      Source: history.source
      User Name: user.name
      Explore: query.view
      Query Status: history.status
      Dashboard ID: dashboard.id
    row: 19
    col: 14
    width: 3
    height: 4
  - title: Compute init
    name: Compute init
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.explore_init_average, query_metrics.model_init_computed_average]
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
          __FILE: google-pso-healthcheck/dashboards/google_pso_dashboard_optimisation.dashboard.lookml
          __LINE_NUM: 1623
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
          __FILE: google-pso-healthcheck/dashboards/google_pso_dashboard_optimisation.dashboard.lookml
          __LINE_NUM: 1639
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - category: table_calculation
      expression: "${query_metrics.explore_init_average}+${query_metrics.explore_init_average}"
      label: Init from Compute
      value_format:
      value_format_name: decimal_3
      _kind_hint: measure
      table_calculation: init_from_compute
      _type_hint: number
    filter_expression: if(is_null(${query_metrics.model_init_computed}),if(is_null(${query_metrics.explore_init}),"No","Yes"),"Yes")="Yes"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Initialisation from Compute
    comparison_label: Database Queries
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [query_metrics.explore_init_average, query_metrics.model_init_computed_average]
    note_state: collapsed
    note_display: hover
    note_text: The Average time it takes to validate and initialise underlying LookML
      code from scratch. This should only apply to a small proportion of queries
    listen:
      Created Date: history.created_date
      Model: query.model
      Dev/Prod Mode: history.workspace_id
      Source: history.source
      User Name: user.name
      Explore: query.view
      Query Status: history.status
      Dashboard ID: dashboard.id
    row: 19
    col: 17
    width: 4
    height: 4
  - title: Prepare Average
    name: Prepare Average
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.prepare_average]
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
          __FILE: google-pso-healthcheck/dashboards/google_pso_dashboard_optimisation.dashboard.lookml
          __LINE_NUM: 1704
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
          __FILE: google-pso-healthcheck/dashboards/google_pso_dashboard_optimisation.dashboard.lookml
          __LINE_NUM: 1720
      - 'No'
      _kind_hint: dimension
      _type_hint: string
    - category: table_calculation
      expression: "${query_metrics.marshalled_cache_load_average}+${query_metrics.model_init_cache_average}"
      label: Init from Cache
      value_format:
      value_format_name: decimal_3
      _kind_hint: measure
      table_calculation: init_from_cache
      _type_hint: number
      is_disabled: true
    filter_expression: if(is_null(${query_metrics.model_init_cache}),if(is_null(${query_metrics.explore_init_mode}),"No","Yes"),"Yes")="Yes"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Prepare Average Time
    comparison_label: Database Queries
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: []
    note_state: collapsed
    note_display: hover
    note_text: 'The average amount of time taken to generate necessary SQL from your
      LookML model as well as create sql from custom dimenisons and measures. This
      can be reduced by simplifying LookML Logic where possible and moving custom
      dimensions to your LookML model. '
    listen:
      Created Date: history.created_date
      Model: query.model
      Dev/Prod Mode: history.workspace_id
      Source: history.source
      User Name: user.name
      Explore: query.view
      Query Status: history.status
      Dashboard ID: dashboard.id
    row: 19
    col: 21
    width: 3
    height: 4
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <nav style="font-size: 18px; padding: 5px 10px 0 10px; height: 60px">
            <a style="padding: 5px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/healthcheck::google_pso__performance_metrics?">Performance Metrics</a>
              <a style="padding: 5px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/healthcheck::google_cloud__query_outliers?">Outliers</a>
              <a style="padding: 5px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/healthcheck::google_pso__history_query_analysis?">History</a>
              <a style="padding: 5px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/healthcheck::google_pso__content_delivery?">Schedules</a>
              <a style="padding: 5px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/healthcheck::google_pso__merged_queries?">Merged Queries</a>
              <a style="padding: 5px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/healthcheck::google_pso__large_dashboards__query_count?">Large Dashboards</a>
              <a style="padding: 5px; border-top: solid 1px #4285F4; border-left: solid 1px #4285F4; border-right: solid 1px #4285F4; border-radius: 5px 5px 0 0; float: left; line-height: 40px; font-weight: bold;" href="/dashboards/healthcheck::google_pso__merged_queries?1">Dashboard Optimisation</a>
            </nav>
    row: 0
    col: 1
    width: 16
    height: 2
  - title: Query Runtime by Tile
    name: Query Runtime by Tile
    model: system__activity
    explore: query_metrics
    type: looker_column
    fields: [dashboard_element.title, history.average_runtime, query_metrics.acquire_connection_average,
      query_metrics.per_user_throttler_average, query_metrics.explore_init_average,
      query_metrics.marshalled_cache_load_average, query_metrics.model_init_computed_average,
      query_metrics.model_init_cache_average, query_metrics.prepare_average, query_metrics.cache_load_average,
      query_metrics.execute_main_query_average, query_metrics.load_main_query_in_memory_average,
      query_metrics.load_process_and_stream_main_query_average, query_metrics.postprocessing_average,
      query_metrics.stream_to_cache_average, query_metrics.queued_average]
    filters:
      dashboard_element.title: "-NULL"
      history.created_date: yesterday
      user.email: ''
    sorts: [history.average_runtime desc]
    limit: 500
    column_limit: 50
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
    stacking: normal
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
    series_colors: {}
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [history.average_runtime]
    listen:
      Dashboard ID: dashboard.id
    row: 23
    col: 1
    width: 23
    height: 18
  - title: User Count
    name: User Count
    model: system__activity
    explore: history
    type: single_value
    fields: [history.dashboard_user]
    filters: {}
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Created Date: history.created_date
      Query Status: history.status
      Dev/Prod Mode: history.workspace_id
      Source: history.source
      Dashboard ID: dashboard.id
    row: 4
    col: 11
    width: 2
    height: 4
  - title: Dashboard Run Count
    name: Dashboard Run Count (2)
    model: system__activity
    explore: history
    type: single_value
    fields: [history.dashboard_run_count]
    filters:
      dashboard.id_as_string: '29674'
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Created Date: history.created_date
      Query Status: history.status
      Dev/Prod Mode: history.workspace_id
      Source: history.source
      Dashboard ID: dashboard.id
    row: 4
    col: 22
    width: 2
    height: 8
  - title: Most Active Dashboard Users
    name: Most Active Dashboard Users
    model: system__activity
    explore: history
    type: looker_grid
    fields: [user.name, history.dashboard_run_count, history.average_runtime, user.email]
    filters:
      user.name: "-NULL"
    sorts: [history.dashboard_run_count desc 0]
    limit: 30
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      query.count:
        is_active: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
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
    y_axes: [{label: Total Queries Run, orientation: bottom, series: [{axisId: query.count,
            id: query.count, name: Query}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Created Date: history.created_date
      Query Status: history.status
      Dev/Prod Mode: history.workspace_id
      Source: history.source
      Dashboard ID: dashboard.id
    row: 41
    col: 1
    width: 23
    height: 13
  filters:
  - name: Created Date
    title: Created Date
    type: field_filter
    default_value: 30 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: system__activity
    explore: history
    listens_to_filters: []
    field: history.created_date
  - name: Explore
    title: Explore
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: system__activity
    explore: query
    listens_to_filters: [Model, User Name]
    field: query.view
  - name: Model
    title: Model
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: system__activity
    explore: query
    listens_to_filters: [Explore, User Name]
    field: query.model
  - name: Dashboard ID
    title: Dashboard ID
    type: field_filter
    default_value: ''
    allow_multiple_values: false
    required: true
    ui_config:
      type: advanced
      display: popover
      options: []
    model: system__activity
    explore: dashboard
    listens_to_filters: []
    field: dashboard.id
  - name: Query Status
    title: Query Status
    type: field_filter
    default_value: complete
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: system__activity
    explore: history
    listens_to_filters: []
    field: history.status
  - name: Dev/Prod Mode
    title: Dev/Prod Mode
    type: field_filter
    default_value: production
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: system__activity
    explore: history
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
    explore: history
    listens_to_filters: []
    field: history.source
  - name: User Name
    title: User Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: system__activity
    explore: user
    listens_to_filters: [Explore, Model]
    field: user.name