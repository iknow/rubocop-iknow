# frozen_string_literal: true

return unless defined?(::RuboCop)

module CustomCops
  class ForbidDateToday < ::RuboCop::Cop::Base
    MSG = 'Do not use `Date.today`, replace with `Date.current`'

    def on_send(node)
      if node.source.include?('Date.today') && node.receiver.const_name == 'Date' && node.method_name == 'today'
        add_offense(node)
      end
    end
  end
end
