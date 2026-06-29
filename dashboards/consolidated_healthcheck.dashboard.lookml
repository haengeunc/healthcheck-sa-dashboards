---
- dashboard: google_pso__consolidated_healthcheck_dashboard
  title: Google PSO - Consolidated Healthcheck Dashboard
  preferred_viewer: dashboards-next
  load_configuration: wait
  description: ''
  filters_location_top: false
  preferred_slug: V3rg2zCcptbuWkLYpbwhXy
  layout: newspaper
  tabs:
  - name: Performance Metrics - Sources
    label: Performance Metrics - Sources
  - name: Performance Metrics KPIs
    label: Performance Metrics KPIs
  - name: Performance Metrics - Query Analysis
    label: Performance Metrics - Query Analysis
  - name: Performance Metrics - Outliers
    label: Performance Metrics - Outliers
  - name: History Analysis
    label: History Analysis
  - name: Content Delivery
    label: Content Delivery
  - name: Large Dashboards
    label: Large Dashboards
  - name: Merged Queries
    label: Merged Queries
  elements:
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
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.async_processing
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 7193
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_async_runtime_value_populated
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.per_user_throttler
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 7209
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: was_per_user_throttling_applied_yesno
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: number
      category: dimension
      dimension: project_init
      expression: "${query_metrics.project_init}"
      label: project init
      value_format:
      value_format_name:
    - _kind_hint: measure
      _type_hint: number
      based_on: project_init
      category: measure
      expression: ''
      label: Average of project init
      measure: average_of_project_init
      type: average
      value_format:
      value_format_name: decimal_2
    - _kind_hint: dimension
      _type_hint: number
      category: dimension
      dimension: looker_processing_time
      expression: "${query_metrics.async_processing}-${query_metrics.execute_main_query}"
      label: Looker Processing Time
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: number
      category: dimension
      dimension: looker_overhead
      expression: "${looker_processing_time}/${query_metrics.async_processing}"
      label: Looker Overhead
      value_format:
      value_format_name:
    - _kind_hint: measure
      _type_hint: number
      based_on: looker_overhead
      category: measure
      expression: ''
      label: Average of Looker Overhead
      measure: average_of_looker_overhead
      type: average
      value_format:
      value_format_name: percent_2
    - _kind_hint: measure
      _type_hint: number
      based_on: looker_processing_time
      expression: ''
      label: Average of Looker Processing Time
      measure: average_of_looker_processing_time
      type: average
    - _kind_hint: measure
      _type_hint: number
      category: table_calculation
      expression: if((${average_of_async_processing}-${average_of_execute_main_query})/${average_of_async_processing}
        >0,(${average_of_async_processing}-${average_of_execute_main_query})/${average_of_async_processing},0)
      is_disabled: true
      label: Looker Overhead
      table_calculation: looker_overhead_1
      value_format:
      value_format_name: percent_2
    - _kind_hint: measure
      _type_hint: number
      based_on: query_metrics.async_processing
      category: measure
      expression: ''
      filters:
        query_metrics.async_processing: not null
      label: Average of Async Processing
      measure: average_of_async_processing
      type: average
    - _kind_hint: measure
      _type_hint: number
      based_on: query_metrics.execute_main_query
      category: measure
      expression: ''
      filters:
        query_metrics.execute_main_query: not null
      label: Average of Execute Main Query
      measure: average_of_execute_main_query
      type: average
    - _kind_hint: measure
      _type_hint: number
      based_on: history.query_run_count_drill
      category: measure
      filters: {}
      label: Filtered history.query_run_count_drill
      measure: filtered_historyquery_run_count_drill
      type: count_distinct
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
    comparison_label: 'Model Init: From Cache'
    comparison_reverse_colors: false
    comparison_type: value
    conditional_formatting_include_nulls: false
    conditional_formatting_include_totals: false
    custom_color_enabled: true
    defaults_version: 1
    enable_conditional_formatting: false
    header_font_size: 12
    header_text_alignment: left
    hidden_fields:
    hidden_pivots: {}
    hide_row_totals: false
    hide_totals: false
    interpolation: linear
    label_type: labPer
    rows_font_size: 12
    show_comparison: false
    show_comparison_label: true
    show_null_points: true
    show_row_numbers: true
    show_single_value_title: true
    single_value_title: Indicative Looker Overhead
    size_to_fit: true
    table_theme: white
    transpose: false
    truncate_column_names: false
    truncate_text: true
    value_labels: legend
    x_axis_zoom: true
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: history.query_run_count_drill,
            id: history.query_run_count_drill, name: Query Run Count}], showLabels: true,
        showValues: true, tickDensity: default, tickDensityCustom: 5, type: linear,
        unpinAxis: false}, {label: '', orientation: bottom, series: [{axisId: looker_overhead_1,
            id: looker_overhead_1, name: Looker Overhead}], showLabels: true, showValues: true,
        tickDensity: default, tickDensityCustom: 5, type: linear, unpinAxis: false}]
    y_axis_zoom: true
    listen:
      Row Limit: query.limit
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 1
    col: 12
    width: 12
    height: 11
    tab_name: Performance Metrics - Sources
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
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.async_processing
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 7432
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_async_runtime_value_populated
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.per_user_throttler
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 7448
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: was_per_user_throttling_applied_yesno
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: number
      category: dimension
      dimension: project_init
      expression: "${query_metrics.project_init}"
      label: project init
      value_format:
      value_format_name:
    - _kind_hint: measure
      _type_hint: number
      based_on: project_init
      category: measure
      expression: ''
      label: Average of project init
      measure: average_of_project_init
      type: average
      value_format:
      value_format_name: decimal_2
    - _kind_hint: dimension
      _type_hint: number
      category: dimension
      dimension: looker_processing_time
      expression: "${query_metrics.async_processing}-${query_metrics.execute_main_query}"
      label: Looker Processing Time
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: number
      category: dimension
      dimension: looker_overhead
      expression: "${looker_processing_time}/${query_metrics.async_processing}"
      label: Looker Overhead
      value_format:
      value_format_name:
    - _kind_hint: measure
      _type_hint: number
      based_on: looker_overhead
      category: measure
      expression: ''
      label: Average of Looker Overhead
      measure: average_of_looker_overhead
      type: average
      value_format:
      value_format_name: percent_2
    - _kind_hint: measure
      _type_hint: number
      based_on: looker_processing_time
      expression: ''
      label: Average of Looker Processing Time
      measure: average_of_looker_processing_time
      type: average
    - _kind_hint: measure
      _type_hint: number
      category: table_calculation
      expression: if((${average_of_async_processing}-${average_of_execute_main_query})/${average_of_async_processing}
        >0,(${average_of_async_processing}-${average_of_execute_main_query})/${average_of_async_processing},0)
      is_disabled: true
      label: Looker Overhead
      table_calculation: looker_overhead_1
      value_format:
      value_format_name: percent_2
    - _kind_hint: measure
      _type_hint: number
      based_on: query_metrics.async_processing
      category: measure
      expression: ''
      filters:
        query_metrics.async_processing: not null
      label: Average of Async Processing
      measure: average_of_async_processing
      type: average
    - _kind_hint: measure
      _type_hint: number
      based_on: query_metrics.execute_main_query
      category: measure
      expression: ''
      filters:
        query_metrics.execute_main_query: not null
      label: Average of Execute Main Query
      measure: average_of_execute_main_query
      type: average
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
    comparison_label: 'Model Init: From Cache'
    comparison_reverse_colors: false
    comparison_type: value
    conditional_formatting_include_nulls: false
    conditional_formatting_include_totals: false
    custom_color_enabled: true
    defaults_version: 1
    enable_conditional_formatting: false
    header_font_size: 12
    header_text_alignment: left
    hidden_fields:
    hidden_pivots: {}
    hide_row_totals: false
    hide_totals: false
    interpolation: linear
    label_type: labPer
    rows_font_size: 12
    show_comparison: false
    show_comparison_label: true
    show_null_points: true
    show_row_numbers: true
    show_single_value_title: true
    single_value_title: Indicative Looker Overhead
    size_to_fit: true
    table_theme: white
    transpose: false
    truncate_column_names: false
    truncate_text: true
    value_labels: legend
    x_axis_zoom: true
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: history.query_run_count_drill,
            id: history.query_run_count_drill, name: Query Run Count}], showLabels: true,
        showValues: true, tickDensity: default, tickDensityCustom: 5, type: linear,
        unpinAxis: false}, {label: '', orientation: bottom, series: [{axisId: looker_overhead_1,
            id: looker_overhead_1, name: Looker Overhead}], showLabels: true, showValues: true,
        tickDensity: default, tickDensityCustom: 5, type: linear, unpinAxis: false}]
    y_axis_zoom: true
    listen:
      Row Limit: query.limit
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 12
    col: 12
    width: 12
    height: 11
    tab_name: Performance Metrics - Sources
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
    - _kind_hint: measure
      _type_hint: number
      category: table_calculation
      expression: if((${average_of_async_processing}-${average_of_execute_main_query})/${average_of_async_processing}
        >0,(${average_of_async_processing}-${average_of_execute_main_query})/${average_of_async_processing},0)
      is_disabled: true
      label: Looker Overhead
      table_calculation: looker_overhead_1
      value_format:
      value_format_name: percent_2
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.async_processing
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 7673
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_async_runtime_value_populated
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.per_user_throttler
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 7689
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: was_per_user_throttling_applied_yesno
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: number
      category: dimension
      dimension: project_init
      expression: "${query_metrics.project_init}"
      label: project init
      value_format:
      value_format_name:
    - _kind_hint: measure
      _type_hint: number
      based_on: project_init
      category: measure
      expression: ''
      label: Average of project init
      measure: average_of_project_init
      type: average
      value_format:
      value_format_name: decimal_2
    - _kind_hint: dimension
      _type_hint: number
      category: dimension
      dimension: looker_processing_time
      expression: "${query_metrics.async_processing}-${query_metrics.execute_main_query}"
      label: Looker Processing Time
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: number
      category: dimension
      dimension: looker_overhead
      expression: "${looker_processing_time}/${query_metrics.async_processing}"
      label: Looker Overhead
      value_format:
      value_format_name:
    - _kind_hint: measure
      _type_hint: number
      based_on: looker_overhead
      category: measure
      expression: ''
      label: Average of Looker Overhead
      measure: average_of_looker_overhead
      type: average
      value_format:
      value_format_name: percent_2
    - _kind_hint: measure
      _type_hint: number
      based_on: looker_processing_time
      expression: ''
      label: Average of Looker Processing Time
      measure: average_of_looker_processing_time
      type: average
    - _kind_hint: measure
      _type_hint: number
      based_on: query_metrics.async_processing
      category: measure
      expression: ''
      filters:
        query_metrics.async_processing: not null
      label: Average of Async Processing
      measure: average_of_async_processing
      type: average
    - _kind_hint: measure
      _type_hint: number
      based_on: query_metrics.execute_main_query
      category: measure
      expression: ''
      filters:
        query_metrics.execute_main_query: not null
      label: Average of Execute Main Query
      measure: average_of_execute_main_query
      type: average
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
    comparison_label: 'Model Init: From Cache'
    comparison_reverse_colors: false
    comparison_type: value
    conditional_formatting_include_nulls: false
    conditional_formatting_include_totals: false
    custom_color_enabled: true
    defaults_version: 1
    enable_conditional_formatting: false
    header_font_size: 12
    header_text_alignment: left
    hidden_fields:
    hidden_pivots: {}
    hide_row_totals: false
    hide_totals: false
    interpolation: linear
    label_type: labPer
    rows_font_size: 12
    show_comparison: false
    show_comparison_label: true
    show_null_points: true
    show_row_numbers: true
    show_single_value_title: true
    single_value_title: Indicative Looker Overhead
    size_to_fit: true
    table_theme: white
    transpose: false
    truncate_column_names: false
    truncate_text: true
    value_labels: legend
    x_axis_zoom: true
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: history.query_run_count_drill,
            id: history.query_run_count_drill, name: Query Run Count}], showLabels: true,
        showValues: true, tickDensity: default, tickDensityCustom: 5, type: linear,
        unpinAxis: false}, {label: '', orientation: bottom, series: [{axisId: looker_overhead_1,
            id: looker_overhead_1, name: Looker Overhead}], showLabels: true, showValues: true,
        tickDensity: default, tickDensityCustom: 5, type: linear, unpinAxis: false}]
    y_axis_zoom: true
    listen:
      Row Limit: query.limit
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 12
    col: 0
    width: 12
    height: 11
    tab_name: Performance Metrics - Sources
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
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.async_processing
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 7894
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_async_runtime_value_populated
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.per_user_throttler
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 7910
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: was_per_user_throttling_applied_yesno
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: number
      category: dimension
      dimension: project_init
      expression: "${query_metrics.project_init}"
      label: project init
      value_format:
      value_format_name:
    - _kind_hint: measure
      _type_hint: number
      based_on: project_init
      category: measure
      expression: ''
      label: Average of project init
      measure: average_of_project_init
      type: average
      value_format:
      value_format_name: decimal_2
    - _kind_hint: dimension
      _type_hint: number
      category: dimension
      dimension: looker_processing_time
      expression: "${query_metrics.async_processing}-${query_metrics.execute_main_query}"
      label: Looker Processing Time
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: number
      category: dimension
      dimension: looker_overhead
      expression: "${looker_processing_time}/${query_metrics.async_processing}"
      label: Looker Overhead
      value_format:
      value_format_name:
    - _kind_hint: measure
      _type_hint: number
      based_on: looker_overhead
      category: measure
      expression: ''
      label: Average of Looker Overhead
      measure: average_of_looker_overhead
      type: average
      value_format:
      value_format_name: percent_2
    - _kind_hint: measure
      _type_hint: number
      based_on: looker_processing_time
      expression: ''
      label: Average of Looker Processing Time
      measure: average_of_looker_processing_time
      type: average
    - _kind_hint: measure
      _type_hint: number
      category: table_calculation
      expression: if((${average_of_async_processing}-${average_of_execute_main_query})/${average_of_async_processing}
        >0,(${average_of_async_processing}-${average_of_execute_main_query})/${average_of_async_processing},0)
      is_disabled: true
      label: Looker Overhead
      table_calculation: looker_overhead_1
      value_format:
      value_format_name: percent_2
    - _kind_hint: measure
      _type_hint: number
      based_on: query_metrics.execute_main_query
      category: measure
      expression: ''
      filters:
        query_metrics.execute_main_query: not null
      label: Average of Execute Main Query
      measure: average_of_execute_main_query
      type: average
    - _kind_hint: measure
      _type_hint: number
      based_on: query_metrics.async_processing
      category: measure
      expression: ''
      filters:
        query_metrics.async_processing: not null
      label: Average of Async Processing
      measure: average_of_async_processing
      type: average
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
    comparison_label: 'Model Init: From Cache'
    comparison_reverse_colors: false
    comparison_type: value
    conditional_formatting_include_nulls: false
    conditional_formatting_include_totals: false
    custom_color_enabled: true
    defaults_version: 1
    enable_conditional_formatting: false
    header_font_size: 12
    header_text_alignment: left
    hidden_fields:
    hidden_pivots: {}
    hide_row_totals: false
    hide_totals: false
    interpolation: linear
    label_type: labPer
    rows_font_size: 12
    show_comparison: false
    show_comparison_label: true
    show_null_points: true
    show_row_numbers: true
    show_single_value_title: true
    single_value_title: Indicative Looker Overhead
    size_to_fit: true
    table_theme: white
    transpose: false
    truncate_column_names: false
    truncate_text: true
    value_labels: legend
    x_axis_zoom: true
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: history.query_run_count_drill,
            id: history.query_run_count_drill, name: Query Run Count}], showLabels: true,
        showValues: true, tickDensity: default, tickDensityCustom: 5, type: linear,
        unpinAxis: false}, {label: '', orientation: bottom, series: [{axisId: looker_overhead_1,
            id: looker_overhead_1, name: Looker Overhead}], showLabels: true, showValues: true,
        tickDensity: default, tickDensityCustom: 5, type: linear, unpinAxis: false}]
    y_axis_zoom: true
    listen:
      Row Limit: query.limit
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 23
    col: 0
    width: 12
    height: 11
    tab_name: Performance Metrics - Sources
  - name: ''
    type: text
    title_text: ''
    subtitle_text: Source Drilldown
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 1
    tab_name: Performance Metrics - Sources
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
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.async_processing
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 8135
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_async_runtime_value_populated
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.per_user_throttler
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 8151
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: was_per_user_throttling_applied_yesno
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: number
      category: dimension
      dimension: project_init
      expression: "${query_metrics.project_init}"
      label: project init
      value_format:
      value_format_name:
    - _kind_hint: measure
      _type_hint: number
      based_on: project_init
      category: measure
      expression: ''
      label: Average of project init
      measure: average_of_project_init
      type: average
      value_format:
      value_format_name: decimal_2
    - _kind_hint: dimension
      _type_hint: number
      category: dimension
      dimension: looker_processing_time
      expression: "${query_metrics.async_processing}-${query_metrics.execute_main_query}"
      label: Looker Processing Time
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: number
      category: dimension
      dimension: looker_overhead
      expression: "${looker_processing_time}/${query_metrics.async_processing}"
      label: Looker Overhead
      value_format:
      value_format_name:
    - _kind_hint: measure
      _type_hint: number
      based_on: looker_overhead
      category: measure
      expression: ''
      label: Average of Looker Overhead
      measure: average_of_looker_overhead
      type: average
      value_format:
      value_format_name: percent_2
    - _kind_hint: measure
      _type_hint: number
      based_on: looker_processing_time
      expression: ''
      label: Average of Looker Processing Time
      measure: average_of_looker_processing_time
      type: average
    - _kind_hint: measure
      _type_hint: number
      category: table_calculation
      expression: if((${average_of_async_processing}-${average_of_execute_main_query})/${average_of_async_processing}
        >0,(${average_of_async_processing}-${average_of_execute_main_query})/${average_of_async_processing},0)
      is_disabled: true
      label: Looker Overhead
      table_calculation: looker_overhead_1
      value_format:
      value_format_name: percent_2
    - _kind_hint: measure
      _type_hint: number
      based_on: query_metrics.execute_main_query
      category: measure
      expression: ''
      filters:
        query_metrics.execute_main_query: not null
      label: Average of Execute Main Query
      measure: average_of_execute_main_query
      type: average
    - _kind_hint: measure
      _type_hint: number
      based_on: query_metrics.async_processing
      category: measure
      expression: ''
      filters:
        query_metrics.async_processing: not null
      label: Average of Async Processing
      measure: average_of_async_processing
      type: average
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
    comparison_label: 'Model Init: From Cache'
    comparison_reverse_colors: false
    comparison_type: value
    conditional_formatting_include_nulls: false
    conditional_formatting_include_totals: false
    custom_color_enabled: true
    defaults_version: 1
    enable_conditional_formatting: false
    header_font_size: 12
    header_text_alignment: left
    hidden_fields:
    hidden_pivots: {}
    hide_row_totals: false
    hide_totals: false
    interpolation: linear
    label_type: labPer
    rows_font_size: 12
    show_comparison: false
    show_comparison_label: true
    show_null_points: true
    show_row_numbers: true
    show_single_value_title: true
    single_value_title: Indicative Looker Overhead
    size_to_fit: true
    table_theme: white
    transpose: false
    truncate_column_names: false
    truncate_text: true
    value_labels: legend
    x_axis_zoom: true
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: history.query_run_count_drill,
            id: history.query_run_count_drill, name: Query Run Count}], showLabels: true,
        showValues: true, tickDensity: default, tickDensityCustom: 5, type: linear,
        unpinAxis: false}, {label: '', orientation: bottom, series: [{axisId: looker_overhead_1,
            id: looker_overhead_1, name: Looker Overhead}], showLabels: true, showValues: true,
        tickDensity: default, tickDensityCustom: 5, type: linear, unpinAxis: false}]
    y_axis_zoom: true
    listen:
      Row Limit: query.limit
      User: user.name
      Created Date: history.created_date
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 1
    col: 0
    width: 12
    height: 11
    tab_name: Performance Metrics - Sources
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
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.async_processing
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 8364
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_async_runtime_value_populated
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.per_user_throttler
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 8380
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: was_per_user_throttling_applied_yesno
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: number
      category: dimension
      dimension: project_init
      expression: "${query_metrics.project_init}"
      label: project init
      value_format:
      value_format_name:
    - _kind_hint: measure
      _type_hint: number
      based_on: project_init
      category: measure
      expression: ''
      label: Average of project init
      measure: average_of_project_init
      type: average
      value_format:
      value_format_name: decimal_2
    - _kind_hint: dimension
      _type_hint: number
      category: dimension
      dimension: looker_processing_time
      expression: "${query_metrics.async_processing}-${query_metrics.execute_main_query}"
      label: Looker Processing Time
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: number
      category: dimension
      dimension: looker_overhead
      expression: "${looker_processing_time}/${query_metrics.async_processing}"
      label: Looker Overhead
      value_format:
      value_format_name:
    - _kind_hint: measure
      _type_hint: number
      based_on: looker_overhead
      category: measure
      expression: ''
      label: Average of Looker Overhead
      measure: average_of_looker_overhead
      type: average
      value_format:
      value_format_name: percent_2
    - _kind_hint: measure
      _type_hint: number
      based_on: looker_processing_time
      expression: ''
      label: Average of Looker Processing Time
      measure: average_of_looker_processing_time
      type: average
    - _kind_hint: measure
      _type_hint: number
      category: table_calculation
      expression: if((${average_of_async_processing}-${average_of_execute_main_query})/${average_of_async_processing}
        >0,(${average_of_async_processing}-${average_of_execute_main_query})/${average_of_async_processing},0)
      is_disabled: true
      label: Looker Overhead
      table_calculation: looker_overhead_1
      value_format:
      value_format_name: percent_2
    - _kind_hint: measure
      _type_hint: number
      based_on: query_metrics.execute_main_query
      category: measure
      expression: ''
      filters:
        query_metrics.execute_main_query: not null
      label: Average of Execute Main Query
      measure: average_of_execute_main_query
      type: average
    - _kind_hint: measure
      _type_hint: number
      based_on: query_metrics.async_processing
      category: measure
      expression: ''
      filters:
        query_metrics.async_processing: not null
      label: Average of Async Processing
      measure: average_of_async_processing
      type: average
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
    comparison_label: 'Model Init: From Cache'
    comparison_reverse_colors: false
    comparison_type: value
    conditional_formatting_include_nulls: false
    conditional_formatting_include_totals: false
    custom_color_enabled: true
    defaults_version: 1
    enable_conditional_formatting: false
    header_font_size: 12
    header_text_alignment: left
    hidden_fields:
    hidden_pivots: {}
    hide_row_totals: false
    hide_totals: false
    interpolation: linear
    label_type: labPer
    rows_font_size: 12
    show_comparison: false
    show_comparison_label: true
    show_null_points: true
    show_row_numbers: true
    show_single_value_title: true
    single_value_title: Indicative Looker Overhead
    size_to_fit: true
    table_theme: white
    transpose: false
    truncate_column_names: false
    truncate_text: true
    value_labels: legend
    x_axis_zoom: true
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: history.query_run_count_drill,
            id: history.query_run_count_drill, name: Query Run Count}], showLabels: true,
        showValues: true, tickDensity: default, tickDensityCustom: 5, type: linear,
        unpinAxis: false}, {label: '', orientation: bottom, series: [{axisId: looker_overhead_1,
            id: looker_overhead_1, name: Looker Overhead}], showLabels: true, showValues: true,
        tickDensity: default, tickDensityCustom: 5, type: linear, unpinAxis: false}]
    y_axis_zoom: true
    listen:
      Row Limit: query.limit
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 23
    col: 12
    width: 12
    height: 11
    tab_name: Performance Metrics - Sources
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
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.async_processing
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 8610
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_async_runtime_value_populated
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{background_color: "#FFFFFF", bold: false, fields: !!null '',
        font_color: "#F7930D", italic: false, strikethrough: false, type: greater
          than, value: 9.999}, {background_color: "#FFFFFF", bold: false, fields: !!null '',
        font_color: "#F54C3E", italic: false, strikethrough: false, type: greater
          than, value: 14.9999}]
    defaults_version: 1
    note_display: hover
    note_state: collapsed
    note_text: The average amount of time a query takes to complete inclusive of pre
      query processing. Main query execution, totals execution and post query processing.
    single_value_title: Average Async Runtime
    listen:
      Row Limit: query.limit
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 2
    col: 5
    width: 5
    height: 4
    tab_name: Performance Metrics KPIs
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
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.async_processing
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 8674
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_async_runtime_value_populated
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Queued queries
    defaults_version: 1
    hidden_pivots: {}
    note_display: hover
    note_state: collapsed
    note_text: The amount of time a query is queued & waiting for a free worker within
      Looker after initialisation. Review connections per node settings to ensure
      they are the maximum allowed value and review large dashboards within the instance
      to identify any over Lookers recommendation of 25 tiles per dashboard which
      are being heavily used. Restructure dashboards to reduce the number of queries
      generated. This metric is also improved when optimising main query execution
      by increasing traffic flow.
    single_value_title: Average Query Queue Time
    listen:
      Row Limit: query.limit
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 12
    col: 8
    width: 4
    height: 4
    tab_name: Performance Metrics KPIs
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
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.async_processing
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 8754
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_async_runtime_value_populated
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Acquire Connection Queries
    conditional_formatting: [{background_color: "#FFFFFF", bold: false, fields: !!null '',
        font_color: "#F7930D", italic: false, strikethrough: false, type: greater
          than, value: 0.2383}]
    defaults_version: 1
    hidden_pivots: {}
    note_display: hover
    note_state: collapsed
    note_text: The time it takes for Looker to obtain a connection to your database.
      This includes time to look up the credentials (or key) for the user, create
      the connection pool if it does not already exist, and initialise the connection
      for use. The recommended benchmark is 0.2383 seconds. If this is higher or impacts
      a large number of queries it suggests that Looker is sending more queries than
      the database is capable of processing concurrently. Review the max connections
      per node value in your connections to optimise. This metric is also improved
      when reducing main query execution time.
    single_value_title: Acquire Connection Time
    listen:
      Row Limit: query.limit
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 12
    col: 0
    width: 4
    height: 4
    tab_name: Performance Metrics KPIs
  - title: Per User Throttler Average
    name: Per User Throttler Average
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
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.async_processing
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 8826
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_async_runtime_value_populated
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.per_user_throttler
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 8842
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: was_per_user_throttling_applied_yesno
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Queries with Per User Throttling
    defaults_version: 1
    hidden_pivots: {}
    note_display: hover
    note_state: collapsed
    note_text: Looker has a default per user/per node throttler ensuring that each
      user can only run 15 queries per node concurrently. This ensures bandwidth is
      available for all users, if Per User Throttler Average is high and impacts a
      high number of queries, review schedules with a view to disperse them throughout
      the time period. Also review Large Dashboards which have over 25 tiles. Review
      use of merged queries also as this can see dashboards with fewer than 25 tiles
      generate a larger volume of queries and see slow load times. If necessary create
      explores which make merged queries redundant. This is also improved by optimising
      main query execution time.
    single_value_title: Per User Throttler Average
    listen:
      Row Limit: query.limit
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 12
    col: 4
    width: 4
    height: 4
    tab_name: Performance Metrics KPIs
  - title: Total Query Count
    name: Total Query Count
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [history.query_run_count_drill, history.database_result_query_count]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.async_processing
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 8919
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_async_runtime_value_populated
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.per_user_throttler
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 8935
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: was_per_user_throttling_applied_yesno
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
    - _kind_hint: measure
      _type_hint: number
      category: table_calculation
      expression: 1-(${history.database_result_query_count}/${history.query_run_count_drill})
      label: Cache Percent
      table_calculation: cache_percent
      value_format:
      value_format_name: percent_2
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Queries From Database
    defaults_version: 1
    hidden_fields: [cache_percent]
    hidden_pivots: {}
    note_display: hover
    note_state: collapsed
    note_text: The number of queries executed within the time period and total number
      of queries executed directly against the database. Review datagroup policies
      if the number of cached queries is unexpectedly high. Expected cache/database
      query ratio can vary depending on your use cases, e.g. if queries are usually
      run filtered at id level it would be low vs if few filters are used on dashboards
      with high usage where it should be high.
    single_value_title: Total Query Count
    listen:
      Row Limit: query.limit
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 2
    col: 15
    width: 5
    height: 4
    tab_name: Performance Metrics KPIs
  - title: 'Explore Init: Compute'
    name: 'Explore Init: Compute'
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.explore_init_average, history.query_run_count_drill]
    filters:
      query_metrics.explore_init: ">0"
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.async_processing
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 9021
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_async_runtime_value_populated
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.per_user_throttler
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 9037
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: was_per_user_throttling_applied_yesno
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Explore Init Queries
    conditional_formatting: [{background_color: "#FFFFFF", bold: false, fields: !!null '',
        font_color: "#F7930D", italic: false, strikethrough: false, type: greater
          than, value: 0.2333}]
    defaults_version: 1
    hidden_pivots: {}
    note_display: hover
    note_state: collapsed
    note_text: This is the average time taken to initialise your explores from code.
      The recommended benchmark for this metric is 0.2333 This should only impact
      a small portion of your queries. If high, review explores for optimisation either
      through restructure or efficiency of joins, removal of unnecessary dimensions
      and measures and review of developer deployment frequency as frequent deployments
      of Lookml code at peak usage invalidates cache.
    single_value_title: 'Explore Init: Compute'
    listen:
      Row Limit: query.limit
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 7
    col: 12
    width: 4
    height: 4
    tab_name: Performance Metrics KPIs
  - title: 'Model Init: Compute'
    name: 'Model Init: Compute'
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.model_init_computed_average, history.query_run_count_drill]
    filters:
      query_metrics.model_init_computed: ">0"
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.async_processing
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 9116
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_async_runtime_value_populated
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.per_user_throttler
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 9132
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: was_per_user_throttling_applied_yesno
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Model Init Queries
    conditional_formatting: [{background_color: "#FFFFFF", bold: false, fields: !!null '',
        font_color: "#F7930D", italic: false, strikethrough: false, type: greater
          than, value: 2.4399}]
    defaults_version: 1
    hidden_pivots: {}
    note_display: hover
    note_state: collapsed
    note_text: This is the average time taken to initialise your models from code.
      The recommended benchmark for this metric is 2.4199. This should only impact
      a small portion of your queries. If the average time is high then performance
      may benefit from models being broken out into smaller components. If the number
      of queries impacted is high, review the frequency of deployments and review
      potential implementation of deployment windows.
    single_value_title: 'Model Init: Compute'
    listen:
      Row Limit: query.limit
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 7
    col: 4
    width: 4
    height: 4
    tab_name: Performance Metrics KPIs
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
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.async_processing
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 9211
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_async_runtime_value_populated
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.per_user_throttler
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 9227
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: was_per_user_throttling_applied_yesno
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Prepare Queries
    conditional_formatting: [{background_color: "#FFFFFF", bold: false, fields: !!null '',
        font_color: "#F7930D", italic: false, strikethrough: false, type: greater
          than, value: 0.4389}]
    defaults_version: 1
    hidden_pivots: {}
    note_display: hover
    note_state: collapsed
    note_text: The amount of time Looker takes to prepare a SQL query based Lookml
      defined in your projects. The recommended benchmark for this metric is 0.4389
      seconds. If this appears to be excessively high, review Lookml logic, consider
      persistent derived tables or migrating calculations back to the database. Move
      custom dimensions and measures into your Lookml model where possible. Also enable
      new Lookml runtime if not already done so.
    single_value_title: Prepare Average
    listen:
      Row Limit: query.limit
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 7
    col: 20
    width: 4
    height: 4
    tab_name: Performance Metrics KPIs
  - title: Main Query Execution Time
    name: Main Query Execution Time
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.execute_main_query_average]
    filters:
      query_metrics.execute_main_query: ">0"
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.async_processing
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 9314
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_async_runtime_value_populated
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.per_user_throttler
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 9330
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: was_per_user_throttling_applied_yesno
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: 'Model Init: From Cache'
    conditional_formatting: [{background_color: "#FFFFFF", bold: false, fields: !!null '',
        font_color: "#F7930D", italic: false, strikethrough: false, type: greater
          than, value: 4.9999}, {background_color: "#FFFFFF", bold: false, fields: !!null '',
        font_color: "#F54C3E", italic: false, strikethrough: false, type: greater
          than, value: !!null ''}]
    defaults_version: 1
    hidden_pivots: {}
    note_display: hover
    note_state: collapsed
    note_text: The amount of time the main query takes to complete within the database.
      The recommended benchmark is 4.8698 seconds. This figure can be optimised through
      aggregation of data, the review of SQL queries to remove inefficiencies such
      as unnecessary sub queries, inclusion of templated filters in derived tables
      and standard database optimization techniques such as indexing, partitioning.
    single_value_title: Main Query Execution Time
    listen:
      Row Limit: query.limit
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 2
    col: 10
    width: 5
    height: 4
    tab_name: Performance Metrics KPIs
  - title: Post Processing - Stream to Cache Time
    name: Post Processing - Stream to Cache Time
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.stream_to_cache_average, history.query_run_count_drill]
    filters:
      query_metrics.stream_to_cache: ">0"
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.async_processing
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 9407
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_async_runtime_value_populated
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.per_user_throttler
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 9423
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: was_per_user_throttling_applied_yesno
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Stream To Cache Queries
    conditional_formatting: [{background_color: "#FFFFFF", bold: false, fields: !!null '',
        font_color: "#F7930D", italic: false, strikethrough: false, type: greater
          than, value: 0.2234}]
    defaults_version: 1
    hidden_pivots: {}
    note_display: hover
    note_state: collapsed
    note_text: This is the amount of time taken to format and stream results to the
      user browser cache and should be present in most queries. The recommended benchmark
      is 0.2234s. If higher, review the number of custom dimensions and measures &
      table calculations, use of pivots, use of merged queries and row limits within
      high throughput dashboards. Identify if custom dimensions and measures can be
      moved back into your Lookml model, if pivots are optimised to include only necessary
      information. Can merged queries be removed via creation of new explores and
      that row limits are in line with requirements. For example if using a single
      value visualisation. Ensure that you are not querying with a limit to 5000 rows.
    single_value_title: Post Processing - Stream to Cache Time
    listen:
      Row Limit: query.limit
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 21
    col: 0
    width: 12
    height: 4
    tab_name: Performance Metrics KPIs
  - title: Average Project Init
    name: Average Project Init
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [average_of_project_init, history.query_run_count_drill]
    filters:
      project_init: ">0"
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.async_processing
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 9505
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_async_runtime_value_populated
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.per_user_throttler
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 9521
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: was_per_user_throttling_applied_yesno
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: number
      category: dimension
      dimension: project_init
      expression: "${query_metrics.project_init}"
      label: project init
      value_format:
      value_format_name:
    - _kind_hint: measure
      _type_hint: number
      based_on: project_init
      category: measure
      expression: ''
      label: Average of project init
      measure: average_of_project_init
      type: average
      value_format:
      value_format_name: decimal_2
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Project Init Queries
    conditional_formatting: [{background_color: "#FFFFFF", bold: false, fields: !!null '',
        font_color: "#F7930D", italic: false, strikethrough: false, type: greater
          than, value: 0.1}]
    defaults_version: 1
    header_font_size: 12
    header_text_alignment: left
    hidden_pivots: {}
    hide_row_totals: false
    hide_totals: false
    label_type: labPer
    limit_displayed_rows: false
    note_display: hover
    note_state: collapsed
    note_text: The amount of time taken to initialise your project, This should be
      under 0.0 seconds (e.g. 0.09). If higher it may be valuable to consider breaking
      the project out into smaller components in a Hub and Spoke model
    rows_font_size: 12
    show_row_numbers: true
    show_view_names: false
    single_value_title: Average Project Init
    size_to_fit: true
    table_theme: white
    transpose: false
    truncate_text: true
    value_labels: legend
    listen:
      Row Limit: query.limit
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 7
    col: 0
    width: 4
    height: 4
    tab_name: Performance Metrics KPIs
  - title: Indicative Looker Overhead
    name: Indicative Looker Overhead
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [average_of_execute_main_query, average_of_async_processing, average_of_acquire_connection]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.async_processing
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 9620
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_async_runtime_value_populated
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.per_user_throttler
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 9636
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: was_per_user_throttling_applied_yesno
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: number
      category: dimension
      dimension: project_init
      expression: "${query_metrics.project_init}"
      label: project init
      value_format:
      value_format_name:
    - _kind_hint: measure
      _type_hint: number
      based_on: project_init
      category: measure
      expression: ''
      label: Average of project init
      measure: average_of_project_init
      type: average
      value_format:
      value_format_name: decimal_2
    - _kind_hint: dimension
      _type_hint: number
      category: dimension
      dimension: looker_processing_time
      expression: "${query_metrics.async_processing}-${query_metrics.execute_main_query}"
      label: Looker Processing Time
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: number
      category: dimension
      dimension: looker_overhead
      expression: "${looker_processing_time}/${query_metrics.async_processing}"
      label: Looker Overhead
      value_format:
      value_format_name:
    - _kind_hint: measure
      _type_hint: number
      based_on: looker_overhead
      category: measure
      expression: ''
      label: Average of Looker Overhead
      measure: average_of_looker_overhead
      type: average
      value_format:
      value_format_name: percent_2
    - _kind_hint: measure
      _type_hint: number
      based_on: looker_processing_time
      category: measure
      expression: ''
      filters:
        is_async_runtime_value_populated: 'Yes'
      label: Average of Looker Processing Time
      measure: average_of_looker_processing_time
      type: average
    - _kind_hint: measure
      _type_hint: number
      category: table_calculation
      expression: "${query_metrics.execute_main_query_average}/${query_metrics.async_processing_average}"
      is_disabled: true
      label: Looker Overhead
      table_calculation: looker_overhead_1
      value_format:
      value_format_name: percent_2
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.execute_main_query
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 9715
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: main_query_metric_is_populated
      label: Main Query Metric is populated
      value_format:
      value_format_name:
    - _kind_hint: measure
      _type_hint: number
      based_on: query_metrics.execute_main_query
      category: measure
      expression: ''
      filters:
        main_query_metric_is_populated: 'Yes'
      label: Average of Execute Main Query
      measure: average_of_execute_main_query
      type: average
    - _kind_hint: measure
      _type_hint: number
      based_on: query_metrics.async_processing
      category: measure
      expression: ''
      filters:
        is_async_runtime_value_populated: 'Yes'
      label: Average of Async Processing
      measure: average_of_async_processing
      type: average
    - _kind_hint: measure
      _type_hint: number
      category: table_calculation
      expression: "(((${average_of_execute_main_query}+${average_of_acquire_connection})/${average_of_async_processing})-1)*(-1)"
      label: Looker Overhead
      table_calculation: looker_overhead_2
      value_format:
      value_format_name: percent_2
    - _kind_hint: measure
      _type_hint: number
      category: table_calculation
      expression: "${average_of_async_processing}-(${average_of_execute_main_query}+${average_of_acquire_connection})"
      label: Overhead Time
      table_calculation: overhead_time
      value_format:
      value_format_name: decimal_2
    - _kind_hint: measure
      _type_hint: number
      based_on: query_metrics.acquire_connection
      expression: ''
      label: Average of Acquire Connection
      measure: average_of_acquire_connection
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
    comparison_label: Overhead Time
    defaults_version: 1
    header_font_size: 12
    header_text_alignment: left
    hidden_fields: [average_of_execute_main_query, average_of_async_processing, average_of_acquire_connection]
    hidden_pivots: {}
    hide_row_totals: false
    hide_totals: false
    interpolation: linear
    label_density: 25
    label_type: labPer
    legend_position: center
    limit_displayed_rows: false
    note_display: hover
    note_state: collapsed
    note_text: "The amount of time a query spends being processed exclusively within\
      \ Looker. This captures the percentage or pre & post processing as a total of\
      \ the overall query run time. \nFormula: Async Runtime - (Main query execution\
      \ + Acquire Connection time) "
    ordering: none
    plot_size_by_field: false
    point_style: none
    rows_font_size: 12
    show_null_labels: false
    show_null_points: true
    show_row_numbers: true
    show_silhouette: false
    show_totals_labels: false
    show_value_labels: false
    show_view_names: false
    show_x_axis_label: true
    show_x_axis_ticks: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    single_value_title: Indicative Looker Overhead
    size_to_fit: true
    stacking: ''
    table_theme: white
    totals_color: "#808080"
    transpose: false
    trellis: ''
    truncate_column_names: false
    truncate_text: true
    value_labels: legend
    x_axis_gridlines: false
    x_axis_reversed: false
    x_axis_scale: auto
    y_axis_combined: true
    y_axis_gridlines: true
    y_axis_reversed: false
    y_axis_scale_mode: linear
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    listen:
      Row Limit: query.limit
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 2
    col: 0
    width: 5
    height: 4
    tab_name: Performance Metrics KPIs
  - title: 'Model Init: Cache'
    name: 'Model Init: Cache'
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.model_init_cache_average, history.query_run_count_drill]
    filters:
      query_metrics.model_init_cache: ">0"
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.async_processing
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 9880
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_async_runtime_value_populated
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.per_user_throttler
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 9896
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: was_per_user_throttling_applied_yesno
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Model Init Queries
    conditional_formatting: [{background_color: "#FFFFFF", bold: false, fields: !!null '',
        font_color: "#F7930D", italic: false, strikethrough: false, type: greater
          than, value: 1}]
    defaults_version: 1
    hidden_pivots: {}
    note_display: hover
    note_state: collapsed
    note_text: This is the average time taken to validate your model from cache. This
      should impact a large proportion of your queries and execute faster than init
      from compute, returning in under a second. If the average time is high then
      performance may benefit from models being broken out into smaller components.
    single_value_title: 'Model Init: Cache'
    listen:
      Row Limit: query.limit
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 7
    col: 8
    width: 4
    height: 4
    tab_name: Performance Metrics KPIs
  - title: 'Explore Init: Cache'
    name: 'Explore Init: Cache'
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.marshalled_cache_load_average, history.query_run_count_drill]
    filters:
      query_metrics.marshalled_cache_load: ">0"
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.async_processing
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 9973
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_async_runtime_value_populated
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.per_user_throttler
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 9989
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: was_per_user_throttling_applied_yesno
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Explore Init Queries
    conditional_formatting: [{background_color: "#FFFFFF", bold: false, fields: !!null '',
        font_color: "#F7930D", italic: false, strikethrough: false, type: greater
          than, value: 0.3513}]
    defaults_version: 1
    hidden_pivots: {}
    note_display: hover
    note_state: collapsed
    note_text: This is the average time taken to validate explore code from cache.
      The recommended benchmark for this metric is 0.3513. This metric should cover
      a larger proportion of queries. If higher, review explores for optimisation
      either through restructure or efficiency of joins as well as moving custom dimensions
      and measures to LookML.
    single_value_title: 'Explore Init: Cache'
    listen:
      Row Limit: query.limit
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 7
    col: 16
    width: 4
    height: 4
    tab_name: Performance Metrics KPIs
  - title: Grand Totals Query Execution
    name: Grand Totals Query Execution
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [average_of_execute_grand_totals_query, history.query_run_count_drill]
    filters:
      query_metrics.execute_grand_totals_query: ">0"
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.async_processing
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 10058
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_async_runtime_value_populated
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.per_user_throttler
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 10074
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: was_per_user_throttling_applied_yesno
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
    - _kind_hint: measure
      _type_hint: number
      based_on: query_metrics.execute_row_totals_query
      expression: ''
      label: Average of Execute Row Totals Query
      measure: average_of_execute_row_totals_query
      type: average
    - _kind_hint: measure
      _type_hint: number
      based_on: query_metrics.execute_grand_totals_query
      expression: ''
      label: Average of Execute Grand Totals Query
      measure: average_of_execute_grand_totals_query
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
    comparison_label: Queries
    defaults_version: 1
    hidden_pivots: {}
    note_display: hover
    note_state: collapsed
    note_text: Looker executes grand totals queries separately to main query execution.
      Grand Totals (The sum of subtotals) should not be applied to all queries. If
      query totals are running against a large volume of queries and adding significantly
      to run time, review that all totals necessary for dashboards with high throughput.
    single_value_title: Grand Totals Query Execution
    listen:
      Row Limit: query.limit
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 12
    col: 20
    width: 4
    height: 4
    tab_name: Performance Metrics KPIs
  - name: Initialisation Phase
    type: text
    title_text: Initialisation Phase
    body_text: ''
    row: 6
    col: 0
    width: 24
    height: 1
    tab_name: Performance Metrics KPIs
  - title: Totals Query Execution
    name: Totals Query Execution
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [average_of_execute_totals_query, history.query_run_count_drill]
    filters:
      query_metrics.execute_totals_query: ">0"
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.async_processing
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 10165
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_async_runtime_value_populated
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.per_user_throttler
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 10181
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: was_per_user_throttling_applied_yesno
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
    - _kind_hint: measure
      _type_hint: number
      based_on: query_metrics.execute_totals_query
      expression: ''
      label: Average of Execute Totals Query
      measure: average_of_execute_totals_query
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
    comparison_label: Queries
    defaults_version: 1
    hidden_pivots: {}
    note_display: hover
    note_state: collapsed
    note_text: Looker executes totals queries separately to main query execution.
      Totals should not be applied to all queries. If query totals are running against
      a large volume of queries and adding significantly to run time, review that
      all totals are necessary for dashboards with high throughput
    single_value_title: Totals Query Execution
    listen:
      Row Limit: query.limit
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 12
    col: 12
    width: 4
    height: 4
    tab_name: Performance Metrics KPIs
  - name: Query Execution Phase
    type: text
    title_text: Query Execution Phase
    body_text: ''
    row: 11
    col: 0
    width: 24
    height: 1
    tab_name: Performance Metrics KPIs
  - title: Row Totals Query Execution
    name: Row Totals Query Execution
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [average_of_execute_row_totals_query, history.query_run_count_drill]
    filters:
      query_metrics.execute_row_totals_query: ">0"
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.async_processing
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 10265
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_async_runtime_value_populated
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.per_user_throttler
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 10281
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: was_per_user_throttling_applied_yesno
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
    - _kind_hint: measure
      _type_hint: number
      based_on: query_metrics.execute_row_totals_query
      expression: ''
      label: Average of Execute Row Totals Query
      measure: average_of_execute_row_totals_query
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
    comparison_label: Queries
    defaults_version: 1
    hidden_pivots: {}
    note_display: hover
    note_state: collapsed
    note_text: Looker executes row totals queries separately to main query execution.
      Row totals should not be applied to all queries. If query totals are running
      against a large volume of queries and adding significantly to run time, review
      that totals are necessary for dashboards with high throughput.
    single_value_title: Row Totals Query Execution
    listen:
      Row Limit: query.limit
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 12
    col: 16
    width: 4
    height: 4
    tab_name: Performance Metrics KPIs
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
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.async_processing
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 10356
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_async_runtime_value_populated
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.per_user_throttler
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 10372
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: was_per_user_throttling_applied_yesno
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
    - _kind_hint: measure
      _type_hint: number
      category: table_calculation
      expression: 1-(${history.database_result_query_count}/${history.query_run_count_drill})
      label: Cache Percent
      table_calculation: cache_percent
      value_format:
      value_format_name: percent_2
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Queries From Database
    defaults_version: 1
    hidden_fields: [history.query_run_count_drill, history.database_result_query_count]
    hidden_pivots: {}
    note_display: hover
    note_state: collapsed
    note_text: The percentage of queries taken from cache. This is the total number
      of where results were not sourced from the database and instead queried directly
      from previous results in Looker.
    single_value_title: Cache Percentage
    listen:
      Row Limit: query.limit
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 2
    col: 20
    width: 4
    height: 4
    tab_name: Performance Metrics KPIs
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
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.async_processing
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 10458
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_async_runtime_value_populated
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
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
    comparison_label: Load Process & Stream Main Query Count
    conditional_formatting: [{background_color: "#FFFFFF", bold: false, fields: !!null '',
        font_color: "#F7930D", italic: false, strikethrough: false, type: greater
          than, value: 0.2383}]
    defaults_version: 1
    hidden_pivots: {}
    note_display: hover
    note_state: collapsed
    note_text: This metric only applies to streamed queries. It tracks the time it
      takes in seconds to load the main query from the database, process it in Looker
      and stream it to the browser.
    single_value_title: Load Process and Stream Main Query
    listen:
      Row Limit: query.limit
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 16
    col: 0
    width: 4
    height: 4
    tab_name: Performance Metrics KPIs
  - title: Load Main Query in Memory
    name: Load Main Query in Memory
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.load_main_query_in_memory_average, history.query_run_count_drill]
    filters:
      query_metrics.load_main_query_in_memory: ">0"
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.async_processing
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 10555
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_async_runtime_value_populated
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Load Main Query Queries
    conditional_formatting: [{background_color: "#FFFFFF", bold: false, fields: !!null '',
        font_color: "#F7930D", italic: false, strikethrough: false, type: greater
          than, value: 0.2383}]
    defaults_version: 1
    hidden_pivots: {}
    note_display: hover
    note_state: collapsed
    note_text: This metric only applies to non-streamed queries. It tracks the time
      it takes in seconds to load the main query results in memory from the source
      database.
    single_value_title: Load Main Query in Memory
    listen:
      Row Limit: query.limit
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 16
    col: 4
    width: 4
    height: 4
    tab_name: Performance Metrics KPIs
  - title: Load Grand Totals In Memory Queries
    name: Load Grand Totals In Memory Queries
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [average_of_load_grand_totals_query_in_memory, history.query_run_count_drill]
    filters:
      query_metrics.load_grand_totals_query_in_memory: ">0"
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.async_processing
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 10631
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_async_runtime_value_populated
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
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
    comparison_label: Load Grand Totals Queries
    conditional_formatting: [{background_color: "#FFFFFF", bold: false, fields: !!null '',
        font_color: "#F7930D", italic: false, strikethrough: false, type: greater
          than, value: 0.2383}]
    defaults_version: 1
    hidden_pivots: {}
    note_display: hover
    note_state: collapsed
    note_text: This metric only applies to non-streamed queries and those with totals
      and row totals enabled. It tracks the time it takes in seconds to load the grand
      total query result in memory from the source database.
    single_value_title: Load Grand Totals In Memory Queries
    listen:
      Row Limit: query.limit
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 16
    col: 16
    width: 4
    height: 4
    tab_name: Performance Metrics KPIs
  - name: Post-Query Execution Phase
    type: text
    title_text: Post-Query Execution Phase
    body_text: ''
    row: 20
    col: 0
    width: 24
    height: 1
    tab_name: Performance Metrics KPIs
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
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.async_processing
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 10723
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_async_runtime_value_populated
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
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
    comparison_label: Load Totals Queries
    conditional_formatting: [{background_color: "#FFFFFF", bold: false, fields: !!null '',
        font_color: "#F7930D", italic: false, strikethrough: false, type: greater
          than, value: 0.2383}]
    defaults_version: 1
    hidden_pivots: {}
    note_display: hover
    note_state: collapsed
    note_text: This metric only applies to non-streamed queries and those with totals
      enabled. It tracks the time it takes in seconds to load the total query results
      in memory from the source database.
    single_value_title: Load Total Query in Memory
    listen:
      Row Limit: query.limit
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 16
    col: 8
    width: 4
    height: 4
    tab_name: Performance Metrics KPIs
  - title: Load Row Totals Query in Memory
    name: Load Row Totals Query in Memory
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [average_of_load_row_totals_query_in_memory, history.query_run_count_drill]
    filters:
      query_metrics.load_row_totals_query_in_memory: ">0"
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.async_processing
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 10806
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_async_runtime_value_populated
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
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
    comparison_label: Load Row Totals Queries
    conditional_formatting: [{background_color: "#FFFFFF", bold: false, fields: !!null '',
        font_color: "#F7930D", italic: false, strikethrough: false, type: greater
          than, value: 0.2383}]
    defaults_version: 1
    hidden_pivots: {}
    note_display: hover
    note_state: collapsed
    note_text: This metric only applies to non-streamed queries and those with row
      totals enabled. It tracks the time it takes in seconds to load the row total
      query results in memory from the source database.
    single_value_title: Load Row Totals Query in Memory
    listen:
      Row Limit: query.limit
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 16
    col: 12
    width: 4
    height: 4
    tab_name: Performance Metrics KPIs
  - title: Cache Load
    name: Cache Load
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.cache_load_average, history.query_run_count_drill]
    filters:
      query_metrics.cache_load: ">0"
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.async_processing
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 10896
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_async_runtime_value_populated
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
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
    comparison_label: Cache Load Queries
    conditional_formatting: [{background_color: "#FFFFFF", bold: false, fields: !!null '',
        font_color: "#F7930D", italic: false, strikethrough: false, type: greater
          than, value: 0.2383}]
    defaults_version: 1
    hidden_pivots: {}
    note_display: hover
    note_state: collapsed
    note_text: 'This metric only applies to cached queries. It tracks the time it
      takes to pull raw results from the result set cache. '
    single_value_title: Cache Load
    listen:
      Row Limit: query.limit
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 16
    col: 20
    width: 4
    height: 4
    tab_name: Performance Metrics KPIs
  - title: Post Processing Time
    name: Post Processing Time
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.postprocessing_average, history.query_run_count_drill]
    filters:
      query_metrics.post_processing: ">0"
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.async_processing
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 10985
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_async_runtime_value_populated
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.per_user_throttler
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 11001
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: was_per_user_throttling_applied_yesno
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Post Processing Queries
    conditional_formatting: [{background_color: "#FFFFFF", bold: false, fields: !!null '',
        font_color: "#F7930D", italic: false, strikethrough: false, type: greater
          than, value: 0.2234}]
    defaults_version: 1
    hidden_pivots: {}
    note_display: hover
    note_state: collapsed
    note_text: This is the amount of time taken to format and stream results to the
      user browser cache and should be present in most queries. The recommended benchmark
      is 0.2234s. If higher, review the number of custom dimensions and measures &
      table calculations, use of pivots, use of merged queries and row limits within
      high throughput dashboards. Identify if custom dimensions and measures can be
      moved back into your Lookml model, if pivots are optimised to include only necessary
      information. Can merged queries be removed via creation of new explores and
      that row limits are in line with requirements. For example if using a single
      value visualisation. Ensure that you are not querying with a limit to 5000 rows.
    single_value_title: Post Processing Time
    listen:
      Row Limit: query.limit
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 21
    col: 12
    width: 12
    height: 4
    tab_name: Performance Metrics KPIs
  - name: High Level Performance Metrics
    type: text
    title_text: High Level Performance Metrics
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 2
    tab_name: Performance Metrics KPIs
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
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.async_processing
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 11083
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_async_runtime_value_populated
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.per_user_throttler
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 11099
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: was_per_user_throttling_applied_yesno
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
    value_labels: legend
    label_type: labPer
    comparison_label: 'Model Init: From Cache'
    comparison_reverse_colors: false
    comparison_type: value
    conditional_formatting_include_nulls: false
    conditional_formatting_include_totals: false
    custom_color_enabled: true
    defaults_version: 1
    enable_conditional_formatting: false
    hidden_pivots: {}
    note_display: hover
    note_state: collapsed
    note_text: 'The number of queries to which Per user throttling was applied. '
    show_comparison: false
    show_comparison_label: true
    show_single_value_title: true
    single_value_title: Stream to Cache Time
    listen:
      Row Limit: query.limit
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 24
    col: 0
    width: 8
    height: 13
    tab_name: Performance Metrics - Query Analysis
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
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.async_processing
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 11168
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_async_runtime_value_populated
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.per_user_throttler
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 11184
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: was_per_user_throttling_applied_yesno
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: number
      category: dimension
      dimension: project_init
      expression: "${query_metrics.project_init}"
      label: project init
      value_format:
      value_format_name:
    - _kind_hint: measure
      _type_hint: number
      based_on: project_init
      category: measure
      expression: ''
      label: Average of project init
      measure: average_of_project_init
      type: average
      value_format:
      value_format_name: decimal_2
    - _kind_hint: dimension
      _type_hint: number
      category: dimension
      dimension: looker_processing_time
      expression: "${query_metrics.async_processing}-${query_metrics.execute_main_query}"
      label: Looker Processing Time
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: number
      category: dimension
      dimension: looker_overhead
      expression: "${looker_processing_time}/${query_metrics.async_processing}"
      label: Looker Overhead
      value_format:
      value_format_name:
    - _kind_hint: measure
      _type_hint: number
      based_on: looker_overhead
      category: measure
      expression: ''
      label: Average of Looker Overhead
      measure: average_of_looker_overhead
      type: average
      value_format:
      value_format_name: percent_2
    - _kind_hint: measure
      _type_hint: number
      based_on: looker_processing_time
      category: measure
      expression: ''
      filters:
        is_async_runtime_value_populated: 'Yes'
      label: Average of Looker Processing Time
      measure: average_of_looker_processing_time
      type: average
    - _kind_hint: measure
      _type_hint: number
      category: table_calculation
      expression: "${query_metrics.execute_main_query_average}/${query_metrics.async_processing_average}"
      is_disabled: true
      label: Looker Overhead
      table_calculation: looker_overhead_1
      value_format:
      value_format_name: percent_2
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.execute_main_query
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 11263
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: main_query_metric_is_populated
      label: Main Query Metric is populated
      value_format:
      value_format_name:
    - _kind_hint: measure
      _type_hint: number
      based_on: query_metrics.execute_main_query
      category: measure
      expression: ''
      filters:
        main_query_metric_is_populated: 'Yes'
      label: Average of Execute Main Query
      measure: average_of_execute_main_query
      type: average
    - _kind_hint: measure
      _type_hint: number
      based_on: query_metrics.async_processing
      category: measure
      expression: ''
      filters:
        is_async_runtime_value_populated: 'Yes'
      label: Average of Async Processing
      measure: average_of_async_processing
      type: average
    - _kind_hint: measure
      _type_hint: number
      category: table_calculation
      expression: "((${average_of_execute_main_query}/${average_of_async_processing})-1)*(-1)"
      is_disabled: true
      label: Looker Overhead
      table_calculation: looker_overhead_2
      value_format:
      value_format_name: percent_2
    - _kind_hint: measure
      _type_hint: number
      category: table_calculation
      expression: "${average_of_async_processing}-${average_of_execute_main_query}"
      is_disabled: true
      label: Overhead Time
      table_calculation: overhead_time
      value_format:
      value_format_name: decimal_2
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
    comparison_label: Overhead Time
    comparison_reverse_colors: false
    comparison_type: value
    conditional_formatting_include_nulls: false
    conditional_formatting_include_totals: false
    custom_color_enabled: true
    defaults_version: 1
    enable_conditional_formatting: false
    header_font_size: 12
    header_text_alignment: left
    hidden_fields: [average_of_execute_main_query]
    hidden_pivots: {}
    hide_row_totals: false
    hide_totals: false
    label_type: labPer
    ordering: none
    rows_font_size: 12
    show_comparison: true
    show_comparison_label: true
    show_null_labels: false
    show_row_numbers: true
    show_silhouette: false
    show_single_value_title: true
    show_totals_labels: false
    single_value_title: Indicative Looker Overhead
    size_to_fit: true
    table_theme: white
    totals_color: "#808080"
    transpose: false
    truncate_column_names: false
    truncate_text: true
    value_labels: legend
    x_axis_zoom: true
    y_axes: [{label: '', orientation: left, series: [{axisId: history.query_run_count_drill,
            id: history.query_run_count_drill, name: Query Run Count2}], showLabels: true,
        showValues: true, tickDensity: default, tickDensityCustom: 5, type: linear,
        unpinAxis: false}, {label: '', orientation: right, series: [{axisId: average_of_async_processing,
            id: average_of_async_processing, name: Average of Async Processing}],
        showLabels: true, showValues: true, tickDensity: default, type: linear, unpinAxis: false}]
    y_axis_zoom: true
    listen:
      Row Limit: query.limit
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 3
    col: 0
    width: 24
    height: 9
    tab_name: Performance Metrics - Query Analysis
  - name: Query Overview
    type: text
    title_text: Query Overview
    body_text: ''
    row: 21
    col: 0
    width: 24
    height: 3
    tab_name: Performance Metrics - Query Analysis
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
    comparison_label: Overhead Time
    comparison_reverse_colors: false
    comparison_type: value
    conditional_formatting_include_nulls: false
    conditional_formatting_include_totals: false
    custom_color_enabled: true
    defaults_version: 1
    enable_conditional_formatting: false
    header_font_size: 12
    header_text_alignment: left
    hidden_fields: []
    hidden_pivots: {}
    hide_row_totals: false
    hide_totals: false
    label_type: labPer
    ordering: none
    rows_font_size: 12
    show_comparison: true
    show_comparison_label: true
    show_null_labels: false
    show_row_numbers: true
    show_single_value_title: true
    single_value_title: Indicative Looker Overhead
    size_to_fit: true
    table_theme: white
    transpose: false
    truncate_column_names: false
    truncate_text: true
    value_labels: legend
    x_axis_zoom: true
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
        showLabels: true, showValues: true, tickDensity: default, type: linear, unpinAxis: false}]
    y_axis_zoom: false
    listen:
      Row Limit: query.limit
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 12
    col: 0
    width: 24
    height: 9
    tab_name: Performance Metrics - Query Analysis
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: Timeseries
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 3
    tab_name: Performance Metrics - Query Analysis
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
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.async_processing
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 11603
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_async_runtime_value_populated
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.per_user_throttler
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 11619
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: was_per_user_throttling_applied_yesno
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
    value_labels: legend
    label_type: labPer
    comparison_label: 'Model Init: From Cache'
    comparison_reverse_colors: false
    comparison_type: value
    conditional_formatting_include_nulls: false
    conditional_formatting_include_totals: false
    custom_color_enabled: true
    defaults_version: 1
    enable_conditional_formatting: false
    hidden_pivots: {}
    note_display: hover
    note_state: collapsed
    note_text: 'The number of queries to which Per user throttling was applied. '
    show_comparison: false
    show_comparison_label: true
    show_single_value_title: true
    single_value_title: Stream to Cache Time
    listen:
      Row Limit: query.limit
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 24
    col: 8
    width: 8
    height: 13
    tab_name: Performance Metrics - Query Analysis
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
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.async_processing
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 11688
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_async_runtime_value_populated
      label: Is Async Runtime Value Populated
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query_metrics.per_user_throttler
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 11704
          filter: ">0"
          label: 'Yes'
      - 'No'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: was_per_user_throttling_applied_yesno
      label: Was Per User Throttling applied (Yes/No)
      value_format:
      value_format_name:
    value_labels: legend
    label_type: labPer
    comparison_label: 'Model Init: From Cache'
    comparison_reverse_colors: false
    comparison_type: value
    conditional_formatting_include_nulls: false
    conditional_formatting_include_totals: false
    custom_color_enabled: true
    defaults_version: 1
    enable_conditional_formatting: false
    hidden_pivots: {}
    note_display: hover
    note_state: collapsed
    note_text: 'The number of queries to which Per user throttling was applied. '
    show_comparison: false
    show_comparison_label: true
    show_single_value_title: true
    single_value_title: Stream to Cache Time
    listen:
      Row Limit: query.limit
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 24
    col: 16
    width: 8
    height: 13
    tab_name: Performance Metrics - Query Analysis
  - title: Async Processing time - Outliers
    name: Async Processing time - Outliers
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.async_processing, query.link]
    sorts: [query_metrics.async_processing desc]
    limit: 1
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    show_view_names: false
    single_value_title: Async Query Time
    listen:
      Query ID: query.id
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 5
    col: 0
    width: 3
    height: 4
    tab_name: Performance Metrics - Outliers
  - title: Queue Time - Outliers
    name: Queue Time - Outliers
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.queued, query.link]
    sorts: [query_metrics.queued desc]
    limit: 1
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    show_view_names: false
    single_value_title: Queue Time
    listen:
      Query ID: query.id
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 5
    col: 3
    width: 3
    height: 4
    tab_name: Performance Metrics - Outliers
  - title: Acquire Connection - Outliers
    name: Acquire Connection - Outliers
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.acquire_connection, query.link]
    sorts: [query_metrics.acquire_connection desc]
    limit: 1
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: "'"
    defaults_version: 1
    show_view_names: false
    single_value_title: Acquire Connection
    listen:
      Query ID: query.id
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 5
    col: 8
    width: 3
    height: 4
    tab_name: Performance Metrics - Outliers
  - title: Connection Held - Outliers
    name: Connection Held - Outliers
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.connection_held, query.link]
    sorts: [query_metrics.connection_held desc]
    limit: 1
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: "'"
    defaults_version: 1
    show_view_names: false
    single_value_title: Connection Held
    listen:
      Query ID: query.id
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 5
    col: 11
    width: 3
    height: 4
    tab_name: Performance Metrics - Outliers
  - title: Per-User Throttler - Outliers
    name: Per-User Throttler - Outliers
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.per_user_throttler, query.link]
    sorts: [query_metrics.per_user_throttler desc]
    limit: 1
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: "'"
    defaults_version: 1
    show_view_names: false
    single_value_title: Per User Throttler
    listen:
      Query ID: query.id
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 5
    col: 14
    width: 3
    height: 4
    tab_name: Performance Metrics - Outliers
  - title: Explore Init - Computed - Outliers
    name: Explore Init - Computed - Outliers
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.explore_init, query.link]
    sorts: [query_metrics.explore_init desc]
    limit: 1
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: "'"
    defaults_version: 1
    show_view_names: false
    single_value_title: 'Explore Init: Computed'
    listen:
      Query ID: query.id
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 9
    col: 18
    width: 3
    height: 4
    tab_name: Performance Metrics - Outliers
  - title: 'Explore Init: From Cache - Outlier'
    name: 'Explore Init: From Cache - Outlier'
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.marshalled_cache_load, query.link]
    sorts: [query_metrics.marshalled_cache_load desc]
    limit: 1
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: "'"
    defaults_version: 1
    show_view_names: false
    single_value_title: 'Explore Init: From Cache'
    listen:
      Query ID: query.id
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 9
    col: 21
    width: 3
    height: 4
    tab_name: Performance Metrics - Outliers
  - title: 'Model Init: Computed  - Outliers'
    name: 'Model Init: Computed  - Outliers'
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.model_init_computed, query.link]
    sorts: [query_metrics.model_init_computed desc]
    limit: 1
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: "'"
    defaults_version: 1
    show_view_names: false
    single_value_title: 'Model Init: Computed'
    listen:
      Query ID: query.id
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 5
    col: 18
    width: 3
    height: 4
    tab_name: Performance Metrics - Outliers
  - title: 'Model Init: From Cache - Outliers'
    name: 'Model Init: From Cache - Outliers'
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.model_init_cache, query.link]
    sorts: [query_metrics.model_init_cache desc]
    limit: 1
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: "'"
    defaults_version: 1
    show_view_names: false
    single_value_title: 'Model Init: From Cache'
    listen:
      Query ID: query.id
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 5
    col: 21
    width: 3
    height: 4
    tab_name: Performance Metrics - Outliers
  - title: Prepare - Outliers
    name: Prepare - Outliers
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.prepare, query.link]
    sorts: [query_metrics.prepare desc]
    limit: 1
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: "'"
    defaults_version: 1
    note_display: hover
    note_state: collapsed
    note_text: 'Prepare is the amount of time spent creating a sql query following
      LookML validation. '
    show_view_names: false
    single_value_title: Prepare
    listen:
      Query ID: query.id
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 13
    col: 19
    width: 4
    height: 3
    tab_name: Performance Metrics - Outliers
  - title: Cache Load - Outliers
    name: Cache Load - Outliers
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.cache_load, query.link]
    sorts: [query_metrics.cache_load desc]
    limit: 1
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: "'"
    defaults_version: 1
    show_view_names: false
    single_value_title: Cache Load
    listen:
      Query ID: query.id
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 11
    col: 0
    width: 3
    height: 4
    tab_name: Performance Metrics - Outliers
  - title: Execute Main Query - Outliers
    name: Execute Main Query - Outliers
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.execute_main_query, query.link]
    sorts: [query_metrics.execute_main_query desc]
    limit: 1
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: "'"
    defaults_version: 1
    show_view_names: false
    single_value_title: Execute Main Query
    listen:
      Query ID: query.id
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 11
    col: 3
    width: 3
    height: 4
    tab_name: Performance Metrics - Outliers
  - title: Load Main Query In Memory - Outliers
    name: Load Main Query In Memory - Outliers
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.load_main_query_in_memory, query.link]
    sorts: [query_metrics.load_main_query_in_memory desc]
    limit: 1
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: "'"
    defaults_version: 1
    show_view_names: false
    single_value_title: Load Main Query
    listen:
      Query ID: query.id
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 15
    col: 3
    width: 3
    height: 4
    tab_name: Performance Metrics - Outliers
  - title: Load Process and Stream Main Query - Outliers
    name: Load Process and Stream Main Query - Outliers
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.load_process_and_stream_main_query, query.link]
    sorts: [query_metrics.load_process_and_stream_main_query desc]
    limit: 1
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: "'"
    defaults_version: 1
    show_view_names: false
    single_value_title: Process and Stream
    listen:
      Query ID: query.id
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 15
    col: 0
    width: 3
    height: 4
    tab_name: Performance Metrics - Outliers
  - title: Execute Grand Totals Query - Outliers
    name: Execute Grand Totals Query - Outliers
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.execute_grand_totals_query, query.link]
    sorts: [query_metrics.execute_grand_totals_query desc]
    limit: 1
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: "'"
    defaults_version: 1
    show_view_names: false
    single_value_title: Execute Grand Totals Query
    listen:
      Query ID: query.id
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 11
    col: 8
    width: 3
    height: 4
    tab_name: Performance Metrics - Outliers
  - title: Execute Row Totals Query - Outliers
    name: Execute Row Totals Query - Outliers
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.execute_row_totals_query, query.link]
    sorts: [query_metrics.execute_row_totals_query desc]
    limit: 1
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: "'"
    defaults_version: 1
    show_view_names: false
    single_value_title: Execute Row Totals Query
    listen:
      Query ID: query.id
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 11
    col: 11
    width: 3
    height: 4
    tab_name: Performance Metrics - Outliers
  - title: Execute Totals Query - Outliers
    name: Execute Totals Query - Outliers
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.execute_totals_query, query.link]
    sorts: [query_metrics.execute_totals_query desc]
    limit: 1
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: "'"
    defaults_version: 1
    show_view_names: false
    single_value_title: Execute Totals Query
    listen:
      Query ID: query.id
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 11
    col: 14
    width: 3
    height: 4
    tab_name: Performance Metrics - Outliers
  - title: Load Grand Totals Query In Memory - Outliers
    name: Load Grand Totals Query In Memory - Outliers
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.load_grand_totals_query_in_memory, query.link]
    sorts: [query_metrics.load_grand_totals_query_in_memory desc]
    limit: 1
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: "'"
    defaults_version: 1
    show_view_names: false
    single_value_title: Load Grand Totals
    listen:
      Query ID: query.id
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 15
    col: 8
    width: 3
    height: 4
    tab_name: Performance Metrics - Outliers
  - title: Load Row Totals Query In Memory - Outliers
    name: Load Row Totals Query In Memory - Outliers
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.load_row_totals_query_in_memory, query.link]
    sorts: [query_metrics.load_row_totals_query_in_memory desc]
    limit: 1
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: "'"
    defaults_version: 1
    show_view_names: false
    single_value_title: Load Row Totals Query In Memory
    listen:
      Query ID: query.id
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 15
    col: 11
    width: 3
    height: 4
    tab_name: Performance Metrics - Outliers
  - title: Load Totals Query In Memory - Outliers
    name: Load Totals Query In Memory - Outliers
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.load_totals_query_in_memory, query.link]
    sorts: [query_metrics.load_totals_query_in_memory desc]
    limit: 1
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: "'"
    defaults_version: 1
    show_view_names: false
    single_value_title: Load Totals Query In Memory
    listen:
      Query ID: query.id
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 15
    col: 14
    width: 3
    height: 4
    tab_name: Performance Metrics - Outliers
  - title: PDTs - Outliers
    name: PDTs - Outliers
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.pdt, query.link]
    sorts: [query_metrics.pdt desc]
    limit: 1
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: "'"
    defaults_version: 1
    show_view_names: false
    single_value_title: PDTs
    listen:
      Query ID: query.id
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 19
    col: 11
    width: 3
    height: 2
    tab_name: Performance Metrics - Outliers
  - title: Postprocessing - Outliers
    name: Postprocessing - Outliers
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [query_metrics.post_processing, query.link]
    sorts: [query_metrics.post_processing desc]
    limit: 1
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: "'"
    defaults_version: 1
    show_view_names: false
    single_value_title: Postprocessing
    listen:
      Query ID: query.id
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 23
    col: 0
    width: 3
    height: 4
    tab_name: Performance Metrics - Outliers
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
    comparison_label: "'"
    defaults_version: 1
    show_view_names: false
    single_value_title: Stream to Cache
    listen:
      Query ID: query.id
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 23
    col: 3
    width: 3
    height: 4
    tab_name: Performance Metrics - Outliers
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
    comparison_label: "'"
    comparison_reverse_colors: false
    comparison_type: value
    conditional_formatting_include_nulls: false
    conditional_formatting_include_totals: false
    custom_color_enabled: true
    defaults_version: 1
    enable_conditional_formatting: false
    hidden_fields:
    show_comparison: true
    show_comparison_label: true
    show_single_value_title: true
    single_value_title: Stream to Cache
    x_axis_zoom: true
    y_axis_zoom: true
    listen:
      Query ID: query.id
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 30
    col: 0
    width: 8
    height: 16
    tab_name: Performance Metrics - Outliers
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
    comparison_label: "'"
    comparison_reverse_colors: false
    comparison_type: value
    conditional_formatting_include_nulls: false
    conditional_formatting_include_totals: false
    custom_color_enabled: true
    defaults_version: 1
    enable_conditional_formatting: false
    hidden_fields: []
    show_comparison: true
    show_comparison_label: true
    show_single_value_title: true
    single_value_title: Stream to Cache
    listen:
      Query ID: query.id
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 46
    col: 8
    width: 8
    height: 16
    tab_name: Performance Metrics - Outliers
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
    comparison_label: "'"
    comparison_reverse_colors: false
    comparison_type: value
    conditional_formatting_include_nulls: false
    conditional_formatting_include_totals: false
    custom_color_enabled: true
    defaults_version: 1
    enable_conditional_formatting: false
    hidden_fields: []
    show_comparison: true
    show_comparison_label: true
    show_single_value_title: true
    single_value_title: Stream to Cache
    listen:
      Query ID: query.id
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 46
    col: 0
    width: 8
    height: 16
    tab_name: Performance Metrics - Outliers
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
    comparison_label: "'"
    comparison_reverse_colors: false
    comparison_type: value
    conditional_formatting_include_nulls: false
    conditional_formatting_include_totals: false
    custom_color_enabled: true
    defaults_version: 1
    enable_conditional_formatting: false
    hidden_fields: []
    show_comparison: true
    show_comparison_label: true
    show_single_value_title: true
    single_value_title: Stream to Cache
    listen:
      Query ID: query.id
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 46
    col: 16
    width: 8
    height: 16
    tab_name: Performance Metrics - Outliers
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
    comparison_label: "'"
    comparison_reverse_colors: false
    comparison_type: value
    conditional_formatting_include_nulls: false
    conditional_formatting_include_totals: false
    custom_color_enabled: true
    defaults_version: 1
    enable_conditional_formatting: false
    hidden_fields: []
    hidden_pivots: {}
    show_comparison: true
    show_comparison_label: true
    show_single_value_title: true
    single_value_title: Stream to Cache
    listen:
      Query ID: query.id
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 62
    col: 0
    width: 8
    height: 13
    tab_name: Performance Metrics - Outliers
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
    conditional_formatting_include_nulls: false
    conditional_formatting_include_totals: false
    defaults_version: 1
    enable_conditional_formatting: false
    header_font_size: 12
    header_text_alignment: left
    hidden_pivots: {}
    hide_row_totals: false
    hide_totals: false
    limit_displayed_rows: false
    rows_font_size: 12
    show_row_numbers: true
    size_to_fit: true
    table_theme: white
    transpose: false
    truncate_text: true
    listen:
      Query ID: query.id
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 62
    col: 8
    width: 16
    height: 13
    tab_name: Performance Metrics - Outliers
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: 'Timings: Asynchronous Worker'
    body_text: ''
    row: 3
    col: 0
    width: 4
    height: 2
    tab_name: Performance Metrics - Outliers
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
    row: 0
    col: 0
    width: 24
    height: 3
    tab_name: Performance Metrics - Outliers
  - name: " (4)"
    type: text
    title_text: ''
    body_text: ''
    row: 3
    col: 6
    width: 2
    height: 6
    tab_name: Performance Metrics - Outliers
  - name: " (5)"
    type: text
    title_text: ''
    subtitle_text: 'Timings: Initialization'
    body_text: ''
    row: 3
    col: 17
    width: 6
    height: 2
    tab_name: Performance Metrics - Outliers
  - name: " (6)"
    type: text
    title_text: ''
    subtitle_text: 'Timings: Connection Handling'
    body_text: ''
    row: 3
    col: 8
    width: 9
    height: 2
    tab_name: Performance Metrics - Outliers
  - name: " (7)"
    type: text
    title_text: ''
    subtitle_text: 'Timings: Main Query'
    body_text: ''
    row: 9
    col: 0
    width: 6
    height: 2
    tab_name: Performance Metrics - Outliers
  - name: " (8)"
    type: text
    title_text: ''
    subtitle_text: 'Timings: Post Query'
    body_text: ''
    row: 22
    col: 0
    width: 6
    height: 1
    tab_name: Performance Metrics - Outliers
  - name: " (9)"
    type: text
    title_text: ''
    subtitle_text: 'Timings: Misc. Ancillary Queries'
    body_text: ''
    row: 9
    col: 6
    width: 12
    height: 2
    tab_name: Performance Metrics - Outliers
  - name: Async Runtime Breakdown
    type: text
    title_text: Async Runtime Breakdown
    body_text: ''
    row: 27
    col: 0
    width: 24
    height: 3
    tab_name: Performance Metrics - Outliers
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
    comparison_label: "'"
    comparison_reverse_colors: false
    comparison_type: value
    conditional_formatting_include_nulls: false
    conditional_formatting_include_totals: false
    custom_color_enabled: true
    defaults_version: 1
    enable_conditional_formatting: false
    hidden_fields:
    show_comparison: true
    show_comparison_label: true
    show_single_value_title: true
    single_value_title: Stream to Cache
    listen:
      Query ID: query.id
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 30
    col: 8
    width: 8
    height: 16
    tab_name: Performance Metrics - Outliers
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
    - _kind_hint: dimension
      _type_hint: number
      category: dimension
      dimension: looker_overhead_runtime
      expression: "${query_metrics.async_processing}-${query_metrics.execute_main_query}"
      label: Looker Overhead Runtime
      value_format:
      value_format_name:
    - _kind_hint: measure
      _type_hint: number
      based_on: looker_overhead_runtime
      category: measure
      expression: ''
      label: Average of Looker Processing
      measure: average_of_looker_processing
      type: average
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
    comparison_label: "'"
    comparison_reverse_colors: false
    comparison_type: value
    conditional_formatting_include_nulls: false
    conditional_formatting_include_totals: false
    custom_color_enabled: true
    defaults_version: 1
    enable_conditional_formatting: false
    hidden_fields:
    hidden_pivots: {}
    show_comparison: true
    show_comparison_label: true
    show_single_value_title: true
    single_value_title: Stream to Cache
    listen:
      Query ID: query.id
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 30
    col: 16
    width: 8
    height: 16
    tab_name: Performance Metrics - Outliers
  - name: " (10)"
    type: text
    title_text: ''
    subtitle_text: Query Counts
    body_text: ''
    row: 22
    col: 6
    width: 18
    height: 1
    tab_name: Performance Metrics - Outliers
  - name: " (11)"
    type: text
    title_text: ''
    body_text: ''
    row: 21
    col: 0
    width: 24
    height: 1
    tab_name: Performance Metrics - Outliers
  - title: Total Query Count - Outliers
    name: Total Query Count - Outliers
    model: system__activity
    explore: query_metrics
    type: single_value
    fields: [history.query_run_count_drill, history.cache_result_query_count, history.database_result_query_count]
    limit: 1
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: "'"
    defaults_version: 1
    show_view_names: false
    single_value_title: Total Query Count
    listen:
      Query ID: query.id
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 23
    col: 8
    width: 3
    height: 4
    tab_name: Performance Metrics - Outliers
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
    comparison_label: "'"
    defaults_version: 1
    hidden_fields: [history.query_run_count_drill, history.cache_result_query_count]
    show_view_names: false
    single_value_title: Database Query Count
    listen:
      Query ID: query.id
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 23
    col: 14
    width: 3
    height: 4
    tab_name: Performance Metrics - Outliers
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
    comparison_label: "'"
    defaults_version: 1
    hidden_fields: [history.query_run_count_drill]
    show_view_names: false
    single_value_title: Cache Query Count
    listen:
      Query ID: query.id
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 23
    col: 11
    width: 3
    height: 4
    tab_name: Performance Metrics - Outliers
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
    comparison_label: Average Run Time
    defaults_version: 1
    label_density: 25
    legend_position: center
    limit_displayed_rows: false
    ordering: none
    plot_size_by_field: false
    point_style: none
    show_null_labels: false
    show_silhouette: false
    show_totals_labels: false
    show_value_labels: false
    show_view_names: false
    show_x_axis_label: true
    show_x_axis_ticks: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    single_value_title: Query Run Count
    stacking: ''
    totals_color: "#808080"
    trellis: ''
    x_axis_gridlines: false
    x_axis_reversed: false
    x_axis_scale: auto
    y_axis_combined: true
    y_axis_gridlines: true
    y_axis_reversed: false
    y_axis_scale_mode: linear
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    listen:
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 0
    col: 3
    width: 4
    height: 4
    tab_name: History Analysis
  - title: Cache Queries
    name: Cache Queries
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
    comparison_label: Average Run Time
    defaults_version: 1
    hidden_pivots: {}
    label_density: 25
    legend_position: center
    limit_displayed_rows: false
    ordering: none
    plot_size_by_field: false
    point_style: none
    show_null_labels: false
    show_silhouette: false
    show_totals_labels: false
    show_value_labels: false
    show_view_names: false
    show_x_axis_label: true
    show_x_axis_ticks: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    single_value_title: Cache Queries
    stacking: ''
    totals_color: "#808080"
    trellis: ''
    x_axis_gridlines: false
    x_axis_reversed: false
    x_axis_scale: auto
    y_axis_combined: true
    y_axis_gridlines: true
    y_axis_reversed: false
    y_axis_scale_mode: linear
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    listen:
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 4
    col: 3
    width: 4
    height: 4
    tab_name: History Analysis
  - title: Database Queries
    name: Database Queries
    model: system__activity
    explore: history
    type: single_value
    fields: [history.database_result_query_count, history.average_runtime]
    filters:
      role.name: ''
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
    comparison_label: Average Run Time
    defaults_version: 1
    hidden_pivots: {}
    label_density: 25
    legend_position: center
    limit_displayed_rows: false
    ordering: none
    plot_size_by_field: false
    point_style: none
    show_null_labels: false
    show_silhouette: false
    show_totals_labels: false
    show_value_labels: false
    show_view_names: false
    show_x_axis_label: true
    show_x_axis_ticks: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    single_value_title: Database Queries
    stacking: ''
    totals_color: "#808080"
    trellis: ''
    x_axis_gridlines: false
    x_axis_reversed: false
    x_axis_scale: auto
    y_axis_combined: true
    y_axis_gridlines: true
    y_axis_reversed: false
    y_axis_scale_mode: linear
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    listen:
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 8
    col: 3
    width: 4
    height: 4
    tab_name: History Analysis
  - title: Queries Per Weekday
    name: Queries Per Weekday
    model: system__activity
    explore: history
    type: looker_area
    fields: [history.query_run_count, history.result_source, history.completed_date]
    pivots: [history.result_source]
    filters:
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
    comparison_label: Average Run Time
    comparison_reverse_colors: false
    comparison_type: value
    conditional_formatting_include_nulls: false
    conditional_formatting_include_totals: false
    custom_color_enabled: true
    defaults_version: 1
    enable_conditional_formatting: false
    hidden_pivots: {}
    ordering: none
    show_comparison: true
    show_comparison_label: true
    show_null_labels: false
    show_single_value_title: true
    single_value_title: Database Queries
    x_axis_zoom: true
    y_axes: [{label: '', orientation: left, series: [{axisId: history.query_run_count,
            id: cache - history.query_run_count, name: cache - History Query Run Count},
          {axisId: history.query_run_count, id: query - history.query_run_count, name: query
              - History Query Run Count}], showLabels: true, showValues: true, tickDensity: default,
        tickDensityCustom: 5, type: linear, unpinAxis: false}, {label: !!null '',
        orientation: right, series: [{axisId: history.average_runtime, id: cache -
              history.average_runtime, name: cache - History Average Runtime in Seconds},
          {axisId: history.average_runtime, id: query - history.average_runtime, name: query
              - History Average Runtime in Seconds}], showLabels: true, showValues: true,
        tickDensity: default, tickDensityCustom: 5, type: linear, unpinAxis: false}]
    y_axis_zoom: true
    listen:
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 15
    col: 0
    width: 24
    height: 10
    tab_name: History Analysis
  - title: Average Runtime Per Day
    name: Average Runtime Per Day
    model: system__activity
    explore: history
    type: looker_area
    fields: [history.result_source, history.completed_date, history.average_runtime]
    pivots: [history.result_source]
    filters:
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
    comparison_label: Average Run Time
    comparison_reverse_colors: false
    comparison_type: value
    conditional_formatting_include_nulls: false
    conditional_formatting_include_totals: false
    custom_color_enabled: true
    defaults_version: 1
    enable_conditional_formatting: false
    hidden_pivots: {}
    ordering: none
    show_comparison: true
    show_comparison_label: true
    show_null_labels: false
    show_single_value_title: true
    single_value_title: Database Queries
    x_axis_zoom: true
    y_axes: [{label: '', orientation: left, series: [{axisId: history.query_run_count,
            id: cache - history.query_run_count, name: cache - History Query Run Count},
          {axisId: history.query_run_count, id: query - history.query_run_count, name: query
              - History Query Run Count}], showLabels: true, showValues: true, tickDensity: default,
        tickDensityCustom: 5, type: linear, unpinAxis: false}, {label: !!null '',
        orientation: right, series: [{axisId: history.average_runtime, id: cache -
              history.average_runtime, name: cache - History Average Runtime in Seconds},
          {axisId: history.average_runtime, id: query - history.average_runtime, name: query
              - History Average Runtime in Seconds}], showLabels: true, showValues: true,
        tickDensity: default, tickDensityCustom: 5, type: linear, unpinAxis: false}]
    y_axis_zoom: true
    listen:
      User: user.name
      Created Date: history.completed_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 25
    col: 0
    width: 24
    height: 9
    tab_name: History Analysis
  - title: Query by Source and Issuer
    name: Query by Source and Issuer
    model: system__activity
    explore: history
    type: looker_donut_multiples
    fields: [history.issuer_source, history.query_run_count, history.result_source]
    pivots: [history.issuer_source]
    fill_fields: [history.issuer_source]
    sorts: [history.issuer_source, history.query_run_count desc 0]
    limit: 500
    column_limit: 50
    show_value_labels: false
    font_size: 12
    defaults_version: 1
    hidden_fields: []
    hidden_pivots: {}
    hidden_points_if_no: []
    label_density: 25
    label_type: labPer
    legend_position: center
    limit_displayed_rows: false
    ordering: none
    plot_size_by_field: false
    point_style: none
    show_null_labels: false
    show_silhouette: false
    show_totals_labels: false
    show_view_names: false
    show_x_axis_label: true
    show_x_axis_ticks: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    stacking: ''
    totals_color: "#808080"
    trellis: ''
    value_labels: legend
    x_axis_gridlines: false
    x_axis_reversed: false
    x_axis_scale: auto
    y_axis_combined: true
    y_axis_gridlines: true
    y_axis_reversed: false
    y_axis_scale_mode: linear
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    listen:
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 0
    col: 19
    width: 5
    height: 12
    tab_name: History Analysis
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
    conditional_formatting_include_nulls: false
    conditional_formatting_include_totals: false
    defaults_version: 1
    enable_conditional_formatting: false
    header_font_size: 12
    header_text_alignment: left
    hide_row_totals: false
    hide_totals: false
    note_display: hover
    note_state: collapsed
    note_text: 'Individual queries by the number of times that query has been run
      representing priories for optimisation. '
    rows_font_size: 12
    show_row_numbers: true
    size_to_fit: true
    table_theme: white
    transpose: false
    truncate_text: true
    listen:
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 47
    col: 0
    width: 8
    height: 17
    tab_name: History Analysis
  - title: Top 50 Error Messages
    name: Top 50 Error Messages
    model: system__activity
    explore: history
    type: looker_grid
    fields: [history.query_run_count, history.message]
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
    font_size: 12
    hidden_pivots: {}
    label_density: 25
    label_type: labPer
    legend_position: center
    minimum_column_width: 75
    ordering: none
    plot_size_by_field: false
    point_style: none
    series_cell_visualizations:
      history.query_run_count:
        is_active: false
    series_column_widths:
      history.message: 1129
    show_null_labels: false
    show_row_totals: true
    show_silhouette: false
    show_sql_query_menu_options: false
    show_totals: true
    show_totals_labels: false
    show_value_labels: true
    show_x_axis_label: true
    show_x_axis_ticks: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    stacking: ''
    totals_color: "#808080"
    trellis: ''
    truncate_header: false
    value_labels: legend
    x_axis_gridlines: false
    x_axis_reversed: false
    x_axis_scale: auto
    y_axis_combined: true
    y_axis_gridlines: true
    y_axis_reversed: false
    y_axis_scale_mode: linear
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    listen:
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 80
    col: 0
    width: 24
    height: 14
    tab_name: History Analysis
  - title: Errors Per Dashboard
    name: Errors Per Dashboard
    model: system__activity
    explore: history
    type: looker_bar
    fields: [dashboard.title, error_results_from_database, history.database_result_query_count]
    sorts: [error_results_from_database desc]
    limit: 10
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: history.database_result_query_count
      category: measure
      filters:
        history.status: error
      label: Error Results from Database
      measure: error_results_from_database
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      based_on: history.database_result_query_count
      category: measure
      filters:
        history.status: killed
      label: Killed Results from Database
      measure: killed_results_from_database
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      based_on: history.cache_result_query_count
      category: measure
      filters:
        history.status: error
      label: Error Results from Cache
      measure: error_results_from_cache
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      based_on: history.cache_result_query_count
      category: measure
      filters:
        history.status: error
      label: Killed Results from Cache
      measure: killed_results_from_cache
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      category: table_calculation
      expression: "${error_results_from_database}/${history.database_result_query_count}"
      label: Error Rate
      table_calculation: error_rate
      value_format:
      value_format_name: percent_2
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
    conditional_formatting_include_nulls: false
    conditional_formatting_include_totals: false
    defaults_version: 1
    enable_conditional_formatting: false
    font_size: '12'
    header_font_size: '12'
    header_text_alignment: left
    hidden_fields: [history.database_result_query_count]
    hidden_pivots: {}
    hide_row_totals: false
    hide_totals: false
    label_type: labPer
    minimum_column_width: 75
    note_display: hover
    note_state: collapsed
    note_text: 'Dashboards ranked by the number of errors they generate and the percentage
      of overall queries which are errors '
    rows_font_size: '12'
    show_row_numbers: true
    show_row_totals: true
    show_sql_query_menu_options: false
    show_totals: true
    size_to_fit: true
    table_theme: white
    transpose: false
    truncate_header: false
    truncate_text: true
    value_labels: legend
    x_axis_zoom: true
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: error_results_from_database,
            id: error_results_from_database, name: Error Results from Database}],
        showLabels: true, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false}, {label: '', orientation: bottom, series: [
          {axisId: error_rate, id: error_rate, name: Error Rate}], showLabels: true,
        showValues: true, tickDensity: default, tickDensityCustom: 5, type: linear,
        unpinAxis: false}]
    y_axis_zoom: true
    listen:
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 66
    col: 0
    width: 8
    height: 14
    tab_name: History Analysis
  - title: Errors Per Look
    name: Errors Per Look
    model: system__activity
    explore: history
    type: looker_bar
    fields: [error_results_from_database, history.database_result_query_count, look.title]
    filters:
      look.title: "-EMPTY"
    sorts: [error_results_from_database desc]
    limit: 10
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: history.database_result_query_count
      category: measure
      filters:
        history.status: error
      label: Error Results from Database
      measure: error_results_from_database
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      based_on: history.database_result_query_count
      category: measure
      filters:
        history.status: killed
      label: Killed Results from Database
      measure: killed_results_from_database
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      based_on: history.cache_result_query_count
      category: measure
      filters:
        history.status: error
      label: Error Results from Cache
      measure: error_results_from_cache
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      based_on: history.cache_result_query_count
      category: measure
      filters:
        history.status: error
      label: Killed Results from Cache
      measure: killed_results_from_cache
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      category: table_calculation
      expression: "${error_results_from_database}/${history.database_result_query_count}"
      label: Error Rate
      table_calculation: error_rate
      value_format:
      value_format_name: percent_2
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
    conditional_formatting_include_nulls: false
    conditional_formatting_include_totals: false
    defaults_version: 1
    enable_conditional_formatting: false
    font_size: '12'
    header_font_size: '12'
    header_text_alignment: left
    hidden_fields: [history.database_result_query_count]
    hidden_pivots: {}
    hide_row_totals: false
    hide_totals: false
    label_type: labPer
    minimum_column_width: 75
    rows_font_size: '12'
    show_row_numbers: true
    show_row_totals: true
    show_sql_query_menu_options: false
    show_totals: true
    size_to_fit: true
    table_theme: white
    transpose: false
    truncate_header: false
    truncate_text: true
    value_labels: legend
    x_axis_zoom: true
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: error_results_from_database,
            id: error_results_from_database, name: Error Results from Database}],
        showLabels: true, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false}, {label: '', orientation: bottom, series: [
          {axisId: error_rate, id: error_rate, name: Error Rate}], showLabels: true,
        showValues: true, tickDensity: default, tickDensityCustom: 5, type: linear,
        unpinAxis: false}]
    y_axis_zoom: true
    listen:
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 66
    col: 16
    width: 8
    height: 14
    tab_name: History Analysis
  - title: Killed Queries Per Dashboard
    name: Killed Queries Per Dashboard
    model: system__activity
    explore: history
    type: looker_bar
    fields: [dashboard.title, history.database_result_query_count, killed_results_from_database]
    sorts: [killed_results_from_database desc]
    limit: 10
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      category: table_calculation
      expression: "${killed_results_from_database}/${history.database_result_query_count}"
      label: Error Rate
      table_calculation: error_rate
      value_format:
      value_format_name: percent_2
    - _kind_hint: measure
      _type_hint: number
      based_on: history.database_result_query_count
      category: measure
      filters:
        history.status: error
      label: Error Results from Database
      measure: error_results_from_database
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      based_on: history.database_result_query_count
      category: measure
      filters:
        history.status: killed
      label: Killed Results from Database
      measure: killed_results_from_database
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      based_on: history.cache_result_query_count
      category: measure
      filters:
        history.status: error
      label: Error Results from Cache
      measure: error_results_from_cache
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      based_on: history.cache_result_query_count
      category: measure
      filters:
        history.status: error
      label: Killed Results from Cache
      measure: killed_results_from_cache
      type: count_distinct
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
    conditional_formatting_include_nulls: false
    conditional_formatting_include_totals: false
    defaults_version: 1
    enable_conditional_formatting: false
    font_size: '12'
    header_font_size: '12'
    header_text_alignment: left
    hidden_fields: [history.database_result_query_count]
    hidden_pivots: {}
    hide_row_totals: false
    hide_totals: false
    label_type: labPer
    minimum_column_width: 75
    rows_font_size: '12'
    show_row_numbers: true
    show_row_totals: true
    show_sql_query_menu_options: false
    show_totals: true
    size_to_fit: true
    table_theme: white
    transpose: false
    truncate_header: false
    truncate_text: true
    value_labels: legend
    x_axis_zoom: true
    y_axes: [{label: '', orientation: top, series: [{axisId: killed_results_from_database,
            id: killed_results_from_database, name: Killed Results from Database}],
        showLabels: true, showValues: true, tickDensity: default, type: linear, unpinAxis: false},
      {label: '', orientation: bottom, series: [{axisId: error_rate, id: error_rate,
            name: Error Rate}], showLabels: true, showValues: true, tickDensity: default,
        tickDensityCustom: 5, type: linear, unpinAxis: false}]
    y_axis_zoom: true
    listen:
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 66
    col: 8
    width: 8
    height: 14
    tab_name: History Analysis
  - title: Queries by Dashboard
    name: Queries by Dashboard
    model: system__activity
    explore: history
    type: looker_bar
    fields: [history.database_result_query_count, dashboard.title]
    filters:
      dashboard.title: "-NULL"
      history.completed_date: 30 days
    sorts: [history.database_result_query_count desc]
    limit: 15
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
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 47
    col: 8
    width: 8
    height: 17
    tab_name: History Analysis
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
    defaults_version: 1
    hidden_pivots: {}
    ordering: none
    show_null_labels: false
    show_silhouette: false
    show_totals_labels: false
    totals_color: "#808080"
    listen:
      User: user.name
      Created Date: history.completed_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 34
    col: 0
    width: 24
    height: 10
    tab_name: History Analysis
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
    defaults_version: 1
    single_value_title: Dashboard Runs
    listen:
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 0
    col: 0
    width: 3
    height: 3
    tab_name: History Analysis
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
    defaults_version: 1
    single_value_title: Dashboard Users
    listen:
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 9
    col: 0
    width: 3
    height: 3
    tab_name: History Analysis
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
    - _kind_hint: measure
      _type_hint: number
      based_on: dashboard.link
      expression: ''
      label: Count of Link
      measure: count_of_link
      type: count_distinct
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    single_value_title: Dashboards Used
    listen:
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 6
    col: 0
    width: 3
    height: 3
    tab_name: History Analysis
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
    - _kind_hint: measure
      _type_hint: number
      based_on: dashboard.link
      expression: ''
      label: Count of Link
      measure: count_of_link
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      based_on: look.id
      expression: ''
      label: Count of ID
      measure: count_of_id
      type: count_distinct
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    single_value_title: Looks Used
    listen:
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 3
    col: 0
    width: 3
    height: 3
    tab_name: History Analysis
  - title: Column Total Queries
    name: Column Total Queries
    model: system__activity
    explore: history
    type: single_value
    fields: [history.query_run_count, history.average_runtime]
    filters:
      dashboard.link: ''
      query.total: 'Yes'
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: dashboard.link
      expression: ''
      label: Count of Link
      measure: count_of_link
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      based_on: look.id
      expression: ''
      label: Count of ID
      measure: count_of_id
      type: count_distinct
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Query Runtime
    defaults_version: 1
    hidden_pivots: {}
    single_value_title: Column Total Queries
    listen:
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 8
    col: 11
    width: 4
    height: 4
    tab_name: History Analysis
  - title: Row Total Queries
    name: Row Total Queries
    model: system__activity
    explore: history
    type: single_value
    fields: [history.query_run_count, history.average_runtime]
    filters:
      query.row_totals: 'Yes'
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: dashboard.link
      expression: ''
      label: Count of Link
      measure: count_of_link
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      based_on: look.id
      expression: ''
      label: Count of ID
      measure: count_of_id
      type: count_distinct
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Query Runtime
    defaults_version: 1
    hidden_pivots: {}
    single_value_title: Row Total Queries
    listen:
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 4
    col: 15
    width: 4
    height: 4
    tab_name: History Analysis
  - title: Pivot Query Times
    name: Pivot Query Times
    model: system__activity
    explore: history
    type: single_value
    fields: [history.query_run_count, history.average_runtime]
    filters:
      query.formatted_pivots: "-EMPTY"
    sorts: [history.query_run_count desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: dashboard.link
      expression: ''
      label: Count of Link
      measure: count_of_link
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      based_on: look.id
      expression: ''
      label: Count of ID
      measure: count_of_id
      type: count_distinct
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Query Runtime
    defaults_version: 1
    hidden_pivots: {}
    single_value_title: Pivot Queries
    listen:
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 8
    col: 15
    width: 4
    height: 4
    tab_name: History Analysis
  - title: Custom Field Queries
    name: Custom Field Queries
    model: system__activity
    explore: history
    type: single_value
    fields: [history.query_run_count, history.average_runtime]
    filters:
      query.dynamic_fields: "-EMPTY,-[]"
    sorts: [history.query_run_count desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: dashboard.link
      expression: ''
      label: Count of Link
      measure: count_of_link
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      based_on: look.id
      expression: ''
      label: Count of ID
      measure: count_of_id
      type: count_distinct
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Query Runtime
    defaults_version: 1
    hidden_pivots: {}
    single_value_title: Custom Field Queries
    listen:
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 0
    col: 15
    width: 4
    height: 4
    tab_name: History Analysis
  - title: Clean Queries
    name: Clean Queries
    model: system__activity
    explore: history
    type: single_value
    fields: [history.query_run_count, history.average_runtime]
    filters:
      is_custom_field_query_yesno: 'No'
      is_pivot_query_yes_no: 'No'
      query.row_totals: 'No'
      query.total: 'No'
    sorts: [history.query_run_count desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: dashboard.link
      expression: ''
      label: Count of Link
      measure: count_of_link
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      based_on: look.id
      expression: ''
      label: Count of ID
      measure: count_of_id
      type: count_distinct
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query.dynamic_fields
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 4376
          filter: EMPTY
          label: 'No'
        - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 4380
          filter: "[]"
          label: 'No'
      - 'Yes'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_custom_field_query_yesno
      label: Is Custom Field Query (Yes/No)
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query.formatted_pivots
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 4396
          filter: EMPTY
          label: 'No'
      - 'Yes'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_pivot_query_yes_no
      label: Is Pivot Query ( Yes/ No)
      value_format:
      value_format_name:
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Query Runtime
    defaults_version: 1
    hidden_pivots: {}
    single_value_title: Clean Queries
    listen:
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 4
    col: 11
    width: 4
    height: 4
    tab_name: History Analysis
  - title: Developer
    name: Developer
    model: system__activity
    explore: history
    type: single_value
    fields: [history.query_run_count, history.average_runtime]
    filters:
      history.completed_date: 30 days
      user_facts.is_admin: 'Yes'
    sorts: [history.query_run_count desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: dashboard.link
      expression: ''
      label: Count of Link
      measure: count_of_link
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      based_on: look.id
      expression: ''
      label: Count of ID
      measure: count_of_id
      type: count_distinct
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query.dynamic_fields
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 4476
          filter: EMPTY
          label: 'No'
        - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 4480
          filter: "[]"
          label: 'No'
      - 'Yes'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_custom_field_query_yesno
      label: Is Custom Field Query (Yes/No)
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query.formatted_pivots
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 4496
          filter: EMPTY
          label: 'No'
      - 'Yes'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_pivot_query_yes_no
      label: Is Pivot Query ( Yes/ No)
      value_format:
      value_format_name:
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Query Runtime
    defaults_version: 1
    hidden_pivots: {}
    single_value_title: Admin Queries
    listen:
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 0
    col: 7
    width: 4
    height: 4
    tab_name: History Analysis
  - title: Developer Queries
    name: Developer Queries
    model: system__activity
    explore: history
    type: single_value
    fields: [history.query_run_count, history.average_runtime]
    filters:
      user_facts.is_developer: 'Yes'
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: dashboard.link
      expression: ''
      label: Count of Link
      measure: count_of_link
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      based_on: look.id
      expression: ''
      label: Count of ID
      measure: count_of_id
      type: count_distinct
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query.dynamic_fields
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 4574
          filter: EMPTY
          label: 'No'
        - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 4578
          filter: "[]"
          label: 'No'
      - 'Yes'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_custom_field_query_yesno
      label: Is Custom Field Query (Yes/No)
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query.formatted_pivots
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 4594
          filter: EMPTY
          label: 'No'
      - 'Yes'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_pivot_query_yes_no
      label: Is Pivot Query ( Yes/ No)
      value_format:
      value_format_name:
    - _kind_hint: measure
      _type_hint: number
      based_on: history.database_result_query_count
      category: measure
      filters:
        user_facts.is_admin: 'Yes'
        user_facts.is_developer: 'Yes'
      label: Filtered history.database_result_query_count
      measure: filtered_historydatabase_result_query_count
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      based_on: history.average_runtime
      category: measure
      filters:
        user_facts.is_admin: 'Yes'
        user_facts.is_developer: 'Yes'
      label: Admin/Developer Average Runtime
      measure: admindeveloper_average_runtime
      type: count_distinct
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Query Runtime
    defaults_version: 1
    hidden_pivots: {}
    single_value_title: Developer Queries
    listen:
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 4
    col: 7
    width: 4
    height: 4
    tab_name: History Analysis
  - title: Explorer Users
    name: Explorer Users
    model: system__activity
    explore: history
    type: single_value
    fields: [history.query_run_count, history.average_runtime]
    filters:
      user_facts.is_content_saver: 'Yes'
      user_facts.is_explorer: 'Yes'
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: dashboard.link
      expression: ''
      label: Count of Link
      measure: count_of_link
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      based_on: look.id
      expression: ''
      label: Count of ID
      measure: count_of_id
      type: count_distinct
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query.dynamic_fields
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 4689
          filter: EMPTY
          label: 'No'
        - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 4693
          filter: "[]"
          label: 'No'
      - 'Yes'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_custom_field_query_yesno
      label: Is Custom Field Query (Yes/No)
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query.formatted_pivots
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 4709
          filter: EMPTY
          label: 'No'
      - 'Yes'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_pivot_query_yes_no
      label: Is Pivot Query ( Yes/ No)
      value_format:
      value_format_name:
    - _kind_hint: measure
      _type_hint: number
      based_on: history.database_result_query_count
      category: measure
      filters:
        user_facts.is_admin: 'Yes'
        user_facts.is_developer: 'Yes'
      label: Filtered history.database_result_query_count
      measure: filtered_historydatabase_result_query_count
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      based_on: history.average_runtime
      category: measure
      filters:
        user_facts.is_admin: 'Yes'
        user_facts.is_developer: 'Yes'
      label: Admin/Developer Average Runtime
      measure: admindeveloper_average_runtime
      type: count_distinct
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Query Runtime
    defaults_version: 1
    hidden_pivots: {}
    single_value_title: Explorer User Queries
    listen:
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 8
    col: 7
    width: 4
    height: 4
    tab_name: History Analysis
  - title: Viewer User Queries
    name: Viewer User Queries
    model: system__activity
    explore: history
    type: single_value
    fields: [history.query_run_count, history.average_runtime]
    filters:
      user_facts.is_viewer: 'Yes'
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: dashboard.link
      expression: ''
      label: Count of Link
      measure: count_of_link
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      based_on: look.id
      expression: ''
      label: Count of ID
      measure: count_of_id
      type: count_distinct
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query.dynamic_fields
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 4805
          filter: EMPTY
          label: 'No'
        - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 4809
          filter: "[]"
          label: 'No'
      - 'Yes'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_custom_field_query_yesno
      label: Is Custom Field Query (Yes/No)
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query.formatted_pivots
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 4825
          filter: EMPTY
          label: 'No'
      - 'Yes'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_pivot_query_yes_no
      label: Is Pivot Query ( Yes/ No)
      value_format:
      value_format_name:
    - _kind_hint: measure
      _type_hint: number
      based_on: history.database_result_query_count
      category: measure
      filters:
        user_facts.is_admin: 'Yes'
        user_facts.is_developer: 'Yes'
      label: Filtered history.database_result_query_count
      measure: filtered_historydatabase_result_query_count
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      based_on: history.average_runtime
      category: measure
      filters:
        user_facts.is_admin: 'Yes'
        user_facts.is_developer: 'Yes'
      label: Admin/Developer Average Runtime
      measure: admindeveloper_average_runtime
      type: count_distinct
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Query Runtime
    defaults_version: 1
    hidden_pivots: {}
    single_value_title: Viewer User Queries
    listen:
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 0
    col: 11
    width: 4
    height: 4
    tab_name: History Analysis
  - title: Queries Per User Group
    name: Queries Per User Group
    model: system__activity
    explore: history
    type: looker_bar
    fields: [history.query_run_count, history.average_runtime, role.name]
    filters:
      history.completed_date: 30 days
    sorts: [history.query_run_count desc]
    limit: 15
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: dashboard.link
      expression: ''
      label: Count of Link
      measure: count_of_link
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      based_on: look.id
      expression: ''
      label: Count of ID
      measure: count_of_id
      type: count_distinct
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query.dynamic_fields
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 4920
          filter: EMPTY
          label: 'No'
        - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 4924
          filter: "[]"
          label: 'No'
      - 'Yes'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_custom_field_query_yesno
      label: Is Custom Field Query (Yes/No)
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: string
      args:
      - query.formatted_pivots
      - - __FILE: healthcheck_dashboard/dashboards/consolidated_healthcheck_dashboard.dashboard.lookml
          __LINE_NUM: 4940
          filter: EMPTY
          label: 'No'
      - 'Yes'
      calculation_type: group_by
      category: dimension
      description: ''
      dimension: is_pivot_query_yes_no
      label: Is Pivot Query ( Yes/ No)
      value_format:
      value_format_name:
    - _kind_hint: measure
      _type_hint: number
      based_on: history.database_result_query_count
      category: measure
      filters:
        user_facts.is_admin: 'Yes'
        user_facts.is_developer: 'Yes'
      label: Filtered history.database_result_query_count
      measure: filtered_historydatabase_result_query_count
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      based_on: history.average_runtime
      category: measure
      filters:
        user_facts.is_admin: 'Yes'
        user_facts.is_developer: 'Yes'
      label: Admin/Developer Average Runtime
      measure: admindeveloper_average_runtime
      type: count_distinct
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
    comparison_label: Average Query Runtime
    comparison_reverse_colors: false
    comparison_type: value
    conditional_formatting_include_nulls: false
    conditional_formatting_include_totals: false
    custom_color_enabled: true
    defaults_version: 1
    enable_conditional_formatting: false
    hidden_pivots: {}
    show_comparison: true
    show_comparison_label: true
    show_single_value_title: true
    single_value_title: SQL Runner Queries
    x_axis_zoom: true
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: history.query_run_count,
            id: history.query_run_count, name: Query Run Count}], showLabels: true,
        showValues: true, tickDensity: default, tickDensityCustom: 5, type: linear,
        unpinAxis: false}, {label: '', orientation: bottom, series: [{axisId: history.average_runtime,
            id: history.average_runtime, name: Average Runtime in Seconds}], showLabels: true,
        showValues: true, tickDensity: default, tickDensityCustom: 5, type: linear,
        unpinAxis: false}]
    y_axis_zoom: true
    listen:
      User: user.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Result Source (Cache/DB): history.result_source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 47
    col: 16
    width: 8
    height: 17
    tab_name: History Analysis
  - name: Daily Trend Analysis
    type: text
    title_text: Daily Trend Analysis
    body_text: ''
    row: 12
    col: 0
    width: 24
    height: 3
    tab_name: History Analysis
  - name: Error Analysis
    type: text
    title_text: Error Analysis
    body_text: ''
    row: 64
    col: 0
    width: 24
    height: 2
    tab_name: History Analysis
  - name: Individual Query Analysis
    type: text
    title_text: Individual Query Analysis
    body_text: ''
    row: 44
    col: 0
    width: 24
    height: 3
    tab_name: History Analysis
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
    colors: ["#75E2E2", "#3EB0D5", "#4276BE", "#462C9D", "#9174F0", "#B1399E", "#B32F37",
      "#E57947", "#FBB555", "#FFD95F", "#C2DD67", "#72D16D"]
    comparison_label: Last 30 Days
    comparison_reverse_colors: false
    comparison_type: change
    custom_color: forestgreen
    custom_color_enabled: false
    hidden_fields:
    inner_radius: 50
    label_type: lab
    note_display: hover
    note_state: collapsed
    note_text: Number of scheduled jobs each day for last 7 days. One scheduled plan
      may have multiple scheduled jobs.
    series_colors: {}
    show_comparison: true
    show_comparison_label: true
    show_single_value_title: true
    value_labels: legend
    listen:
      Run Once (Yes / No): scheduled_plan.run_once
      Schedule Plan: scheduled_plan.name
      User: user.name
      Created Date: scheduled_job.created_date
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: scheduled_job.status
      Query Created Hour of Day: scheduled_job.created_hour_of_day
    row: 0
    col: 16
    width: 8
    height: 6
    tab_name: Content Delivery
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
    colors: ["#75E2E2", "#3EB0D5", "#4276BE", "#462C9D", "#9174F0", "#B1399E", "#B32F37",
      "#E57947", "#FBB555", "#FFD95F", "#C2DD67", "#72D16D"]
    comparison_label: Last 30 Days
    comparison_reverse_colors: false
    comparison_type: change
    custom_color: forestgreen
    custom_color_enabled: false
    defaults_version: 1
    hidden_fields:
    inner_radius: 50
    label_type: lab
    note_display: hover
    note_state: collapsed
    note_text: Number of scheduled jobs each day for last 7 days. One scheduled plan
      may have multiple scheduled jobs.
    series_colors: {}
    show_comparison: true
    show_comparison_label: true
    show_single_value_title: true
    value_labels: legend
    listen:
      Run Once (Yes / No): scheduled_plan.run_once
      Schedule Plan: scheduled_plan.name
      User: user.name
      Created Date: scheduled_job.created_date
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: scheduled_job.status
      Query Created Hour of Day: scheduled_job.created_hour_of_day
    row: 6
    col: 16
    width: 8
    height: 7
    tab_name: Content Delivery
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
      Schedule Plan: scheduled_plan.name
      User: user.name
      Created Date: scheduled_job.created_date
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: scheduled_job.status
      Query Created Hour of Day: scheduled_job.created_hour_of_day
    row: 0
    col: 0
    width: 16
    height: 19
    tab_name: Content Delivery
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
      Schedule Plan: scheduled_plan.name
      User: user.name
      Created Date: scheduled_job.created_date
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: scheduled_job.status
      Query Created Hour of Day: scheduled_job.created_hour_of_day
    row: 19
    col: 8
    width: 16
    height: 6
    tab_name: Content Delivery
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
    - _kind_hint: measure
      _type_hint: number
      based_on: scheduled_job.status
      category: measure
      expression: ''
      filters:
        scheduled_job.status: failure
      label: Count of Failure
      measure: count_of_failure
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      based_on: scheduled_job.status
      category: measure
      expression: ''
      filters:
        scheduled_job.status: success
      label: 'Count of Successful '
      measure: count_of_successful
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      based_on: scheduled_job.status
      category: measure
      expression: ''
      filters:
        scheduled_job.status: '"in_progress"'
      label: Count of in_progress
      measure: count_of_in_progress
      type: count_distinct
    - _kind_hint: supermeasure
      _type_hint: number
      category: table_calculation
      expression: sum(pivot_row(${scheduled_job.count}))
      label: Sum
      table_calculation: sum
      value_format:
      value_format_name:
    - _kind_hint: measure
      _type_hint: number
      category: table_calculation
      expression: "${scheduled_job.count}/${sum}"
      label: Percent of Total
      table_calculation: percent_of_total
      value_format:
      value_format_name: percent_0
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
    defaults_version: 1
    hidden_fields: [sum, scheduled_job.count]
    hidden_pivots: {}
    hidden_series: [success - scheduled_job.count, failure - scheduled_job.count]
    label_type: labPer
    value_labels: legend
    x_axis_zoom: true
    y_axis_zoom: true
    listen:
      Run Once (Yes / No): scheduled_plan.run_once
      Schedule Plan: scheduled_plan.name
      User: user.name
      Created Date: scheduled_job.created_date
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: scheduled_job.status
      Query Created Hour of Day: scheduled_job.created_hour_of_day
    row: 19
    col: 0
    width: 8
    height: 6
    tab_name: Content Delivery
  - title: Failure Status
    name: Failure Status
    model: system__activity
    explore: scheduled_plan
    type: looker_grid
    fields: [user.name, user.email, scheduled_job.count, scheduled_job.status_detail]
    filters:
      scheduled_job.finalized_date: 7 days
      scheduled_job.finalized_day_of_week_index: '0'
    sorts: [scheduled_job.count desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: scheduled_job.status
      category: measure
      expression: ''
      filters:
        scheduled_job.status: failure
      label: Count of Failure
      measure: count_of_failure
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      based_on: scheduled_job.status
      category: measure
      expression: ''
      filters:
        scheduled_job.status: success
      label: 'Count of Successful '
      measure: count_of_successful
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      based_on: scheduled_job.status
      category: measure
      expression: ''
      filters:
        scheduled_job.status: '"in_progress"'
      label: Count of in_progress
      measure: count_of_in_progress
      type: count_distinct
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
      Schedule Plan: scheduled_plan.name
      User: user.name
      Created Date: scheduled_job.created_date
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: scheduled_job.status
      Query Created Hour of Day: scheduled_job.created_hour_of_day
    row: 25
    col: 8
    width: 16
    height: 7
    tab_name: Content Delivery
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
    column_order: [scheduled_job_stage.started_hour_of_day, Monday|FIELD|0_scheduled_job_stage.avg_runtime,
      Monday|FIELD|0_scheduled_job.count, Tuesday|FIELD|1_scheduled_job_stage.avg_runtime,
      Tuesday|FIELD|1_scheduled_job.count, Wednesday|FIELD|2_scheduled_job_stage.avg_runtime,
      Wednesday|FIELD|2_scheduled_job.count, Thursday|FIELD|3_scheduled_job_stage.avg_runtime,
      Thursday|FIELD|3_scheduled_job.count, Friday|FIELD|4_scheduled_job_stage.avg_runtime,
      Friday|FIELD|4_scheduled_job.count, Saturday|FIELD|5_scheduled_job_stage.avg_runtime,
      Saturday|FIELD|5_scheduled_job.count, Sunday|FIELD|6_scheduled_job_stage.avg_runtime,
      Sunday|FIELD|6_scheduled_job.count]
    conditional_formatting: []
    defaults_version: 1
    minimum_column_width: 75
    pinned_columns:
      scheduled_job_stage.started_hour_of_day: left
    series_cell_visualizations:
      scheduled_job.count:
        is_active: true
      scheduled_job_stage.avg_runtime:
        is_active: true
    series_column_widths:
      scheduled_job_stage.started_hour_of_day: 153
    series_labels:
      scheduled_job_stage.avg_runtime: Average Time in Queue
    series_text_format:
      scheduled_job_stage.started_day_of_week:
        bg_color: "#00ABFA"
      scheduled_job_stage.started_hour_of_day:
        align: right
        bold: true
    show_row_totals: true
    show_sql_query_menu_options: false
    show_totals: true
    truncate_column_names: false
    truncate_header: false
    listen:
      Run Once (Yes / No): scheduled_plan.run_once
      Schedule Plan: scheduled_plan.name
      User: user.name
      Created Date: scheduled_job.created_date
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: scheduled_job.status
      Query Created Hour of Day: scheduled_job.created_hour_of_day
    row: 32
    col: 8
    width: 16
    height: 12
    tab_name: Content Delivery
  - title: Inactive Users with Schedules
    name: Inactive Users with Schedules
    model: system__activity
    explore: user
    type: looker_grid
    fields: [user.name, user_facts.last_ui_login_credential_type, user_facts.last_ui_login_date,
      history.most_recent_query_date, scheduled_job.count]
    filters:
      scheduled_job.count: ">0"
      user.is_disabled: 'No'
      user_facts.last_ui_login_date: before 90 days ago
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
      Schedule Plan: scheduled_plan.name
      User: user.name
      Created Date: scheduled_job.created_date
      Dashboard Title: dashboard.title
      Status: scheduled_job.status
      Query Created Hour of Day: scheduled_job.created_hour_of_day
    row: 25
    col: 0
    width: 8
    height: 6
    tab_name: Content Delivery
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
      Schedule Plan: scheduled_plan.name
      User: user.name
      Created Date: scheduled_job.created_date
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: scheduled_job.status
      Query Created Hour of Day: scheduled_job.created_hour_of_day
    row: 31
    col: 0
    width: 8
    height: 6
    tab_name: Content Delivery
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
      Schedule Plan: scheduled_plan.name
      User: user.name
      Created Date: scheduled_job.created_date
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: scheduled_job.status
      Query Created Hour of Day: scheduled_job.created_hour_of_day
    row: 37
    col: 0
    width: 8
    height: 6
    tab_name: Content Delivery
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
    - _kind_hint: measure
      _type_hint: number
      based_on: scheduled_job.status
      category: measure
      expression: ''
      filters:
        scheduled_job.status: failure
      label: Count of Failure
      measure: count_of_failure
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      based_on: scheduled_job.status
      category: measure
      expression: ''
      filters:
        scheduled_job.status: success
      label: 'Count of Successful '
      measure: count_of_successful
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      based_on: scheduled_job.status
      category: measure
      expression: ''
      filters:
        scheduled_job.status: '"in_progress"'
      label: Count of in_progress
      measure: count_of_in_progress
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      category: table_calculation
      expression: sum(${scheduled_job.count})
      label: Sum
      table_calculation: sum
      value_format:
      value_format_name:
    - _kind_hint: measure
      _type_hint: number
      category: table_calculation
      expression: "${scheduled_job.count}/${sum}"
      label: Percent of Total
      table_calculation: percent_of_total
      value_format:
      value_format_name: percent_0
    - _kind_hint: measure
      _type_hint: number
      category: table_calculation
      expression: mean(${percent_of_total})
      is_disabled: true
      label: mean
      table_calculation: mean
      value_format:
      value_format_name: percent_0
    value_labels: legend
    label_type: labPer
    defaults_version: 1
    font_size: 12
    hidden_fields: [sum, scheduled_job.count]
    hidden_pivots: {}
    hidden_points_if_no: []
    hidden_series: [success - scheduled_job.count, failure - scheduled_job.count]
    label_density: 25
    legend_position: center
    limit_displayed_rows: false
    ordering: none
    plot_size_by_field: false
    point_style: none
    show_null_labels: false
    show_silhouette: false
    show_totals_labels: false
    show_value_labels: true
    show_view_names: false
    show_x_axis_label: true
    show_x_axis_ticks: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    stacking: normal
    totals_color: "#808080"
    trellis: ''
    x_axis_gridlines: false
    x_axis_reversed: false
    x_axis_scale: auto
    x_axis_zoom: true
    y_axis_combined: true
    y_axis_gridlines: true
    y_axis_reversed: false
    y_axis_scale_mode: linear
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    y_axis_zoom: true
    listen:
      Run Once (Yes / No): scheduled_plan.run_once
      Schedule Plan: scheduled_plan.name
      User: user.name
      Created Date: scheduled_job.created_date
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: scheduled_job.status
      Query Created Hour of Day: scheduled_job.created_hour_of_day
    row: 13
    col: 16
    width: 8
    height: 6
    tab_name: Content Delivery
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
        dashboard.deleted_date: 'NULL'
        dashboard.moved_to_trash: 'No'
        dashboard_element.count: ">25"
      sorts: [query.count desc]
      limit: 100
      column_limit: 50
      dynamic_fields:
      - _kind_hint: measure
        _type_hint: number
        expression: "${dashboard_element.count}-${dashboard_element.count_text}"
        label: Total Query Tiles
        table_calculation: total_query_tiles
        value_format:
        value_format_name:
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
      Dashboard Title: dashboard.title
    - Created Date: history.created_date
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Workspace ID: history.workspace_id
      Dialect: history.dialect
    row: 32
    col: 0
    width: 24
    height: 23
    tab_name: Large Dashboards
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
    defaults_version: 1
    single_value_title: No of Dashboards
    listen:
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Workspace ID: history.workspace_id
      Dialect: history.dialect
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 0
    col: 0
    width: 4
    height: 3
    tab_name: Large Dashboards
  - title: Dashboard Run Metrics
    name: Dashboard Run Metrics
    model: system__activity
    explore: dashboard_performance
    type: looker_grid
    fields: [dashboard.title, dashboard.id, history.query_run_count_drill, history.dashboard_run_count,
      max_of_max_runtime, min_of_min_runtime]
    filters:
      dashboard.id: NOT NULL
      history.completed_date: 7 days
    sorts: [history.query_run_count_drill desc]
    limit: 20
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: dashboard_history_stats.max_runtime
      expression: ''
      label: Max of Max Runtime
      measure: max_of_max_runtime
      type: max
    - _kind_hint: measure
      _type_hint: number
      based_on: dashboard_history_stats.min_runtime
      expression: ''
      label: Min of Min Runtime
      measure: min_of_min_runtime
      type: min
    - _kind_hint: measure
      _type_hint: number
      category: table_calculation
      expression: "${history.query_run_count_drill}/${history.dashboard_run_count}"
      label: Queries Per Run
      table_calculation: queries_per_run
      value_format:
      value_format_name:
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
    hidden_fields: [dashboard.id]
    hidden_pivots: {}
    minimum_column_width: 75
    series_cell_visualizations:
      dashboard_history_stats.avg_tile_runtime:
        is_active: false
    series_labels:
      dashboard_history_stats.avg_tile_runtime: Average Tile Runtime
      max_of_max_runtime: Max Runtime
      max_of_total_queries: Total Queries
      min_of_min_runtime: Min Runtime
      queries_per_run: Average No Queries Per Run
    series_value_format:
      max_of_max_runtime:
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
        name: decimal_2
      min_of_min_runtime:
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
        name: decimal_2
      queries_per_run:
        decimals: '0'
        format_string: "#,##0"
        label: Decimals (0)
        label_prefix: Decimals
        name: decimal_0
    show_row_totals: true
    show_sql_query_menu_options: false
    show_totals: true
    truncate_header: false
    listen:
      Created Date: history.created_date
      Model: model_set.models
      Dashboard Title: dashboard.title
      Workspace ID: history.workspace_id
      Dialect: history.dialect
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 3
    col: 0
    width: 12
    height: 12
    tab_name: Large Dashboards
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
      - _kind_hint: measure
        _type_hint: number
        based_on: dashboard_element.id
        category: measure
        expression: ''
        filters:
          dashboard_element.refresh_interval_ordered: not null
        label: Tiles with Auto-Refresh
        measure: tiles_with_auto_refresh
        type: count_distinct
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
    conditional_formatting_include_nulls: false
    conditional_formatting_include_totals: false
    enable_conditional_formatting: false
    header_font_size: '12'
    header_text_alignment: left
    hidden_fields: [dashboard.id, history.database_result_query_count]
    label_density: 25
    legend_position: center
    limit_displayed_rows: true
    limit_displayed_rows_values:
      first_last: first
      num_rows: '20'
      show_hide: show
    minimum_column_width: 75
    ordering: none
    plot_size_by_field: false
    point_style: none
    rows_font_size: '12'
    series_cell_visualizations:
      tiles_with_auto_refresh:
        is_active: false
    series_types: {}
    show_null_labels: false
    show_row_numbers: true
    show_row_totals: true
    show_silhouette: false
    show_sql_query_menu_options: false
    show_totals: true
    show_totals_labels: false
    show_value_labels: false
    show_view_names: false
    show_x_axis_label: true
    show_x_axis_ticks: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    size_to_fit: true
    stacking: ''
    table_theme: white
    totals_color: "#808080"
    transpose: false
    trellis: ''
    truncate_header: false
    truncate_text: true
    type: looker_bar
    x_axis_gridlines: false
    x_axis_reversed: false
    x_axis_scale: auto
    x_axis_zoom: true
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: tiles_with_auto_refresh,
            id: tiles_with_auto_refresh, name: Tiles with Auto-Refresh}], showLabels: true,
        showValues: true, tickDensity: default, tickDensityCustom: 5, type: linear,
        unpinAxis: false}, {label: '', orientation: bottom, series: [{axisId: history.query_run_count,
            id: history.query_run_count, name: Query Run Count}], showLabels: true,
        showValues: true, tickDensity: default, tickDensityCustom: 5, type: linear,
        unpinAxis: false}]
    y_axis_combined: true
    y_axis_gridlines: true
    y_axis_reversed: false
    y_axis_scale_mode: linear
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    y_axis_zoom: true
    sorts: [history.query_run_count desc]
    column_limit: 50
    listen:
    - Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
    - Created Date: history.created_date
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Workspace ID: history.workspace_id
      Dialect: history.dialect
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 0
    col: 12
    width: 12
    height: 15
    tab_name: Large Dashboards
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
    defaults_version: 1
    single_value_title: Average Tile Runtime
    value_format: '0.00'
    listen:
      Created Date: history.created_date
      Model: model_set.models
      Dashboard Title: dashboard.title
      Workspace ID: history.workspace_id
      Dialect: history.dialect
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 0
    col: 8
    width: 4
    height: 3
    tab_name: Large Dashboards
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
    defaults_version: 1
    single_value_title: Used in the last 30 days
    listen:
      Explore: query.view
      Dashboard Title: dashboard.title
    row: 0
    col: 4
    width: 4
    height: 3
    tab_name: Large Dashboards
  - title: Dashboards by Run & Query Count
    name: Dashboards by Run & Query Count
    model: system__activity
    explore: history
    type: looker_bar
    fields: [dashboard.title, history.dashboard_run_count, history.query_run_count]
    filters:
      history.completed_date: 30 days
      query.model: ''
      query.view: ''
      role.name: ''
      user.name: ''
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
    x_axis_zoom: true
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: history.dashboard_run_count,
            id: history.dashboard_run_count, name: Dashboard Run Count}], showLabels: true,
        showValues: true, tickDensity: default, tickDensityCustom: 5, type: linear,
        unpinAxis: false}, {label: '', orientation: bottom, series: [{axisId: history.query_run_count,
            id: history.query_run_count, name: Query Run Count}], showLabels: true,
        showValues: true, tickDensity: default, tickDensityCustom: 5, type: linear,
        unpinAxis: false}]
    y_axis_zoom: true
    listen:
      Created Date: history.created_date
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Workspace ID: history.workspace_id
      Dialect: history.dialect
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 15
    col: 0
    width: 12
    height: 17
    tab_name: Large Dashboards
  - title: Dashboards by Query and Average Runtime
    name: Dashboards by Query and Average Runtime
    model: system__activity
    explore: history
    type: looker_bar
    fields: [dashboard.title, history.database_result_query_count, history.average_runtime]
    filters:
      history.average_runtime: NOT NULL
      history.result_source: query
      history.workspace_id: production
      query.model: ''
      query.view: ''
      role.name: ''
      user.name: ''
    sorts: [history.database_result_query_count desc]
    limit: 10
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: history.database_result_query_count
      category: measure
      filters:
        history.status: error
      label: Error Results from Database
      measure: error_results_from_database
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      based_on: history.database_result_query_count
      category: measure
      filters:
        history.status: killed
      label: Killed Results from Database
      measure: killed_results_from_database
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      based_on: history.cache_result_query_count
      category: measure
      filters:
        history.status: error
      label: Error Results from Cache
      measure: error_results_from_cache
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      based_on: history.cache_result_query_count
      category: measure
      filters:
        history.status: error
      label: Killed Results from Cache
      measure: killed_results_from_cache
      type: count_distinct
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
    conditional_formatting_include_nulls: false
    conditional_formatting_include_totals: false
    defaults_version: 1
    enable_conditional_formatting: false
    font_size: '12'
    header_font_size: '12'
    header_text_alignment: left
    hidden_fields:
    hidden_pivots: {}
    hide_row_totals: false
    hide_totals: false
    label_type: labPer
    minimum_column_width: 75
    rows_font_size: '12'
    show_row_numbers: true
    show_row_totals: true
    show_sql_query_menu_options: false
    show_totals: true
    size_to_fit: true
    table_theme: white
    transpose: false
    truncate_header: false
    truncate_text: true
    value_labels: legend
    x_axis_zoom: true
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: error_results_from_database,
            id: error_results_from_database, name: Error Results from Database}],
        showLabels: true, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false}, {label: '', orientation: bottom, series: [
          {axisId: error_rate, id: error_rate, name: Error Rate}], showLabels: true,
        showValues: true, tickDensity: default, tickDensityCustom: 5, type: linear,
        unpinAxis: false}]
    y_axis_zoom: true
    listen:
      Created Date: history.created_date
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Workspace ID: history.workspace_id
      Dialect: history.dialect
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 15
    col: 12
    width: 12
    height: 17
    tab_name: Large Dashboards
  - name: " (12)"
    type: text
    title_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Merged Queries"}],"align":"center"},{"type":"p","children":[{"text":""}],"id":1687993536114},{"type":"p","children":[{"text":"Merged
      Results","fontSize":"12pt","backgroundColor":"transparent","color":"rgb(153,
      153, 153)","bold":true},{"text":" is a post-query processing feature that, if
      not used thoughtfully, can overtax Looker instance resources and cause your
      Looker instance to respond more slowly for all users.","fontSize":"12pt","backgroundColor":"transparent","color":"rgb(153,
      153, 153)"}],"id":1687993499703,"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 0
    col: 5
    width: 19
    height: 3
    tab_name: Merged Queries
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
    - _kind_hint: measure
      _type_hint: number
      category: table_calculation
      expression: "(${dashboard_element.count_merge_query}/${query.count})"
      label: "% of Total"
      table_calculation: of_total
      value_format:
      value_format_name: percent_0
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
    hidden_pivots: {}
    minimum_column_width: 75
    series_cell_visualizations:
      dashboard_element.count_merge_query:
        is_active: true
      of_total:
        is_active: true
    series_labels:
      merge_query_source_query.count: Total Merge Queries
      query.count: Total Dashboard Queries
    show_row_totals: true
    show_sql_query_menu_options: false
    show_totals: true
    truncate_header: false
    listen:
      Dashboard Creator: user.name
      Moved to Trash (Yes / No): dashboard.moved_to_trash
      Created Date: query.created_date
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
    row: 5
    col: 16
    width: 8
    height: 11
    tab_name: Merged Queries
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
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Dashboard Creator: dashboard_creator.name
      Moved to Trash (Yes / No): dashboard.moved_to_trash
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 3
    col: 8
    width: 4
    height: 2
    tab_name: Merged Queries
  - title: Average merged query time in Seconds
    name: Average merged query time in Seconds
    model: system__activity
    explore: history
    type: single_value
    fields: [history.average_runtime]
    filters:
      history.source: '"merge_query"'
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      category: table_calculation
      expression: "${history.average_runtime}/60"
      is_disabled: true
      label: tt
      table_calculation: tt
      value_format:
      value_format_name:
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Dashboard Creator: dashboard_creator.name
      Moved to Trash (Yes / No): dashboard.moved_to_trash
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 3
    col: 15
    width: 3
    height: 2
    tab_name: Merged Queries
  - title: Dashboards with Merged Queries
    name: Dashboards with Merged Queries (2)
    model: system__activity
    explore: dashboard
    type: single_value
    fields: [dashboard.count]
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
    defaults_version: 1
    header_font_size: 12
    header_text_alignment: left
    hidden_pivots: {}
    hide_row_totals: false
    hide_totals: false
    limit_displayed_rows: false
    rows_font_size: 12
    show_row_numbers: true
    show_view_names: false
    size_to_fit: true
    table_theme: white
    transpose: false
    truncate_text: true
    listen:
      Moved to Trash (Yes / No): dashboard.moved_to_trash
      Created Date: merge_query.created_date
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
    row: 3
    col: 21
    width: 3
    height: 2
    tab_name: Merged Queries
  - title: Merged Queries Past 90 Days
    name: Merged Queries Past 90 Days
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
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Dashboard Creator: dashboard_creator.name
      Moved to Trash (Yes / No): dashboard.moved_to_trash
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 3
    col: 12
    width: 3
    height: 2
    tab_name: Merged Queries
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
    - _kind_hint: measure
      _type_hint: number
      based_on: user.dev_branch_name
      expression: ''
      label: Count of Dev Branch Name
      measure: count_of_dev_branch_name
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      based_on: user.dev_branch_name
      category: measure
      expression:
      filters:
        user.dev_branch_name: "-NULL"
      label: Dev Queries
      measure: dev_queries
      type: count_distinct
      value_format:
      value_format_name:
    - _kind_hint: measure
      _type_hint: number
      based_on: merge_query.id
      expression: ''
      label: Count of ID
      measure: count_of_id
      type: count_distinct
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
    hidden_pivots: {}
    label_density: 25
    legend_position: center
    minimum_column_width: 75
    ordering: none
    plot_size_by_field: false
    point_style: none
    series_cell_visualizations:
      history.query_run_count:
        is_active: true
    show_null_labels: false
    show_row_totals: true
    show_silhouette: false
    show_sql_query_menu_options: false
    show_totals: true
    show_totals_labels: false
    show_value_labels: false
    show_x_axis_label: true
    show_x_axis_ticks: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    stacking: ''
    totals_color: "#808080"
    trellis: ''
    truncate_header: false
    x_axis_gridlines: false
    x_axis_reversed: false
    x_axis_scale: auto
    y_axis_combined: true
    y_axis_gridlines: true
    y_axis_reversed: false
    y_axis_scale_mode: linear
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    listen:
      Dashboard Creator: dashboard_creator.name
      Moved to Trash (Yes / No): dashboard.moved_to_trash
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 18
    col: 8
    width: 8
    height: 9
    tab_name: Merged Queries
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
    - _kind_hint: measure
      _type_hint: number
      based_on: user.dev_branch_name
      expression: ''
      label: Count of Dev Branch Name
      measure: count_of_dev_branch_name
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      based_on: user.dev_branch_name
      category: measure
      expression:
      filters:
        user.dev_branch_name: "-NULL"
      label: Dev Queries
      measure: dev_queries
      type: count_distinct
      value_format:
      value_format_name:
    - _kind_hint: measure
      _type_hint: number
      based_on: merge_query.id
      expression: ''
      label: Count of ID
      measure: count_of_id
      type: count_distinct
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
    hidden_pivots: {}
    label_density: 25
    legend_position: center
    minimum_column_width: 75
    ordering: none
    plot_size_by_field: false
    point_style: none
    series_cell_visualizations:
      history.query_run_count:
        is_active: true
    show_null_labels: false
    show_row_totals: true
    show_silhouette: false
    show_sql_query_menu_options: false
    show_totals: true
    show_totals_labels: false
    show_value_labels: false
    show_x_axis_label: true
    show_x_axis_ticks: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    stacking: ''
    totals_color: "#808080"
    trellis: ''
    truncate_header: false
    x_axis_gridlines: false
    x_axis_reversed: false
    x_axis_scale: auto
    y_axis_combined: true
    y_axis_gridlines: true
    y_axis_reversed: false
    y_axis_scale_mode: linear
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    listen:
      Dashboard Creator: dashboard_creator.name
      Moved to Trash (Yes / No): dashboard.moved_to_trash
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 18
    col: 0
    width: 8
    height: 9
    tab_name: Merged Queries
  - title: Merged Queries by Database
    name: Merged Queries by Database
    model: system__activity
    explore: history
    type: looker_line
    fields: [query.created_date, history.dialect, history.query_run_count]
    pivots: [history.dialect]
    fill_fields: [query.created_date]
    filters:
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
    comparison_reverse_colors: false
    comparison_type: value
    conditional_formatting_include_nulls: false
    conditional_formatting_include_totals: false
    custom_color_enabled: true
    defaults_version: 1
    enable_conditional_formatting: false
    hidden_pivots: {}
    reference_lines: []
    show_comparison: false
    show_comparison_label: true
    show_single_value_title: true
    trend_lines: []
    x_axis_zoom: true
    y_axis_zoom: true
    listen:
      Dashboard Creator: dashboard_creator.name
      Moved to Trash (Yes / No): dashboard.moved_to_trash
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 5
    col: 8
    width: 8
    height: 5
    tab_name: Merged Queries
  - title: Merge Queries by Database
    name: Merge Queries by Database
    model: system__activity
    explore: history
    type: looker_bar
    fields: [history.dialect, query.count]
    pivots: [history.dialect]
    filters:
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
    comparison_reverse_colors: false
    comparison_type: value
    conditional_formatting_include_nulls: false
    conditional_formatting_include_totals: false
    custom_color_enabled: true
    defaults_version: 1
    enable_conditional_formatting: false
    hidden_pivots: {}
    interpolation: monotone
    reference_lines: []
    show_comparison: false
    show_comparison_label: true
    show_null_points: true
    show_single_value_title: true
    trend_lines: []
    x_axis_zoom: true
    y_axis_zoom: true
    listen:
      Dashboard Creator: dashboard_creator.name
      Moved to Trash (Yes / No): dashboard.moved_to_trash
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 3
    col: 0
    width: 8
    height: 7
    tab_name: Merged Queries
  - title: Average Runtime in Seconds
    name: Average Runtime in Seconds
    model: system__activity
    explore: history
    type: looker_column
    fields: [history.dialect, query.created_date, history.average_runtime]
    pivots: [history.dialect]
    fill_fields: [query.created_date]
    filters:
      history.source: '"merge_query"'
      query.created_date: 500 days
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
    comparison_reverse_colors: false
    comparison_type: value
    conditional_formatting_include_nulls: false
    conditional_formatting_include_totals: false
    custom_color_enabled: true
    defaults_version: 1
    enable_conditional_formatting: false
    interpolation: monotone
    reference_lines: []
    show_comparison: false
    show_comparison_label: true
    show_null_points: true
    show_single_value_title: true
    trend_lines: []
    x_axis_zoom: true
    y_axis_zoom: true
    listen:
      Dashboard Creator: dashboard_creator.name
      Moved to Trash (Yes / No): dashboard.moved_to_trash
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 10
    col: 8
    width: 8
    height: 6
    tab_name: Merged Queries
  - title: Merged Queries Run Count
    name: Merged Queries Run Count
    model: system__activity
    explore: history
    type: looker_bar
    fields: [history.dialect, history.query_run_count]
    pivots: [history.dialect]
    filters:
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
    comparison_reverse_colors: false
    comparison_type: value
    conditional_formatting_include_nulls: false
    conditional_formatting_include_totals: false
    custom_color_enabled: true
    defaults_version: 1
    enable_conditional_formatting: false
    hidden_pivots: {}
    interpolation: monotone
    note_display: hover
    note_state: collapsed
    note_text: The Total number of queries run originating from Merged Query
    reference_lines: []
    show_comparison: false
    show_comparison_label: true
    show_null_points: true
    show_single_value_title: true
    trend_lines: []
    x_axis_zoom: true
    y_axis_zoom: true
    listen:
      Dashboard Creator: dashboard_creator.name
      Moved to Trash (Yes / No): dashboard.moved_to_trash
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 10
    col: 0
    width: 8
    height: 6
    tab_name: Merged Queries
  - title: Merged Queries By User
    name: Merged Queries By User
    model: system__activity
    explore: history
    type: looker_grid
    fields: [query.count, history.query_run_count, dashboard_creator.name]
    filters:
      dashboard_creator.name: "-NULL"
      history.source: '"merge_query"'
    sorts: [query.count desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: user.dev_branch_name
      expression: ''
      label: Count of Dev Branch Name
      measure: count_of_dev_branch_name
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      based_on: user.dev_branch_name
      category: measure
      expression:
      filters:
        user.dev_branch_name: "-NULL"
      label: Dev Queries
      measure: dev_queries
      type: count_distinct
      value_format:
      value_format_name:
    - _kind_hint: measure
      _type_hint: number
      based_on: merge_query.id
      expression: ''
      label: Count of ID
      measure: count_of_id
      type: count_distinct
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
    hidden_pivots: {}
    label_density: 25
    legend_position: center
    minimum_column_width: 75
    ordering: none
    plot_size_by_field: false
    point_style: none
    series_cell_visualizations:
      history.query_run_count:
        is_active: true
    show_null_labels: false
    show_row_totals: true
    show_silhouette: false
    show_sql_query_menu_options: false
    show_totals: true
    show_totals_labels: false
    show_value_labels: false
    show_x_axis_label: true
    show_x_axis_ticks: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    stacking: ''
    totals_color: "#808080"
    trellis: ''
    truncate_header: false
    x_axis_gridlines: false
    x_axis_reversed: false
    x_axis_scale: auto
    y_axis_combined: true
    y_axis_gridlines: true
    y_axis_reversed: false
    y_axis_scale_mode: linear
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    listen:
      Moved to Trash (Yes / No): dashboard.moved_to_trash
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 18
    col: 16
    width: 8
    height: 9
    tab_name: Merged Queries
  - title: Merged Queries Saved in the Last 7 complete days
    name: Merged Queries Saved in the Last 7 complete days
    model: system__activity
    explore: dashboard
    type: looker_column
    fields: [dashboard_element.created_date, dashboard_element.count_merge_query]
    fill_fields: [dashboard_element.created_date]
    filters:
      dashboard_element.created_date: 7 days ago for 7 days
      result_maker.is_merge_query: 'Yes'
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
    comparison_reverse_colors: false
    comparison_type: value
    conditional_formatting_include_nulls: false
    conditional_formatting_include_totals: false
    custom_color_enabled: true
    defaults_version: 1
    enable_conditional_formatting: false
    header_font_size: 12
    header_text_alignment: left
    hidden_fields:
    hide_row_totals: false
    hide_totals: false
    interpolation: linear
    rows_font_size: 12
    show_comparison: false
    show_comparison_label: true
    show_null_points: true
    show_row_numbers: true
    show_single_value_title: true
    size_to_fit: true
    table_theme: white
    transpose: false
    truncate_text: true
    listen:
      Moved to Trash (Yes / No): dashboard.moved_to_trash
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
    row: 29
    col: 0
    width: 8
    height: 7
    tab_name: Merged Queries
  - title: Worst Dashboards with Merged Queries by queries run count
    name: Worst Dashboards with Merged Queries by queries run count
    model: system__activity
    explore: history
    type: looker_grid
    fields: [history.query_run_count, dashboard.title]
    filters:
      merge_query.id: NOT NULL
      result_maker.is_merge_query: 'Yes'
    sorts: [history.query_run_count desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: dimension
      _type_hint: string
      category: table_calculation
      expression: |+
        if(
          is_null(${merge_query.formatted_pivots}) OR ${merge_query.formatted_pivots} = "[]", "No", "Yes - Please Review"
          )

      is_disabled: true
      label: Pivots Used
      table_calculation: pivots_used
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: string
      category: table_calculation
      expression: |
        if(
          is_null(${merge_query.dynamic_fields}) OR ${merge_query.dynamic_fields} = "[]", "No", "Yes - Please Review"
          )
      is_disabled: true
      label: Table Calcs Used
      table_calculation: table_calcs_used
      value_format:
      value_format_name:
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
    hidden_fields: []
    hidden_pivots: {}
    interpolation: linear
    label_density: 25
    legend_position: center
    minimum_column_width: 75
    plot_size_by_field: false
    point_style: none
    show_null_points: true
    show_row_totals: true
    show_sql_query_menu_options: false
    show_totals: true
    show_value_labels: false
    show_x_axis_label: true
    show_x_axis_ticks: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    stacking: ''
    trellis: ''
    truncate_header: false
    x_axis_gridlines: false
    x_axis_reversed: false
    x_axis_scale: auto
    y_axis_combined: true
    y_axis_gridlines: true
    y_axis_reversed: false
    y_axis_scale_mode: linear
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    listen:
      Dashboard Creator: dashboard_creator.name
      Moved to Trash (Yes / No): dashboard.moved_to_trash
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 42
    col: 0
    width: 24
    height: 6
    tab_name: Merged Queries
  - title: Alert Details - Dashboard element and user (in the past 7 complete days)
    name: Alert Details - Dashboard element and user (in the past 7 complete days)
    model: system__activity
    explore: dashboard
    type: looker_grid
    fields: [dashboard_element.created_date, user.name, dashboard.title, dashboard_element.title]
    filters:
      dashboard_element.created_date: 7 days ago for 7 days
      dashboard_element.result_source: Merge Query
      result_maker.is_merge_query: 'Yes'
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
    defaults_version: 1
    label_density: 25
    legend_position: center
    minimum_column_width: 75
    ordering: none
    plot_size_by_field: false
    point_style: none
    series_labels:
      dashboard.title: Dashboard Title
      dashboard_element.title: Tile Title
    show_null_labels: false
    show_row_totals: true
    show_silhouette: false
    show_sql_query_menu_options: false
    show_totals: true
    show_totals_labels: false
    show_value_labels: false
    show_x_axis_label: true
    show_x_axis_ticks: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    stacking: ''
    totals_color: "#808080"
    trellis: ''
    truncate_header: false
    x_axis_gridlines: false
    x_axis_reversed: false
    x_axis_scale: auto
    y_axis_combined: true
    y_axis_gridlines: true
    y_axis_reversed: false
    y_axis_scale_mode: linear
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    listen:
      Moved to Trash (Yes / No): dashboard.moved_to_trash
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
    row: 27
    col: 16
    width: 8
    height: 9
    tab_name: Merged Queries
  - name: " (13)"
    type: text
    title_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Impact"}],"align":"center"},{"type":"p","children":[{"text":"A
      breakdown of the number of Queries created and run by a specfic Explore/Model/User"}],"id":1688391891791,"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 16
    col: 0
    width: 24
    height: 2
    tab_name: Merged Queries
  - name: " (14)"
    type: text
    title_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Alert"}],"align":"center"},{"type":"p","id":1688400883295,"children":[{"text":"If
      a merged query is saved to a dashboard - use details tiles for more information"}]}]'
    rich_content_json: '{"format":"slate"}'
    row: 27
    col: 0
    width: 8
    height: 2
    tab_name: Merged Queries
  - name: " (15)"
    type: text
    title_text: ''
    body_text: '[{"type":"h1","children":[{"text":""}]},{"type":"p","children":[{"text":"Fields
      Used in this Dashboard","bold":true}],"id":1688463045819},{"type":"ol","children":[{"type":"li","children":[{"type":"lic","id":1688463111733,"children":[{"bold":true,"text":"Query
      Count - "},{"text":"The count of query id''s"}]}],"id":1688463322043},{"type":"li","children":[{"type":"lic","id":1688463066478,"children":[{"text":"Query
      Run Count - ","bold":true},{"text":" The total run count of a query"}]}],"id":1688463322041},{"type":"li","children":[{"type":"lic","id":1688463184150,"children":[{"text":"Averge
      Query Runtime - ","bold":true},{"text":"Average runtime of a query"}]}],"id":1688463322040},{"type":"li","children":[{"type":"lic","id":1688463191777,"children":[{"bold":true,"text":"Runtime
      in Seconds - "},{"text":"The lastest runtime of a query"}]}],"id":1688463322038}],"id":1688463322044}]'
    rich_content_json: '{"format":"slate"}'
    row: 0
    col: 0
    width: 5
    height: 3
    tab_name: Merged Queries
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
    sorts: [merge_query_source_query.count desc, history.query_run_count desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: dimension
      _type_hint: string
      category: table_calculation
      expression: |+
        if(
          is_null(${merge_query.formatted_pivots}) OR ${merge_query.formatted_pivots} = "[]", "No", "Yes - Please Review"
          )

      label: Pivots Used
      table_calculation: pivots_used
      value_format:
      value_format_name:
    - _kind_hint: dimension
      _type_hint: string
      category: table_calculation
      expression: |+
        if(
          is_null(${merge_query.dynamic_fields}) OR ${merge_query.dynamic_fields} = "[]", "No", "Yes - Please Review"
          )

      label: Table Calculation Used
      table_calculation: table_calculation_used
      value_format:
      value_format_name:
    - _kind_hint: measure
      _type_hint: number
      based_on: query.view
      expression: ''
      label: Count of Explore
      measure: count_of_explore
      type: count_distinct
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
    column_order: ["$$$_row_numbers_$$$", merge_query.created_date, user.name, dashboard.title,
      dashboard.id, dashboard_element.title, dashboard_element.id, pivots_used, table_calculation_used,
      merge_query_source_query.count, count_of_explore]
    conditional_formatting: [{background_color: "#0666EB", bold: false, fields: [],
        font_color: !!null '', italic: false, strikethrough: false, type: along a
          scale..., value: !!null ''}]
    defaults_version: 1
    hidden_fields: [merge_query.formatted_pivots, merge_query.dynamic_fields]
    hidden_pivots: {}
    interpolation: linear
    label_density: 25
    legend_position: center
    minimum_column_width: 75
    plot_size_by_field: false
    point_style: none
    series_cell_visualizations:
      merge_query_source_query.count:
        is_active: true
    series_labels:
      dashboard.title: Dashboard Title
      dashboard_element.id: Element ID
      dashboard_element.title: Query Tile Title
      merge_query_source_query.count: Count of Source Queries
      user.name: User Name
    series_text_format:
      pivots_used: {}
    show_null_points: true
    show_row_totals: true
    show_sql_query_menu_options: false
    show_totals: true
    show_value_labels: false
    show_x_axis_label: true
    show_x_axis_ticks: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    stacking: ''
    trellis: ''
    truncate_header: false
    x_axis_gridlines: false
    x_axis_reversed: false
    x_axis_scale: auto
    y_axis_combined: true
    y_axis_gridlines: true
    y_axis_reversed: false
    y_axis_scale_mode: linear
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    listen:
      Moved to Trash (Yes / No): dashboard.moved_to_trash
      Created Date: query.created_date
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
    row: 36
    col: 0
    width: 24
    height: 6
    tab_name: Merged Queries
  - title: Merged Queries - Percent of Total
    name: Merged Queries - Percent of Total
    model: system__activity
    explore: history
    type: single_value
    fields: [history.query_run_count, filtered_historyquery_run_count]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      category: table_calculation
      expression: "${filtered_historyquery_run_count}/${history.query_run_count}"
      label: Merged Queries - Percent of total
      table_calculation: merged_queries_percent_of_total
      value_format:
      value_format_name: percent_0
    - _kind_hint: measure
      _type_hint: number
      based_on: history.query_run_count
      category: measure
      filters:
        history.source: '"merge_query"'
      label: Filtered history.query_run_count
      measure: filtered_historyquery_run_count
      type: count_distinct
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields: [history.query_run_count, filtered_historyquery_run_count]
    hidden_pivots: {}
    label_density: 25
    legend_position: center
    limit_displayed_rows: false
    ordering: none
    plot_size_by_field: false
    point_style: none
    show_null_labels: false
    show_silhouette: false
    show_totals_labels: false
    show_value_labels: false
    show_view_names: false
    show_x_axis_label: true
    show_x_axis_ticks: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    stacking: ''
    totals_color: "#808080"
    trellis: ''
    x_axis_gridlines: false
    x_axis_reversed: false
    x_axis_scale: auto
    y_axis_combined: true
    y_axis_gridlines: true
    y_axis_reversed: false
    y_axis_scale_mode: linear
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    listen:
      Dashboard Creator: dashboard_creator.name
      Created Date: history.created_date
      Connection Name: history.connection_name
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
      Status: history.status
      Workspace ID: history.workspace_id
      Source (History): history.source
      Dialect: history.dialect
      Query Created Hour of Day: history.created_hour_of_day
      Runtime Tiers in Seconds: history.runtime_tiers
    row: 3
    col: 18
    width: 3
    height: 2
    tab_name: Merged Queries
  - title: Alert Details - Dashboard (in the past 7 complete days)
    name: Alert Details - Dashboard (in the past 7 complete days)
    model: system__activity
    explore: dashboard
    type: looker_grid
    fields: [dashboard_element.created_date, dashboard_element.count_merge_query,
      dashboard.title]
    filters:
      dashboard_element.created_date: 7 days ago for 7 days
      result_maker.is_merge_query: 'Yes'
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
    comparison_reverse_colors: false
    comparison_type: value
    custom_color_enabled: true
    defaults_version: 1
    hidden_fields:
    interpolation: linear
    label_density: 25
    legend_position: center
    ordering: none
    plot_size_by_field: false
    point_style: none
    show_comparison: false
    show_comparison_label: true
    show_null_labels: false
    show_null_points: true
    show_silhouette: false
    show_single_value_title: true
    show_totals_labels: false
    show_value_labels: false
    show_x_axis_label: true
    show_x_axis_ticks: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    stacking: ''
    totals_color: "#808080"
    trellis: ''
    x_axis_gridlines: false
    x_axis_reversed: false
    x_axis_scale: auto
    y_axis_combined: true
    y_axis_gridlines: true
    y_axis_reversed: false
    y_axis_scale_mode: linear
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    listen:
      Moved to Trash (Yes / No): dashboard.moved_to_trash
      Model: query.model
      Explore: query.view
      Dashboard Title: dashboard.title
    row: 27
    col: 8
    width: 8
    height: 9
    tab_name: Merged Queries
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
      options:
      - past
    model: system__activity
    explore: history
    listens_to_filters: []
    field: history.created_date
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
  - name: Status
    title: Status
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
    explore: history
    listens_to_filters: []
    field: history.workspace_id
  - name: Source (History)
    title: Source (History)
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
    explore: history
    listens_to_filters: []
    field: user.name
  - name: Result Source (Cache/DB)
    title: Result Source (Cache/DB)
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
    field: history.result_source
  - name: Dialect
    title: Dialect
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
        max: 23
        min: 0
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
  - name: Query ID
    title: Query ID
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
    field: query.id
  - name: Dashboard Creator
    title: Dashboard Creator
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
    field: dashboard_creator.name
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
