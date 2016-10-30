# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Amazon::Ecs.options = {
  associate_tag:     'litencatt0f-22',
  AWS_access_key_id: 'AKIAJF5GY2UGKCDITOZA',
  AWS_secret_key:   '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'
}
