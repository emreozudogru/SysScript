# Contributing

Thank you for contributing to SysScript.

## Contribution Workflow

1. Fork the repository and create a dedicated branch.
2. Clearly describe the scope of your change in the PR description.
3. For changes that affect script behavior, include:
   - Target scope (client/server/OU)
   - Possible side effects (restart, update, profile deletion, etc.)
   - Rollback approach
4. If possible, provide test-environment output or verification steps.

## Coding and Quality Notes

- Preserve the existing batch-script style where practical.
- Add clear comments for non-obvious commands.
- Add cautionary comments near OU/domain targeting lines to reduce mis-targeting risk.

## Commit and PR Guidance

- Use concise, meaningful commit messages.
- Write PR titles that clearly state intent.
- Submit large or destructive changes in separate PRs.
