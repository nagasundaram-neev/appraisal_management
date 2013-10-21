class Implication < ActiveRecord::Base
 has_many :curr_implications
 has_many :next_implications
end
