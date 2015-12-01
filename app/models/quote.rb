class Quote < ActiveRecord::Base
  validates :saying, :presence => true, :length => { :maximum => 1000, :minimum => 2 }
  validates :author, :presence => true, :length => { :maximum => 100, :minimum => 2 }

  def unique_tag
    abbr = self.author.split(" ").collect do |sub_string|
      sub_string[0]
    end

    abbr.join("") + '#' + self.id.to_s
  end

end
