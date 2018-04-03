RSpec.describe LeanInteractor do
  describe '.initialize_with' do
    subject { interactor.initialize_with(*argument_names) }

    let(:argument_names) { [:a, :b] }
    let(:interactor) { Class.new { include LeanInteractor } }
    let(:method_definition) { '' }

    it 'defines methods' do
      expect(interactor)
        .to receive(:attr_reader)
        .with(*argument_names)

      expect(LeanInteractor::GenerateMainMethod)
        .to receive(:for)
        .with(:self, :for, argument_names)
        .and_return(method_definition)

      expect(LeanInteractor::GenerateInitializeMethod)
        .to receive(:for)
        .with(argument_names)
        .and_return(method_definition)

      expect(subject).to eq(true)
    end

    context 'with no arguments' do
      let(:argument_names) { [] }

      it { is_expected.to eq(nil) }
    end
  end
end
