require 'sinatra'
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))
require 'skelton/app'
run Skelton::App
