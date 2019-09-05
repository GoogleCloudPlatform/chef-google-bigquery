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

module Google
  module Bigquery
    module Data
      # A class to manage data for CsvOptions for table.
      class TableCsvOptions
        include Comparable

        attr_reader :allow_jagged_rows
        attr_reader :allow_quoted_newlines
        attr_reader :encoding
        attr_reader :field_delimiter
        attr_reader :quote
        attr_reader :skip_leading_rows

        def to_json(_arg = nil)
          {
            'allowJaggedRows' => allow_jagged_rows,
            'allowQuotedNewlines' => allow_quoted_newlines,
            'encoding' => encoding,
            'fieldDelimiter' => field_delimiter,
            'quote' => quote,
            'skipLeadingRows' => skip_leading_rows
          }.reject { |_k, v| v.nil? }.to_json
        end

        def to_s
          {
            allow_jagged_rows: allow_jagged_rows.to_s,
            allow_quoted_newlines: allow_quoted_newlines.to_s,
            encoding: encoding.to_s,
            field_delimiter: field_delimiter.to_s,
            quote: quote.to_s,
            skip_leading_rows: skip_leading_rows.to_s
          }.map { |k, v| "#{k}: #{v}" }.join(', ')
        end

        def ==(other)
          return false unless other.is_a? TableCsvOptions
          compare_fields(other).each do |compare|
            next if compare[:self].nil? || compare[:other].nil?
            return false if compare[:self] != compare[:other]
          end
          true
        end

        def <=>(other)
          return false unless other.is_a? TableCsvOptions
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
            { self: allow_jagged_rows, other: other.allow_jagged_rows },
            { self: allow_quoted_newlines, other: other.allow_quoted_newlines },
            { self: encoding, other: other.encoding },
            { self: field_delimiter, other: other.field_delimiter },
            { self: quote, other: other.quote },
            { self: skip_leading_rows, other: other.skip_leading_rows }
          ]
        end
      end

      # Manages a TableCsvOptions nested object
      # Data is coming from the GCP API
      class TableCsvOptionsApi < TableCsvOptions
        def initialize(args)
          @allow_jagged_rows =
            Google::Bigquery::Property::Boolean.api_parse(args['allowJaggedRows'])
          @allow_quoted_newlines =
            Google::Bigquery::Property::Boolean.api_parse(args['allowQuotedNewlines'])
          @encoding = Google::Bigquery::Property::Enum.api_parse(args['encoding'])
          @field_delimiter = Google::Bigquery::Property::String.api_parse(args['fieldDelimiter'])
          @quote = Google::Bigquery::Property::String.api_parse(args['quote'])
          @skip_leading_rows =
            Google::Bigquery::Property::Integer.api_parse(args['skipLeadingRows'])
        end
      end

      # Manages a TableCsvOptions nested object
      # Data is coming from the Chef catalog
      class TableCsvOptionsCatalog < TableCsvOptions
        def initialize(args)
          @allow_jagged_rows =
            Google::Bigquery::Property::Boolean.catalog_parse(args[:allow_jagged_rows])
          @allow_quoted_newlines =
            Google::Bigquery::Property::Boolean.catalog_parse(args[:allow_quoted_newlines])
          @encoding = Google::Bigquery::Property::Enum.catalog_parse(args[:encoding])
          @field_delimiter =
            Google::Bigquery::Property::String.catalog_parse(args[:field_delimiter])
          @quote = Google::Bigquery::Property::String.catalog_parse(args[:quote])
          @skip_leading_rows =
            Google::Bigquery::Property::Integer.catalog_parse(args[:skip_leading_rows])
        end
      end
    end

    module Property
      # A class to manage input to CsvOptions for table.
      class TableCsvOptions
        def self.coerce
          ->(x) { ::Google::Bigquery::Property::TableCsvOptions.catalog_parse(x) }
        end

        # Used for parsing Chef catalog
        def self.catalog_parse(value)
          return if value.nil?
          return value if value.is_a? Data::TableCsvOptions
          Data::TableCsvOptionsCatalog.new(value)
        end

        # Used for parsing GCP API responses
        def self.api_parse(value)
          return if value.nil?
          return value if value.is_a? Data::TableCsvOptions
          Data::TableCsvOptionsApi.new(value)
        end
      end
    end
  end
end