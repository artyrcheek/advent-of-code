class SonarSweeper
  def initialize(input, sample_size: 1)
    @input = input.map(&:to_i)
    @sample_size = sample_size
  end

  def all_measurements
    (0..@input.length-1).map do |index|
      measure_change(index)
    end
  end

  def no_change_measurements
    all_measurements.select { |measurement| measurement == :no_change }
  end

  def positive_measurements
    all_measurements.select { |m| m == :increase }
  end

  def negative_measurements
    all_measurements.select { |m| m == :decrease }
  end

  private

  def measure_change(index)
    previous_sample = sample(index-1)
    current_sample = sample(index)

    return nil if current_sample.nil? || previous_sample.nil?
    return :no_change if current_sample.sum == previous_sample.sum
    current_sample.sum > previous_sample.sum ? :increase : :decrease
  end

  def sample(index)
    return nil if index < 0
    sample = @input.slice(index, @sample_size)
    return nil if sample.length != @sample_size
    sample
  end

end
