$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "mazemap"

def file_fixture(name)
  File.join(File.dirname(__FILE__), "fixtures", "files", name)
end