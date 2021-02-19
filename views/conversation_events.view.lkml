view: conversation_events {
  sql_table_name: "BICYCLE_HEALTH"."CONVERSATION_EVENTS"
    ;;

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

  dimension: actor_entity_id {
    type: string
    sql: ${TABLE}."ACTOR_ENTITY_ID" ;;
  }

  dimension: conversation_id {
    primary_key: yes
    type: string
    # hidden: yes
    sql: ${TABLE}."CONVERSATION_ID" ;;
  }

  dimension: data {
    type: string
    sql: ${TABLE}."DATA" ;;
  }

  dimension: event {
    type: string
    sql: ${TABLE}."EVENT" ;;
  }

  dimension_group: timestamp {
    type: time
    timeframes: [
      raw,
      date,
      month,
      week,
      quarter,
      hour,
      minute,
      second,
      millisecond
    ]
    datatype: timestamp
    sql: replace(${TABLE}."TIMESTAMP",'UTC','')::timestamp_tz ;;
  }

  measure: count {
    type: count
    drill_fields: [conversations.conversation_id]
  }

  dimension: processing_events{
    type:  string
    sql: CASE WHEN ${conversation_events.event} = 'ARCHIVE' then NULL
            WHEN (replace(replace(replace(${conversation_events.data},'[',''),']',''),'\"','')) LIKE ('%remove_tags:null%') then 'ADDED_TAGS'
            WHEN (replace(replace(replace(${conversation_events.data},'[',''),']',''),'\"','')) LIKE ('%add_tags:null%') then 'REMOVED_TAGS'
            END  ;;
  }

  dimension: tags {
    type: string
    sql: CASE WHEN ${conversation_events.data} LIKE ('%"remove_tags":null%') then split_part(split_part(${conversation_events.data},':',2),'"',2)
            WHEN ${conversation_events.data} LIKE ('%"add_tags":null%') then split_part(split_part(${conversation_events.data},':',3),'"',2)
            END ;;
  }
}
