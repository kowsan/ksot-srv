require 'redis'
$redis = Redis.new(:host => '127.0.0.1', :port => 6379, :db => 2)
unless $redis.keys.empty?
  $redis.del($redis.keys)
end


def drop_redis_cache
  $redis.flushdb
end
