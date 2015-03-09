#!/bin/bash
/usr/lib/naemon/plugins/check_smtp -H mail.example-server.ba -A LOGIN -U naemon@example-domain.ba -P PASSWORD | grep -q "SMTP OK"
exit $?
