require_relative '../lib/app'

describe App do
  it('should get correct result') do
    $stdout.should_receive(:puts).with(no_args)
    $stdout.should_receive(:puts).with('Best-fit hotels for customer 1')
    $stdout.should_receive(:puts).with('Lakewood')
    $stdout.should_receive(:puts).with(no_args)
    $stdout.should_receive(:puts).with('Best-fit hotels for customer 2')
    $stdout.should_receive(:puts).with('Bridgewood')
    $stdout.should_receive(:puts).with(no_args)
    $stdout.should_receive(:puts).with('Best-fit hotels for customer 3')
    $stdout.should_receive(:puts).with('Ridgewood')
    $stdout.should_receive(:puts).with(no_args)

    App.new.run 'spec/fixtures/test_input_data.txt'
  end
end