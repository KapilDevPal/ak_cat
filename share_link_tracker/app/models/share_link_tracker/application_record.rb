module ShareLinkTracker
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
    
    # Groupdate doesn't need to be explicitly included this way
    # It extends ActiveRecord::Base automatically when loaded
  end
end 