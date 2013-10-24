# encoding: utf-8

module Sparsify
  def self.sparse(source)
    source.each_with_object(Hash.new) do |(key, value), new_hash|
      if value.is_a? Hash
        sparse(value).each do |k, v|
          new_hash["#{key}.#{k}"] = v
        end
      else
        new_hash[key] = value
      end
    end
  end

end
