get_stage("install") %>%
  add_step(step_install_deps())

if (ci_on_travis()) {
  get_stage("deploy") %>%
    add_code_step(rmarkdown::render("README.Rmd")) %>%
    add_step(step_setup_ssh()) %>%
    add_step(step_setup_push_deploy()) %>%
    step_do_push_deploy(commit_paths = "README.md")
}
