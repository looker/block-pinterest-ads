include: "*.view.lkml"
view: pinterest_ad_group_key_base {
  extends: [pinterest_account_key_base]
  extension: required

  dimension: ad_group_key_base {
    hidden: yes
    sql: {% if _dialect._name == 'snowflake' %}
        ${account_key_base} || '-' || TO_CHAR(${ad_group_id})
      {% elsif _dialect._name == 'redshift' %}
        ${account_key_base} || '-' || CAST(${ad_group_id} AS VARCHAR)
      {% else %}
        CONCAT(${account_key_base}, "-", CAST(${ad_group_id} as STRING))
      {% endif %} ;;
  }
  dimension: key_base {
    hidden: yes
    sql: ${ad_group_key_base} ;;
  }
}

view: pinterest_ad_key_base {
  extends: [pinterest_ad_group_key_base]
  extension: required

  dimension: ad_key_base {
   hidden: yes
    sql:
      {% if _dialect._name == 'snowflake' %}
        ${ad_group_key_base} || '-' || TO_CHAR(${ad_id})
      {% elsif _dialect._name == 'redshift' %}
        ${ad_group_key_base} || '-' || CAST(${ad_id} AS VARCHAR)
      {% else %}
        CONCAT(${ad_group_key_base}, "-", CAST(${ad_id} as STRING))
      {% endif %} ;;
  }
  dimension: key_base {
    sql: ${ad_key_base} ;;
  }
}

view: pinterest_account_key_base {
  extends: [date_base]
  extension: required

  dimension: account_key_base {
    hidden: yes
    sql: {% if _dialect._name == 'snowflake' %}
        TO_CHAR(${account_id})
      {% elsif _dialect._name == 'redshift' %}
        CAST(${account_id} AS VARCHAR)
      {% else %}
        CAST(${account_id} AS STRING)
      {% endif %} ;;
  }
  dimension: key_base {
    hidden: yes
    sql: ${account_key_base} ;;
  }
}



view: pinterest_campaign_key_base {
  extends: [pinterest_account_key_base]
  extension: required

  dimension: campaign_key_base {
    hidden: yes
    sql: {% if _dialect._name == 'snowflake' %}
        ${account_key_base} || '-' || TO_CHAR(${campaign_id})
      {% elsif _dialect._name == 'redshift' %}
        ${account_key_base} || '-' || CAST(${campaign_id} AS VARCHAR)
      {% else %}
        CONCAT(${account_key_base}, "-", CAST(${campaign_id} as STRING))
      {% endif %} ;;
  }
  dimension: key_base {
    hidden: yes
    sql: ${campaign_key_base} ;;
  }
}
