require 'singleton'
require 'rest-client'
require 'active_support/all'

require_relative 'lib/css_tree'
require_relative 'lib/dom_tree'
require_relative 'lib/network'
require_relative 'lib/render_tree'
require_relative 'lib/ui'

# The MessyBrowser.
class MessyBrowser
  include Singleton

  def run
    puts 'The MessyBrowser is running.'

    # Create a new application
    application = FXApp.new('MessyBrowser', 'Init')
    # Construct the main window
    ::Ui::BrowserWindow.new(application)
    # Create the windows
    application.create
    # Start event loop
    application.run
  end
end

MessyBrowser.instance.run
