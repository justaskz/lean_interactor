RSpec.describe LeanInteractor do
  describe '.run' do
    subject { interactor.run }

    let(:interactor) do
      Class.new do
        include LeanInteractor

        def run
          :result
        end
      end
    end

    it { is_expected.to eq(:result) }
  end

  describe '.for' do
    let(:interactor) do
      Class.new do
        include LeanInteractor

        initialize_with :arg_1, :arg_2

        def run
          arg_1 + arg_2
        end
      end
    end

    let(:arg_1) { 1 }
    let(:arg_2) { 2 }

    context 'with correct amount of arguments' do
      subject { interactor.for(arg_1, arg_2) }

      it { is_expected.to eq(3) }
    end

    context 'with incorrect amount of arguments' do
      subject { interactor.for(arg_1) }

      it 'raises an error' do
        expect { subject }.to raise_error(ArgumentError)
      end
    end
  end
end
