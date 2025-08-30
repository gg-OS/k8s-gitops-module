resource "flux_bootstrap_git" "this" {
  path = "gitops/clusters/dev"

  components = [
    "source-controller",
    "kustomize-controller",
    "helm-controller",
    "notification-controller"
  ]
}