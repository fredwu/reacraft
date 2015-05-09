RSpec.shared_examples 'a reacraft unit' do
  subject { described_class.new }

  before do
    Kernel.silence_warnings do
      DB = SqlServer2016::Database.new
    end
  end

  describe '#upgrade' do
    before do
      3.times { subject.upgrade }
      2.times { subject.downgrade }
    end

    its(:health) { is_expected.to eq(110) }
    its(:level)  { is_expected.to eq(2) }
  end

  describe 'weakness' do
    before do
      4.times { subject.attacked }
    end

    its(:health) { is_expected.to eq(20) }
    its(:status) { is_expected.to eq(:weak) }
  end

  describe 'death' do
    before do
      5.times { subject.attacked }
    end

    its(:health) { is_expected.to eq(0) }
    its(:status) { is_expected.to eq(:dead) }
  end
end

RSpec.describe 'ReaCraft' do
  describe(Terrans::Unit) { it_behaves_like 'a reacraft unit' }
  describe(Zerg::Unit)    { it_behaves_like 'a reacraft unit' }
  describe(Protoss::Unit) { it_behaves_like 'a reacraft unit' }
end

