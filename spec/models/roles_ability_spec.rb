require 'spec_helper'

describe RolesAbility do
  it { should belong_to(:role) }
  it { should belong_to(:ability) }
end
