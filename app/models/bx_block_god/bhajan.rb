module BxBlockGod
  class Bhajan < ApplicationRecord
    self.table_name = 'bx_block_god_bhajans'
    belongs_to :god, class_name: 'BxBlockGod::God'

    enum :bhajan_type, {
      arti: 'arti',
      bhajan: 'bhajan',
      chalisa: 'chalisa',
      stotram: 'stotram',
      mantra: 'mantra'
    }

    validates :bhajan_type, presence: true
    validates :text, presence: true
  end
end 