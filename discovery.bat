whoami
query user /SERVER:%COMPUTERNAME%
ipconfig /all
systeminfo
net view /all /domain
net view /all
net group Domain Admins /domain
net user
wmic /NAMESPACE:\\root\SecurityCenter2 PATH AntiVirusProduct GET /value
