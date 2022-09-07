pipeline{
    //  กำหนด ชื่อ,IP,.. ของ agent --> any : can run any agent
    agent any
    //
    environment{
    }
    stages{
        stage("unit test"){
            steps{
                sh "echo '🚨 Unit tests when build.'"
            }
        }
        stage("deployment"){
            steps{
                sh """
                       scp docker-compose.yml jirawat_rackz@devz-server:./topgun-server/docker-compose.yml
                       scp -r ./emqx_data jirawat_rackz@devz-server:./topgun-server
                       scp -r ./emqx_log jirawat_rackz@devz-server:./topgun-server
                       scp -r ./node_red_data jirawat_rackz@devz-server:./topgun-server
                       scp deploy-script.sh jirawat_rackz@devz-server:./topgun-server/deploy-script.sh
                       ssh -oStrictHostKeyChecking=no -t jirawat_rackz@devz-server \"
                           chmod +x ./topgun-server/deploy-script.sh
                           ./topgun-server/deploy-script.sh
                       \"
                    """
            }
        }
    }
}
