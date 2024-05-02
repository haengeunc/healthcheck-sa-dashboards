---
- dashboard: google_pso__history_query_analysis
  title: Google PSO - History Query Analysis
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  preferred_slug: e48fmsliaOZ7IeeIMvN5Yv
  elements:
  - title: Query Run Count
    name: Query Run Count
    model: system__activity
    explore: history
    type: single_value
    fields: [history.query_run_count, history.average_runtime]
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
    single_value_title: Query Run Count
    comparison_label: Average Run Time
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
    listen:
      Created Date: history.created_date
      Explore: query.view
      Model: query.model
      Dashboard Title: dashboard.title
      User Name: user.name
      User Role: role.name
      Dialect: history.dialect
    row: 2
    col: 3
    width: 4
    height: 4
  - title: Cache Queries
    name: Cache Queries
    model: system__activity
    explore: history
    type: single_value
    fields: [history.query_run_count, history.average_runtime]
    filters:
      history.result_source: cache
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
    single_value_title: Cache Queries
    comparison_label: Average Run Time
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
    listen:
      Created Date: history.created_date
      Explore: query.view
      Model: query.model
      Dashboard Title: dashboard.title
      User Name: user.name
      User Role: role.name
      Dialect: history.dialect
    row: 6
    col: 3
    width: 4
    height: 4
  - title: Database Queries
    name: Database Queries
    model: system__activity
    explore: history
    type: single_value
    fields: [history.query_run_count, history.average_runtime]
    filters:
      history.result_source: query
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
    single_value_title: Database Queries
    comparison_label: Average Run Time
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
    listen:
      Created Date: history.created_date
      Explore: query.view
      Model: query.model
      Dashboard Title: dashboard.title
      User Name: user.name
      User Role: role.name
      Dialect: history.dialect
    row: 10
    col: 3
    width: 4
    height: 4
  - title: Queries Per Weekday
    name: Queries Per Weekday
    model: system__activity
    explore: history
    type: looker_area
    fields: [history.query_run_count, history.result_source, history.completed_date]
    pivots: [history.result_source]
    filters:
      history.result_source: -"stale_cache",-NULL
      history.completed_day_of_week: "-Saturday,-Sunday"
    sorts: [history.result_source, history.completed_date desc]
    limit: 500
    column_limit: 50
    row_total: right
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
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: history.query_run_count,
            id: cache - history.query_run_count, name: cache - History Query Run Count},
          {axisId: history.query_run_count, id: query - history.query_run_count, name: query
              - History Query Run Count}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: history.average_runtime, id: cache -
              history.average_runtime, name: cache - History Average Runtime in Seconds},
          {axisId: history.average_runtime, id: query - history.average_runtime, name: query
              - History Average Runtime in Seconds}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Database Queries
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: Average Run Time
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    ordering: none
    show_null_labels: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Created Date: history.created_date
      Explore: query.view
      Model: query.model
      Dashboard Title: dashboard.title
      User Name: user.name
      User Role: role.name
      Dialect: history.dialect
    row: 17
    col: 0
    width: 24
    height: 10
  - title: Average Runtime Per Day
    name: Average Runtime Per Day
    model: system__activity
    explore: history
    type: looker_area
    fields: [history.result_source, history.completed_date, history.average_runtime]
    pivots: [history.result_source]
    filters:
      history.result_source: -"stale_cache",-NULL
      history.completed_day_of_week: "-Saturday,-Sunday"
    sorts: [history.result_source, history.completed_date desc]
    limit: 500
    column_limit: 50
    row_total: right
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
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: history.query_run_count,
            id: cache - history.query_run_count, name: cache - History Query Run Count},
          {axisId: history.query_run_count, id: query - history.query_run_count, name: query
              - History Query Run Count}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: history.average_runtime, id: cache -
              history.average_runtime, name: cache - History Average Runtime in Seconds},
          {axisId: history.average_runtime, id: query - history.average_runtime, name: query
              - History Average Runtime in Seconds}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Database Queries
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: Average Run Time
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    ordering: none
    show_null_labels: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Created Date: history.completed_date
      Explore: query.view
      Model: query.model
      Dashboard Title: dashboard.title
      User Name: user.name
      User Role: role.name
      Dialect: history.dialect
    row: 27
    col: 0
    width: 24
    height: 9
  - title: Query by Source and Issuer
    name: Query by Source and Issuer
    model: system__activity
    explore: history
    type: looker_donut_multiples
    fields: [history.issuer_source, history.query_run_count, history.result_source]
    pivots: [history.issuer_source]
    fill_fields: [history.issuer_source]
    filters:
      history.result_source: -"stale_cache"
    sorts: [history.issuer_source, history.query_run_count desc 0]
    limit: 500
    column_limit: 50
    show_value_labels: false
    font_size: 12
    value_labels: legend
    label_type: labPer
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
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: []
    hidden_points_if_no: []
    hidden_pivots: {}
    listen:
      Created Date: history.created_date
      Explore: query.view
      Model: query.model
      Dashboard Title: dashboard.title
      User Name: user.name
      User Role: role.name
      Dialect: history.dialect
    row: 2
    col: 19
    width: 5
    height: 12
  - title: Top 20 Queries
    name: Top 20 Queries
    model: system__activity
    explore: history
    type: looker_bar
    fields: [history.query_run_count, query.link, query.model, query.view]
    sorts: [history.query_run_count desc]
    limit: 20
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
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: 'Individual queries by the number of times that query has been run
      representing priories for optimisation. '
    listen:
      Created Date: history.created_date
      Explore: query.view
      Model: query.model
      Dashboard Title: dashboard.title
      User Name: user.name
      User Role: role.name
      Dialect: history.dialect
    row: 88
    col: 0
    width: 8
    height: 17
  - title: Top 50 Error Messages
    name: Top 50 Error Messages
    model: system__activity
    explore: history
    type: looker_grid
    fields: [history.query_run_count, history.message]
    filters:
      history.status: error
      history.source: -api,-api3,-api4,-"__lookml_test__"
      history.workspace_id: production
    sorts: [history.query_run_count desc]
    limit: 50
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
    show_value_labels: true
    font_size: 12
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
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    minimum_column_width: 75
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_column_widths:
      history.message: 1129
    series_cell_visualizations:
      history.query_run_count:
        is_active: false
    listen:
      Created Date: history.created_date
      Explore: query.view
      Model: query.model
      Dashboard Title: dashboard.title
      User Name: user.name
      User Role: role.name
      Dialect: history.dialect
    row: 121
    col: 0
    width: 24
    height: 14
  - title: Errors Per Dashboard
    name: Errors Per Dashboard
    model: system__activity
    explore: history
    type: looker_bar
    fields: [dashboard.title, error_results_from_database, history.database_result_query_count]
    filters:
      history.workspace_id: production
    sorts: [error_results_from_database desc]
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
    - category: table_calculation
      expression: "${error_results_from_database}/${history.database_result_query_count}"
      label: Error Rate
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: error_rate
      _type_hint: number
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
    hidden_fields: [history.database_result_query_count]
    note_state: collapsed
    note_display: hover
    note_text: 'Dashboards ranked by the number of errors they generate and the percentage
      of overall queries which are errors '
    listen:
      Created Date: history.created_date
      Explore: query.view
      Model: query.model
      Dashboard Title: dashboard.title
      User Name: user.name
      User Role: role.name
      Dialect: history.dialect
    row: 107
    col: 0
    width: 8
    height: 14
  - title: Errors Per Look
    name: Errors Per Look
    model: system__activity
    explore: history
    type: looker_bar
    fields: [error_results_from_database, history.database_result_query_count, look.title]
    filters:
      history.workspace_id: production
      look.title: "-EMPTY"
    sorts: [error_results_from_database desc]
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
    - category: table_calculation
      expression: "${error_results_from_database}/${history.database_result_query_count}"
      label: Error Rate
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: error_rate
      _type_hint: number
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
    hidden_fields: [history.database_result_query_count]
    listen:
      Created Date: history.created_date
      Explore: query.view
      Model: query.model
      Dashboard Title: dashboard.title
      User Name: user.name
      User Role: role.name
      Dialect: history.dialect
    row: 107
    col: 16
    width: 8
    height: 14
  - title: Killed Queries Per Dashboard
    name: Killed Queries Per Dashboard
    model: system__activity
    explore: history
    type: looker_bar
    fields: [dashboard.title, history.database_result_query_count, killed_results_from_database]
    filters:
      history.workspace_id: production
    sorts: [killed_results_from_database desc]
    limit: 10
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${killed_results_from_database}/${history.database_result_query_count}"
      label: Error Rate
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: error_rate
      _type_hint: number
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
    y_axes: [{label: '', orientation: top, series: [{axisId: killed_results_from_database,
            id: killed_results_from_database, name: Killed Results from Database}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        type: linear}, {label: '', orientation: bottom, series: [{axisId: error_rate,
            id: error_rate, name: Error Rate}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    hidden_fields: [history.database_result_query_count]
    listen:
      Created Date: history.created_date
      Explore: query.view
      Model: query.model
      Dashboard Title: dashboard.title
      User Name: user.name
      User Role: role.name
      Dialect: history.dialect
    row: 107
    col: 8
    width: 8
    height: 14
  - title: Top 10 Dashboards by Average Runtime
    name: Top 10 Dashboards by Average Runtime
    model: system__activity
    explore: history
    type: looker_bar
    fields: [dashboard.title, history.database_result_query_count, history.average_runtime]
    filters:
      history.workspace_id: production
      dashboard.title: "-EMPTY"
      history.result_source: query
      history.average_runtime: NOT NULL
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
    hidden_fields: [history.database_result_query_count]
    listen:
      Created Date: history.created_date
      Explore: query.view
      Model: query.model
      User Name: user.name
      User Role: role.name
      Dialect: history.dialect
    row: 61
    col: 8
    width: 8
    height: 11
  - title: Top 10 Dashboard averages per query tier by 5 minute+ queries
    name: Top 10 Dashboard averages per query tier by 5 minute+ queries
    model: system__activity
    explore: history
    type: looker_bar
    fields: [dashboard.title, history.database_result_query_count, history.average_runtime,
      history.runtime_tiers]
    pivots: [history.runtime_tiers]
    filters:
      history.workspace_id: production
      dashboard.title: "-EMPTY"
      history.result_source: query
      history.average_runtime: NOT NULL
    sorts: [history.database_result_query_count desc 5, history.runtime_tiers]
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
    stacking: normal
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
    hidden_fields: [history.database_result_query_count]
    listen:
      Created Date: history.created_date
      Explore: query.view
      Model: query.model
      User Name: user.name
      User Role: role.name
      Dialect: history.dialect
    row: 72
    col: 0
    width: 24
    height: 13
  - title: Dashboards by Run Count
    name: Dashboards by Run Count
    model: system__activity
    explore: history
    type: looker_bar
    fields: [dashboard.title, history.dashboard_run_count]
    filters:
      dashboard.title: "-EMPTY"
      history.completed_date: 30 days
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
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Created Date: history.created_date
      Explore: query.view
      Model: query.model
      User Name: user.name
      User Role: role.name
      Dialect: history.dialect
    row: 61
    col: 0
    width: 8
    height: 11
  - title: Queries by Connection
    name: Queries by Connection
    model: system__activity
    explore: history
    type: looker_bar
    fields: [history.connection_name, history.database_result_query_count]
    filters:
      history.completed_date: 30 days
    sorts: [history.database_result_query_count desc]
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
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Created Date: history.created_date
      Explore: query.view
      Model: query.model
      Dashboard Title: dashboard.title
      User Name: user.name
      User Role: role.name
      Dialect: history.dialect
    row: 88
    col: 8
    width: 8
    height: 17
  - title: Dashboard Runs Per Day
    name: Dashboard Runs Per Day
    model: system__activity
    explore: history
    type: looker_line
    fields: [history.dashboard_run_count, history.completed_date]
    filters:
      history.completed_day_of_week: "-Saturday,-Sunday"
    sorts: [history.completed_date desc]
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
    show_null_points: true
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Created Date: history.completed_date
      Explore: query.view
      Model: query.model
      Dashboard Title: dashboard.title
      User Name: user.name
      User Role: role.name
      Dialect: history.dialect
    row: 36
    col: 0
    width: 24
    height: 10
  - title: Dashboard Runs
    name: Dashboard Runs
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
    single_value_title: Dashboard Runs
    defaults_version: 1
    listen:
      Created Date: history.created_date
      Explore: query.view
      Model: query.model
      Dashboard Title: dashboard.title
      User Name: user.name
      User Role: role.name
      Dialect: history.dialect
    row: 2
    col: 0
    width: 3
    height: 3
  - title: Dashboard Users
    name: Dashboard Users
    model: system__activity
    explore: history
    type: single_value
    fields: [history.dashboard_user]
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
    single_value_title: Dashboard Users
    defaults_version: 1
    listen:
      Created Date: history.created_date
      Explore: query.view
      Model: query.model
      Dashboard Title: dashboard.title
      User Name: user.name
      User Role: role.name
      Dialect: history.dialect
    row: 11
    col: 0
    width: 3
    height: 3
  - title: Dashboards Used
    name: Dashboards Used
    model: system__activity
    explore: history
    type: single_value
    fields: [count_of_link]
    filters:
      dashboard.link: ''
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: count_of_link
      based_on: dashboard.link
      expression: ''
      label: Count of Link
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
    single_value_title: Dashboards Used
    defaults_version: 1
    listen:
      Created Date: history.created_date
      Explore: query.view
      Model: query.model
      Dashboard Title: dashboard.title
      User Name: user.name
      User Role: role.name
      Dialect: history.dialect
    row: 8
    col: 0
    width: 3
    height: 3
  - title: Looks Used
    name: Looks Used
    model: system__activity
    explore: history
    type: single_value
    fields: [count_of_id]
    filters:
      dashboard.link: ''
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: count_of_link
      based_on: dashboard.link
      expression: ''
      label: Count of Link
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
    - measure: count_of_id
      based_on: look.id
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
    single_value_title: Looks Used
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Created Date: history.created_date
      Explore: query.view
      Model: query.model
      Dashboard Title: dashboard.title
      User Name: user.name
      User Role: role.name
      Dialect: history.dialect
    row: 5
    col: 0
    width: 3
    height: 3
  - title: Column Total Queries
    name: Column Total Queries
    model: system__activity
    explore: history
    type: single_value
    fields: [history.query_run_count, history.average_runtime]
    filters:
      dashboard.link: ''
      query.total: 'Yes'
      history.result_source: query
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: count_of_link
      based_on: dashboard.link
      expression: ''
      label: Count of Link
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
    - measure: count_of_id
      based_on: look.id
      expression: ''
      label: Count of ID
      type: count_distinct
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
    single_value_title: Column Total Queries
    comparison_label: Average Query Runtime
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Created Date: history.created_date
      Explore: query.view
      Model: query.model
      Dashboard Title: dashboard.title
      User Name: user.name
      User Role: role.name
      Dialect: history.dialect
    row: 10
    col: 11
    width: 4
    height: 4
  - title: Row Total Queries
    name: Row Total Queries
    model: system__activity
    explore: history
    type: single_value
    fields: [history.query_run_count, history.average_runtime]
    filters:
      history.result_source: query
      query.row_totals: 'Yes'
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: count_of_link
      based_on: dashboard.link
      expression: ''
      label: Count of Link
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
    - measure: count_of_id
      based_on: look.id
      expression: ''
      label: Count of ID
      type: count_distinct
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
    single_value_title: Row Total Queries
    comparison_label: Average Query Runtime
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Created Date: history.created_date
      Explore: query.view
      Model: query.model
      Dashboard Title: dashboard.title
      User Name: user.name
      User Role: role.name
      Dialect: history.dialect
    row: 6
    col: 15
    width: 4
    height: 4
  - title: Pivot Query Times
    name: Pivot Query Times
    model: system__activity
    explore: history
    type: single_value
    fields: [history.query_run_count, history.average_runtime]
    filters:
      history.result_source: query
      query.formatted_pivots: "-EMPTY"
    sorts: [history.query_run_count desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: count_of_link
      based_on: dashboard.link
      expression: ''
      label: Count of Link
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
    - measure: count_of_id
      based_on: look.id
      expression: ''
      label: Count of ID
      type: count_distinct
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
    single_value_title: Pivot Queries
    comparison_label: Average Query Runtime
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Created Date: history.created_date
      Explore: query.view
      Model: query.model
      Dashboard Title: dashboard.title
      User Name: user.name
      User Role: role.name
      Dialect: history.dialect
    row: 10
    col: 15
    width: 4
    height: 4
  - title: Custom Field Queries
    name: Custom Field Queries
    model: system__activity
    explore: history
    type: single_value
    fields: [history.query_run_count, history.average_runtime]
    filters:
      history.result_source: query
      query.dynamic_fields: "-EMPTY,-[]"
    sorts: [history.query_run_count desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: count_of_link
      based_on: dashboard.link
      expression: ''
      label: Count of Link
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
    - measure: count_of_id
      based_on: look.id
      expression: ''
      label: Count of ID
      type: count_distinct
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
    single_value_title: Custom Field Queries
    comparison_label: Average Query Runtime
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Created Date: history.created_date
      Explore: query.view
      Model: query.model
      Dashboard Title: dashboard.title
      User Name: user.name
      User Role: role.name
      Dialect: history.dialect
    row: 2
    col: 15
    width: 4
    height: 4
  - title: Clean Queries
    name: Clean Queries
    model: system__activity
    explore: history
    type: single_value
    fields: [history.query_run_count, history.average_runtime]
    filters:
      history.result_source: query
      query.row_totals: 'No'
      query.total: 'No'
      is_pivot_query_yes_no: 'No'
      is_custom_field_query_yesno: 'No'
    sorts: [history.query_run_count desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: count_of_link
      based_on: dashboard.link
      expression: ''
      label: Count of Link
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
    - measure: count_of_id
      based_on: look.id
      expression: ''
      label: Count of ID
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
    - category: dimension
      description: ''
      label: Is Custom Field Query (Yes/No)
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_custom_field_query_yesno
      args:
      - query.dynamic_fields
      - - label: 'No'
          filter: EMPTY
          __FILE: data_development/dashboards/Google_PSO_-_History_Query_Analysis.dashboard.lookml
          __LINE_NUM: 1887
        - label: 'No'
          filter: "[]"
          __FILE: data_development/dashboards/Google_PSO_-_History_Query_Analysis.dashboard.lookml
          __LINE_NUM: 1889
      - 'Yes'
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      description: ''
      label: Is Pivot Query ( Yes/ No)
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_pivot_query_yes_no
      args:
      - query.formatted_pivots
      - - label: 'No'
          filter: EMPTY
          __FILE: data_development/dashboards/Google_PSO_-_History_Query_Analysis.dashboard.lookml
          __LINE_NUM: 1903
      - 'Yes'
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
    single_value_title: Clean Queries
    comparison_label: Average Query Runtime
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Created Date: history.created_date
      Explore: query.view
      Model: query.model
      Dashboard Title: dashboard.title
      User Name: user.name
      User Role: role.name
      Dialect: history.dialect
    row: 6
    col: 11
    width: 4
    height: 4
  - title: Developer
    name: Developer
    model: system__activity
    explore: history
    type: single_value
    fields: [history.query_run_count, history.average_runtime]
    filters:
      history.completed_date: 30 days
      history.result_source: query
      user_facts.is_admin: 'Yes'
    sorts: [history.query_run_count desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: count_of_link
      based_on: dashboard.link
      expression: ''
      label: Count of Link
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
    - measure: count_of_id
      based_on: look.id
      expression: ''
      label: Count of ID
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
    - category: dimension
      description: ''
      label: Is Custom Field Query (Yes/No)
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_custom_field_query_yesno
      args:
      - query.dynamic_fields
      - - label: 'No'
          filter: EMPTY
          __FILE: data_development/dashboards/Google_PSO_-_History_Query_Analysis.dashboard.lookml
          __LINE_NUM: 1969
        - label: 'No'
          filter: "[]"
          __FILE: data_development/dashboards/Google_PSO_-_History_Query_Analysis.dashboard.lookml
          __LINE_NUM: 1971
      - 'Yes'
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      description: ''
      label: Is Pivot Query ( Yes/ No)
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_pivot_query_yes_no
      args:
      - query.formatted_pivots
      - - label: 'No'
          filter: EMPTY
          __FILE: data_development/dashboards/Google_PSO_-_History_Query_Analysis.dashboard.lookml
          __LINE_NUM: 1985
      - 'Yes'
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
    single_value_title: Admin Queries
    comparison_label: Average Query Runtime
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Created Date: history.created_date
      Explore: query.view
      Model: query.model
      Dashboard Title: dashboard.title
      User Name: user.name
      User Role: role.name
      Dialect: history.dialect
    row: 2
    col: 7
    width: 4
    height: 4
  - title: Developer Queries
    name: Developer Queries
    model: system__activity
    explore: history
    type: single_value
    fields: [history.query_run_count, history.average_runtime]
    filters:
      history.result_source: query
      user_facts.is_developer: 'Yes'
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: count_of_link
      based_on: dashboard.link
      expression: ''
      label: Count of Link
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
    - measure: count_of_id
      based_on: look.id
      expression: ''
      label: Count of ID
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
    - category: dimension
      description: ''
      label: Is Custom Field Query (Yes/No)
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_custom_field_query_yesno
      args:
      - query.dynamic_fields
      - - label: 'No'
          filter: EMPTY
          __FILE: data_development/dashboards/Google_PSO_-_History_Query_Analysis.dashboard.lookml
          __LINE_NUM: 2049
        - label: 'No'
          filter: "[]"
          __FILE: data_development/dashboards/Google_PSO_-_History_Query_Analysis.dashboard.lookml
          __LINE_NUM: 2051
      - 'Yes'
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      description: ''
      label: Is Pivot Query ( Yes/ No)
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_pivot_query_yes_no
      args:
      - query.formatted_pivots
      - - label: 'No'
          filter: EMPTY
          __FILE: data_development/dashboards/Google_PSO_-_History_Query_Analysis.dashboard.lookml
          __LINE_NUM: 2065
      - 'Yes'
      _kind_hint: dimension
      _type_hint: string
    - category: measure
      label: Filtered history.database_result_query_count
      based_on: history.database_result_query_count
      _kind_hint: measure
      measure: filtered_historydatabase_result_query_count
      type: count_distinct
      _type_hint: number
      filters:
        user_facts.is_admin: 'Yes'
        user_facts.is_developer: 'Yes'
    - category: measure
      label: Admin/Developer Average Runtime
      based_on: history.average_runtime
      _kind_hint: measure
      measure: admindeveloper_average_runtime
      type: count_distinct
      _type_hint: number
      filters:
        user_facts.is_admin: 'Yes'
        user_facts.is_developer: 'Yes'
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Developer Queries
    comparison_label: Average Query Runtime
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Created Date: history.created_date
      Explore: query.view
      Model: query.model
      Dashboard Title: dashboard.title
      User Name: user.name
      User Role: role.name
      Dialect: history.dialect
    row: 6
    col: 7
    width: 4
    height: 4
  - title: Explorer Users
    name: Explorer Users
    model: system__activity
    explore: history
    type: single_value
    fields: [history.query_run_count, history.average_runtime]
    filters:
      history.result_source: query
      user_facts.is_explorer: 'Yes'
      user_facts.is_content_saver: 'Yes'
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: count_of_link
      based_on: dashboard.link
      expression: ''
      label: Count of Link
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
    - measure: count_of_id
      based_on: look.id
      expression: ''
      label: Count of ID
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
    - category: dimension
      description: ''
      label: Is Custom Field Query (Yes/No)
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_custom_field_query_yesno
      args:
      - query.dynamic_fields
      - - label: 'No'
          filter: EMPTY
          __FILE: data_development/dashboards/Google_PSO_-_History_Query_Analysis.dashboard.lookml
          __LINE_NUM: 2150
        - label: 'No'
          filter: "[]"
          __FILE: data_development/dashboards/Google_PSO_-_History_Query_Analysis.dashboard.lookml
          __LINE_NUM: 2152
      - 'Yes'
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      description: ''
      label: Is Pivot Query ( Yes/ No)
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_pivot_query_yes_no
      args:
      - query.formatted_pivots
      - - label: 'No'
          filter: EMPTY
          __FILE: data_development/dashboards/Google_PSO_-_History_Query_Analysis.dashboard.lookml
          __LINE_NUM: 2166
      - 'Yes'
      _kind_hint: dimension
      _type_hint: string
    - category: measure
      label: Filtered history.database_result_query_count
      based_on: history.database_result_query_count
      _kind_hint: measure
      measure: filtered_historydatabase_result_query_count
      type: count_distinct
      _type_hint: number
      filters:
        user_facts.is_admin: 'Yes'
        user_facts.is_developer: 'Yes'
    - category: measure
      label: Admin/Developer Average Runtime
      based_on: history.average_runtime
      _kind_hint: measure
      measure: admindeveloper_average_runtime
      type: count_distinct
      _type_hint: number
      filters:
        user_facts.is_admin: 'Yes'
        user_facts.is_developer: 'Yes'
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Explorer User Queries
    comparison_label: Average Query Runtime
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Created Date: history.created_date
      Explore: query.view
      Model: query.model
      Dashboard Title: dashboard.title
      User Name: user.name
      User Role: role.name
      Dialect: history.dialect
    row: 10
    col: 7
    width: 4
    height: 4
  - title: Viewer User Queries
    name: Viewer User Queries
    model: system__activity
    explore: history
    type: single_value
    fields: [history.query_run_count, history.average_runtime]
    filters:
      history.result_source: query
      user_facts.is_viewer: 'Yes'
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: count_of_link
      based_on: dashboard.link
      expression: ''
      label: Count of Link
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
    - measure: count_of_id
      based_on: look.id
      expression: ''
      label: Count of ID
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
    - category: dimension
      description: ''
      label: Is Custom Field Query (Yes/No)
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_custom_field_query_yesno
      args:
      - query.dynamic_fields
      - - label: 'No'
          filter: EMPTY
          __FILE: data_development/dashboards/Google_PSO_-_History_Query_Analysis.dashboard.lookml
          __LINE_NUM: 2250
        - label: 'No'
          filter: "[]"
          __FILE: data_development/dashboards/Google_PSO_-_History_Query_Analysis.dashboard.lookml
          __LINE_NUM: 2252
      - 'Yes'
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      description: ''
      label: Is Pivot Query ( Yes/ No)
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_pivot_query_yes_no
      args:
      - query.formatted_pivots
      - - label: 'No'
          filter: EMPTY
          __FILE: data_development/dashboards/Google_PSO_-_History_Query_Analysis.dashboard.lookml
          __LINE_NUM: 2266
      - 'Yes'
      _kind_hint: dimension
      _type_hint: string
    - category: measure
      label: Filtered history.database_result_query_count
      based_on: history.database_result_query_count
      _kind_hint: measure
      measure: filtered_historydatabase_result_query_count
      type: count_distinct
      _type_hint: number
      filters:
        user_facts.is_admin: 'Yes'
        user_facts.is_developer: 'Yes'
    - category: measure
      label: Admin/Developer Average Runtime
      based_on: history.average_runtime
      _kind_hint: measure
      measure: admindeveloper_average_runtime
      type: count_distinct
      _type_hint: number
      filters:
        user_facts.is_admin: 'Yes'
        user_facts.is_developer: 'Yes'
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Viewer User Queries
    comparison_label: Average Query Runtime
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Created Date: history.created_date
      Explore: query.view
      Model: query.model
      Dashboard Title: dashboard.title
      User Name: user.name
      User Role: role.name
      Dialect: history.dialect
    row: 2
    col: 11
    width: 4
    height: 4
  - title: Queries Per User Group
    name: Queries Per User Group
    model: system__activity
    explore: history
    type: looker_bar
    fields: [history.query_run_count, history.average_runtime, role.name]
    filters:
      history.completed_date: 30 days
      history.result_source: query
    sorts: [history.query_run_count desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: count_of_link
      based_on: dashboard.link
      expression: ''
      label: Count of Link
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
    - measure: count_of_id
      based_on: look.id
      expression: ''
      label: Count of ID
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
    - category: dimension
      description: ''
      label: Is Custom Field Query (Yes/No)
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_custom_field_query_yesno
      args:
      - query.dynamic_fields
      - - label: 'No'
          filter: EMPTY
          __FILE: data_development/dashboards/Google_PSO_-_History_Query_Analysis.dashboard.lookml
          __LINE_NUM: 2351
        - label: 'No'
          filter: "[]"
          __FILE: data_development/dashboards/Google_PSO_-_History_Query_Analysis.dashboard.lookml
          __LINE_NUM: 2353
      - 'Yes'
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      description: ''
      label: Is Pivot Query ( Yes/ No)
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: is_pivot_query_yes_no
      args:
      - query.formatted_pivots
      - - label: 'No'
          filter: EMPTY
          __FILE: data_development/dashboards/Google_PSO_-_History_Query_Analysis.dashboard.lookml
          __LINE_NUM: 2367
      - 'Yes'
      _kind_hint: dimension
      _type_hint: string
    - category: measure
      label: Filtered history.database_result_query_count
      based_on: history.database_result_query_count
      _kind_hint: measure
      measure: filtered_historydatabase_result_query_count
      type: count_distinct
      _type_hint: number
      filters:
        user_facts.is_admin: 'Yes'
        user_facts.is_developer: 'Yes'
    - category: measure
      label: Admin/Developer Average Runtime
      based_on: history.average_runtime
      _kind_hint: measure
      measure: admindeveloper_average_runtime
      type: count_distinct
      _type_hint: number
      filters:
        user_facts.is_admin: 'Yes'
        user_facts.is_developer: 'Yes'
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
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: history.query_run_count,
            id: history.query_run_count, name: Query Run Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: '', orientation: bottom, series: [{axisId: history.average_runtime,
            id: history.average_runtime, name: Average Runtime in Seconds}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: SQL Runner Queries
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: Average Query Runtime
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Created Date: history.created_date
      Explore: query.view
      Model: query.model
      Dashboard Title: dashboard.title
      User Name: user.name
      User Role: role.name
      Dialect: history.dialect
    row: 88
    col: 16
    width: 8
    height: 17
  - name: Daily Trend Analysis
    type: text
    title_text: Daily Trend Analysis
    body_text: ''
    row: 14
    col: 0
    width: 24
    height: 3
  - name: Error Analysis
    type: text
    title_text: Error Analysis
    body_text: ''
    row: 105
    col: 0
    width: 24
    height: 2
  - name: Query Dashboard Analysis
    type: text
    title_text: Query Dashboard Analysis
    body_text: ''
    row: 59
    col: 0
    width: 24
    height: 2
  - name: Individual Query Analysis
    type: text
    title_text: Individual Query Analysis
    body_text: ''
    row: 85
    col: 0
    width: 24
    height: 3
  - name: Queries by Source
    type: text
    title_text: Queries by Source
    body_text: ''
    row: 46
    col: 0
    width: 24
    height: 3
  - title: Top 10 Dashboards by Database Query Count
    name: Top 10 Dashboards by Database Query Count
    model: system__activity
    explore: history
    type: looker_bar
    fields: [dashboard.title, history.database_result_query_count]
    filters:
      history.workspace_id: production
      dashboard.title: "-EMPTY"
      history.result_source: query
      history.average_runtime: NOT NULL
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
      Explore: query.view
      Model: query.model
      User Name: user.name
      User Role: role.name
      Dialect: history.dialect
    row: 61
    col: 16
    width: 8
    height: 11
  - title: Top 20 User Accounts
    name: Top 20 User Accounts
    model: system__activity
    explore: history
    type: looker_bar
    fields: [history.query_run_count, user.name]
    filters:
      history.issuer_source: User
    sorts: [history.query_run_count desc]
    limit: 20
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Queries by User
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: queries_by_user
      args:
      - user.name
      - - label: Looker Delivery
          filter: Looker Delivery
          __FILE: data_development/dashboards/Google_PSO_-_History_Query_Analysis.dashboard.lookml
          __LINE_NUM: 2639
        - label: Salesforce Integration
          filter: Salesforce Integration
          __FILE: data_development/dashboards/Google_PSO_-_History_Query_Analysis.dashboard.lookml
          __LINE_NUM: 2641
        - label: Looker Operation
          filter: Looker Operation
          __FILE: data_development/dashboards/Google_PSO_-_History_Query_Analysis.dashboard.lookml
          __LINE_NUM: 2643
        - Everyone Else
      _kind_hint: dimension
      _type_hint: string
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
    value_labels: labels
    label_type: labPer
    defaults_version: 1
    listen:
      Created Date: history.created_date
      Explore: query.view
      Model: query.model
      Dashboard Title: dashboard.title
      User Role: role.name
      Dialect: history.dialect
    row: 49
    col: 0
    width: 24
    height: 10
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <nav style="font-size: 18px; padding: 5px 10px 0 10px; height: 60px">
        <a style="padding: 5px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/healthcheck::google_pso__performance_metrics">Performance Metrics</a>
        <a style="padding: 5px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/healthcheck::google_cloud__query_outliers">Outliers</a>
      <a style="padding: 5px; border-top: solid 1px #4285F4; border-left: solid 1px #4285F4; border-right: solid 1px #4285F4; border-radius: 5px 5px 0 0; float: left; line-height: 40px; font-weight: bold;" href="/dashboards/healthcheck::google_pso__history_query_analysis">
      History</a>
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
    default_value: 30 day
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
    explore: query_metrics
    listens_to_filters: []
    field: user.name
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
  - name: Dashboard Title
    title: Dashboard Title
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
    field: dashboard.title
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
  - name: User Role
    title: User Role
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
    field: role.name
  - name: Dialect
    title: Dialect
    type: field_filter
    default_value: bigquery_standard_sql
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: system__activity
    explore: query_metrics
    listens_to_filters: []
    field: history.dialect
