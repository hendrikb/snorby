require 'dm-migrations/auto_migration'
require 'dm-migrations/adapters/dm-do-adapter'
require 'snorby/model'



# require '../model/types/numeric_ip_addr'
require '/var/www/snorby2/lib/snorby/model/types/numeric_ip_addr.rb'

module DataMapper
  module Migrations
    module MysqlAdapter
        include DataObjectsAdapter
#		include Snorby::Model::Types
        module ClassMethods
          # Default types for all data object based adapters.
          #
          # @return [Hash] default types for data objects adapters.
          #
          # @api private
          def type_map
            super.merge(
              Object   => { :primitive => 'MEDIUMTEXT'},
              DateTime => { :primitive => 'DATETIME'  },
              Time     => { :primitive => 'DATETIME'  },
			  ::Snorby::Model::Types::NumericIPAddr => { :primitive => 'VARBINARY(16)' },
            ).freeze
          end
      end      
    end
  end
end  
