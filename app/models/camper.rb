class Camper < ApplicationRecord
    has_many :signups
    has_many :activities, through: :signups

    validates :name, presence: true
    validates :age, numericality: {greater_than_or_equal_to: 8, less_than_or_equal_to: 18}
    
    def profile
        self.to_json(
            include: {
                activities: {
                    except: [
                        :created_at,
                        :updated_at
                    ]
                }
            },
            except: [
                :created_at,
                :updated_at
            ]
        )
    end

end
