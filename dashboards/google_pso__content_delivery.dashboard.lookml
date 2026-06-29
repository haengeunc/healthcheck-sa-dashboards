---
- dashboard: google_pso__content_delivery
  title: Google PSO - Content Delivery
  layout: newspaper
  preferred_viewer: dashboards-next
  load_configuration: wait
  description: ''
  filters_location_top: false
  preferred_slug: DaY64VAMWuweTG5UOz6rmH
  elements:
  - title: Google PSO - Content Delivery
    name: Google PSO - Content Delivery
    model: system__activity
    explore: scheduled_plan
    type: looker_pie
    fields: [scheduled_job.created_day_of_week, scheduled_job.count]
    fill_fields: [scheduled_job.created_day_of_week]
    sorts: [scheduled_job.created_day_of_week]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: lab
    inner_radius: 50
    colors: ["#75E2E2", "#3EB0D5", "#4276BE", "#462C9D", "#9174F0", "#B1399E", "#B32F37",
      "#E57947", "#FBB555", "#FFD95F", "#C2DD67", "#72D16D"]
    series_colors: {}
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: Last 30 Days
    hidden_fields:
    note_state: collapsed
    note_display: hover
    note_text: Number of scheduled jobs each day for last 7 days. One scheduled plan
      may have multiple scheduled jobs.
    listen:
      Run Once (Yes / No): scheduled_plan.run_once
      Created Date: scheduled_job.created_date
      Status: scheduled_job.status
      Schedule Plan: scheduled_plan.name
      Dashboard: dashboard.title
      User: user.name
      Explore: query.view
      Model: query.model
      Created Hour of Day: scheduled_job.created_hour_of_day
    row: 2
    col: 16
    width: 8
    height: 6
  - title: Schedules by Hour of Day
    name: Schedules by Hour of Day
    model: system__activity
    explore: scheduled_plan
    type: looker_column
    fields: [scheduled_job.count, scheduled_job.created_hour_of_day]
    fill_fields: [scheduled_job.created_hour_of_day]
    sorts: [scheduled_job.created_hour_of_day]
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
    value_labels: legend
    label_type: lab
    inner_radius: 50
    colors: ["#75E2E2", "#3EB0D5", "#4276BE", "#462C9D", "#9174F0", "#B1399E", "#B32F37",
      "#E57947", "#FBB555", "#FFD95F", "#C2DD67", "#72D16D"]
    series_colors: {}
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: Last 30 Days
    hidden_fields:
    note_state: collapsed
    note_display: hover
    note_text: Number of scheduled jobs each day for last 7 days. One scheduled plan
      may have multiple scheduled jobs.
    defaults_version: 1
    listen:
      Run Once (Yes / No): scheduled_plan.run_once
      Created Date: scheduled_job.created_date
      Status: scheduled_job.status
      Schedule Plan: scheduled_plan.name
      Dashboard: dashboard.title
      User: user.name
      Explore: query.view
      Model: query.model
      Created Hour of Day: scheduled_job.created_hour_of_day
    row: 8
    col: 16
    width: 8
    height: 7
  - title: Schedule History (Expanded Admin)
    name: Schedule History (Expanded Admin)
    model: system__activity
    explore: scheduled_plan
    type: looker_grid
    fields: [scheduled_plan.id, user.name, scheduled_job.cron_schedule, scheduled_plan_destination.type,
      scheduled_job.id, scheduled_job.status, scheduled_job.status_detail, scheduled_job.created_time,
      scheduled_job.finalized_time, scheduled_job_stage.runtime, look.link, dashboard.link]
    sorts: [scheduled_job.created_time desc]
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
    defaults_version: 1
    listen:
      Run Once (Yes / No): scheduled_plan.run_once
      Created Date: scheduled_job.created_date
      Status: scheduled_job.status
      Schedule Plan: scheduled_plan.name
      Dashboard: dashboard.title
      User: user.name
      Explore: query.view
      Model: query.model
      Created Hour of Day: scheduled_job.created_hour_of_day
    row: 2
    col: 0
    width: 16
    height: 19
  - title: Error Trends
    name: Error Trends
    model: system__activity
    explore: scheduled_plan
    type: looker_grid
    fields: [scheduled_job.created_time, scheduled_job.finalized_time, scheduled_job.id,
      scheduled_job.status, user.name, scheduled_job.status_detail, scheduled_job_stage.stage,
      scheduled_plan_destination.type, scheduled_plan_destination.format]
    sorts: [scheduled_job.status]
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
    defaults_version: 1
    listen:
      Run Once (Yes / No): scheduled_plan.run_once
      Created Date: scheduled_job.created_date
      Status: scheduled_job.status
      Schedule Plan: scheduled_plan.name
      Dashboard: dashboard.title
      User: user.name
      Explore: query.view
      Model: query.model
      Created Hour of Day: scheduled_job.created_hour_of_day
    row: 21
    col: 8
    width: 16
    height: 6
  - title: Success/Failure Ratio - Daily
    name: Success/Failure Ratio - Daily
    model: system__activity
    explore: scheduled_plan
    type: looker_column
    fields: [scheduled_job.finalized_day_of_week, scheduled_job.status, scheduled_job.count]
    pivots: [scheduled_job.status]
    fill_fields: [scheduled_job.finalized_day_of_week]
    filters:
      scheduled_job.finalized_date: 7 days
    sorts: [scheduled_job.status, scheduled_job.count desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Count of Failure
      based_on: scheduled_job.status
      _kind_hint: measure
      measure: count_of_failure
      type: count_distinct
      _type_hint: number
      filters:
        scheduled_job.status: failure
    - category: measure
      expression: ''
      label: 'Count of Successful '
      based_on: scheduled_job.status
      _kind_hint: measure
      measure: count_of_successful
      type: count_distinct
      _type_hint: number
      filters:
        scheduled_job.status: success
    - category: measure
      expression: ''
      label: Count of in_progress
      based_on: scheduled_job.status
      _kind_hint: measure
      measure: count_of_in_progress
      type: count_distinct
      _type_hint: number
      filters:
        scheduled_job.status: '"in_progress"'
    - category: table_calculation
      expression: sum(pivot_row(${scheduled_job.count}))
      label: Sum
      value_format:
      value_format_name:
      _kind_hint: supermeasure
      table_calculation: sum
      _type_hint: number
    - category: table_calculation
      expression: "${scheduled_job.count}/${sum}"
      label: Percent of Total
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: percent_of_total
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
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_series: [success - scheduled_job.count, failure - scheduled_job.count]
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [sum, scheduled_job.count]
    value_labels: legend
    label_type: labPer
    listen:
      Run Once (Yes / No): scheduled_plan.run_once
      Created Date: scheduled_job.created_date
      Status: scheduled_job.status
      Schedule Plan: scheduled_plan.name
      Dashboard: dashboard.title
      User: user.name
      Explore: query.view
      Model: query.model
      Created Hour of Day: scheduled_job.created_hour_of_day
    row: 21
    col: 0
    width: 8
    height: 6
  - title: Failure Status
    name: Failure Status
    model: system__activity
    explore: scheduled_plan
    type: looker_grid
    fields: [user.name, user.email, scheduled_job.count, scheduled_job.status_detail]
    filters:
      scheduled_job.finalized_day_of_week_index: '0'
      scheduled_job.finalized_date: 7 days
    sorts: [scheduled_job.count desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Count of Failure
      based_on: scheduled_job.status
      _kind_hint: measure
      measure: count_of_failure
      type: count_distinct
      _type_hint: number
      filters:
        scheduled_job.status: failure
    - category: measure
      expression: ''
      label: 'Count of Successful '
      based_on: scheduled_job.status
      _kind_hint: measure
      measure: count_of_successful
      type: count_distinct
      _type_hint: number
      filters:
        scheduled_job.status: success
    - category: measure
      expression: ''
      label: Count of in_progress
      based_on: scheduled_job.status
      _kind_hint: measure
      measure: count_of_in_progress
      type: count_distinct
      _type_hint: number
      filters:
        scheduled_job.status: '"in_progress"'
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
    defaults_version: 1
    listen:
      Run Once (Yes / No): scheduled_plan.run_once
      Created Date: scheduled_job.created_date
      Status: scheduled_job.status
      Schedule Plan: scheduled_plan.name
      Dashboard: dashboard.title
      User: user.name
      Explore: query.view
      Model: query.model
      Created Hour of Day: scheduled_job.created_hour_of_day
    row: 27
    col: 8
    width: 16
    height: 7
  - title: Weekly Schedule Heatmap
    name: Weekly Schedule Heatmap
    model: system__activity
    explore: scheduled_plan
    type: looker_grid
    fields: [scheduled_job_stage.started_hour_of_day, scheduled_job_stage.started_day_of_week,
      scheduled_job_stage.avg_runtime, scheduled_job.count]
    pivots: [scheduled_job_stage.started_day_of_week]
    fill_fields: [scheduled_job_stage.started_hour_of_day, scheduled_job_stage.started_day_of_week]
    filters:
      scheduled_job_stage.stage: '"enqueue_for_execute"'
    sorts: [scheduled_job_stage.started_day_of_week 0, scheduled_job_stage.started_hour_of_day]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: true
    show_sql_query_menu_options: false
    pinned_columns:
      scheduled_job_stage.started_hour_of_day: left
    column_order: [scheduled_job_stage.started_hour_of_day, Monday|FIELD|0_scheduled_job_stage.avg_runtime,
      Monday|FIELD|0_scheduled_job.count, Tuesday|FIELD|1_scheduled_job_stage.avg_runtime,
      Tuesday|FIELD|1_scheduled_job.count, Wednesday|FIELD|2_scheduled_job_stage.avg_runtime,
      Wednesday|FIELD|2_scheduled_job.count, Thursday|FIELD|3_scheduled_job_stage.avg_runtime,
      Thursday|FIELD|3_scheduled_job.count, Friday|FIELD|4_scheduled_job_stage.avg_runtime,
      Friday|FIELD|4_scheduled_job.count, Saturday|FIELD|5_scheduled_job_stage.avg_runtime,
      Saturday|FIELD|5_scheduled_job.count, Sunday|FIELD|6_scheduled_job_stage.avg_runtime,
      Sunday|FIELD|6_scheduled_job.count]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      scheduled_job_stage.avg_runtime: Average Time in Queue
    series_column_widths:
      scheduled_job_stage.started_hour_of_day: 153
    series_cell_visualizations:
      scheduled_job_stage.avg_runtime:
        is_active: true
      scheduled_job.count:
        is_active: true
    series_text_format:
      scheduled_job_stage.started_day_of_week:
        bg_color: "#00ABFA"
      scheduled_job_stage.started_hour_of_day:
        align: right
        bold: true
    conditional_formatting: []
    truncate_column_names: false
    defaults_version: 1
    listen:
      Run Once (Yes / No): scheduled_plan.run_once
      Created Date: scheduled_job.created_date
      Status: scheduled_job.status
      Schedule Plan: scheduled_plan.name
      Dashboard: dashboard.title
      User: user.name
      Explore: query.view
      Model: query.model
      Created Hour of Day: scheduled_job.created_hour_of_day
    row: 34
    col: 8
    width: 16
    height: 12
  - title: Inactive Users with Schedules
    name: Inactive Users with Schedules
    model: system__activity
    explore: user
    type: looker_grid
    fields: [user.name, user_facts.last_ui_login_credential_type, user_facts.last_ui_login_date,
      history.most_recent_query_date, scheduled_job.count]
    filters:
      user_facts.last_ui_login_date: before 90 days ago
      user.is_disabled: 'No'
      scheduled_job.count: ">0"
    sorts: [history.most_recent_query_date desc]
    limit: 5000
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
    defaults_version: 1
    listen:
      Created Date: scheduled_job.created_date
      Status: scheduled_job.status
      Schedule Plan: scheduled_plan.name
      Dashboard: dashboard.title
      User: user.name
      Created Hour of Day: scheduled_job.created_hour_of_day
    row: 27
    col: 0
    width: 8
    height: 6
  - title: Schedules to Delete
    name: Schedules to Delete
    model: system__activity
    explore: scheduled_plan
    type: looker_grid
    fields: [scheduled_plan.id, scheduled_job.status, user.name, scheduled_job.status_detail,
      scheduled_plan_destination.type, scheduled_plan_destination.format]
    filters:
      scheduled_job.status_detail: "%An API error occurred%,%User missing permission\
        \ to send to specified destination%,%Not authorized to run scheduled plan%,%The\
        \ view for this Look cannot be found%,%User cannot run Look%,%User cannot\
        \ run Dashboard%"
    sorts: [scheduled_job.status_detail desc]
    limit: 1000
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
    defaults_version: 1
    listen:
      Run Once (Yes / No): scheduled_plan.run_once
      Created Date: scheduled_job.created_date
      Status: scheduled_job.status
      Schedule Plan: scheduled_plan.name
      Dashboard: dashboard.title
      User: user.name
      Explore: query.view
      Model: query.model
      Created Hour of Day: scheduled_job.created_hour_of_day
    row: 33
    col: 0
    width: 8
    height: 6
  - title: Schedules with Connection Timeout
    name: Schedules with Connection Timeout
    model: system__activity
    explore: scheduled_plan
    type: looker_grid
    fields: [scheduled_job.created_time, scheduled_job.finalized_time, scheduled_job.id,
      scheduled_job.status, user.name, scheduled_job.status_detail, scheduled_job_stage.stage,
      scheduled_plan_destination.type, scheduled_plan_destination.format]
    filters:
      scheduled_job.status_detail: "%timeout%"
    sorts: [scheduled_job.created_time desc]
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
    defaults_version: 1
    listen:
      Run Once (Yes / No): scheduled_plan.run_once
      Created Date: scheduled_job.created_date
      Status: scheduled_job.status
      Schedule Plan: scheduled_plan.name
      Dashboard: dashboard.title
      User: user.name
      Explore: query.view
      Model: query.model
      Created Hour of Day: scheduled_job.created_hour_of_day
    row: 39
    col: 0
    width: 8
    height: 6
  - title: Mean Rate of Success and Failure
    name: Mean Rate of Success and Failure
    model: system__activity
    explore: scheduled_plan
    type: looker_pie
    fields: [scheduled_job.status, scheduled_job.count]
    filters:
      scheduled_job.finalized_date: 7 days
    sorts: [scheduled_job.status, scheduled_job.count desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Count of Failure
      based_on: scheduled_job.status
      _kind_hint: measure
      measure: count_of_failure
      type: count_distinct
      _type_hint: number
      filters:
        scheduled_job.status: failure
    - category: measure
      expression: ''
      label: 'Count of Successful '
      based_on: scheduled_job.status
      _kind_hint: measure
      measure: count_of_successful
      type: count_distinct
      _type_hint: number
      filters:
        scheduled_job.status: success
    - category: measure
      expression: ''
      label: Count of in_progress
      based_on: scheduled_job.status
      _kind_hint: measure
      measure: count_of_in_progress
      type: count_distinct
      _type_hint: number
      filters:
        scheduled_job.status: '"in_progress"'
    - category: table_calculation
      expression: sum(${scheduled_job.count})
      label: Sum
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: sum
      _type_hint: number
    - category: table_calculation
      expression: "${scheduled_job.count}/${sum}"
      label: Percent of Total
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: percent_of_total
      _type_hint: number
    - category: table_calculation
      expression: mean(${percent_of_total})
      label: mean
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: mean
      _type_hint: number
      is_disabled: true
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
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_series: [success - scheduled_job.count, failure - scheduled_job.count]
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [sum, scheduled_job.count]
    hidden_points_if_no: []
    font_size: 12
    listen:
      Run Once (Yes / No): scheduled_plan.run_once
      Created Date: scheduled_job.created_date
      Status: scheduled_job.status
      Schedule Plan: scheduled_plan.name
      Dashboard: dashboard.title
      User: user.name
      Explore: query.view
      Model: query.model
      Created Hour of Day: scheduled_job.created_hour_of_day
    row: 15
    col: 16
    width: 8
    height: 6
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <nav style="font-size: 18px; padding: 5px 10px 0 10px; height: 60px">
        <a style="padding: 5px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/healthcheck::google_pso__performance_metrics?">Performance Metrics</a>
        <a style="padding: 5px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/healthcheck::google_cloud__query_outliers?">Outliers</a>
        <a style="padding: 5px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/healthcheck::google_pso__history_query_analysis?">History</a>
      <a style="padding: 5px; border-top: solid 1px #4285F4; border-left: solid 1px #4285F4; border-right: solid 1px #4285F4; border-radius: 5px 5px 0 0; float: left; line-height: 40px; font-weight: bold;" href="/dashboards/healthcheck::google_pso__content_delivery?">
      Schedules</a>
        <a style="padding: 5px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/healthcheck::google_pso__merged_queries?">Merged Queries</a>
        <a style="padding: 5px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/healthcheck::google_pso__large_dashboards__query_count?">Large Dashboards</a>
        <a style="padding: 5px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/healthcheck::google_pso__dashboard_optimisation_?">Dashboard Optimisation</a>
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
      type: advanced
      display: popover
      options: []
    model: system__activity
    explore: scheduled_plan
    listens_to_filters: []
    field: scheduled_job.created_date
  - name: Run Once (Yes / No)
    title: Run Once (Yes / No)
    type: field_filter
    default_value: 'No'
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_toggles
      display: inline
    model: system__activity
    explore: scheduled_plan
    listens_to_filters: []
    field: scheduled_plan.run_once
  - name: Schedule Plan
    title: Schedule Plan
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: system__activity
    explore: scheduled_plan
    listens_to_filters: []
    field: scheduled_plan.name
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
    explore: scheduled_plan
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
    explore: scheduled_plan
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
    explore: scheduled_plan
    listens_to_filters: []
    field: dashboard.title
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
    explore: scheduled_plan
    listens_to_filters: []
    field: user.name
  - name: Status
    title: Status
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: system__activity
    explore: scheduled_plan
    listens_to_filters: []
    field: scheduled_job.status
  - name: Created Hour of Day
    title: Created Hour of Day
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
    explore: scheduled_plan
    listens_to_filters: []
    field: scheduled_job.created_hour_of_day