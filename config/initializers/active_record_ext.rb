module ActiveRecord
  class Base
    def self.filter_attributes(hash)
      hash.stringify_keys.slice(*self.accessible_attributes.to_a)
    end
  end
end
