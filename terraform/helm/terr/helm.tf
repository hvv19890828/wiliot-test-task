resource "helm_release" "toffie" {
  name  = var.appname
  chart = "../test-front/"
  values = [templatefile("${path.module}/tmplts/values.yaml.tpl", {
    commonlabel = var.appname
  })]
}

