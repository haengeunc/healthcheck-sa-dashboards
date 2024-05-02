---
- dashboard: google_pso__merged_queries
  title: Google PSO - Merged Queries
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: BCI2PV2bnXQDRYnHEYcGHh
  elements:
  - name: ''
    type: text
    title_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Merged Queries"}],"align":"center"},{"type":"p","children":[{"text":""}],"id":1687993536114},{"type":"p","children":[{"text":"Merged
      Results","fontSize":"12pt","backgroundColor":"transparent","color":"rgb(153,
      153, 153)","bold":true},{"text":" is a post-query processing feature that, if
      not used thoughtfully, can overtax Looker instance resources and cause your
      Looker instance to respond more slowly for all users.","fontSize":"12pt","backgroundColor":"transparent","color":"rgb(153,
      153, 153)"}],"id":1687993499703,"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 2
    col: 5
    width: 19
    height: 3
  - title: Dashboards with Merged Queries
    name: Dashboards with Merged Queries
    model: system__activity
    explore: dashboard
    type: looker_grid
    fields: [dashboard.id, dashboard.title, dashboard_element.count_merge_query, query.count]
    filters:
      merge_query_source_query.count: ">0"
    sorts: [dashboard_element.count_merge_query desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "(${dashboard_element.count_merge_query}/${query.count})"
      label: "% of Total"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: of_total
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
      query.count: Total Dashboard Queries
      merge_query_source_query.count: Total Merge Queries
    series_cell_visualizations:
      dashboard_element.count_merge_query:
        is_active: true
      of_total:
        is_active: true
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Moved to Trash (Yes / No): dashboard.moved_to_trash
      Model: query.model
      Explore: query.view
    row: 7
    col: 16
    width: 8
    height: 11
  - title: Total Merged Queries
    name: Total Merged Queries
    model: system__activity
    explore: history
    type: single_value
    fields: [query.count]
    filters:
      history.source: '"merge_query"'
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
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Status: history.status
      Result Source: history.result_source
      Moved to Trash (Yes / No): dashboard.moved_to_trash
      Model: query.model
      Explore: query.view
    row: 5
    col: 8
    width: 4
    height: 2
  - title: Average merged query time in Seconds
    name: Average merged query time in Seconds
    model: system__activity
    explore: history
    type: single_value
    fields: [history.average_runtime]
    filters:
      history.source: '"merge_query"'
      query.created_date: 90 days
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${history.average_runtime}/60"
      label: tt
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: tt
      _type_hint: number
      is_disabled: true
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Status: history.status
      Created Date: history.created_date
      Result Source: history.result_source
      Moved to Trash (Yes / No): dashboard.moved_to_trash
      Model: query.model
      Explore: query.view
    row: 5
    col: 12
    width: 3
    height: 2
  - title: Dashboards with Merged Queries (Used last 30 days)
    name: Dashboards with Merged Queries (Used last 30 days)
    model: system__activity
    explore: dashboard
    type: single_value
    fields: [filtered_history_dashboards.dashboards_used_last_30, dashboard.count]
    filters:
      dashboard_element.result_source: Merge Query
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
    listen:
      Moved to Trash (Yes / No): dashboard.moved_to_trash
      Model: query.model
      Explore: query.view
    row: 5
    col: 18
    width: 3
    height: 2
  - title: Merged Queries Past 90 Days
    name: Merged Queries Past 90 Days
    model: system__activity
    explore: history
    type: single_value
    fields: [query.count]
    filters:
      history.source: '"merge_query"'
      query.created_date: 90 days
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
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Status: history.status
      Result Source: history.result_source
      Moved to Trash (Yes / No): dashboard.moved_to_trash
      Model: query.model
      Explore: query.view
    row: 5
    col: 21
    width: 3
    height: 2
  - title: Merged Queries By Model
    name: Merged Queries By Model
    model: system__activity
    explore: history
    type: looker_grid
    fields: [query.model, query.count, history.query_run_count]
    filters:
      history.source: '"merge_query"'
    sorts: [query.count desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: count_of_dev_branch_name
      based_on: user.dev_branch_name
      expression: ''
      label: Count of Dev Branch Name
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
    - category: measure
      expression:
      label: Dev Queries
      value_format:
      value_format_name:
      based_on: user.dev_branch_name
      _kind_hint: measure
      measure: dev_queries
      type: count_distinct
      _type_hint: number
      filters:
        user.dev_branch_name: "-NULL"
    - measure: count_of_id
      based_on: merge_query.id
      expression: ''
      label: Count of ID
      type: count_distinct
      _kind_hint: measure
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
    series_cell_visualizations:
      history.query_run_count:
        is_active: true
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
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Status: history.status
      Created Date: history.created_date
      Result Source: history.result_source
      Moved to Trash (Yes / No): dashboard.moved_to_trash
      Model: query.model
      Explore: query.view
    row: 20
    col: 8
    width: 8
    height: 9
  - title: Merged Queries By Explore
    name: Merged Queries By Explore
    model: system__activity
    explore: history
    type: looker_grid
    fields: [query.count, query.view, history.query_run_count]
    filters:
      history.source: '"merge_query"'
    sorts: [query.count desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: count_of_dev_branch_name
      based_on: user.dev_branch_name
      expression: ''
      label: Count of Dev Branch Name
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
    - category: measure
      expression:
      label: Dev Queries
      value_format:
      value_format_name:
      based_on: user.dev_branch_name
      _kind_hint: measure
      measure: dev_queries
      type: count_distinct
      _type_hint: number
      filters:
        user.dev_branch_name: "-NULL"
    - measure: count_of_id
      based_on: merge_query.id
      expression: ''
      label: Count of ID
      type: count_distinct
      _kind_hint: measure
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
    series_cell_visualizations:
      history.query_run_count:
        is_active: true
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
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Status: history.status
      Created Date: history.created_date
      Result Source: history.result_source
      Moved to Trash (Yes / No): dashboard.moved_to_trash
      Model: query.model
      Explore: query.view
    row: 20
    col: 0
    width: 8
    height: 9
  - title: Merged Queries by Database
    name: Merged Queries by Database
    model: system__activity
    explore: history
    type: looker_line
    fields: [query.created_date, history.dialect, history.query_run_count]
    pivots: [history.dialect]
    fill_fields: [query.created_date]
    filters:
      query.created_date: 90 days
      history.source: '"merge_query"'
    sorts: [history.dialect, query.created_date desc]
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
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    y_axes: [{label: '', orientation: left, series: [{axisId: history.query_run_count,
            id: exasol - history.query_run_count, name: exasol}, {axisId: history.query_run_count,
            id: trino - history.query_run_count, name: trino}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      trino - history.query_run_count: "#00ABFA"
    series_labels:
      exasol - history.query_run_count: Helios
      trino - history.query_run_count: Zeus
    reference_lines: []
    trend_lines: []
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Status: history.status
      Created Date: history.created_date
      Result Source: history.result_source
      Moved to Trash (Yes / No): dashboard.moved_to_trash
      Model: query.model
      Explore: query.view
    row: 7
    col: 8
    width: 8
    height: 5
  - title: Merge Queries by Database
    name: Merge Queries by Database
    model: system__activity
    explore: history
    type: looker_bar
    fields: [history.dialect, query.count]
    pivots: [history.dialect]
    filters:
      query.created_date: 90 days
      history.source: '"merge_query"'
    sorts: [history.dialect]
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: history.query_run_count,
            id: exasol - history.query_run_count, name: exasol}, {axisId: history.query_run_count,
            id: trino - history.query_run_count, name: trino}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      trino - history.query_run_count: "#00ABFA"
      trino - query.count: "#00ABFA"
    series_labels:
      exasol - query.count: Helios
      trino - query.count: Zeus
    reference_lines: []
    trend_lines: []
    show_null_points: true
    interpolation: monotone
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Status: history.status
      Created Date: history.created_date
      Result Source: history.result_source
      Moved to Trash (Yes / No): dashboard.moved_to_trash
      Model: query.model
      Explore: query.view
    row: 5
    col: 0
    width: 8
    height: 7
  - title: Average Runtime in Seconds
    name: Average Runtime in Seconds
    model: system__activity
    explore: history
    type: looker_column
    fields: [history.dialect, query.created_date, history.average_runtime]
    pivots: [history.dialect]
    fill_fields: [query.created_date]
    filters:
      query.created_date: 20 days
      history.source: '"merge_query"'
    sorts: [history.dialect, query.created_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: if(${history.dialect} = "trino", ${history.average_runtime}*-1,
        null)
      label: trino
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: trino
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
    y_axes: [{label: '', orientation: left, series: [{axisId: history.query_run_count,
            id: exasol - history.query_run_count, name: exasol}, {axisId: history.query_run_count,
            id: trino - history.query_run_count, name: trino}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      trino - history.query_run_count: "#00ABFA"
      trino - trino: "#00ABFA"
      trino - history.average_runtime: "#00ABFA"
      exasol - history.average_runtime: "#0666EB"
    series_labels:
      exasol - history.average_runtime: Helios
      trino - history.average_runtime: Zeus
    reference_lines: []
    trend_lines: []
    show_null_points: true
    interpolation: monotone
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots:
      exasol:
        measure_names: []
      trino:
        measure_names: []
    defaults_version: 1
    listen:
      Status: history.status
      Created Date: history.created_date
      Result Source: history.result_source
      Moved to Trash (Yes / No): dashboard.moved_to_trash
      Model: query.model
      Explore: query.view
    row: 12
    col: 8
    width: 8
    height: 6
  - title: Merged Queries Run Count
    name: Merged Queries Run Count
    model: system__activity
    explore: history
    type: looker_bar
    fields: [history.dialect, history.query_run_count]
    pivots: [history.dialect]
    filters:
      query.created_date: 90 days
      history.source: '"merge_query"'
    sorts: [history.dialect]
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: history.query_run_count,
            id: exasol - history.query_run_count, name: exasol}, {axisId: history.query_run_count,
            id: trino - history.query_run_count, name: trino}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      trino - history.query_run_count: "#00ABFA"
    series_labels:
      exasol - history.query_run_count: Helios
      trino - history.query_run_count: Zeus
    reference_lines: []
    trend_lines: []
    show_null_points: true
    interpolation: monotone
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: The Total number of queries run originating from Merged Query
    listen:
      Status: history.status
      Created Date: history.created_date
      Result Source: history.result_source
      Moved to Trash (Yes / No): dashboard.moved_to_trash
      Model: query.model
      Explore: query.view
    row: 12
    col: 0
    width: 8
    height: 6
  - title: Merged Queries By User
    name: Merged Queries By User
    model: system__activity
    explore: history
    type: looker_grid
    fields: [query.count, history.query_run_count, user.name]
    filters:
      history.source: '"merge_query"'
    sorts: [query.count desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: count_of_dev_branch_name
      based_on: user.dev_branch_name
      expression: ''
      label: Count of Dev Branch Name
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
    - category: measure
      expression:
      label: Dev Queries
      value_format:
      value_format_name:
      based_on: user.dev_branch_name
      _kind_hint: measure
      measure: dev_queries
      type: count_distinct
      _type_hint: number
      filters:
        user.dev_branch_name: "-NULL"
    - measure: count_of_id
      based_on: merge_query.id
      expression: ''
      label: Count of ID
      type: count_distinct
      _kind_hint: measure
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
    series_cell_visualizations:
      history.query_run_count:
        is_active: true
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
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Status: history.status
      Created Date: history.created_date
      Result Source: history.result_source
      Moved to Trash (Yes / No): dashboard.moved_to_trash
      Model: query.model
      Explore: query.view
    row: 20
    col: 16
    width: 8
    height: 9
  - title: Merged Queries Saved in the Last 7 complete days
    name: Merged Queries Saved in the Last 7 complete days
    model: system__activity
    explore: dashboard
    type: looker_column
    fields: [dashboard_element.created_date, dashboard_element.count_merge_query]
    fill_fields: [dashboard_element.created_date]
    filters:
      result_maker.is_merge_query: 'Yes'
      dashboard_element.created_date: 7 days ago for 7 days
    sorts: [dashboard_element.created_date desc]
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
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields:
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
    listen:
      Moved to Trash (Yes / No): dashboard.moved_to_trash
      Model: query.model
      Explore: query.view
    row: 31
    col: 0
    width: 8
    height: 7
  - title: Worst Dashboards with Merged Queries by queries run count
    name: Worst Dashboards with Merged Queries by queries run count
    model: system__activity
    explore: history
    type: looker_grid
    fields: [history.query_run_count, dashboard.title]
    filters:
      merge_query.id: NOT NULL
      dashboard.title: "-NULL"
      result_maker.is_merge_query: 'Yes'
    sorts: [history.query_run_count desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: |+
        if(
          is_null(${merge_query.formatted_pivots}) OR ${merge_query.formatted_pivots} = "[]", "No", "Yes - Please Review"
          )

      label: Pivots Used
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: pivots_used
      _type_hint: string
      is_disabled: true
    - category: table_calculation
      expression: |
        if(
          is_null(${merge_query.dynamic_fields}) OR ${merge_query.dynamic_fields} = "[]", "No", "Yes - Please Review"
          )
      label: Table Calcs Used
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: table_calcs_used
      _type_hint: string
      is_disabled: true
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
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: []
    listen:
      Status: history.status
      Created Date: history.created_date
      Moved to Trash (Yes / No): dashboard.moved_to_trash
      Model: query.model
      Explore: query.view
    row: 44
    col: 0
    width: 24
    height: 6
  - title: Alert Details - Dashboard element and user (in the past 7 complete days)
    name: Alert Details - Dashboard element and user (in the past 7 complete days)
    model: system__activity
    explore: dashboard
    type: looker_grid
    fields: [dashboard_element.created_date, user.name, dashboard.title, dashboard_element.title]
    filters:
      dashboard_element.created_date: 7 days ago for 7 days
      result_maker.is_merge_query: 'Yes'
      dashboard_element.result_source: Merge Query
    sorts: [dashboard_element.created_date desc]
    limit: 500
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
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      dashboard.title: Dashboard Title
      dashboard_element.title: Tile Title
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
    defaults_version: 1
    listen:
      Moved to Trash (Yes / No): dashboard.moved_to_trash
      Model: query.model
      Explore: query.view
    row: 29
    col: 16
    width: 8
    height: 9
  - name: " (2)"
    type: text
    title_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Impact"}],"align":"center"},{"type":"p","children":[{"text":"A
      breakdown of the number of Queries created and run by a specfic Explore/Model/User"}],"id":1688391891791,"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 18
    col: 0
    width: 24
    height: 2
  - name: " (3)"
    type: text
    title_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Alert"}],"align":"center"},{"type":"p","id":1688400883295,"children":[{"text":"If
      a merged query is saved to a dashboard - use details tiles for more information"}]}]'
    rich_content_json: '{"format":"slate"}'
    row: 29
    col: 0
    width: 8
    height: 2
  - name: " (4)"
    type: text
    title_text: ''
    body_text: '[{"type":"h1","children":[{"text":""}]},{"type":"p","children":[{"text":"Fields
      Used in this Dashboard","bold":true}],"id":1688463045819},{"type":"ol","children":[{"type":"li","children":[{"type":"lic","id":1688463111733,"children":[{"bold":true,"text":"Query
      Count - "},{"text":"The count of query id''s"}]}],"id":1688463322043},{"type":"li","children":[{"type":"lic","id":1688463066478,"children":[{"text":"Query
      Run Count - ","bold":true},{"text":" The total run count of a query"}]}],"id":1688463322041},{"type":"li","children":[{"type":"lic","id":1688463184150,"children":[{"text":"Averge
      Query Runtime - ","bold":true},{"text":"Average runtime of a query"}]}],"id":1688463322040},{"type":"li","children":[{"type":"lic","id":1688463191777,"children":[{"bold":true,"text":"Runtime
      in Seconds - "},{"text":"The lastest runtime of a query"}]}],"id":1688463322038}],"id":1688463322044}]'
    rich_content_json: '{"format":"slate"}'
    row: 2
    col: 0
    width: 5
    height: 3
  - title: Worst Merged Queries (Dashboard element details)
    name: Worst Merged Queries (Dashboard element details)
    model: system__activity
    explore: dashboard
    type: looker_grid
    fields: [merge_query.created_date, user.name, dashboard.title, dashboard_element.title,
      merge_query.formatted_pivots, merge_query.dynamic_fields, merge_query_source_query.count,
      dashboard.id, count_of_explore, dashboard_element.id]
    filters:
      merge_query.id: NOT NULL
      dashboard.title: "-NULL"
    sorts: [merge_query_source_query.count desc, history.query_run_count desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: |+
        if(
          is_null(${merge_query.formatted_pivots}) OR ${merge_query.formatted_pivots} = "[]", "No", "Yes - Please Review"
          )

      label: Pivots Used
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: pivots_used
      _type_hint: string
    - category: table_calculation
      expression: |+
        if(
          is_null(${merge_query.dynamic_fields}) OR ${merge_query.dynamic_fields} = "[]", "No", "Yes - Please Review"
          )

      label: Table Calculation Used
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: table_calculation_used
      _type_hint: string
    - measure: count_of_explore
      based_on: query.view
      expression: ''
      label: Count of Explore
      type: count_distinct
      _kind_hint: measure
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
    series_labels:
      merge_query_source_query.count: Count of Source Queries
      user.name: User Name
      dashboard.title: Dashboard Title
      dashboard_element.title: Query Tile Title
      dashboard_element.id: Element ID
    series_cell_visualizations:
      merge_query_source_query.count:
        is_active: true
    series_text_format:
      pivots_used: {}
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#0666EB",
        font_color: !!null '', color_application: {collection_id: revolut-light, palette_id: revolut-light-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: []}]
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
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [merge_query.formatted_pivots, merge_query.dynamic_fields]
    column_order: ["$$$_row_numbers_$$$", merge_query.created_date, user.name, dashboard.title,
      dashboard.id, dashboard_element.title, dashboard_element.id, pivots_used, table_calculation_used,
      merge_query_source_query.count, count_of_explore]
    listen:
      Moved to Trash (Yes / No): dashboard.moved_to_trash
      Model: query.model
      Explore: query.view
    row: 38
    col: 0
    width: 24
    height: 6
  - title: Merged Queries - Percent of Total
    name: Merged Queries - Percent of Total
    model: system__activity
    explore: history
    type: single_value
    fields: [history.query_run_count, filtered_historyquery_run_count]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${filtered_historyquery_run_count}/${history.query_run_count}"
      label: Merged Queries - Percent of total
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: merged_queries_percent_of_total
      _type_hint: number
    - category: measure
      label: Filtered history.query_run_count
      based_on: history.query_run_count
      _kind_hint: measure
      measure: filtered_historyquery_run_count
      type: count_distinct
      _type_hint: number
      filters:
        history.source: '"merge_query"'
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    hidden_fields: [history.query_run_count, filtered_historyquery_run_count]
    listen:
      Result Source: history.result_source
      Status: history.status
      Created Date: history.created_date
      Dialect: history.dialect
      Model: query.model
      Explore: query.view
    row: 5
    col: 15
    width: 3
    height: 2
  - title: Alert Details - Dashboard (in the past 7 complete days)
    name: Alert Details - Dashboard (in the past 7 complete days)
    model: system__activity
    explore: dashboard
    type: looker_grid
    fields: [dashboard_element.created_date, dashboard_element.count_merge_query,
      dashboard.title]
    filters:
      result_maker.is_merge_query: 'Yes'
      dashboard_element.created_date: 7 days ago for 7 days
    sorts: [dashboard_element.created_date desc, dashboard_element.count_merge_query
        desc]
    limit: 500
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
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields:
    listen:
      Moved to Trash (Yes / No): dashboard.moved_to_trash
      Model: query.model
      Explore: query.view
    row: 29
    col: 8
    width: 8
    height: 9
  - name: " (5)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <nav style="font-size: 18px; padding: 5px 10px 0 10px; height: 60px">
        <a style="padding: 5px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/healthcheck::google_pso__performance_metrics">Performance Metrics</a>
        <a style="padding: 5px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/healthcheck::google_cloud__query_outliers">Outliers</a>
        <a style="padding: 5px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/healthcheck::google_pso__history_query_analysis">History</a>
        <a style="padding: 5px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/healthcheck::google_pso__content_delivery">Schedules</a>
        <a style="padding: 5px; border-top: solid 1px #4285F4; border-left: solid 1px #4285F4; border-right: solid 1px #4285F4; border-radius: 5px 5px 0 0; float: left; line-height: 40px; font-weight: bold;" href="/dashboards/healthcheck::google_pso__merged_queries">Merged Queries</a>
        <a style="padding: 5px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/healthcheck::google_pso__large_dashboards__query_count">Large Dashboards</a>
        <a style="padding: 5px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/healthcheck::google_pso__dashboard_optimisation_">Dashboard Optimisation</a>
      </nav>
    row: 0
    col: 0
    width: 24
    height: 2
  filters:
  - name: Result Source
    title: Result Source
    type: field_filter
    default_value: query
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: system__activity
    explore: history
    listens_to_filters: []
    field: history.result_source
  - name: Status
    title: Status
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
    field: history.status
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
  - name: Dialect
    title: Dialect
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options:
      - bigquery
    model: system__activity
    explore: history
    listens_to_filters: []
    field: history.dialect
  - name: Moved to Trash (Yes / No)
    title: Moved to Trash (Yes / No)
    type: field_filter
    default_value: 'No'
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_toggles
      display: inline
    model: system__activity
    explore: dashboard
    listens_to_filters: []
    field: dashboard.moved_to_trash
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
