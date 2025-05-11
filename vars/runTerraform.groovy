// vars/runTerraform.groovy
def call(String action = 'plan') {
    sh """
      terraform init
      terraform ${action} -var-file=dev.tfvars
    """
}
