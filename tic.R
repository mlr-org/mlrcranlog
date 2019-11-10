get_stage("install") %>%
  add_step(step_install_deps())

if (ci_on_travis()) {
  get_stage("deploy") %>%
    add_step(step_setup_ssh()) %>%
    add_step(step_setup_push_deploy(".", branch = "master", orphan = FALSE)) %>%
    add_code_step(rmarkdown::render("README.Rmd")) %>%
    add_step(step_push_deploy(commit_paths = c("README.md", "README_files/")))
}
