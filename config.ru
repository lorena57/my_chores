require_relative "./config/env"

use Rack::MethodOverride
use SessionsController
use ChoresController
use GadgetsController
run ApplicationController

#run ApplicationController file starts the application (app/my_chores)