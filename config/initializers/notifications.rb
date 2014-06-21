ActiveSupport::Notifications.subscribe "process_action.action_controller" do |name, start, finish, id, payload|

  format = payload[:format]
  path = payload[:path]
  page_duration = (finish-start)*1000
  view_duration = payload[:view_runtime]
  db_duration = payload[:db_runtime]

  puts "\nRequest Format: %s\nPath: %3s\nPage Duration: %3.1fms\nView Duration: %3.1fms\nDB Duration: %3.1fms" % [format.to_s.upcase, path, page_duration, view_duration, db_duration]
end
