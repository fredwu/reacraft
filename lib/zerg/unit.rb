module Zerg
  class Unit < XelNaga::Unit
    def initialize
      super

      DB.events[:health] << @health
      DB.events[:level]  << @level
    end

    def upgrade
      DB.events[:level]  << 1
      DB.events[:health] << 10
    end

    def downgrade
      DB.events[:level]  << -1
      DB.events[:health] << -10
    end

    def attacked
      DB.events[:health] << -20
    end

    def health
      DB.events[:health].inject(:+)
    end

    def level
      DB.events[:level].inject(:+)
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
