# MaiCoin quiz

## Running Instructions:
Please run the specs with `demo` tag using `RSpec`.

- install `RSpec`: `$ bundle install`
- run specs: `$ bundle exec rspec spec/ --format d --tag demo`

## File structure:

### `lib` folder:
This folder includes `LinkedList` and `BinaryTreeNode` classes used by classes in `models`

### `models` folder:
This folder includes question solvers, each question is solved by a class in a file.

### `spec` folder:
This folder includes unit tests of all classes. 
Tests of classes in `lib` and `models` are placed in `spec/lib` and `spec/model`, respectively.

## Testing:
run all unit tests by `$ bundle exec rspec spec/ --format d`
