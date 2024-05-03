# frozen_string_literal: true

require 'test_helper'

class SceneDecoratorTest < ActiveSupport::TestCase
  def setup
    @scene = Scene.new.extend SceneDecorator
  end

  # test "the truth" do
  #   assert true
  # end
end
