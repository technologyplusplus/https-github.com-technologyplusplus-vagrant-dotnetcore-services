#!/usr/bin/env bash

##################
#	
# THIS CREATES A BASE INSTALL OF .NET CORE. 
# SOFTWARE: 
# - 
#
##################


#------------------
#	Register the trusted Microsoft signature key
#------------------
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg

sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-trusty-prod trusty main" > /etc/apt/sources.list.d/dotnetdev.list'

#------------------
# Register the Microsoft Product feed for your distro version
#------------------
sudo apt-get -y update
sudo apt-get -y install dotnet-sdk-2.0.0

#------------------
# Install SQL Server
#------------------
#sudo apt-get install mssql-server
#sudo MSSQL_PID=Developer ACCEPT_EULA=Y MSSQL_SA_PASSWORD='password' /opt/mssql/bin/mssql-conf -n setup
#sqlcmd -S localhost -U SA -Q 'select @@VERSION' 


#------------------
# Install Git, Curl
#------------------
sudo apt-get -y install Git
sudo apt-get -y install Curl
sudo apt-get -y install Firefox


echo "----- DISABLE FIREWALL -----"
sudo ufw disable
sudo ufw status
echo "----- NETSTAT -----"
sudo netstat -tnlp
sudo dotnet --version

#------------------
# Clone Git Repo
#------------------
echo "------ CLONE REPO ----- "
sudo git clone https://github.com/technologyplusplus/Gratitude_WebServices.git 

echo "------ CLONE CONPLETED  ----- "

cd Gratitude_WebServices
cd WebServices
#create new MVC app
#dotnet new mvc -o hwapp
#cd hwapp
# cat Program.cs
sudo dotnet run --server.urls=http://0.0.0.0:5000

echo "----- NETSTAT -----"
sudo netstat -tnlp





