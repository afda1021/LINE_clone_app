root_path = File.expand_path('../../', __FILE__)

worker_processes 2

working_directory root_path

pid "#{root_path}/tmp/pids/unicorn.pid"

listen "#{root_path}/tmp/sockets/unicorn.sock"

# エラーログを記録するファイル
stderr_path "#{root_path}/log/unicorn.stderr.log"

# 通常ログを記録するファイル
stdout_path "#{root_path}/log/unicorn.stdout.log"

timeout 30

# ダウンタイムなしでUnicornを再起動する
preload_app true

GC.respond_to?(:copy_on_write_friendly=) && GC.copy_on_write_friendly = true

check_client_connection false

run_once = true

before_fork do |server, worker|
  defined?(ActiveRecord::Base) && ActiveRecord::Base.connection.disconnect!

  if run_once
    run_once = false # prevent from firing again
  end

  old_pid = "#{server.config[:pid]}.oldbin"

  if File.exist?(old_pid) && server.pid != old_pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH => e
      logger.error e
    end
  end
end

after_fork do |_server, _worker|
  defined?(ActiveRecord::Base) && ActiveRecord::Base.establish_connection
end
