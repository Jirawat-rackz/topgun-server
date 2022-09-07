#!/usr/bin/env bash
cd topgun-server
docker compose pull
docker compose down
docker compose up -d