require 'test_helper'

class SymptomTest < ActiveSupport::TestCase

  test 'required attributes are reqired' do
    symptom = Symptom.new
    assert_not symptom.valid?
  end

  test 'accepts date ended greater than date started' do
    symptom = Symptom.new(name: 'Coughing', date_started: Date.new(2014,9,18), date_ended: Date.new(2014,9,19))
    assert symptom.valid?
  end

  test 'reject date ended less than date started' do
    symptom = Symptom.new(name: 'Coughing', date_started: Date.new(2014,9,18), date_ended: Date.new(2014,9,17))
    assert_not symptom.valid?
  end

end
