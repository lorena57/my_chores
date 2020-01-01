require_relative "./config/env"

use Rack::MethodOverride
use SessionsController
use ChoresController
use GadgetsController
run ApplicationController