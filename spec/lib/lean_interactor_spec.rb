RSpec.describe LeanInteractor do
  let(:argument_names) { [:a, :b] }
  let(:interactor) { Class.new { include LeanInteractor } }
  let(:method_definition) { '' }

  shared_examples 'initializer' do |method_name|
    it 'defines methods' do
      expect(interactor)
        .to receive(:attr_reader)
        .with(*argument_names)

      expect(LeanInteractor::GenerateMainMethod)
        .to receive(:for)
        .with(:self, method_name, argument_names)
        .and_return(method_definition)

      expect(LeanInteractor::GenerateInitializeMethod)
        .to receive(:for)
        .with(argument_names)
        .and_return(method_definition)

      expect(subject).to eq(true)
    end
  end

  describe '.initialize_for' do
    subject { interactor.initialize_for(*argument_names) }

    it_behaves_like('initializer', :for)
  end

  describe '.initialize_run' do
    subject { interactor.initialize_run(*argument_names) }

    it_behaves_like('initializer', :run)
  end

  describe '.initialize_call' do
    subject { interactor.initialize_call(*argument_names) }

    it_behaves_like('initializer', :call)
  end
end
