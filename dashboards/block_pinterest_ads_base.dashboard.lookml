- dashboard: block_pinterest_ads_base
  hidden: yes
  layout: newspaper
  preferred_viewer: dashboards-next
  embed_style:
    background_color: "#ffffff"
    show_title: false
    title_color: "#3a4245"
    show_filters_bar: false
    tile_text_color: "#3a4245"
    text_tile_text_color: ''
  filters:
    - name: Period
      title: Period
      type: field_filter
      default_value: 28 day
      allow_multiple_values: false
      required: true
      model: block_pinterest_ads
      explore: pinterest_ad_impressions_ad_adapter
      listens_to_filters: []
      field: fact.period
    - name: Period Latest
      title: Period Latest
      type: field_filter
      default_value: 'Yes'
      allow_multiple_values: false
      required: true
      model: block_pinterest_ads
      explore: pinterest_ad_impressions_ad_adapter
      listens_to_filters: []
      field: fact.date_period_latest
