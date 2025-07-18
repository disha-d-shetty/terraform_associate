########### Use only when variables cant be used(eg - functions) ###############
locals {
  tags_for_eip = {
    Time = formatdate("YYYY-MM-DD", timestamp())
  }
}