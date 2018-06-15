require 'lean_interactor/version'
require 'lean_interactor/generate_initialize_method'
require 'lean_interactor/generate_main_method'

module LeanInteractor
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def initialize_for(*argument_names)
      initialize_method(:for, argument_names)
    end

    def initialize_run(*argument_names)
      initialize_method(:run, argument_names)
    end

    def initialize_call(*argument_names)
      initialize_method(:call, argument_names)
    end

    private

    def initialize_method(method_name, argument_names)
      attr_reader(*argument_names)
      eval LeanInteractor::GenerateMainMethod.for(:self, method_name, argument_names)
      eval LeanInteractor::GenerateInitializeMethod.for(argument_names)

      true
    end
  end
end
