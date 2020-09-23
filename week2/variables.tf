locals {
  user_data = templatefile(
    "user_data.tmpl", {}
  )
}
