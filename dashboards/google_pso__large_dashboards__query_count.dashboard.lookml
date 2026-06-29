---
- dashboard: google_pso__large_dashboards__query_count
  title: Google PSO - Large Dashboards & Query Count
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  filters_location_top: false
  preferred_slug: jak1Q2o4OHnPOTrM4zhBcv
  elements:
  - name: Large Dashboards & Query count
    title: Large Dashboards & Query count
    merged_queries:
    - model: system__activity
      explore: dashboard
      type: table
      fields: [dashboard.title, dashboard.link, dashboard_element.count_look, dashboard_element.count_lookless,
        dashboard_element.count_text, dashboard_element.count_merge_query, dashboard_element.count,
        query.count, dashboard.id]
      filters:
        dashboard_element.count: ">25"
        dashboard.deleted_date: 'NULL'
        dashboard.moved_to_trash: 'No'
      sorts: [query.count desc]
      limit: 100
      column_limit: 50
      dynamic_fields:
      - table_calculation: total_query_tiles
        label: Total Query Tiles
        expression: "${dashboard_element.count}-${dashboard_element.count_text}"
        value_format:
        value_format_name:
        _kind_hint: measure
        _type_hint: number
      join_fields: []
    - model: system__activity
      explore: history
      type: table
      fields: [dashboard.id, history.query_run_count, history.average_runtime]
      filters:
        dashboard.id: NOT NULL
      sorts: [history.query_run_count desc]
      limit: 5000
      column_limit: 50
      join_fields:
      - field_name: dashboard.id
        source_field_name: dashboard.id
    type: looker_grid
    column_limit: 50
    listen:
    - Model: query.model
      Explore: query.view
      Dashboard: dashboard.title
    - Created Date: history.created_date
      Model: query.model
      Explore: query.view
      Dashboard: dashboard.title
    row: 34
    col: 0
    width: 24
    height: 23
  - name: ''
    type: text
    title_text: ''
    body_text: |-
      <nav style="font-size: 18px; padding: 5px 10px 0 10px; height: 60px">
        <a style="padding: 5px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/healthcheck::google_pso__performance_metrics?">Performance Metrics</a>
        <a style="padding: 5px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/healthcheck::google_cloud__query_outliers?">Outliers</a>
        <a style="padding: 5px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/healthcheck::google_pso__history_query_analysis?">History</a>
        <a style="padding: 5px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/healthcheck::google_pso__content_delivery?">Schedules</a>
        <a style="padding: 5px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/healthcheck::google_pso__merged_queries?">Merged Queries</a>
        <a style="padding: 5px; border-top: solid 1px #4285F4; border-left: solid 1px #4285F4; border-right: solid 1px #4285F4; border-radius: 5px 5px 0 0; float: left; line-height: 40px; font-weight: bold;" href="/dashboards/healthcheck::google_pso__large_dashboards__query_count?">Large Dashboards</a>
        <a style="padding: 5px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/healthcheck::google_pso__dashboard_optimisation_?">Dashboard Optimisation</a>
      </nav>
    row: 0
    col: 0
    width: 24
    height: 2
  - title: Number of Dashboards
    name: Number of Dashboards
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [dashboard.count]
    filters:
      dashboard.moved_to_trash: 'No'
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
    single_value_title: No of Dashboards
    defaults_version: 1
    listen:
      Model: query.model
      Explore: query.view
      Dashboard: dashboard.title
    row: 2
    col: 0
    width: 4
    height: 3
  - title: Dashboard Run Metrics
    name: Dashboard Run Metrics
    model: system__activity
    explore: dashboard_performance
    type: looker_grid
    fields: [dashboard.title, dashboard.id, history.query_run_count_drill, history.dashboard_run_count,
      max_of_max_runtime, min_of_min_runtime]
    filters:
      history.completed_date: 7 days
      dashboard.id: NOT NULL
    sorts: [history.query_run_count_drill desc]
    limit: 20
    column_limit: 50
    dynamic_fields:
    - measure: max_of_max_runtime
      based_on: dashboard_history_stats.max_runtime
      expression: ''
      label: Max of Max Runtime
      type: max
      _kind_hint: measure
      _type_hint: number
    - measure: min_of_min_runtime
      based_on: dashboard_history_stats.min_runtime
      expression: ''
      label: Min of Min Runtime
      type: min
      _kind_hint: measure
      _type_hint: number
    - category: table_calculation
      expression: "${history.query_run_count_drill}/${history.dashboard_run_count}"
      label: Queries Per Run
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: queries_per_run
      _type_hint: number
    show_view_names: false
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
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      max_of_max_runtime: Max Runtime
      min_of_min_runtime: Min Runtime
      max_of_total_queries: Total Queries
      dashboard_history_stats.avg_tile_runtime: Average Tile Runtime
      queries_per_run: Average No Queries Per Run
    series_cell_visualizations:
      dashboard_history_stats.avg_tile_runtime:
        is_active: false
    series_value_format:
      max_of_max_runtime:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      min_of_min_runtime:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      queries_per_run:
        name: decimal_0
        decimals: '0'
        format_string: "#,##0"
        label: Decimals (0)
        label_prefix: Decimals
    hidden_fields: [dashboard.id]
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Created Date: history.created_date
      Model: model_set.models
      Dashboard: dashboard.title
    row: 5
    col: 0
    width: 12
    height: 12
  - name: Dashboards with Auto-Refresh tiles
    title: Dashboards with Auto-Refresh tiles
    merged_queries:
    - model: system__activity
      explore: dashboard
      type: table
      fields: [dashboard.title, dashboard.id, dashboard_element.refresh_interval_ordered,
        tiles_with_auto_refresh]
      filters:
        dashboard.moved_to_trash: 'No'
        dashboard_element.refresh_interval_ordered: NOT NULL
      sorts: [dashboard_element.refresh_interval_ordered]
      limit: 5000
      column_limit: 50
      dynamic_fields:
      - category: measure
        expression: ''
        label: Tiles with Auto-Refresh
        based_on: dashboard_element.id
        _kind_hint: measure
        measure: tiles_with_auto_refresh
        type: count_distinct
        _type_hint: number
        filters:
          dashboard_element.refresh_interval_ordered: not null
      join_fields: []
    - model: system__activity
      explore: history
      type: table
      fields: [dashboard.id, history.query_run_count, history.database_result_query_count]
      filters:
        dashboard.id: NOT NULL
        history.created_date: 7 days
      sorts: [history.query_run_count desc 0]
      limit: 5000
      column_limit: 50
      join_fields:
      - field_name: dashboard.id
        source_field_name: dashboard.id
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: tiles_with_auto_refresh,
            id: tiles_with_auto_refresh, name: Tiles with Auto-Refresh}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: '', orientation: bottom, series: [{axisId: history.query_run_count,
            id: history.query_run_count, name: Query Run Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
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
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '20'
    legend_position: center
    series_types: {}
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
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    truncate_header: false
    size_to_fit: true
    minimum_column_width: 75
    series_cell_visualizations:
      tiles_with_auto_refresh:
        is_active: false
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [dashboard.id, history.database_result_query_count]
    type: looker_bar
    sorts: [history.query_run_count desc]
    column_limit: 50
    listen:
    - Model: query.model
      Explore: query.view
      Refresh Interval (In Seconds): dashboard_element.refresh_interval_ordered
      Dashboard: dashboard.title
    - Created Date: history.created_date
      Model: query.model
      Explore: query.view
      Dashboard: dashboard.title
    row: 2
    col: 12
    width: 12
    height: 15
  - title: Tile Runtime
    name: Tile Runtime
    model: system__activity
    explore: dashboard_performance
    type: single_value
    fields: [dashboard_history_stats.avg_tile_runtime]
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
    single_value_title: Average Tile Runtime
    value_format: '0.00'
    defaults_version: 1
    listen:
      Model: model_set.models
      Dashboard: dashboard.title
    row: 2
    col: 8
    width: 4
    height: 3
  - title: Untitled
    name: Untitled
    model: system__activity
    explore: dashboard
    type: single_value
    fields: [filtered_history_dashboards.dashboards_used_last_30]
    filters:
      dashboard.moved_to_trash: 'No'
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
    single_value_title: Used in the last 30 days
    defaults_version: 1
    listen:
      Dashboard: dashboard.title
    row: 2
    col: 4
    width: 4
    height: 3
  - title: Dashboards by Run & Query Count
    name: Dashboards by Run & Query Count
    model: system__activity
    explore: history
    type: looker_bar
    fields: [dashboard.title, history.dashboard_run_count, history.query_run_count]
    filters:
      history.completed_date: 30 days
      query.view: ''
      query.model: ''
      user.name: ''
      role.name: ''
    sorts: [history.dashboard_run_count desc]
    limit: 10
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
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: history.dashboard_run_count,
            id: history.dashboard_run_count, name: Dashboard Run Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: '', orientation: bottom, series: [{axisId: history.query_run_count,
            id: history.query_run_count, name: Query Run Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Created Date: history.created_date
      Dashboard: dashboard.title
    row: 17
    col: 0
    width: 12
    height: 17
  - title: Dashboards by Query and Average Runtime
    name: Dashboards by Query and Average Runtime
    model: system__activity
    explore: history
    type: looker_bar
    fields: [dashboard.title, history.database_result_query_count, history.average_runtime]
    filters:
      history.workspace_id: production
      history.result_source: query
      history.average_runtime: NOT NULL
      query.view: ''
      query.model: ''
      user.name: ''
      role.name: ''
    sorts: [history.database_result_query_count desc]
    limit: 10
    column_limit: 50
    dynamic_fields:
    - category: measure
      label: Error Results from Database
      based_on: history.database_result_query_count
      _kind_hint: measure
      measure: error_results_from_database
      type: count_distinct
      _type_hint: number
      filters:
        history.status: error
    - category: measure
      label: Killed Results from Database
      based_on: history.database_result_query_count
      _kind_hint: measure
      measure: killed_results_from_database
      type: count_distinct
      _type_hint: number
      filters:
        history.status: killed
    - category: measure
      label: Error Results from Cache
      based_on: history.cache_result_query_count
      _kind_hint: measure
      measure: error_results_from_cache
      type: count_distinct
      _type_hint: number
      filters:
        history.status: error
    - category: measure
      label: Killed Results from Cache
      based_on: history.cache_result_query_count
      _kind_hint: measure
      measure: killed_results_from_cache
      type: count_distinct
      _type_hint: number
      filters:
        history.status: error
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: error_results_from_database,
            id: error_results_from_database, name: Error Results from Database}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: '', orientation: bottom, series: [
          {axisId: error_rate, id: error_rate, name: Error Rate}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: '12'
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    hidden_pivots: {}
    minimum_column_width: 75
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    hidden_fields:
    listen:
      Created Date: history.created_date
      Dashboard: dashboard.title
    row: 17
    col: 12
    width: 12
    height: 17
  filters:
  - name: Created Date
    title: Created Date
    type: field_filter
    default_value: 90 day
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
  - name: Refresh Interval (In Seconds)
    title: Refresh Interval (In Seconds)
    type: field_filter
    default_value: "[0,3600]"
    allow_multiple_values: true
    required: false
    ui_config:
      type: range_slider
      display: inline
      options:
        min: 0
        max: 3600
    model: system__activity
    explore: query_metrics
    listens_to_filters: []
    field: dashboard_element.refresh_interval_ordered
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
    explore: history
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
    explore: history
    listens_to_filters: []
    field: query.view
  - name: Dashboard
    title: Dashboard
    type: field_filter
    default_value: "-NULL"
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: system__activity
    explore: history
    listens_to_filters: []
    field: dashboard.title
