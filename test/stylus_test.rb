require File.expand_path('../test_helper', __FILE__)

class StylusTest < UnitTest
  class App < UnitTest::App
    register Sinatra::AssetPack

    assets do |a|
      a.css :a, '/css/a.css', [
        '/css/stylus.css'
      ]
    end
  end

  def app
    App
  end

  test "build" do
    Stylus.expects(:compile).returns("body{background:#f00;color:#00f;}")
    get '/css/stylus.css'
    assert body.gsub(/[ \t\r\n]/, '') == "body{background:#f00;color:#00f;}"
  end
end
