pipeline {
    agent { label 'k8s_kaniko_agent' }
    environment {
        IMAGE_PUSH_DESTINATION = 'reg.fungalgenomics.ca/psipred-4.02'
    }
    stages {
        stage('Build with Kaniko') {
            steps {
                container(name: 'kaniko', shell: '/busybox/sh') {
                    withEnv(['PATH+EXTRA=/busybox']) {
                        sh '''#!/busybox/sh
                        /kaniko/executor --context `pwd` --destination $IMAGE_PUSH_DESTINATION
                        '''
                    }
                }
            }
        }
    }
}