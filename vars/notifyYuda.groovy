// vars/notifyYuda.groovy
def call(String status) {
    echo "Would send email for ${status} in job ${env.JOB_NAME} #${env.BUILD_NUMBER}"
    // Just return a map or string, don't call emailext here
    return [
        to: 'yuda691@gmail.com',
        subject: "Build ${status}: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
        body: """<p>Build <b>${status}</b>: <a href="${env.BUILD_URL}">${env.JOB_NAME} #${env.BUILD_NUMBER}</a></p>""",
        mimeType: 'text/html'
    ]
}
