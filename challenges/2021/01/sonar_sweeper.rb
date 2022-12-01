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

  def positive_measurement_count
    all_measurements.count { |m| m == :increase }
  end

  private

  def measure_change(index)
    previous_sample = sample(index-1)
    current_sample = sample(index)
    return nil if [current_sample, previous_sample].any?(&:nil?)

    return :no_change if current_sample.sum == previous_sample.sum
    current_sample.sum > previous_sample.sum ? :increase : :decrease
  end

  def sample(index)
    # with sample size 3: [can_sample, can_sample, can_sample, nil, nil]
    return nil if index < 0 || index > @input.length-@sample_size
    @input.slice(index, @sample_size)
  end

end
