---
- dashboard: google_pso__large_dashboards__query_count
  title: Google PSO - Large Dashboards + Query Count
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
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
    -
    - Created Date: history.created_date
    row: 2
    col: 0
    width: 24
    height: 23
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <nav style="font-size: 18px; padding: 5px 10px 0 10px; height: 60px">
        <a style="padding: 5px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/healthcheck::google_pso__performance_metrics">Performance Metrics</a>
        <a style="padding: 5px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/healthcheck::google_cloud__query_outliers">Outliers</a>
        <a style="padding: 5px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/healthcheck::google_pso__history_query_analysis">History</a>
        <a style="padding: 5px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/healthcheck::google_pso__content_delivery">Schedules</a>
        <a style="padding: 5px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/healthcheck::google_pso__merged_queries?">Merged Queries</a>
        <a style="padding: 5px; border-top: solid 1px #4285F4; border-left: solid 1px #4285F4; border-right: solid 1px #4285F4; border-radius: 5px 5px 0 0; float: left; line-height: 40px; font-weight: bold;" href="/dashboards/healthcheck::google_pso__large_dashboards__query_count">Large Dashboards</a>
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
    explore: history
    listens_to_filters: []
    field: history.created_date
