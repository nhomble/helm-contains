helm contains
=============
check for existence of chart

## Usage
```bash
if [[ $(helm contains [CHART]) = "true" ]];
  echo "exists"
else
  echo "nope"
fi
```
