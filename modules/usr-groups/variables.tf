variable "groups" {
  type = map(list(string))
  default = {
    developers = ["alice", "bob", "charlie"]
    operators  = ["dave", "eve"]
    managers   = ["freak"]
  }
}

