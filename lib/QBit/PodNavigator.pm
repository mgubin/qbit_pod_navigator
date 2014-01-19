package QBit::PodNavigator;

use qbit;

use base qw(QBit::WebInterface::OwnServer QBit::Application);

use QBit::Application::Model::Pod accessor => 'pod';

use QBit::WebInterface::Controller::Pod path => 'pod';

__PACKAGE__->config_opts(application_title => 'POD navigator');

sub default_cmd {pod => 'show'}

TRUE;
