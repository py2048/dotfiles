#!/usr/bin/env bash
systemctl stop spoof-dpi.service
/usr/bin/warp-svc
systemctl start spoof-dpi.service

