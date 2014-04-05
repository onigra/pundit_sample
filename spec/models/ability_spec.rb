require 'spec_helper'

describe Ability do
  it { should have_many(:roles).through(:roles_abilities) }
end
