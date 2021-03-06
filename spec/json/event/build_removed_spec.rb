require 'spec_helper'

describe 'JSON for websocket events' do

  let(:repository) { Scenario.default.first }
  let(:build) { repository.last_build }
  let(:job) { build.matrix.first }

  it 'build:removed' do
    json_for_pusher('build:removed', job).should == {
     'build' => {
       'id' => job.id,
       'number' => '2.1'
      },
      'repository' => {
        'id' => repository.id,
        'slug' => "svenfuchs/minimal"
      }
    }
  end
end
