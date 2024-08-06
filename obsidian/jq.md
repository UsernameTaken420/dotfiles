Tool for filtering JSON input
- `cat file.json | jq` formats output
- `jq --arg variableName "variableContent" '.$variableName'` to use a variable inside the query
- `jq --arg env "dev" '.DistributionList.Items[] | select(.Aliases.Items[] | contains("$env")) | .Id'` selects the `Id` of the item in the distribution list that has `"dev"` inside the aliases list

