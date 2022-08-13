resource "helm_release" "toffie" {
  name  = var.appname
  chart = "../../helm/test-app/"
  values = [templatefile("${path.module}/tmplts/values.yaml.tpl", {
    commonlabel = var.appname
  })]
}

