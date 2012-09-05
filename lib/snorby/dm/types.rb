require 'dm-migrations/auto_migration'
require 'dm-migrations/adapters/dm-do-adapter'
require 'snorby/model'

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
			  ::Snorby::Model::Types::NumericIPAddr => { :primitive => 'DECIMAL(39)' },
            ).freeze
          end
      end      
    end
  end
end  
