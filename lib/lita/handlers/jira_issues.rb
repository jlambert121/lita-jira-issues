module Lita
  module Handlers
    class JiraIssues < Handler

      def self.default_config(config)
        config.enabled = true
      end

      route /[A-Z]+-\d+/, :jira_key, help: {
        "KEY-123" => "Replies with information about the given JIRA key"
      }

      def jira_key(response)
        response.matches.each do | key |
          response.reply "[#{key}]"
        end
      end
    end

    Lita.register_handler(JiraIssues)
  end
end
