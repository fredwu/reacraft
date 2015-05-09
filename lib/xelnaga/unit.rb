module XelNaga
  class Unit
    include Virtus.model

    STATUSES = [:normal, :weak, :dead]

    attribute :health, Integer, default: 100
    attribute :level,  Integer, default: 1
    attribute :status, Symbol,  default: :normal
  end
end
