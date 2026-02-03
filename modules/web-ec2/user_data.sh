#!/bin/bash
set -euxo pipefail
dnf -y update
dnf -y install nginx
systemctl enable --now nginx
cat >/usr/share/nginx/html/index.html <<'HTML'
<!doctype html>
<html lang="en">
<head><meta charset="utf-8"><title>Terraform Web Server</title></head>
<body style="font-family: system-ui, margin:40px;">
<h1>It Works!</h1>
<p>Provisioned with Terraform. Module web-ec2.</p>
</body>
</html>
HTML
