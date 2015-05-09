module Protoss
  class Unit < XelNaga::Unit
    include AASM

    def upgrade
      self.level  += 1
      self.health += 10
    end

    def downgrade
      self.level  -= 1
      self.health -= 10
    end

    def attacked
      self.health -= 20

      attack
    end

    def status
      aasm.current_state
    end

    aasm do
      state :normal, initial: true
      state :weak
      state :dead

      event :attack do
        transitions from: :normal, to: :weak do
          guard do
            self.health < 30
          end
        end

        transitions from: [:normal, :weak], to: :dead do
          guard do
            self.health <= 0
          end
        end

        transitions from: :normal, to: :normal
      end
    end
  end
end
