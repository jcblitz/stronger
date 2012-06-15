class Wendler531BodyBuilder
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

  OHP_LIFT = Exercise.new("Standing Military Press", :ohp)
  BENCH_LIFT = Exercise.new("Bench Press", :bench)
  SQUAT_LIFT = Exercise.new("Squat", :squat)
  DEADLIFT_LIFT = Exercise.new("Deadlift", :deadlift)
  CHINUP_LIFT = Exercise.new("Chinup", :chinup)
  HANGING_LEG_LIFT = Exercise.new("Hanging Leg Raises", :leg_raises)
  DUMBBELL_ROW_LIFT = Exercise.new("Dumbbell Row", :dumbbell_row)
  LEG_CURL_LIFT = Exercise.new("Leg Curl", :leg_curl)

  MAX_TRAINING_FACTOR = 0.90

  def description
    "5/3/1: The Simplest and Most Effective Training System for Raw Strength"
  end

  def origin_link
    "http://www.mensfitness.com/training/build-muscle/531-variations?page=2"
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
    ohp_workout << LiftSet.new(OHP_LIFT, (ohp * MAX_TRAINING_FACTOR) * WEEK_1_1, "5")
    ohp_workout << LiftSet.new(OHP_LIFT, (ohp * MAX_TRAINING_FACTOR) * WEEK_1_2, "5")
    ohp_workout << LiftSet.new(OHP_LIFT, (ohp * MAX_TRAINING_FACTOR) * WEEK_1_3, "5+")
    5.times do
      ohp_workout << LiftSet.new(CHINUP_LIFT, 0, "10")
    end

    cycle[:ohp] = ohp_workout

    squat_workout = []
    squat_workout << LiftSet.new(SQUAT_LIFT, (squat * MAX_TRAINING_FACTOR) * WEEK_1_1, "5")
    squat_workout << LiftSet.new(SQUAT_LIFT, (squat * MAX_TRAINING_FACTOR) * WEEK_1_2, "5")
    squat_workout << LiftSet.new(SQUAT_LIFT, (squat * MAX_TRAINING_FACTOR) * WEEK_1_3, "5+")
    5.times do
      squat_workout << LiftSet.new(LEG_CURL_LIFT, 0, "10")
    end

    cycle[:squat] = squat_workout

    bench_workout = []
    bench_workout << LiftSet.new(BENCH_LIFT, (bench * MAX_TRAINING_FACTOR) * WEEK_1_1, "5")
    bench_workout << LiftSet.new(BENCH_LIFT, (bench * MAX_TRAINING_FACTOR) * WEEK_1_2, "5")
    bench_workout << LiftSet.new(BENCH_LIFT, (bench * MAX_TRAINING_FACTOR) * WEEK_1_3, "5+")
    5.times do
      bench_workout << LiftSet.new(DUMBBELL_ROW_LIFT, 0, "10")
    end

    cycle[:bench] = bench_workout

    deadlift_workout = []
    deadlift_workout << LiftSet.new(DEADLIFT_LIFT, (deadlift * MAX_TRAINING_FACTOR) * WEEK_1_1, "5")
    deadlift_workout << LiftSet.new(DEADLIFT_LIFT, (deadlift * MAX_TRAINING_FACTOR) * WEEK_1_2, "5")
    deadlift_workout << LiftSet.new(DEADLIFT_LIFT, (deadlift * MAX_TRAINING_FACTOR) * WEEK_1_3, "5+")
    5.times do
      deadlift_workout << LiftSet.new(LEG_CURL_LIFT, 0, "10")
    end

    cycle[:deadlift] = deadlift_workout

    return cycle


  end

  def build_two(deadlift, squat, bench, ohp)
    cycle = Hash.new

    ohp_workout = []
    ohp_workout << LiftSet.new(OHP_LIFT, (ohp * MAX_TRAINING_FACTOR) * WEEK_2_1, "3")
    ohp_workout << LiftSet.new(OHP_LIFT, (ohp * MAX_TRAINING_FACTOR) * WEEK_2_2, "3")
    ohp_workout << LiftSet.new(OHP_LIFT, (ohp * MAX_TRAINING_FACTOR) * WEEK_2_3, "3+")
    5.times do
      ohp_workout << LiftSet.new(CHINUP_LIFT, 0, "10")
    end

    cycle[:ohp] = ohp_workout

    squat_workout = []
    squat_workout << LiftSet.new(SQUAT_LIFT, (squat * MAX_TRAINING_FACTOR) * WEEK_2_1, "3")
    squat_workout << LiftSet.new(SQUAT_LIFT, (squat * MAX_TRAINING_FACTOR) * WEEK_2_2, "3")
    squat_workout << LiftSet.new(SQUAT_LIFT, (squat * MAX_TRAINING_FACTOR) * WEEK_2_3, "3+")
    5.times do
      squat_workout << LiftSet.new(LEG_CURL_LIFT, 0, "10")
    end

    cycle[:squat] = squat_workout

    bench_workout = []
    bench_workout << LiftSet.new(BENCH_LIFT, (bench * MAX_TRAINING_FACTOR) * WEEK_2_1, "3")
    bench_workout << LiftSet.new(BENCH_LIFT, (bench * MAX_TRAINING_FACTOR) * WEEK_2_2, "3")
    bench_workout << LiftSet.new(BENCH_LIFT, (bench * MAX_TRAINING_FACTOR) * WEEK_2_3, "3+")
    5.times do
      bench_workout << LiftSet.new(DUMBBELL_ROW_LIFT, 0, "10")
    end

    cycle[:bench] = bench_workout

    deadlift_workout = []
    deadlift_workout << LiftSet.new(DEADLIFT_LIFT, (deadlift * MAX_TRAINING_FACTOR) * WEEK_2_1, "3")
    deadlift_workout << LiftSet.new(DEADLIFT_LIFT, (deadlift * MAX_TRAINING_FACTOR) * WEEK_2_2, "3")
    deadlift_workout << LiftSet.new(DEADLIFT_LIFT, (deadlift * MAX_TRAINING_FACTOR) * WEEK_2_3, "3+")
    5.times do
      deadlift_workout << LiftSet.new(HANGING_LEG_LIFT, 0, "10")
    end

    cycle[:deadlift] = deadlift_workout

    return cycle
  end

  def build_three(deadlift, squat, bench, ohp)
    cycle = Hash.new

    ohp_workout = []
    ohp_workout << LiftSet.new(OHP_LIFT, (ohp * MAX_TRAINING_FACTOR) * WEEK_3_1, "5")
    ohp_workout << LiftSet.new(OHP_LIFT, (ohp * MAX_TRAINING_FACTOR) * WEEK_3_2, "3")
    ohp_workout << LiftSet.new(OHP_LIFT, (ohp * MAX_TRAINING_FACTOR) * WEEK_3_3, "1+")
    5.times do
      ohp_workout << LiftSet.new(CHINUP_LIFT, 0, "10")
    end

    cycle[:ohp] = ohp_workout

    squat_workout = []
    squat_workout << LiftSet.new(SQUAT_LIFT, (squat * MAX_TRAINING_FACTOR) * WEEK_3_1, "5")
    squat_workout << LiftSet.new(SQUAT_LIFT, (squat * MAX_TRAINING_FACTOR) * WEEK_3_2, "3")
    squat_workout << LiftSet.new(SQUAT_LIFT, (squat * MAX_TRAINING_FACTOR) * WEEK_3_3, "1+")
    5.times do
      squat_workout << LiftSet.new(LEG_CURL_LIFT, 0, "10")
    end

    cycle[:squat] = squat_workout

    bench_workout = []
    bench_workout << LiftSet.new(BENCH_LIFT, (bench * MAX_TRAINING_FACTOR) * WEEK_3_1, "5")
    bench_workout << LiftSet.new(BENCH_LIFT, (bench * MAX_TRAINING_FACTOR) * WEEK_3_2, "3")
    bench_workout << LiftSet.new(BENCH_LIFT, (bench * MAX_TRAINING_FACTOR) * WEEK_3_3, "1+")
    5.times do
      bench_workout << LiftSet.new(DUMBBELL_ROW_LIFT, 0, "10")
    end

    cycle[:bench] = bench_workout

    deadlift_workout = []
    deadlift_workout << LiftSet.new(DEADLIFT_LIFT, (deadlift * MAX_TRAINING_FACTOR) * WEEK_3_1, "5")
    deadlift_workout << LiftSet.new(DEADLIFT_LIFT, (deadlift * MAX_TRAINING_FACTOR) * WEEK_3_2, "3")
    deadlift_workout << LiftSet.new(DEADLIFT_LIFT, (deadlift * MAX_TRAINING_FACTOR) * WEEK_3_3, "1+")
    5.times do
      deadlift_workout << LiftSet.new(HANGING_LEG_LIFT, 0, "10")
    end

    cycle[:deadlift] = deadlift_workout

    return cycle
  end

  def build_four(deadlift, squat, bench, ohp)
    cycle = Hash.new

    ohp_workout = []
    5.times do
      ohp_workout << LiftSet.new(OHP_LIFT, (ohp * MAX_TRAINING_FACTOR) * WEEK_4, "10")
    end
    5.times do
      ohp_workout << LiftSet.new(CHINUP_LIFT, 0, "10")
    end

    cycle[:ohp] = ohp_workout

    squat_workout = []
    5.times do
      squat_workout << LiftSet.new(SQUAT_LIFT, (squat * MAX_TRAINING_FACTOR) * WEEK_4, "10")
    end
    5.times do
      squat_workout << LiftSet.new(LEG_CURL_LIFT, 0, "10")
    end

    cycle[:squat] = squat_workout

    bench_workout = []
    5.times do
      bench_workout << LiftSet.new(BENCH_LIFT, (bench * MAX_TRAINING_FACTOR) * WEEK_4, "10")
    end
    5.times do
      bench_workout << LiftSet.new(DUMBBELL_ROW_LIFT, 0, "10")
    end

    cycle[:bench] = bench_workout

    deadlift_workout = []
    5.times do
      deadlift_workout << LiftSet.new(DEADLIFT_LIFT, (deadlift * MAX_TRAINING_FACTOR) * WEEK_4, "10")
    end
    5.times do
      deadlift_workout << LiftSet.new(HANGING_LEG_LIFT, 0, "10")
    end

    cycle[:deadlift] = deadlift_workout

    return cycle
  end

end