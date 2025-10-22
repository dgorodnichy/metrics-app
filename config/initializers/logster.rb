redis_connection = Redis.new(host: 'localhost')
Logster.store = Logster::RedisStore.new(redis_connection)
