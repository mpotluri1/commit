<powershell>
if ([Environment]::OSVersion.Version -ge (new-object 'Version' 6,1)) {
   New-NetFirewallRule -DisplayName "Allow WinRM" -Direction Inbound -Action Allow -Protocol TCP  -EdgeTraversalPolicy Allow -LocalPort 5985
} else {
    netsh advfirewall firewall add rule name="Allow WinRM" dir=in protocol=TCP localport=5985 action=allow remoteip=any localip=any profile=any
}
winrm set winrm/config/service/auth '@{Basic="true"}'
winrm set winrm/config/service '@{AllowUnencrypted="true"}'
$admin = [adsi]("WinNT://./Administrator, user")
$admin.psbase.invoke("SetPassword", "password@123")
</powershell>