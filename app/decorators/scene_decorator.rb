# frozen_string_literal: true

module SceneDecorator
  def to_colon
    hours = seconds / 3600
    minutes = (seconds % 3600) / 60
    colon_seconds = seconds % 60

    "#{"%02d" %hours}:#{"%02d" %minutes}:#{"%02d" %colon_seconds}"
  end
end
