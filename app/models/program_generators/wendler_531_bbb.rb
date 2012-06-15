class Wendler531BBB
  WEEK_1_1 = 0.65
  WEEK_1_2 = 0.75
  WEEK_1_3 = 0.85

  WEEK_2_1 = 0.70
  WEEK_2_2 = 0.80
  WEEK_2_3 = 0.90

  WEEK_3_1 = 0.75
  WEEK_3_2 = 0.85
  WEEK_3_3 = 0.95

  WEEK_4 = 0.3

  MAX_TRAINING_FACTOR = 0.90

  def description
    "5/3/1: The Simplest and Most Effective Training System for Raw Strength"
  end

  def origin_link
    "http://www.amazon.com/Simplest-Effective-Training-Strength-Edition/dp/B00686OYGQ"
  end

  def generate(deadlift, squat, bench, ohp)
    mesocycle = Hash.new 

    mesocycle[:one] = build_one(deadlift, squat, bench, ohp)
    mesocycle[:two] = build_two(deadlift, squat, bench, ohp)
    mesocycle[:three] = build_three(deadlift, squat, bench, ohp)
    mesocycle[:four] = build_four(deadlift, squat, bench, ohp)

    return mesocycle
  end

  def build_one(deadlift, squat, bench, ohp)
    cycle = Hash.new

    ohp_workout = []
    ohp_workout << LiftSet.new(:ohp, (ohp * MAX_TRAINING_FACTOR) * WEEK_1_1, "5")
    ohp_workout << LiftSet.new(:ohp, (ohp * MAX_TRAINING_FACTOR) * WEEK_1_2, "5")
    ohp_workout << LiftSet.new(:ohp, (ohp * MAX_TRAINING_FACTOR) * WEEK_1_3, "5+")
    5.times do
      ohp_workout << LiftSet.new(:chinup, 0, "10")
    end

    cycle[:ohp] = ohp_workout

    squat_workout = []
    squat_workout << LiftSet.new(:squat, (squat * MAX_TRAINING_FACTOR) * WEEK_1_1, "5")
    squat_workout << LiftSet.new(:squat, (squat * MAX_TRAINING_FACTOR) * WEEK_1_2, "5")
    squat_workout << LiftSet.new(:squat, (squat * MAX_TRAINING_FACTOR) * WEEK_1_3, "5+")
    5.times do
      squat_workout << LiftSet.new(:leg_curl, 0, "10")
    end

    cycle[:squat] = squat_workout

    bench_workout = []
    bench_workout << LiftSet.new(:bench, (bench * MAX_TRAINING_FACTOR) * WEEK_1_1, "5")
    bench_workout << LiftSet.new(:bench, (bench * MAX_TRAINING_FACTOR) * WEEK_1_2, "5")
    bench_workout << LiftSet.new(:bench, (bench * MAX_TRAINING_FACTOR) * WEEK_1_3, "5+")
    5.times do
      bench_workout << LiftSet.new(:dumbbell_row, 0, "10")
    end

    cycle[:bench] = bench_workout

    deadlift_workout = []
    deadlift_workout << LiftSet.new(:deadlift, (deadlift * MAX_TRAINING_FACTOR) * WEEK_1_1, "5")
    deadlift_workout << LiftSet.new(:deadlift, (deadlift * MAX_TRAINING_FACTOR) * WEEK_1_2, "5")
    deadlift_workout << LiftSet.new(:deadlift, (deadlift * MAX_TRAINING_FACTOR) * WEEK_1_3, "5+")
    5.times do
      deadlift_workout << LiftSet.new(:leg_raises, 0, "10")
    end

    cycle[:deadlift] = deadlift_workout

    return cycle


  end

  def build_two(deadlift, squat, bench, ohp)
    cycle = Hash.new

    ohp_workout = []
    ohp_workout << LiftSet.new(:ohp, (ohp * MAX_TRAINING_FACTOR) * WEEK_2_1, "3")
    ohp_workout << LiftSet.new(:ohp, (ohp * MAX_TRAINING_FACTOR) * WEEK_2_2, "3")
    ohp_workout << LiftSet.new(:ohp, (ohp * MAX_TRAINING_FACTOR) * WEEK_2_3, "3+")
    5.times do
      ohp_workout << LiftSet.new(:chinup, 0, "10")
    end

    cycle[:ohp] = ohp_workout

    squat_workout = []
    squat_workout << LiftSet.new(:squat, (squat * MAX_TRAINING_FACTOR) * WEEK_2_1, "3")
    squat_workout << LiftSet.new(:squat, (squat * MAX_TRAINING_FACTOR) * WEEK_2_2, "3")
    squat_workout << LiftSet.new(:squat, (squat * MAX_TRAINING_FACTOR) * WEEK_2_3, "3+")
    5.times do
      squat_workout << LiftSet.new(:leg_curl, 0, "10")
    end

    cycle[:squat] = squat_workout

    bench_workout = []
    bench_workout << LiftSet.new(:bench, (bench * MAX_TRAINING_FACTOR) * WEEK_2_1, "3")
    bench_workout << LiftSet.new(:bench, (bench * MAX_TRAINING_FACTOR) * WEEK_2_2, "3")
    bench_workout << LiftSet.new(:bench, (bench * MAX_TRAINING_FACTOR) * WEEK_2_3, "3+")
    5.times do
      bench_workout << LiftSet.new(:dumbbell_row, 0, "10")
    end

    cycle[:bench] = bench_workout

    deadlift_workout = []
    deadlift_workout << LiftSet.new(:deadlift, (deadlift * MAX_TRAINING_FACTOR) * WEEK_2_1, "3")
    deadlift_workout << LiftSet.new(:deadlift, (deadlift * MAX_TRAINING_FACTOR) * WEEK_2_2, "3")
    deadlift_workout << LiftSet.new(:deadlift, (deadlift * MAX_TRAINING_FACTOR) * WEEK_2_3, "3+")
    5.times do
      deadlift_workout << LiftSet.new(:leg_raises, 0, "10")
    end

    cycle[:deadlift] = deadlift_workout

    return cycle
  end

  def build_three(deadlift, squat, bench, ohp)
    cycle = Hash.new

    ohp_workout = []
    ohp_workout << LiftSet.new(:ohp, (ohp * MAX_TRAINING_FACTOR) * WEEK_3_1, "5")
    ohp_workout << LiftSet.new(:ohp, (ohp * MAX_TRAINING_FACTOR) * WEEK_3_2, "3")
    ohp_workout << LiftSet.new(:ohp, (ohp * MAX_TRAINING_FACTOR) * WEEK_3_3, "1+")
    5.times do
      ohp_workout << LiftSet.new(:chinup, 0, "10")
    end

    cycle[:ohp] = ohp_workout

    squat_workout = []
    squat_workout << LiftSet.new(:squat, (squat * MAX_TRAINING_FACTOR) * WEEK_3_1, "5")
    squat_workout << LiftSet.new(:squat, (squat * MAX_TRAINING_FACTOR) * WEEK_3_2, "3")
    squat_workout << LiftSet.new(:squat, (squat * MAX_TRAINING_FACTOR) * WEEK_3_3, "1+")
    5.times do
      squat_workout << LiftSet.new(:leg_curl, 0, "10")
    end

    cycle[:squat] = squat_workout

    bench_workout = []
    bench_workout << LiftSet.new(:bench, (bench * MAX_TRAINING_FACTOR) * WEEK_3_1, "5")
    bench_workout << LiftSet.new(:bench, (bench * MAX_TRAINING_FACTOR) * WEEK_3_2, "3")
    bench_workout << LiftSet.new(:bench, (bench * MAX_TRAINING_FACTOR) * WEEK_3_3, "1+")
    5.times do
      bench_workout << LiftSet.new(:dumbbell_row, 0, "10")
    end

    cycle[:bench] = bench_workout

    deadlift_workout = []
    deadlift_workout << LiftSet.new(:deadlift, (deadlift * MAX_TRAINING_FACTOR) * WEEK_3_1, "5")
    deadlift_workout << LiftSet.new(:deadlift, (deadlift * MAX_TRAINING_FACTOR) * WEEK_3_2, "3")
    deadlift_workout << LiftSet.new(:deadlift, (deadlift * MAX_TRAINING_FACTOR) * WEEK_3_3, "1+")
    5.times do
      deadlift_workout << LiftSet.new(:leg_raises, 0, "10")
    end

    cycle[:deadlift] = deadlift_workout

    return cycle
  end

  def build_four(deadlift, squat, bench, ohp)
    cycle = Hash.new

    ohp_workout = []
    5.times do
      ohp_workout << LiftSet.new(:ohp, (ohp * MAX_TRAINING_FACTOR) * WEEK_4, "10")
    end
    5.times do
      ohp_workout << LiftSet.new(:chinup, 0, "10")
    end

    cycle[:ohp] = ohp_workout

    squat_workout = []
    5.times do
      squat_workout << LiftSet.new(:squat, (squat * MAX_TRAINING_FACTOR) * WEEK_4, "10")
    end
    5.times do
      squat_workout << LiftSet.new(:leg_curl, 0, "10")
    end

    cycle[:squat] = squat_workout

    bench_workout = []
    5.times do
      bench_workout << LiftSet.new(:bench, (bench * MAX_TRAINING_FACTOR) * WEEK_4, "10")
    end
    5.times do
      bench_workout << LiftSet.new(:dumbbell_row, 0, "10")
    end

    cycle[:bench] = bench_workout

    deadlift_workout = []
    5.times do
      deadlift_workout << LiftSet.new(:deadlift, (deadlift * MAX_TRAINING_FACTOR) * WEEK_4, "10")
    end
    5.times do
      deadlift_workout << LiftSet.new(:leg_raises, 0, "10")
    end

    cycle[:deadlift] = deadlift_workout

    return cycle
  end

end