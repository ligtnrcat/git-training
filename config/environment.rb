# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Amazon::Ecs.options = {
  associate_tag:     'litencatt0f-22',
  AWS_access_key_id: 'AKIAJCFYFKKA75F34E2A',
  AWS_secret_key:   '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'
}
