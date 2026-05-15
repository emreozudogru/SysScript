# SysScript

SysScript is a practical collection of Windows batch scripts for centralized administration in Active Directory environments.

## What is included

This repository groups operational scripts used to:

- trigger and monitor Windows Update tasks,
- run remote `gpupdate` commands,
- clean disks and user profiles,
- restart or shut down target machines,
- disable SMB1 and legacy sharing configurations.

## Repository layout

- `IZU-SCRIPT/` → scripts for institutional systems
- `STD-SCRIPT/` → scripts for student-domain systems
- `SCRIPT-IZU/` → support files such as host lists and logs

## Requirements

Before running scripts, ensure you have:

1. Domain connectivity and DNS resolution
2. Administrative privileges on target machines
3. RSAT / AD CLI tools (`dsquery`) when required
4. `PsExec64.exe` available in expected folder paths
5. Network/firewall rules that allow remote management

## Basic usage

> ⚠️ Run in a test OU/lab first. Many scripts apply remote changes immediately.

```bat
cd IZU-SCRIPT
INSTALL_UPDATE_ALL.bat
```

Recommended workflow:

1. Open script and review OU/domain filters.
2. Confirm the target scope.
3. Execute from an elevated Command Prompt.
4. Review generated outputs/log files.

## Safety notes

- Scripts may include hard-coded domain/OU filters.
- Mis-targeting can affect many machines at once.
- Validate scripts in non-production first.

## Documentation

- [CONTRIBUTING.md](CONTRIBUTING.md)
- [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md)
- [SECURITY.md](SECURITY.md)

## License

Distributed under the MIT License. See [LICENSE](LICENSE).
