#   Lab 3 - Powershell Data

get-ciminstance win32_networkadapterconfiguration |
Where-Object {($_.ipenabled -eq 'ccontains')} |
Format-Table Description, Index, IPAddress, IPSubnet, DNSDomain, DNSServerSearchOrder