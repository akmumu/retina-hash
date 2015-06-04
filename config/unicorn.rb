module Rails
  class <<self

    def root
      "/home/admin/akmumu/www/retina-data/current"
    end

    def shared
      "/home/admin/akmumu/www/retina-data/shared"
    end

  end
end

preload_app true
working_directory Rails.root
pid "#{Rails.shared}/tmp/unicorn.retina-data.pid"
stderr_path "#{Rails.shared}/log/unicorn.log"
stdout_path "#{Rails.shared}/log/unicorn.log"

listen 7000, tcp_nopush: false

listen "#{Rails.shared}/tmp/sockets/unicorn.retina-data.sock"
worker_processes 1
timeout 300

if GC.respond_to?(:copy_on_write_friendly=)
  GC.copy_on_write_friendly = true
end

before_exec do |server|
  ENV["BUNDLE_GEMFILE"] = "#{Rails.root}/Gemfile"
end

before_fork do |server, worker|
  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      puts "Send 'QUIT' signal to unicorn error!"
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
  defined?(Redis) and $redis.client.reconnect
end