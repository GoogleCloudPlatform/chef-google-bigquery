# Copyright 2018 Google Inc.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
#
# ----------------------------------------------------------------------------
#
#     This file is automatically generated by Magic Modules and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------

require 'google/bigquery/property/array'
module Google
  module Bigquery
    module Data
      # A class to manage data for ColumnFamilies for table.
      class TableColumnFamilies
        include Comparable

        attr_reader :columns
        attr_reader :encoding
        attr_reader :family_id
        attr_reader :only_read_latest
        attr_reader :type

        def to_json(_arg = nil)
          {
            'columns' => columns,
            'encoding' => encoding,
            'familyId' => family_id,
            'onlyReadLatest' => only_read_latest,
            'type' => type
          }.reject { |_k, v| v.nil? }.to_json
        end

        def to_s
          {
            columns: ['[',
                      columns.map(&:to_json).join(', '),
                      ']'].join(' '),
            encoding: encoding.to_s,
            family_id: family_id.to_s,
            only_read_latest: only_read_latest.to_s,
            type: type.to_s
          }.map { |k, v| "#{k}: #{v}" }.join(', ')
        end

        def ==(other)
          return false unless other.is_a? TableColumnFamilies
          compare_fields(other).each do |compare|
            next if compare[:self].nil? || compare[:other].nil?
            return false if compare[:self] != compare[:other]
          end
          true
        end

        def <=>(other)
          return false unless other.is_a? TableColumnFamilies
          compare_fields(other).each do |compare|
            next if compare[:self].nil? || compare[:other].nil?
            result = compare[:self] <=> compare[:other]
            return result unless result.zero?
          end
          0
        end

        def inspect
          to_json
        end

        private

        def compare_fields(other)
          [
            { self: columns, other: other.columns },
            { self: encoding, other: other.encoding },
            { self: family_id, other: other.family_id },
            { self: only_read_latest, other: other.only_read_latest },
            { self: type, other: other.type }
          ]
        end
      end

      # Manages a TableColumnFamilies nested object
      # Data is coming from the GCP API
      class TableColumnFamiliesApi < TableColumnFamilies
        def initialize(args)
          @columns = Google::Bigquery::Property::TableColumnsArray.api_parse(args['columns'])
          @encoding = Google::Bigquery::Property::Enum.api_parse(args['encoding'])
          @family_id = Google::Bigquery::Property::String.api_parse(args['familyId'])
          @only_read_latest = Google::Bigquery::Property::Boolean.api_parse(args['onlyReadLatest'])
          @type = Google::Bigquery::Property::Enum.api_parse(args['type'])
        end
      end

      # Manages a TableColumnFamilies nested object
      # Data is coming from the Chef catalog
      class TableColumnFamiliesCatalog < TableColumnFamilies
        def initialize(args)
          @columns = Google::Bigquery::Property::TableColumnsArray.catalog_parse(args[:columns])
          @encoding = Google::Bigquery::Property::Enum.catalog_parse(args[:encoding])
          @family_id = Google::Bigquery::Property::String.catalog_parse(args[:family_id])
          @only_read_latest =
            Google::Bigquery::Property::Boolean.catalog_parse(args[:only_read_latest])
          @type = Google::Bigquery::Property::Enum.catalog_parse(args[:type])
        end
      end
    end

    module Property
      # A class to manage input to ColumnFamilies for table.
      class TableColumnFamilies
        def self.coerce
          ->(x) { ::Google::Bigquery::Property::TableColumnFamilies.catalog_parse(x) }
        end

        # Used for parsing Chef catalog
        def self.catalog_parse(value)
          return if value.nil?
          return value if value.is_a? Data::TableColumnFamilies
          Data::TableColumnFamiliesCatalog.new(value)
        end

        # Used for parsing GCP API responses
        def self.api_parse(value)
          return if value.nil?
          return value if value.is_a? Data::TableColumnFamilies
          Data::TableColumnFamiliesApi.new(value)
        end
      end

      # A Chef property that holds an integer
      class TableColumnFamiliesArray < Google::Bigquery::Property::Array
        def self.coerce
          ->(x) { ::Google::Bigquery::Property::TableColumnFamiliesArray.catalog_parse(x) }
        end

        # Used for parsing Chef catalog
        def self.catalog_parse(value)
          return if value.nil?
          return TableColumnFamilies.catalog_parse(value) \
            unless value.is_a?(::Array)
          value.map { |v| TableColumnFamilies.catalog_parse(v) }
        end

        # Used for parsing GCP API responses
        def self.api_parse(value)
          return if value.nil?
          return TableColumnFamilies.api_parse(value) \
            unless value.is_a?(::Array)
          value.map { |v| TableColumnFamilies.api_parse(v) }
        end
      end
    end
  end
end