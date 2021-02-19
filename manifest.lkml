project_name: "demo"

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
# local_dependency: {
#   project: "name_of_other_project"
# }
application: demo {
  label: "Actionable Insight"
#   url: "http://localhost:8080/bundle.js"
  file: "bundle.js"
  entitlements: {
    # allow_same_origin: yes
    # allow_forms: yes
    local_storage: yes
    navigation: yes
    new_window: yes
    core_api_methods: ["me","all_user_attributes","user_attribute_user_values"]
  }
}
