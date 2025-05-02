// vars/getGitCommit.groovy
def call() {
    return sh(script: "git rev-parse HEAD", returnStdout: true).trim()
}