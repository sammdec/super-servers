class Marvel
  require 'digest/md5'
  include HTTParty
  debug_output $stderr

  base_uri 'gateway.marvel.com/v1/public'

  def initialize(public_key, private_key)
    @public_key = public_key
    @private_key = private_key
  end
  attr_reader :public_key, :private_key


  def rand_characters(limit=1)
    options = {limit: limit, offset: random_offset}
    self.class.get('/characters', query: auth_params.merge(options))
  end

  private
  def random_offset
    # 1402 is the current number of characters in the Marvel Universe
    rand(0...1402)
  end

  def auth_params
    ts = Time.now.to_i
    hash = auth_hash(ts)
    return {ts: ts, apikey: public_key, hash: hash}
  end

  def auth_hash(ts)
    value = ts.to_s << private_key << public_key
    md5 = Digest::MD5.hexdigest value
  end
end