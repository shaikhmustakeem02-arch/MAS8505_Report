
# CRISP-DM Cycle 2 – Data Preparation (Combined)
# Purpose:
# 1. Create country-level disengagement metrics
# 2. Focus on high-enrolment countries
# 3. Segment countries by disengagement severity
# 4. Identify critical disengagement steps

# Country-level metrics
cycle2_country_metrics <- learner_outcomes %>%
  group_by(country_final) %>%
  summarise(
    learners = n(),
    avg_final_step = mean(final_step),
    early_dropout_rate = mean(final_step <= 2),
    .groups = "drop"
  )

# Focus on high-impact countries
cycle2_focus <- cycle2_country_metrics %>%
  filter(learners >= 100)

# Disengagement segmentation
cycle2_segmented <- cycle2_focus %>%
  mutate(
    disengagement_segment = case_when(
      early_dropout_rate >= quantile(early_dropout_rate, 0.66) ~ "Early-dropout",
      early_dropout_rate >= quantile(early_dropout_rate, 0.33) ~ "Mid-dropout",
      TRUE ~ "Late-dropout"
    )
  )

# Critical loss points
cycle2_loss_points <- learner_outcomes %>%
  filter(country_final %in% cycle2_segmented$country_final) %>%
  count(country_final, final_step) %>%
  group_by(country_final) %>%
  slice_max(n, n = 1) %>%
  ungroup()

# Cache all Cycle 2 munged outputs
cache("cycle2_segmented")
cache("cycle2_loss_points")
