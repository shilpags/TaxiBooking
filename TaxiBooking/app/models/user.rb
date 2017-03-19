class User < ActiveRecord::Base
validates_uniqueness_of :name, :message => _('is in use.')

end
