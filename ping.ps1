$count = 20;

$dns = [ordered]@{
    home = "127.0.0.1";
    router = "192.168.12.1";
    cloudflare1 = "1.1.1.1"; 
    cloudflare2 = "1.0.0.1"; 
    google1 = "8.8.8.8"; 
    google2 = "8.8.4.4"; 
    quad91 = "9.9.9.9";
    quad92 = "149.112.112.112";
    opendns1 = "208.67.222.222";
    opendns2 = "208.67.220.220";
    comodo1 = "8.26.56.26";
    comodo2 = "8.20.247.20";
}

$dns

While ($True) {
    foreach ($key in $dns.Keys) {
        Write-Host "${key}: $($dns.Item($key))";
        Write-Output "$i" | Out-File ping$key.txt;
        Get-Date | Out-File -Append ping$key.txt;
        ping -D -c 20 $i -v $($dns.Item($key)) | Out-File -Append ping$key.txt;
    }
    Get-Date;
    git add .;
    git commit -m "add ping $i";
    git push origin --all;
}
