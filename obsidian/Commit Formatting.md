According to [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) with correlations to Semantic [[Versioning]]:
```
<type>[optional scope]: <description>

[optional body]

[optional footer]
```

### types
| name                | description                  | SemVer correlation |
| ------------------- | ---------------------------- | ------------------ |
| `fix`               | patch for a bug in the code  | `PATCH`            |
| `feat`              | introduces a new feature     | `MINOR`            |
| any type with a `!` | introduces a breaking change | `MAJOR`            |
### examples
```
feat!: send an email to the customer when product is shipped
```

```
chore: change terms "whitelist" and "blacklist" to "allowlist" and "blocklist"
```

```
feat(lang): add Polish language
```