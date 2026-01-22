# Cycle 1 – Data Ingestion

assign(
  "cycle1_bound",
  list(
    enrolments = bind_rows(
      cyber.security.1_enrolments,
      cyber.security.2_enrolments,
      cyber.security.3_enrolments,
      cyber.security.4_enrolments,
      cyber.security.5_enrolments,
      cyber.security.6_enrolments,
      cyber.security.7_enrolments
    ),
    
    step_activity = bind_rows(
      cyber.security.1_step.activity,
      cyber.security.2_step.activity,
      cyber.security.3_step.activity,
      cyber.security.4_step.activity,
      cyber.security.5_step.activity,
      cyber.security.6_step.activity,
      cyber.security.7_step.activity
    )
  ),
  envir = globalenv()
)

cache("cycle1_bound")
