RSpec.describe LeanInteractor::GenerateMainMethod, '.for' do
  subject { described_class.for(base_class_name, method_name, argument_names) }

  let(:base_class_name) { :self }
  let(:method_name) { :run }

  context 'with argument names' do
    let(:argument_names) { [:a, :b] }

    it 'generates method definition' do
      expected = <<~CODE
        def self.run(a, b)
        new(a, b).run
        end
      CODE

      expect(subject).to eq(expected.strip)
    end
  end

  context 'without argument names' do
    let(:argument_names) { [] }

    it 'generates method definition' do
      expected = <<~CODE
        def self.run()
        new().run
        end
      CODE

      expect(subject).to eq(expected.strip)
    end
  end
end
