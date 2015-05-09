module Terrans
  class Unit < XelNaga::Unit
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
    end

    def status
      if self.health <= 0
        :dead
      elsif self.health < 30
        :weak
      else
        :normal
      end
    end
  end
end
