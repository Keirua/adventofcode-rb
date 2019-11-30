# Manage a solution's spec file for a given day
class PuzzleSpec
  def self.spec_source_directory(year)
    File.join('spec', "year#{year}")
  end

  def self.spec_source_path(year, day)
    day = Day.pad(day)
    File.join(spec_source_directory(year), "day#{day}_spec.rb")
  end

  def self.spec_source(year, day)
    day = Day.pad(day)

    <<~TPL
      require 'spec_helper'

      RSpec.describe Year#{year}::Day#{day} do
        day = Year#{year}::Day#{day}.new

        it "solves part1" do
          expect(day.part1('some_input')).to eq('expected_result')
        end

        it "solves part2" do
          expect(day.part2('some_input')).to eq(nil)
        end
      end
    TPL
  end
end
