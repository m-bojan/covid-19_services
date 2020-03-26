# frozen_string_literal: true

# Loading environment based app settings
app_default_yml  = YAML.load_file(Rails.root + 'config/application.yml').symbolize_keys
add_default_attr = app_default_yml[:default].symbolize_keys
CONSTANT = add_default_attr.merge(app_default_yml[Rails.env.to_sym].symbolize_keys)
