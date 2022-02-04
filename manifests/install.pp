# @summary Downloading, extracting, installing and ensuring Jenkins installation.

#installing jenkins
#wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
#echo deb https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list
#sudo apt-get update
#sudo apt-get install jenkins

#curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
#  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
#echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
#  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
#  /etc/apt/sources.list.d/jenkins.list > /dev/null
# sudo apt-get update
# sudo apt-get install jenkins

#starting jenkins
#sudo systemctl start jenkins
#sudo systemctl status jenkins

#opening the firwall
#sudo ufw allow 8080
#sudo ufw status


class jenkins::install {

  exec { 'download, extract':
    command     => wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add - echo deb https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list,
    cwd         => /etc/apt/sources.list.d/,
    creates     => /etc/apt/sources.list.d/jenkins.list,
    environment => production,
    user        => 'root',
  }

  exec { 'install':
    command     => sudo apt-get update, sudo apt-get install jenkins,
    cwd         => /etc/apt/sources.list.d/
    creates     => /etc/apt/sources.list.d/jenkins.list
    environment => production
    user        => 'root',
  }

  package{'jenkins':
    ensure   => 'running'
    command => 'sudo systemctl start jenkins'
  }
}
