module PhusionPassenger
  module Utils

    protected

    NULL = "\0".freeze

    def split_by_null_into_hash(data)
      args = data.split(NULL, -1)
      args.pop
      headers_hash = Hash.new
      args.each_slice(2).to_a.each do |pair|
        headers_hash[pair.first] = pair.last unless headers_hash.keys.include? pair.first
      end
      return headers_hash
    end

  end
end