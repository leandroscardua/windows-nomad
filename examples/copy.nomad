job "copy" {
  datacenters = ["dc1"]
  type = "batch"
  constraint {
    attribute = "${attr.kernel.name}"
    value     = "windows"
  }
  task "copy" {
    driver = "raw_exec"
    config {
      command = "powershell.exe"
      args = [
          "-Command","copy-item",
          "-Path","${NOMAD_TASK_DIR}",
          "-Destination", "c:\\app",
          "-Recurse",
          ]
    }
    artifact {
      source = "https://github.com/leandroscardua/dotnetcoreapp/raw/main/aspnetapp.zip"
    }
  }
}
