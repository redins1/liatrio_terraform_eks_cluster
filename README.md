# CONTENTS OF THIS FILE
---------------------

 * Introduction
 * Requirements
 * Installation
 * Configuration
 * Running
 * Maintainers


## INTRODUCTION
------------

The liatrio terraform eks cluster project allows for the push of the button 
configuration and deployment of a node.js application to an AWS EKS cluster 
provisioned via Terraform and Jenkins. It uses the Users personal AWS IAM 
credentials along with a custom built docker image stored on ECR in AWS to 
provision the infrastructure and application.  
Link to my Jenkins instance: http://3.231.42.49:8080/  


## REQUIREMENTS
------------
* A personal AWS account with an IAM User with required system administration 
access to create and administer an EKS cluster in AWS.  

* The custom docker image is already uploaded to ECR with name:  
 389566217404.dkr.ecr.us-east-1.amazonaws.com/liatrio_exercise:latest  
 (If this changes, please update the name in the manifest.yaml file)  

* In a personal development instance on centos install the required software 
for both your personal and jenkins user (once Jenkins is installed):  
### AWSCli   
* **Version:** 1.22.38  
* **Additional instructions:**  
&nbsp;&nbsp;&nbsp;&nbsp;Configure aws cli to authenticate using your personal IAM user to your AWS instance.  
&nbsp;&nbsp;&nbsp;&nbsp;(Don't forget to copy the .aws folder from your home dir to the jenkins home dir)  
### Jenkins  
* **Version:** 2.319.2  
* **Plug-ins:**  
&nbsp;&nbsp;&nbsp;&nbsp;Amazon ECR plugin (amazon-ecr): 1.7  
&nbsp;&nbsp;&nbsp;&nbsp;Amazon Web Services SDK :: EC2 (aws-java-sdk-ec2): 1.12.131-302.vbef9650c6521  
&nbsp;&nbsp;&nbsp;&nbsp;Amazon Web Services SDK :: ECR (aws-java-sdk-ecr): 1.12.131-302.vbef9650c6521  
&nbsp;&nbsp;&nbsp;&nbsp;Amazon Web Services SDK :: Minimal (aws-java-sdk-minimal): 1.12.131-302.vbef9650c6521  
&nbsp;&nbsp;&nbsp;&nbsp;Ant Plugin (ant): 1.13  
&nbsp;&nbsp;&nbsp;&nbsp;Apache HttpComponents Client 4.x API Plugin (apache-httpcomponents-client-4-api): 4.5.13-1.0  
&nbsp;&nbsp;&nbsp;&nbsp;Authentication Tokens API Plugin (authentication-tokens): 1.4  
&nbsp;&nbsp;&nbsp;&nbsp;Autofavorite for Blue Ocean (blueocean-autofavorite): 1.2.4  
&nbsp;&nbsp;&nbsp;&nbsp;Bitbucket Branch Source Plugin (cloudbees-bitbucket-branch-source): 751.vda_24678a_f781  
&nbsp;&nbsp;&nbsp;&nbsp;Bitbucket Pipeline for Blue Ocean (blueocean-bitbucket-pipeline): 1.25.2  
&nbsp;&nbsp;&nbsp;&nbsp;Blue Ocean (blueocean): 1.25.2  
&nbsp;&nbsp;&nbsp;&nbsp;Blue Ocean Core JS (blueocean-core-js): 1.25.2  
&nbsp;&nbsp;&nbsp;&nbsp;Blue Ocean Pipeline Editor (blueocean-pipeline-editor): 1.25.2  
&nbsp;&nbsp;&nbsp;&nbsp;Bootstrap 4 API Plugin (bootstrap4-api): 4.6.0-3  
&nbsp;&nbsp;&nbsp;&nbsp;Bootstrap 5 API Plugin (bootstrap5-api): 5.1.3-4  
&nbsp;&nbsp;&nbsp;&nbsp;Branch API Plugin (branch-api): 2.7.0  
&nbsp;&nbsp;&nbsp;&nbsp;Build Timeout (build-timeout): 1.20  
&nbsp;&nbsp;&nbsp;&nbsp;Caffeine API Plugin (caffeine-api): 2.9.2-29.v717aac953ff3  
&nbsp;&nbsp;&nbsp;&nbsp;Checks API plugin (checks-api): 1.7.2  
&nbsp;&nbsp;&nbsp;&nbsp;CloudBees AWS Credentials Plugin (aws-credentials): 1.33  
&nbsp;&nbsp;&nbsp;&nbsp;CloudBees Docker Build and Publish plugin (docker-build-publish): 1.3.3  
&nbsp;&nbsp;&nbsp;&nbsp;Command Agent Launcher Plugin (command-launcher): 1.6  
&nbsp;&nbsp;&nbsp;&nbsp;Common API for Blue Ocean (blueocean-commons): 1.25.2  
&nbsp;&nbsp;&nbsp;&nbsp;Config API for Blue Ocean (blueocean-config): 1.25.2  
&nbsp;&nbsp;&nbsp;&nbsp;Credentials Binding Plugin (credentials-binding): 1.27.1  
&nbsp;&nbsp;&nbsp;&nbsp;Credentials Plugin (credentials): 1074.v60e6c29b_b_44b_  
&nbsp;&nbsp;&nbsp;&nbsp;Dashboard for Blue Ocean (blueocean-dashboard): 1.25.2  
&nbsp;&nbsp;&nbsp;&nbsp;Design Language (jenkins-design-language): 1.25.2  
&nbsp;&nbsp;&nbsp;&nbsp;Display URL API (display-url-api): 2.3.5  
&nbsp;&nbsp;&nbsp;&nbsp;Display URL for Blue Ocean (blueocean-display-url): 2.4.1  
&nbsp;&nbsp;&nbsp;&nbsp;Docker API Plugin (docker-java-api): 3.1.5.2  
&nbsp;&nbsp;&nbsp;&nbsp;Docker Commons Plugin (docker-commons): 1.18  
&nbsp;&nbsp;&nbsp;&nbsp;Docker Pipeline (docker-workflow): 1.27  
&nbsp;&nbsp;&nbsp;&nbsp;Docker plugin (docker-plugin): 1.2.6  
&nbsp;&nbsp;&nbsp;&nbsp;Durable Task Plugin (durable-task): 493.v195aefbb0ff2  
&nbsp;&nbsp;&nbsp;&nbsp;ECharts API Plugin (echarts-api): 5.2.2-2  
&nbsp;&nbsp;&nbsp;&nbsp;Email Extension Plugin (email-ext): 2.86  
&nbsp;&nbsp;&nbsp;&nbsp;Events API for Blue Ocean (blueocean-events): 1.25.2  
&nbsp;&nbsp;&nbsp;&nbsp;Favorite (favorite): 2.3.3  
&nbsp;&nbsp;&nbsp;&nbsp;Folders Plugin (cloudbees-folder): 6.17  
&nbsp;&nbsp;&nbsp;&nbsp;Font Awesome API Plugin (font-awesome-api): 5.15.4-5  
&nbsp;&nbsp;&nbsp;&nbsp;GIT server Plugin (git-server): 1.10  
&nbsp;&nbsp;&nbsp;&nbsp;Git Pipeline for Blue Ocean (blueocean-git-pipeline): 1.25.2  
&nbsp;&nbsp;&nbsp;&nbsp;Git client plugin (git-client): 3.11.0  
&nbsp;&nbsp;&nbsp;&nbsp;Git plugin (git): 4.10.3  
&nbsp;&nbsp;&nbsp;&nbsp;GitHub API Plugin (github-api): 1.301-378.v9807bd746da5  
&nbsp;&nbsp;&nbsp;&nbsp;GitHub Branch Source Plugin (github-branch-source): 2.11.4  
&nbsp;&nbsp;&nbsp;&nbsp;GitHub Pipeline for Blue Ocean (blueocean-github-pipeline): 1.25.2  
&nbsp;&nbsp;&nbsp;&nbsp;GitHub plugin (github): 1.34.1  
&nbsp;&nbsp;&nbsp;&nbsp;Gradle Plugin (gradle): 1.38  
&nbsp;&nbsp;&nbsp;&nbsp;HTML Publisher plugin (htmlpublisher): 1.28  
&nbsp;&nbsp;&nbsp;&nbsp;Handy Uri Templates 2.x API Plugin (handy-uri-templates-2-api): 2.1.8-1.0  
&nbsp;&nbsp;&nbsp;&nbsp;JQuery3 API Plugin (jquery3-api): 3.6.0-2  
&nbsp;&nbsp;&nbsp;&nbsp;JSch dependency plugin (jsch): 0.1.55.2  
&nbsp;&nbsp;&nbsp;&nbsp;JUnit Plugin (junit): 1.53  
&nbsp;&nbsp;&nbsp;&nbsp;JWT for Blue Ocean (blueocean-jwt): 1.25.2  
&nbsp;&nbsp;&nbsp;&nbsp;Jackson 2 API Plugin (jackson2-api): 2.13.1-246.va8a9f3eaf46a  
&nbsp;&nbsp;&nbsp;&nbsp;Java JSON Web Token (JJWT) Plugin (jjwt-api): 0.11.2-9.c8b45b8bb173  
&nbsp;&nbsp;&nbsp;&nbsp;JavaBeans Activation Framework (JAF) API (javax-activation-api): 1.2.0-2  
&nbsp;&nbsp;&nbsp;&nbsp;JavaMail API (javax-mail-api): 1.6.2-5  
&nbsp;&nbsp;&nbsp;&nbsp;JavaScript GUI Lib: ACE Editor bundle plugin (ace-editor): 1.1  
&nbsp;&nbsp;&nbsp;&nbsp;JavaScript GUI Lib: Handlebars bundle plugin (handlebars): 3.0.8  
&nbsp;&nbsp;&nbsp;&nbsp;JavaScript GUI Lib: Moment.js bundle plugin (momentjs): 1.1.1  
&nbsp;&nbsp;&nbsp;&nbsp;Kubernetes CLI Plugin (kubernetes-cli): 1.10.3  
&nbsp;&nbsp;&nbsp;&nbsp;Kubernetes Client API Plugin (kubernetes-client-api): 5.11.2-182.v0f1cf4c5904e  
&nbsp;&nbsp;&nbsp;&nbsp;Kubernetes Credentials Plugin (kubernetes-credentials): 0.9.0  
&nbsp;&nbsp;&nbsp;&nbsp;Kubernetes plugin (kubernetes): 1.31.3  
&nbsp;&nbsp;&nbsp;&nbsp;LDAP Plugin (ldap): 2.7  
&nbsp;&nbsp;&nbsp;&nbsp;Lockable Resources plugin (lockable-resources): 2.13  
&nbsp;&nbsp;&nbsp;&nbsp;Mailer Plugin (mailer): 408.vd726a_1130320  
&nbsp;&nbsp;&nbsp;&nbsp;Matrix Authorization Strategy Plugin (matrix-auth): 3.0  
&nbsp;&nbsp;&nbsp;&nbsp;Matrix Project Plugin (matrix-project): 1.20  
&nbsp;&nbsp;&nbsp;&nbsp;Metrics Plugin (metrics): 4.0.2.8.1  
&nbsp;&nbsp;&nbsp;&nbsp;OWASP Markup Formatter Plugin (antisamy-markup-formatter): 2.7  
&nbsp;&nbsp;&nbsp;&nbsp;OkHttp Plugin (okhttp-api): 4.9.3-105.vb96869f8ac3a  
&nbsp;&nbsp;&nbsp;&nbsp;Oracle Java SE Development Kit Installer Plugin (jdk-tool): 1.5  
&nbsp;&nbsp;&nbsp;&nbsp;PAM Authentication plugin (pam-auth): 1.6.1  
&nbsp;&nbsp;&nbsp;&nbsp;Personalization for Blue Ocean (blueocean-personalization): 1.25.2  
&nbsp;&nbsp;&nbsp;&nbsp;Pipeline (workflow-aggregator): 2.6  
&nbsp;&nbsp;&nbsp;&nbsp;Pipeline Graph Analysis Plugin (pipeline-graph-analysis): 188.v3a01e7973f2c  
&nbsp;&nbsp;&nbsp;&nbsp;Pipeline SCM API for Blue Ocean (blueocean-pipeline-scm-api): 1.25.2  
&nbsp;&nbsp;&nbsp;&nbsp;Pipeline implementation for Blue Ocean (blueocean-pipeline-api-impl): 1.25.2  
&nbsp;&nbsp;&nbsp;&nbsp;Pipeline: API (workflow-api): 1122.v7a_916f363c86  
&nbsp;&nbsp;&nbsp;&nbsp;Pipeline: Basic Steps (workflow-basic-steps): 2.24  
&nbsp;&nbsp;&nbsp;&nbsp;Pipeline: Build Step (pipeline-build-step): 2.15  
&nbsp;&nbsp;&nbsp;&nbsp;Pipeline: Declarative (pipeline-model-definition): 1.9.3  
&nbsp;&nbsp;&nbsp;&nbsp;Pipeline: Declarative Extension Points API (pipeline-model-extensions): 1.9.3  
&nbsp;&nbsp;&nbsp;&nbsp;Pipeline: GitHub Groovy Libraries (pipeline-github-lib): 1.0  
&nbsp;&nbsp;&nbsp;&nbsp;Pipeline: Groovy (workflow-cps): 2648.va9433432b33c  
&nbsp;&nbsp;&nbsp;&nbsp;Pipeline: Input Step (pipeline-input-step): 427.va6441fa17010  
&nbsp;&nbsp;&nbsp;&nbsp;Pipeline: Job (workflow-job): 1145.v7f2433caa07f  
&nbsp;&nbsp;&nbsp;&nbsp;Pipeline: Milestone Step (pipeline-milestone-step): 1.3.2  
&nbsp;&nbsp;&nbsp;&nbsp;Pipeline: Model API (pipeline-model-api): 1.9.3  
&nbsp;&nbsp;&nbsp;&nbsp;Pipeline: Multibranch (workflow-multibranch): 706.vd43c65dec013  
&nbsp;&nbsp;&nbsp;&nbsp;Pipeline: Nodes and Processes (workflow-durable-task-step): 1121.va_65b_d2701486  
&nbsp;&nbsp;&nbsp;&nbsp;Pipeline: REST API Plugin (pipeline-rest-api): 2.20  
&nbsp;&nbsp;&nbsp;&nbsp;Pipeline: SCM Step (workflow-scm-step): 2.13  
&nbsp;&nbsp;&nbsp;&nbsp;Pipeline: Shared Groovy Libraries (workflow-cps-global-lib): 552.vd9cc05b8a2e1  
&nbsp;&nbsp;&nbsp;&nbsp;Pipeline: Stage Step (pipeline-stage-step): 291.vf0a8a7aeeb50  
&nbsp;&nbsp;&nbsp;&nbsp;Pipeline: Stage Tags Metadata (pipeline-stage-tags-metadata): 1.9.3  
&nbsp;&nbsp;&nbsp;&nbsp;Pipeline: Stage View Plugin (pipeline-stage-view): 2.20  
&nbsp;&nbsp;&nbsp;&nbsp;Pipeline: Step API (workflow-step-api): 622.vb_8e7c15b_c95a_  
&nbsp;&nbsp;&nbsp;&nbsp;Pipeline: Supporting APIs (workflow-support): 813.vb_d7c3d2984a_0  
&nbsp;&nbsp;&nbsp;&nbsp;Plain Credentials Plugin (plain-credentials): 1.7  
&nbsp;&nbsp;&nbsp;&nbsp;Plugin Utilities API Plugin (plugin-util-api): 2.12.0  
&nbsp;&nbsp;&nbsp;&nbsp;Popper.js 2 API Plugin (popper2-api): 2.11.2-1  
&nbsp;&nbsp;&nbsp;&nbsp;Popper.js API Plugin (popper-api): 1.16.1-2  
&nbsp;&nbsp;&nbsp;&nbsp;Pub-Sub "light" Bus (pubsub-light): 1.16  
&nbsp;&nbsp;&nbsp;&nbsp;REST API for Blue Ocean (blueocean-rest): 1.25.2  
&nbsp;&nbsp;&nbsp;&nbsp;REST Implementation for Blue Ocean (blueocean-rest-impl): 1.25.2  
&nbsp;&nbsp;&nbsp;&nbsp;Resource Disposer Plugin (resource-disposer): 0.17  
&nbsp;&nbsp;&nbsp;&nbsp;SCM API Plugin (scm-api): 595.vd5a_df5eb_0e39  
&nbsp;&nbsp;&nbsp;&nbsp;SSH Build Agents plugin (ssh-slaves): 1.33.0  
&nbsp;&nbsp;&nbsp;&nbsp;SSH Credentials Plugin (ssh-credentials): 1.19  
&nbsp;&nbsp;&nbsp;&nbsp;SSH server (sshd): 3.1.0  
&nbsp;&nbsp;&nbsp;&nbsp;Script Security Plugin (script-security): 1131.v8b_b_5eda_c328e  
&nbsp;&nbsp;&nbsp;&nbsp;Server Sent Events (SSE) Gateway Plugin (sse-gateway): 1.24  
&nbsp;&nbsp;&nbsp;&nbsp;Snakeyaml API Plugin (snakeyaml-api): 1.29.1  
&nbsp;&nbsp;&nbsp;&nbsp;Structs Plugin (structs): 308.v852b473a2b8c  
&nbsp;&nbsp;&nbsp;&nbsp;Terraform Plugin (terraform): 1.0.10  
&nbsp;&nbsp;&nbsp;&nbsp;Timestamper (timestamper): 1.16  
&nbsp;&nbsp;&nbsp;&nbsp;Token Macro Plugin (token-macro): 267.vcdaea6462991  
&nbsp;&nbsp;&nbsp;&nbsp;Trilead API Plugin (trilead-api): 1.0.13  
&nbsp;&nbsp;&nbsp;&nbsp;Variant Plugin (variant): 1.4  
&nbsp;&nbsp;&nbsp;&nbsp;Web for Blue Ocean (blueocean-web): 1.25.2  
&nbsp;&nbsp;&nbsp;&nbsp;Workspace Cleanup Plugin (ws-cleanup): 0.40  
&nbsp;&nbsp;&nbsp;&nbsp;bouncycastle API Plugin (bouncycastle-api): 2.25  
&nbsp;&nbsp;&nbsp;&nbsp;docker-build-step (docker-build-step): 2.8  
&nbsp;&nbsp;&nbsp;&nbsp;i18n for Blue Ocean (blueocean-i18n): 1.25.2  
### kubectl  
* **Version:** 1.23.1  
* **Additional instructions:**  
&nbsp;&nbsp;&nbsp;&nbsp;Create kubectl secret docker-registry named regcred to authenticate using
    your personal IAM user to your AWS instance to be able to download the docker image.  
&nbsp;&nbsp;&nbsp;&nbsp;(Don't forget to copy the .kube folder from your home dir to the jenkins home dir)
### Terraform  
* **Version:** 1.1.4


## INSTALLATION
------------

Create a Jenkins pipeline to read the Jenkinsfile from the github repo on the correct branch.
Also, check the "Do not allow concurrent builds" and "GitHub project" checkboxes.  
Fill in the required info for the "GitHub project" check box.


## CONFIGURATION
-------------

Configurable parameter:
 * Choice parameter in Jenkins to either Create or destroy the application.  

## RUNNING
-------
Click on the newly created Jenkins job, click "Build now" or "Build with parameters"  

## MAINTAINERS
-----------

 * Philip Snider (https://github.com/redins1)
