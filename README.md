# My Little Prison
[![MySQL](https://img.shields.io/badge/MySQL-8.0-4479A1?logo=mysql&logoColor=white)](https://www.mysql.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Build](https://img.shields.io/github/actions/workflow/status/Gitubrr/MyLittlePrison_HW/build.yaml?label=build)](https://github.com/Gitubrr/MyLittlePrison_HW/actions/workflows/build.yaml)

Prison database

## Database structure

- **Prisoner** — prisoners
- **Criminal_Code_Article** — criminal code articles
- **Prisoner_Article** — prisoner convictions (many-to-many with articles)
- **Employee** — prison staff
- **Visit** — prisoner visits
- **Conscription** — disciplinary violations
- **Punishment** — penalties for violations (one-to-one with Conscription)
- **Duty_Schedule** — employee duty schedules

## ERD diagram

![ERD](docs/erd.png)

## Installation

Create a database and import data
```bash
mysql -u root -p < src/init.sql
```