# frozen_string_literal: true

module SceneDecorator
  def to_colon
    hours = 0
    minutes = 0
    colon_seconds = seconds

    minutes = colon_seconds / 60
    if minutes >= 60
      hours = minutes / 60
      minutes = colon_seconds - hours * 3600
      colon_seconds = colon_seconds - hours * 3600 - minutes * 60
    elsif minutes > 0
      colon_seconds = colon_seconds - minutes * 60
    end

    "#{"%02d" %hours}:#{"%02d" %minutes}:#{"%02d" %colon_seconds}"
  end
end
