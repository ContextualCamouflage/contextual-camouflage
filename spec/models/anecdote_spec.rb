require 'rails_helper'

RSpec.describe Anecdote, type: :model do
  it { is_expected.to belong_to(:submission) }

end
