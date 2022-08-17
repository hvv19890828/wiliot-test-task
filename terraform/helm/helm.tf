resource "helm_release" "wiliot-test-app" {
  name  = var.appname
  chart = "../../helm/test-app/"
  values = [templatefile("${path.module}/tmplts/values.yaml.tpl", {
    commonlabel = var.appname
    image = data.terraform_remote_state.wiliot-aws-remote-tfstate.outputs.wiliot-test-app-image
  })]
}

