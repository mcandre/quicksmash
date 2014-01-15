# QuickSmash - A Smalltalk port of the QuickCheck unit test framework

# EXAMPLE

    $ make install
    $ make test
    gst -f example.st
    +++ OK, passed 100 tests.
    *** Failed! (-19 )
    +++ OK, passed 100 tests.

# HOMEPAGE

http://www.yellosoft.us/quickcheck

# REQUIREMENTS

* [GNU Smalltalk](http://smalltalk.gnu.org/)

Example: `brew install gnu-smalltalk`

## Optional

* [Ruby](https://www.ruby-lang.org/) 2+
* [Bundler](http://bundler.io/)
* [Cucumber](http://cukes.info/)
* [Guard](http://guardgem.org/)

# TESTING

Ensure the example script works as expected:

    $ bundle
    $ cucumber
    Feature: Run example tests

      Scenario: Running example tests            # features/run_example_tests.feature:3
        Given the program has finished           # features/step_definitions/steps.rb:1
        Then the output is correct for each test # features/step_definitions/steps.rb:5

    1 scenario (1 passed)
    2 steps (2 passed)
    0m0.017s

Guard can automatically run testing when the code changes:

    $ bundle
    $ guard -G Guardfile-cucumber
    ...

# INSTALL

    $ make install
