connection: "demo"
include: "/views/*.view"
datagroup: demo_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

explore: conversations {
  # access_filter: {
  #   field: conversation_events.event
  #   user_attribute: department
  # }
  join:  entities{
    type: left_outer
    sql_on: ${conversations.primary_entity_id} = ${entities.entity_id};;
    relationship: many_to_many
  }

  join: conversation_events {
    type:  left_outer
    sql_on: ${conversations.conversation_id} = ${conversation_events.conversation_id} ;;
    relationship: one_to_many
  }

  join: entities_new {
    type: left_outer
    sql_on: ${entities_new.entity_id} = ${messages.actor_entity_id} ;;
    relationship: one_to_many
  }

  join: messages {
    relationship: many_to_one
    type: left_outer
    sql_on: ${conversations.conversation_id}=${messages.conversation_id} ;;
  }
}

persist_with: demo_default_datagroup
