class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: {
    safari: 14,
    chrome: 87,
    firefox: 80,
    ie: false
  }
end
