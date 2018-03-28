require 'lean_interactor/generate_initialize_method'
require 'lean_interactor/generate_main_method'
require 'lean_interactor/version'

module LeanInteractor
  def self.included(base)
    base.extend(ClassMethods)
    eval LeanInteractor::GenerateMainMethod.for(:base, :run, [])
  end

  module ClassMethods
    def initialize_with(*argument_names)
      attr_reader(*argument_names)
      eval LeanInteractor::GenerateMainMethod.for(:self, :for, argument_names)
      eval LeanInteractor::GenerateInitializeMethod.for(argument_names)
    end
  end
end
