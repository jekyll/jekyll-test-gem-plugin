# frozen_string_literal: true

require "colorator"
require "json"

data = JSON.parse(ENV["EVENT_JSON"])
label = %Q(TAG #{data["ref"].delete_prefix("refs/tags/").cyan})
puts <<-TEXT

  ---------------------------------------------------------
  #{label.center(64)}
  ---------------------------------------------------------


      Pushed by: #{data.dig("pusher", "name")&.cyan}
     Repository: #{data.dig("repository", "full_name")&.cyan}


    Head Commit Details:

      #{data.dig("head_commit", "message").inspect.cyan}

         Author: #{data.dig("head_commit", "author", "username")&.cyan}
      Committer: #{data.dig("head_commit", "committer", "username")&.cyan}
         SHA ID: #{data.dig("head_commit", "id")&.cyan}

  ---------------------------------------------------------
TEXT
