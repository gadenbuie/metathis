do_package_checks()

if (ci_on_travis()) {
  step_install_github("gadenbuie/pkgdown@meta-social-cards")
  do_pkgdown()
}
