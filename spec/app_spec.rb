require_relative '../lib/app'

describe App do
  it('should get correct result') do
    expect($stdout).to receive(:puts).with(no_args)
    expect($stdout).to receive(:puts).with('Best-fit hotels for customer 1')
    expect($stdout).to receive(:puts).with('Lakewood')
    expect($stdout).to receive(:puts).with(no_args)
    expect($stdout).to receive(:puts).with('Best-fit hotels for customer 2')
    expect($stdout).to receive(:puts).with('Bridgewood')
    expect($stdout).to receive(:puts).with(no_args)
    expect($stdout).to receive(:puts).with('Best-fit hotels for customer 3')
    expect($stdout).to receive(:puts).with('Ridgewood')
    expect($stdout).to receive(:puts).with(no_args)

    App.new.run 'spec/fixtures/test_input_data.txt'
  end
end