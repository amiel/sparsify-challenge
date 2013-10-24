# encoding: utf-8

module Sparsify
  def self.sparse(source)
    SparseHash.new(source).to_h
  end

  class SparseHash
    attr_reader :sparse_hash
    def initialize(source)
      @sparse_hash = {}
      set_values_from_hash(source)
    end

    alias_method :to_h, :sparse_hash

    def []=(k, v)
      v.is_a?(Hash) ? set_values_from_hash(v, k) : sparse_hash[k] = v
    end

    def set_values_from_hash(hash, prefix = nil)
      hash.each do |k, v|
        sparse_key = [prefix, k].compact.join('.')
        self[sparse_key] = v
      end

      hash
    end
  end

end
