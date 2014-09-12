module TrialProceedingHelper

  def self.compute_trial_proceeding_duration
    TrialProceeding.all.each do |trial_proceeding|
      trial_proceeding.compute_durations
    end
  end

end
