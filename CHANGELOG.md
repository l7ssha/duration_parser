## 3.0.0

- `null` returned when parsing fails.
- Year/month parsing changed to refer to local year/month
    > For example, `1 month` resolves to 31 days in january, but only 28 in february. This ensures that `1 month` away from the nth day is always the nth day of the following month, and similarly for leap years.
- Added `allowNegative` to set whether negative values are allowed. Parsing will fail if the final result is negative.


## 2.0.1

- Initial version.
- Fixup naming and version

## 2.0.0

- Initial version.
