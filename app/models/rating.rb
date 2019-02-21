class Rating < ApplicationRecord
  belongs_to :rated, class_name: "User"
  belongs_to :rater, class_name: "User"
end

# belongs_to :user
# belongs_to :friend, class_name: "User"
