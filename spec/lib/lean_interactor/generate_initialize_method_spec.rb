RSpec.describe LeanInteractor::GenerateInitializeMethod, '.for' do
  subject { described_class.for(argument_names) }

  let(:argument_names) { [:a, :b] }

  it 'generates method definition' do
    expected = <<~CODE
      define_method(:initialize) do |a, b|
      @a = a
      @b = b
      end
    CODE

    expect(subject).to eq(expected.strip)
  end
end
