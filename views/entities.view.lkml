view: entities {
  sql_table_name: "BICYCLE_HEALTH"."ENTITIES"
    ;;
  drill_fields: [entity_id]

  dimension: entity_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."ENTITY_ID" ;;
  }

  dimension: _file {
    type: string
    sql: ${TABLE}."_FILE" ;;
  }

  dimension: _fivetran_synced {
    type: string
    sql: ${TABLE}."_FIVETRAN_SYNCED" ;;
  }

  dimension: _line {
    type: number
    sql: ${TABLE}."_LINE" ;;
  }

  dimension: _modified {
    type: string
    sql: ${TABLE}."_MODIFIED" ;;
  }

  dimension: display_name {
    type: string
    sql: ${TABLE}."DISPLAY_NAME" ;;
  }

  dimension_group: dob {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DOB" ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}."FIRST_NAME" ;;
  }

  dimension: invite_pending {
    type: yesno
    sql: ${TABLE}."INVITE_PENDING" ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}."LAST_NAME" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."TYPE" ;;
  }

  measure: count {
    type: count
    drill_fields: [entity_id, first_name, display_name, last_name]
  }

  dimension: full_name {
    type: string
    sql: concat(${first_name},' ',${last_name}) ;;
  }
}
