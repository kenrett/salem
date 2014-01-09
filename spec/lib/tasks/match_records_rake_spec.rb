require 'spec_helper'
require 'csv'

describe 'match_records' do
  include_context 'rake'

  before :each do
    @row = {date: 'blah', blah: 'blah'}
    @record = {date: 'blah', blah: 'blah'}
    CSV.stub(:foreach).and_yield(@row).and_yield(@record)
    File.stub(:open)
  end

  it 'opens a file if records match' do
    rake

    expect(File).to have_received(:open).with('./matches.csv', 'a')
  end

  it "doesn't open a file unless records match" do
    @record = {date: 'blop'}

    rake

    expect(File).to_not have_received(:open)
  end
end
