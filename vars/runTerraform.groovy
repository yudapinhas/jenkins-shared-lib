// vars/runTerraform.groovy
def call(String action = 'plan') {
    sh "terraform init"
    sh "terraform ${action}"
}