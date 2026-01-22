# Cycle 1 – Data Preparation
# Standardise enrolments, retain step activity, then merge


# ---- Enrolments: standardise country signal ----
enrolments_cycle1_clean <- cycle1_bound$enrolments %>%
  transmute(
    learner_id,
    country_final = if_else(
      is.na(country) | country == "Unknown",
      detected_country,
      country
    )
  ) %>%
  filter(!is.na(country_final)) %>%
  distinct(learner_id, .keep_all = TRUE)

# ---- Step activity: keep analysis-relevant fields ----
step_activity_cycle1_clean <- cycle1_bound$step_activity %>%
  select(
    learner_id,
    step_number,
    week_number,
    first_visited_at,
    last_completed_at
  )

# ---- Merge for Cycle 1 analysis ----
cycle1_prepared <- step_activity_cycle1_clean %>%
  left_join(enrolments_cycle1_clean, by = "learner_id")

cache("cycle1_prepared")
