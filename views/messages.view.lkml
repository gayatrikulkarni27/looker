view: messages {
  sql_table_name: "BICYCLE_HEALTH"."MESSAGES"
    ;;
  drill_fields: [message_id_conversation_id_created_timestamp_internal_actor_entity_id_message_trigger_message_body_destinations]

  dimension: message_id_conversation_id_created_timestamp_internal_actor_entity_id_message_trigger_message_body_destinations {
    # primary_key: yes
    type: string
    sql: ${TABLE}."MESSAGE_ID_CONVERSATION_ID_CREATED_TIMESTAMP_INTERNAL_ACTOR_ENTITY_ID_MESSAGE_TRIGGER_MESSAGE_BODY_DESTINATIONS" ;;
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

  dimension_group: created_timestamp {
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
    sql: replace(${TABLE}."CREATED_TIMESTAMP",'UTC','')::timestamp_tz ;;
  }

  dimension: hour_of_day {
    type: string
    sql: CASE WHEN (${conversation_events.data}) LIKE ('%"remove_tags":null%') then ((CAST(EXTRACT(HOUR FROM CAST((replace((${created_timestamp_second}),'UTC','')::timestamp_tz) AS TIMESTAMP)) AS INT)) - 5)
            WHEN (${conversation_events.data}) LIKE ('%"add_tags":null%') then 0
             ELSE NULL END ;;
  }

  dimension: date {
    type: string
    sql: TO_CHAR(TO_DATE(CASE WHEN (${conversation_events.data}) LIKE ('%"remove_tags":null%') then (TO_CHAR(TO_DATE((replace((${created_timestamp_hour}),'UTC','')::timestamp_tz)), 'YYYY-MM-DD'))
            WHEN (${conversation_events.data}) LIKE ('%"add_tags":null%') then null
            ELSE NULL END ), 'YYYY-MM-DD')  ;;
  }

  dimension: destinations {
    type: string
    sql: ${TABLE}."DESTINATIONS" ;;
  }

  dimension: internal {
    type: yesno
    sql: ${TABLE}."INTERNAL" ;;
  }

  dimension: message_body {
    type: string
    sql: ${TABLE}."MESSAGE_BODY" ;;
  }

  dimension: message_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."MESSAGE_ID" ;;
  }

  dimension: message_trigger {
    type: string
    sql: ${TABLE}."MESSAGE_TRIGGER" ;;
  }

  measure: count {
    type: count
    drill_fields: [message_id_conversation_id_created_timestamp_internal_actor_entity_id_message_trigger_message_body_destinations, conversations.conversation_id, messages.message_id_conversation_id_created_timestamp_internal_actor_entity_id_message_trigger_message_body_destinations, messages.count]
  }
}
