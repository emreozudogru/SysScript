# SysScript

SysScript is a collection of Windows batch scripts for **centralized administration, maintenance, and update operations** in Active Directory domain environments.

It is designed for bulk remote execution scenarios using tools such as `PsExec`, `dsquery`, `ping`, `gpupdate`, `wuauclt`, `dism`, and `shutdown`.

## Organization-Specific Context

This repository includes scripts customized for **Istanbul Sabahattin Zaim University (IZU)**:

- `izu.edu.tr` domain context for institutional systems
- `std.izu.edu.tr` subdomain context for student systems

In this repo, `STD` refers to the **student domain** (`std.izu.edu.tr`).

## Repository Structure

- `IZU-SCRIPT/`: Scripts targeting IZU institutional domain hosts
- `STD-SCRIPT/`: Scripts targeting STD student-domain hosts (`std.izu.edu.tr`)
- `SCRIPT-IZU/`: Supporting files (for example `PING.txt`)

## What These Scripts Do

- Trigger and report Windows Update activity in bulk
- Run `gpupdate` remotely on multiple hosts
- Disable SMB1 features on clients/servers
- Execute cleanup and restart tasks
- Perform profile cleanup operations (in STD scripts)

## Requirements

Typical prerequisites:

1. Active Directory connectivity
2. Administrative privileges (local/domain admin as required)
3. Reachable target hosts (network + firewall rules)
4. `PsExec64.exe` available in expected paths
5. AD command-line tools (`dsquery`, usually via RSAT)

## Usage

> ⚠️ These scripts can make immediate remote changes. Always validate in a test OU/lab before production use.

1. Open Command Prompt as Administrator.
2. Move into the relevant folder (`IZU-SCRIPT` or `STD-SCRIPT`).
3. Review OU/domain filters inside the script.
4. Run the script and review generated output files (`PING.txt`, `domaincomputers*.txt`, etc.).

Example:

```bat
cd IZU-SCRIPT
INSTALL_UPDATE_ALL.bat
```

## Safety Notes

- Many scripts include hard-coded OU/domain paths.
- Incorrect targeting may cause mass restart or disruptive changes.
- For operational changes, document impact scope in pull requests.

See [SECURITY.md](SECURITY.md) for more guidance.

## Contributing

Please read:

- [CONTRIBUTING.md](CONTRIBUTING.md)
- [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md)

## License

This project is licensed under the [MIT License](LICENSE).
