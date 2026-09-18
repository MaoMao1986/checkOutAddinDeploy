$ErrorActionPreference = 'Stop'
$expectedThumbprint = '9ED715817BB5C0D1BDB0E5474C71E03EF872F14E'
$certificatePath = Join-Path $PSScriptRoot 'CheckOutAddIn.cer'

if (-not (Test-Path -LiteralPath $certificatePath)) {
    throw "Certificate file not found: $certificatePath"
}

$certificate = [Security.Cryptography.X509Certificates.X509Certificate2]::new($certificatePath)
if ($certificate.Thumbprint -ne $expectedThumbprint) {
    throw "Certificate thumbprint mismatch. Expected $expectedThumbprint, actual $($certificate.Thumbprint)."
}
if ($certificate.NotAfter -le (Get-Date)) {
    throw "Certificate expired at $($certificate.NotAfter)."
}

Import-Certificate -FilePath $certificatePath -CertStoreLocation Cert:\CurrentUser\Root | Out-Null
Import-Certificate -FilePath $certificatePath -CertStoreLocation Cert:\CurrentUser\TrustedPublisher | Out-Null

$trustedRoot = Get-ChildItem Cert:\CurrentUser\Root | Where-Object Thumbprint -eq $expectedThumbprint
$trustedPublisher = Get-ChildItem Cert:\CurrentUser\TrustedPublisher | Where-Object Thumbprint -eq $expectedThumbprint
if (-not $trustedRoot -or -not $trustedPublisher) {
    throw 'Certificate was not found in both required current-user trust stores after import.'
}

Write-Host "Trusted certificate: $expectedThumbprint"
