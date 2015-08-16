require 'spec_helper'

RSpec.describe MatlabRuby do
  let(:matlab_engine) { MatlabRuby.start_engine }

  before(:all) do
    MatlabRuby.initialize ENV['MATLAB_RUBY_LIBS_PATH']
  end

  context 'when initialized API' do
    describe '.start_engine' do
      after do
        MatlabRuby.stop_engine @matlab_engine
      end
      it 'successfully starts the engine' do
        @matlab_engine = MatlabRuby.start_engine
      end
    end

    describe '.stop_engine' do
      it 'successfully stops the engine' do
        MatlabRuby.stop_engine matlab_engine
      end
    end

    context 'when engine starts' do
      before do
        matlab_engine
      end

      after do
        MatlabRuby.stop_engine(matlab_engine)
      end

      let(:x_value) { 5 }

      describe '.engEvalString' do
        after do
          MatlabRuby.engEvalString matlab_engine, "clearvars x;"
        end

        it 'evaluates the string' do
          MatlabRuby.engEvalString matlab_engine, "x=#{x_value};"
        end
      end

      describe '.engGetVariable' do
        before do
          MatlabRuby.engEvalString matlab_engine, "x=#{x_value};"
        end

        after do
          MatlabRuby.engEvalString matlab_engine, "clearvars x;"
        end

        it 'returns the variable value' do
          MatlabRuby.engGetVariable matlab_engine, "x"
        end
      end

      describe '.mxGetScalar' do
        let(:x_matlab_var) { MatlabRuby.engGetVariable matlab_engine, "x" }

        before do
          MatlabRuby.engEvalString matlab_engine, "x=#{x_value}"
        end

        after do
          MatlabRuby.engEvalString matlab_engine, "clearvars x;"
        end

        it 'returns the scalar value' do
          expect(MatlabRuby.mxGetScalar(x_matlab_var)).to eq(x_value)
        end
      end
    end
  end
end