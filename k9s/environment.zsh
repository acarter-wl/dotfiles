export K9S_CONFIG_DIR=~/.k9s

# k9s plugins
plugins=(
  helm
  kustomize
  kubectx
  kubeselect
  kube-ps1
  openshift
  stern
)


alias k9s-context="k9s --context"
alias k9s-plugins="ls -la ~/.k9s/plugins"
alias k9s-rm-plugins="rm -rf ~/.k9s/plugins/*"
alias k9s-up="k9s-rm-plugins && k9s-plugins && k9s"


