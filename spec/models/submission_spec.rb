require 'rails_helper'

RSpec.describe Submission, type: :model do
  it { is_expected.to have_many(:researches) }
  it { is_expected.to have_many(:anecdotes) }

end
