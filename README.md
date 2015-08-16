# MatlabRuby #

This is a Ruby interface to the [MATLAB Engine API](http://www.mathworks.com/help/matlab/calling-matlab-engine-from-c-c-and-fortran-programs.html)
and to the [C/C++ Matrix Library API](http://www.mathworks.com/help/matlab/cc-mx-matrix-library.html).

MATLAB needs to be installed and you need to know where the dynamically loaded library files are located. For example, in my installation (Ubuntu 14.04)
MATLAB dlls are installed here: `/usr/local/MATLAB/R2014a/bin/glnxa64`

## Installation ##

Add this line to your application's Gemfile:

```ruby
gem 'matlab_ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install matlab_ruby

## Usage ##

Open the file `lib/matlab_ruby.rb` to see which functions of the APIs are interfaced via this gem. Not all functions are ready.

### Initialize ###

First you need to initialize the interface to the API implementations. 
Call `.initialize` and give the path to the MATLAB libs directory:

```
MatlabRuby.initialize('/usr/local/MATLAB/R2014a/bin/glnxa64')
```

### Start Engine ###

Then you need to start the MATLAB engine. 

```
matlab_engine = MatlabRuby.startEngine
```

### Call API Functions ###

And now you are ready to call API functions.

Example:
```
MatlabRuby.engEvalString matlab_engine, "x = 5;"

x_var   = MatlabRuby.engGetVariable matlab_engine, "x"

x_value = MatlabRuby.mxGetScalar(x_var)

MatlabRuby.engEvalString(matlab_engine, "clearvars x;")

puts "Value of 'x' is #{x_value}" # this should print out 5.0
```

## Tests ##

In order to run the tests of this gem, you need to have the MATLAB engine installed and you need to have
MATLAB_RUBY_LIBS_PATH environment variable set to the correct path to the MATLAB libs. You can do that inside the ".env.test" file

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/matlab_ruby. This project is intended to be a safe, welcoming space for collaboration, 
and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

