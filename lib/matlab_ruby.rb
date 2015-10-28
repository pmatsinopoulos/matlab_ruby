require "matlab_ruby/version"
require "ffi"

module MatlabRuby
  extend FFI::Library

  # This initializes with the directory of the matlab dynamically linked libraries
  # E.g. /usr/local/MATLAB/R2014a/bin/glnxa64
  #
  def self.initialize(matlab_dll_dir = ENV['MATLAB_RUBY_LIBS_PATH'])
    ffi_lib "#{matlab_dll_dir}/libeng.so"
    attach_function :engOpen,         [:string], :pointer
    attach_function :engClose,        [:pointer], :int
    attach_function :engPutVariable,  [:pointer, :string, :pointer ], :int
    attach_function :engGetVariable,  [:pointer, :string], :pointer
    attach_function :engEvalString,   [:pointer, :string ], :int

    ffi_lib "#{matlab_dll_dir}/libmx.so"
    attach_function :mxGetNumberOfFields,  [:pointer], :int

    attach_function :mxGetScalar, [:pointer], :double

    attach_function :mxCreateDoubleMatrix, [:int, :int, :int], :pointer
    attach_function :mxDestroyArray,       [:pointer], :void
    attach_function :mxGetClassName,       [:pointer], :string

    ffi_lib FFI::Library::LIBC
    attach_function :malloc, [:size_t], :pointer
    attach_function :free,   [:pointer], :void
  end

  def self.start_engine(matlab_start_arguments = "-nosplash -nodisplay -nojvm")
    engOpen "matlab #{matlab_start_arguments}"
  end

  def self.stop_engine(engine_ref)
    engClose engine_ref
  end
end
