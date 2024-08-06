[[OWASP Project]] CLI tool to map attack surfaces and discover assets
**Note**: might require service API keys

### Use
#### enum
Attempt to enumerate subdomains
- `amass enum -active -d target-name.com` attempts to collect certificate information
	- `-active` asks subdomains directly for certificates
	- `-passive` acquires subdomain info from search engines, etc
#### intel
Collect OSINT and parent domains owned by the organization
- `amass intel -addr [ip addr]`
- `amass intel -d [target domain] -whois` specifically pulls WHOIS records